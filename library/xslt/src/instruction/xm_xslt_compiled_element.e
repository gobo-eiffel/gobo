note
	description:

		"Elements whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ELEMENT

inherit

	XM_XSLT_ELEMENT_CONSTRUCTOR
		redefine
			simplify, check_static_type, sub_expressions, promote_instruction, item_type
		end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; an_element_name: XM_XPATH_EXPRESSION; a_namespace: detachable XM_XPATH_EXPRESSION; a_namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT;
			some_attribute_sets: detachable DS_ARRAYED_LIST [INTEGER]; a_schema_type: detachable XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER;
			inherit_namespaces: BOOLEAN; a_content: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			element_name_not_void: an_element_name /= Void
			namespace_or_namespace_context: a_namespace = Void implies a_namespace_context /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip >= a_validation_action
			content_not_void: a_content /= Void
		do
			executable := an_executable
			element_name := an_element_name
			namespace := a_namespace
			namespace_context := a_namespace_context
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_schema_type
			is_inherit_namespaces := inherit_namespaces
			content := a_content
			adopt_child_expression (element_name)
			if a_namespace /= Void then
				adopt_child_expression (a_namespace)
			end
			adopt_child_expression (content)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			element_name_set: element_name = an_element_name
			attribute_sets_set: attribute_sets = some_attribute_sets
			namespace_set: namespace = a_namespace
			namespace_context_set: namespace_context = a_namespace_context
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_schema_type
			is_inherit_namespaces_set: is_inherit_namespaces = inherit_namespaces
			content_set: content = a_content
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			if attached internal_item_type as l_internal_item_type then
				Result := l_internal_item_type
			else
				Result := Precursor
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions
		do
			create Result.make (3)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
			Result.put (element_name, 2)
			if attached namespace as l_namespace then
				Result.put (l_namespace, 3)
			end
		end

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER
			-- Name code;
			-- Not 100% pure as it may report an error.
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_name_value: XM_XPATH_ITEM
			l_string_value: XM_XPATH_STRING_VALUE
			l_uri: detachable STRING
			l_xml_prefix: STRING
			l_parser: detachable XM_XPATH_QNAME_PARSER
			l_error: XM_XPATH_ERROR_VALUE
		do
			check attached a_context.transformer as l_transformer then
				create l_item.make (Void)
				element_name.evaluate_item (l_item, a_context)
				check attached l_item.item as l_item_item then
					l_name_value := l_item_item
					if l_name_value = Void or else l_name_value.is_error then -- empty sequence
						create l_error.make_from_string ("xsl:element has no 'name'",
																	 Xpath_errors_uri,"XTDE0820", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
						Result := -1
					else
						l_string_value := l_name_value.as_string_value
						create l_parser.make (l_string_value.string_value)
						if not l_parser.is_valid then
							create l_error.make_from_string ("'name' attribute of xsl:element does not evaluate to a lexical QName.",
																		 Xpath_errors_uri,"XTDE0820", Dynamic_error)
							l_error.set_location (system_id, line_number)
							l_transformer.report_recoverable_error (l_error)
							Result := -1
						end
					end
				end
				if Result /= -1 then
					check
						l_parser_not_void: l_parser /= Void
						l_parser_valid: attached l_parser.optional_prefix as l_optional_prefix
						l_parser_valid_2: attached l_parser.local_name as l_local_name
					then
						l_xml_prefix := l_optional_prefix
						if not attached namespace as l_namespace then
							check invariant_namespace_or_namespace_context: attached namespace_context as l_namespace_context then
								l_uri := l_namespace_context.uri_for_defaulted_prefix (l_xml_prefix, True)
							end
							if l_uri = Void then
								create l_error.make_from_string (STRING_.concat ("'name' attribute of xsl:element has an undeclared prefix: ", l_xml_prefix),
																			 Xpath_errors_uri,"XTDE0830", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_recoverable_error (l_error)
								Result := -1
							end
						else
							l_namespace.evaluate_as_string (a_context)
							check postcondition_of_evaluate_as_string: attached l_namespace.last_evaluated_string as l_last_evaluated_string then
								if l_last_evaluated_string.is_error then
									l_transformer.report_warning ("'namespace' attribute of xsl:element failed evaluation - using null namespace", Current)
									l_uri := ""
								else
									l_uri := l_last_evaluated_string.string_value
								end
								if l_uri.count = 0 then
									l_xml_prefix := ""
								else
									l_xml_prefix := l_optional_prefix
								end
								if STRING_.same_string (l_xml_prefix, "xmlns") then
									-- not legal, so:
									l_xml_prefix := "x-xmlns"
								end
							end
						end
						if Result /= -1 then
							check l_uri /= Void then
								if shared_name_pool.is_name_code_allocated (l_xml_prefix, l_uri, l_local_name) then
									Result := shared_name_pool.name_code (l_xml_prefix, l_uri, l_local_name)
								else
									shared_name_pool.allocate_name (l_xml_prefix, l_uri, l_local_name)
									Result := shared_name_pool.last_name_code
								end
							end
						end
					end
				end
			end
		end

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING
			-- Re-calculated base URI
		do
			if attached base_uri as l_base_uri then
				Result := l_base_uri
			else
				Result := ""
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			std.error.put_string (a_string)
			if attached namespace as l_namespace then
				l_namespace.display (a_level + 2)
			end
			element_name.display (a_level + 2)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "content ")
			std.error.put_string (a_string)
			content.display (a_level + 2)
		end


feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_namespace: like namespace
		do
			create l_replacement.make (Void)
			element_name.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if element_name /= l_replacement_item then
					element_name := l_replacement_item
					adopt_child_expression (element_name)
					reset_static_properties
				end
			end
			if element_name.is_error then
				set_replacement (a_replacement, element_name)
			else
				l_namespace := namespace
				if l_namespace /= Void then
					l_replacement.put (Void)
					l_namespace.simplify  (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
						if l_namespace /= l_replacement_item then
							l_namespace := l_replacement_item
							namespace := l_namespace
							adopt_child_expression (l_namespace)
							reset_static_properties
						end
					end
					if l_namespace.is_error then
						set_replacement (a_replacement, l_namespace)
					end
				end
			end

			if a_replacement.item = Void then

				-- The following code will need modifying for a schema-aware processor:

				create {XM_XPATH_CONTENT_TYPE_TEST} internal_item_type.make (Element_node, type_factory.untyped_type)

				Precursor (a_replacement)
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_single_string_type: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_namespace: like namespace
		do
			create l_replacement.make (Void)
			element_name.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if element_name /= l_replacement_item then
					element_name := l_replacement_item
					adopt_child_expression (element_name)
					reset_static_properties
				end
			end
			if element_name.is_error then
				set_replacement (a_replacement, element_name)
			else
				create l_role.make (Instruction_role, "xsl:element/name", 1, Xpath_errors_uri, "XPTY0004")
				create l_type_checker
				create l_single_string_type.make_single_string
				l_type_checker.static_type_check (a_context, element_name, l_single_string_type, False, l_role)
				if l_type_checker.is_static_type_check_error then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
					end
				else
					check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
						element_name := (l_checked_expression)
						adopt_child_expression (element_name)
					end
					reset_static_properties
					l_namespace := namespace
					if l_namespace /= Void then
						l_replacement.put (Void)
						l_namespace.check_static_type (l_replacement, a_context, a_context_item_type)
						check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
							if l_namespace /= l_replacement_item then
								l_namespace := l_replacement_item
								namespace := l_namespace
								adopt_child_expression (l_namespace)
								reset_static_properties
							end
						end
						if l_namespace.is_error then
							set_replacement (a_replacement, l_namespace)
						else
							create l_role.make (Instruction_role, "xsl:element/namespace", 1, Xpath_errors_uri, "XPTY0004")
							create l_type_checker
							l_type_checker.static_type_check (a_context, l_namespace, l_single_string_type, False, l_role)
							if l_type_checker.is_static_type_check_error then
								check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error_2 then
									set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error_2))
								end
							else
								check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression2 then
									namespace := l_checked_expression2
									adopt_child_expression (l_checked_expression2)
									reset_static_properties
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				Precursor (a_replacement, a_context, a_context_item_type)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			element_name.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if element_name /= l_replacement_item then
					element_name := l_replacement_item
					adopt_child_expression (element_name)
					reset_static_properties
				end
			end
			if attached namespace as l_namespace then
				l_replacement.put (Void)
				l_namespace.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if namespace /= l_replacement_item then
						namespace := l_replacement_item
						adopt_child_expression (l_replacement_item)
						reset_static_properties
					end
				end
			end
			Precursor (a_offer)
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER)
			-- Output namespace nodes for the new element.
		do
			-- do_nothing
		end


feature {NONE} -- Implementation

	element_name: XM_XPATH_EXPRESSION
			-- Name

	namespace: detachable XM_XPATH_EXPRESSION
			-- Namespace

	namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

	internal_item_type: detachable XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known

invariant

	element_name_not_void: initialized implies element_name /= Void
	namespace_or_namespace_context: initialized and then namespace = Void implies namespace_context /= Void

end

