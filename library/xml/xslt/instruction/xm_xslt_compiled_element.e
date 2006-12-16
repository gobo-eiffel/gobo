indexing
	description:

		"Elements whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make (an_executable: XM_XSLT_EXECUTABLE; an_element_name, a_namespace: XM_XPATH_EXPRESSION; a_namespace_context: XM_XSLT_NAMESPACE_CONTEXT;
			some_attribute_sets: DS_ARRAYED_LIST [INTEGER]; a_schema_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER;
			inherit_namespaces: BOOLEAN; a_content: XM_XPATH_EXPRESSION) is
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
			adopt_child_expression (element_name)
			namespace := a_namespace
			if namespace /= Void then adopt_child_expression (namespace) end
			namespace_context := a_namespace_context
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_schema_type
			is_inherit_namespaces := inherit_namespaces
			content := a_content
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
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			if internal_item_type /= Void then
				Result := internal_item_type
			else
				Result := Precursor
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions
		do
			create Result.make (3)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
			Result.put (element_name, 2)
			if namespace /= Void then
				Result.put (namespace, 3)
			end
		end

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code;
			-- Not 100% pure as it may report an error.
		local
			a_name_value: XM_XPATH_ITEM
			a_string_value: XM_XPATH_STRING_VALUE
			a_uri, an_xml_prefix: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			an_error: XM_XPATH_ERROR_VALUE 
		do
			element_name.evaluate_item (a_context)
			a_name_value := element_name.last_evaluated_item
			if a_name_value = Void or else a_name_value.is_error then -- empty sequence
				create an_error.make_from_string ("xsl:element has no 'name'",
															 Xpath_errors_uri,"XTDE0820", Dynamic_error)
				an_error.set_location (system_id, line_number)
				a_context.transformer.report_fatal_error (an_error)
				Result := -1
			else
				a_string_value := a_name_value.as_string_value
				create a_parser.make (a_string_value.string_value)
				if not a_parser.is_valid then
					create an_error.make_from_string ("'name' attribute of xsl:element does not evaluate to a lexical QName.",
																 Xpath_errors_uri,"XTDE0820", Dynamic_error)
					an_error.set_location (system_id, line_number)
					a_context.transformer.report_recoverable_error (an_error)
					Result := -1
				end
			end
			if Result /= -1 then
				an_xml_prefix := a_parser.optional_prefix
				if namespace = Void then
					a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, True)
					if a_uri = Void then
						create an_error.make_from_string (STRING_.concat ("'name' attribute of xsl:element has an undeclared prefix: ", an_xml_prefix),
																	 Xpath_errors_uri,"XTDE0830", Dynamic_error)
						an_error.set_location (system_id, line_number)
						a_context.transformer.report_recoverable_error (an_error)
						Result := -1
						check False end
					end
				else
					namespace.evaluate_as_string (a_context)
					if namespace.last_evaluated_string.is_error then
						a_context.transformer.report_warning ("'namespace' attribute of xsl:element failed evaluation - using null namespace", Current)
						a_uri := ""
					else
						a_uri := namespace.last_evaluated_string.string_value
					end
					if a_uri.count = 0 then
						an_xml_prefix := ""
					else
						an_xml_prefix := a_parser.optional_prefix
					end
					if STRING_.same_string (an_xml_prefix, "xmlns") then
						-- not legal, so:
						an_xml_prefix := "x-xmlns"
					end
				end
				if Result /= -1 then
					if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_parser.local_name) then
						Result := shared_name_pool.name_code (an_xml_prefix, a_uri, a_parser.local_name)
					else
						shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_parser.local_name)
						Result := shared_name_pool.last_name_code
					end
				end
			end
		end

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING is
			-- Re-calculated base URI
		do
			Result := base_uri
			if Result = Void then
				Result := ""
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			std.error.put_string (a_string)
			if namespace /= Void then
				namespace.display (a_level + 2)
			end
			element_name.display (a_level + 2)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "content ")
			std.error.put_string (a_string)
			content.display (a_level + 2)
		end


feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			element_name.simplify
			if element_name.was_expression_replaced then
				element_name := element_name.replacement_expression
				adopt_child_expression (element_name)
			end
			if namespace /= Void then
				namespace.simplify
				if namespace.was_expression_replaced then
					namespace := namespace.replacement_expression
					adopt_child_expression (namespace)
				end
			end

			-- The following code will need modifying for a schema-aware processor:

			create {XM_XPATH_CONTENT_TYPE_TEST} internal_item_type.make (Element_node, type_factory.untyped_type)
			
			Precursor
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_string_type: XM_XPATH_SEQUENCE_TYPE
		do
			element_name.check_static_type (a_context, a_context_item_type)
			if element_name.was_expression_replaced then
				element_name := element_name.replacement_expression
			end
			if element_name.is_error then set_last_error (element_name.error_value) end
			create a_role.make (Instruction_role, "xsl:element/name", 1, Xpath_errors_uri, "XPTY0004")
			create a_type_checker
			create a_single_string_type.make_single_string
			a_type_checker.static_type_check (a_context, element_name, a_single_string_type, False, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error (a_type_checker.static_type_check_error)
			else
				element_name := (a_type_checker.checked_expression)
				adopt_child_expression (element_name)
			end
			if namespace /= Void then
				namespace.check_static_type (a_context, a_context_item_type)
				if namespace.was_expression_replaced then
					namespace := namespace.replacement_expression
				end
				create a_role.make (Instruction_role, "xsl:element/namespace", 1, Xpath_errors_uri, "XPTY0004")
				create a_type_checker
				a_type_checker.static_type_check (a_context, namespace, a_single_string_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					namespace := (a_type_checker.checked_expression)
					adopt_child_expression (namespace)
				end			
			end
			Precursor (a_context, a_context_item_type)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			element_name.promote (an_offer)
			if element_name.was_expression_replaced then
				element_name := element_name.replacement_expression
				adopt_child_expression (element_name)
				reset_static_properties
			end
			if element_name.is_error then set_last_error (element_name.error_value) end
			if not is_error and then namespace /= Void then
				namespace.promote (an_offer)
				if namespace.was_expression_replaced then
					namespace := namespace.replacement_expression
					adopt_child_expression (namespace)
					reset_static_properties
				end
				if namespace.is_error then set_last_error (namespace.error_value) end
			end
			if not is_error then Precursor (an_offer) end
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		do
			-- do_nothing
		end


feature {NONE} -- Implementation
	
	element_name: XM_XPATH_EXPRESSION
			-- Name
	
	namespace: XM_XPATH_EXPRESSION
			-- Namespace

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

	internal_item_type: XM_XPATH_ITEM_TYPE 
			-- Data type of the expression, when known

invariant

	element_name_not_void: initialized implies element_name /= Void
	namespace_or_namespace_context: initialized and then namespace = Void implies namespace_context /= Void

end
	
