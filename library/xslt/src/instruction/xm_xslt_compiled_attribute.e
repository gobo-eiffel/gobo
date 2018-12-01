note

	description:

		"Attributes whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_ATTRIBUTE

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			sub_expressions, simplify, compute_cardinality, promote_instruction, display,
			item_type, evaluate_name_code
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XSLT_VALIDATION

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; an_attribute_name: XM_XPATH_EXPRESSION; a_namespace: detachable XM_XPATH_EXPRESSION; a_namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT;
			a_validation_action: INTEGER; a_simple_type: detachable XM_XPATH_SCHEMA_TYPE; a_type_annotation: INTEGER)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: an_attribute_name /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
			namespace_context_not_void: a_namespace = Void implies a_namespace_context /= Void
		do
			executable := an_executable
			namespace_context := a_namespace_context
			type := a_simple_type
			attribute_name := an_attribute_name
			set_namespace (a_namespace)
			adopt_child_expression (attribute_name)
			validation_action := a_validation_action
			type_annotation := a_type_annotation
			options := 0
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_set: attribute_name = an_attribute_name
			namespace_set: namespace = a_namespace
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
			type_annotation_set: type_annotation = a_type_annotation
			namespace_context_set: namespace_context = a_namespace_context
			no_options_set: options = 0
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := attribute_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		local
			an_index: INTEGER
		do
			create Result.make (3)
			an_index := 1
			if attached select_expression as l_select_expression then
				Result.put (l_select_expression, an_index)
				an_index := an_index + 1
			end
			Result.put (attribute_name, an_index)
			an_index := an_index + 1
			if attached namespace as l_namespace then
				Result.put (l_namespace, an_index)
			end
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
				local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:attribute ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			std.error.put_string (a_string)
			if attached namespace as l_namespace then
				l_namespace.display (a_level + 2)
			end
			attribute_name.display (a_level + 2)
			std.error.put_new_line
		end

feature -- Status_setting

	set_attribute_name (a_name: like attribute_name)
			-- Set attribute name.
		require
			attribute_name_not_void: a_name /= Void
		do
			if a_name /= attribute_name then
				attribute_name := a_name
				adopt_child_expression (attribute_name)
				if are_static_properties_computed then
					reset_static_properties
				end
			end
		ensure
			set: attribute_name = a_name
		end

	set_namespace (a_namespace: like namespace)
			-- Set attribute name.
		do
			if a_namespace /= namespace then
				namespace := a_namespace
				if a_namespace /= Void then
					adopt_child_expression (a_namespace)
				end
				if are_static_properties_computed then
					reset_static_properties
				end
			end
		ensure
			set: namespace = a_namespace
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			attribute_name.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_attribute_name then
				set_attribute_name (l_attribute_name)
				if l_attribute_name.is_error then
					set_replacement (a_replacement, l_attribute_name)
				else
					if attached namespace as l_old_namespace then
						l_replacement.put (Void)
						l_old_namespace.simplify (l_replacement)
						check postcondition_of_simplify: attached l_replacement.item as l_namespace then
							set_namespace (l_namespace)
							if l_namespace.is_error then
								set_replacement (a_replacement, l_namespace)
							else
								Precursor (a_replacement)
							end
						end
					else
						Precursor (a_replacement)
					end
				end
			end
		end

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_single_string_type: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			attribute_name.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_attribute_name then
				set_attribute_name (l_attribute_name)
				if l_attribute_name.is_error then
					set_replacement (a_replacement, l_attribute_name)
				else
					create l_role.make (Instruction_role, "xsl:attribute/name", 1, Xpath_errors_uri, "XPTY0004")
					create l_type_checker
					create l_single_string_type.make_single_string
					l_type_checker.static_type_check (a_context, l_attribute_name, l_single_string_type, False, l_role)
					if l_type_checker.is_static_type_check_error then
						check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
						end
					else
						check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
							set_attribute_name (l_checked_expression)
						end
						if attached namespace as l_old_namespace then
							l_replacement.put (Void)
							l_old_namespace.check_static_type (l_replacement, a_context, a_context_item_type)
							check postcondition_of_check_static_type: attached l_replacement.item as l_namespace then
								set_namespace (l_namespace)
								if l_namespace.is_error then
									set_replacement (a_replacement, l_namespace)
								else
									create l_role.make (Instruction_role, "xsl:attribute/namespace", 1, Xpath_errors_uri, "XPTY0004")
									create l_type_checker
									l_type_checker.static_type_check (a_context, l_namespace, l_single_string_type, False, l_role)
									if l_type_checker.is_static_type_check_error then
										check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
											set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
										end
									else
										check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
											set_namespace (l_checked_expression)
										end
									end
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			attribute_name.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				set_attribute_name (l_replacement_item)
			end
			if attached namespace as l_namespace then
				l_replacement.put (Void)
				l_namespace.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_namespace (l_replacement_item)
				end
			end
			Precursor (a_offer)
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			evaluate_name_code (a_context)
			if not attached error_value as l_error_value then
				expand_children (a_context)
				if not is_error then
					check
						postcondition_of_expand_children: attached last_string_value as l_last_string_value
					 	attached a_context.current_receiver as l_current_receiver
					 then
						l_current_receiver.notify_attribute (last_name_code, 0, l_last_string_value, options)
					end
				end
			else
				check is_error: is_error end
				check attached a_context.transformer as l_transformer then
					l_transformer.report_fatal_error (l_error_value)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	attribute_name: XM_XPATH_EXPRESSION
			-- Name

	namespace: detachable XM_XPATH_EXPRESSION
			-- Namespace

	validation_action: INTEGER
			-- Validation action

	type_annotation: INTEGER
			-- Type annotation

	type: detachable XM_XPATH_SCHEMA_TYPE
			--Type

	options: INTEGER
			-- Receiver options

	namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

	evaluate_name_code (a_context: XM_XPATH_CONTEXT)
			-- Evaluate name code.
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_error: XM_XPATH_ERROR_VALUE
			l_qname: XM_XPATH_STRING_VALUE
			l_parser: XM_XPATH_QNAME_PARSER
			l_prefix, l_local: STRING
		do
			create l_item.make (Void)
			attribute_name.evaluate_item (l_item, a_context)
			if not attached l_item.item as l_item_item then
				create l_error.make_from_string ("Attribute 'name' must be a string", Xpath_errors_uri, "XPTY0004", Dynamic_error)
				set_last_error (l_error)
			elseif attached l_item_item.error_value as l_error_value then
				check is_error: l_item_item.is_error end
				set_last_error (l_error_value)
			elseif not l_item_item.is_string_value then
				create l_error.make_from_string ("Attribute 'name' must be a string", Xpath_errors_uri, "XPTY0004", Dynamic_error)
				set_last_error (l_error)
			else
				l_qname := l_item_item.as_string_value
				create l_parser.make (l_qname.string_value)
				if not l_parser.is_valid then
					create l_error.make_from_string ("Attribute 'name' must be a lexical QName", Xpath_errors_uri, "XTDE0850", Dynamic_error)
					set_last_error (l_error)
				elseif namespace = Void and STRING_.same_string (l_qname.string_value, Xmlns) then
					create l_error.make_from_string ("Attribute 'name' cannot be 'xmlns'", Xpath_errors_uri, "XTDE0855", Dynamic_error)
					set_last_error (l_error)
				else
					check
						l_parser_is_valid: attached l_parser.optional_prefix as l_parser_optional_prefix
						l_parser_is_valid_2: attached l_parser.local_name as l_parser_local_name
					then
						l_prefix := l_parser_optional_prefix
						l_local := l_parser_local_name
						if STRING_.same_string (l_prefix, Xmlns) then
							if namespace = Void then
								create l_error.make_from_string ("Attribute 'name' cannot be a namespace declaration", Xpath_errors_uri, "XTDE0860", Dynamic_error)
								set_last_error (l_error)
							else
								l_prefix := "" -- i.e. we will ignore it
							end
						else
							evaluate_name_code_stage2 (l_prefix, l_local, a_context)
						end
					end
				end
			end
		end

	evaluate_name_code_stage2 (a_prefix, a_local: STRING; a_context: XM_XPATH_CONTEXT)
			-- Complete evaluation of name code.
		require
			a_prefix_not_void: a_prefix /= Void
			a_local_not_void: a_local /= Void
			a_context_not_void: a_context /= Void
			no_error_yet: not is_error
		local
			l_uri, l_prefix: detachable STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_namespace_uri: UT_URI
		do
			l_prefix := STRING_.cloned_string (a_prefix)
			if not attached namespace as l_namespace then
				if l_prefix.is_empty then
					l_uri := ""
				else
					check invariant_namespace_context_not_void: attached namespace_context as l_namespace_context then
						l_uri := l_namespace_context.uri_for_defaulted_prefix (l_prefix, False)
					end
				end
				if l_uri = Void then
					create l_error.make_from_string ("Undeclared prefix in attribute 'name'", Xpath_errors_uri, "XTDE0860", Dynamic_error)
					set_last_error (l_error)
				end
			else
				l_namespace.evaluate_as_string (a_context)
				check postcondition_of_evaluate_as_string: attached l_namespace.last_evaluated_string as l_last_evaluated_string then
					if attached l_last_evaluated_string.error_value as l_error_value then
						check is_error: l_last_evaluated_string.is_error end
						set_last_error (l_error_value)
					else
						l_uri := l_last_evaluated_string.string_value
						if Url_encoding.has_excluded_characters (l_uri) or l_uri.occurrences ('#') > 1 then
							create l_error.make_from_string ("Namespace does not conform to xs:anyURI", Xpath_errors_uri, "XTDE0865", Dynamic_error)
							set_last_error (l_error)
						else
							if not l_uri.is_empty then
								create l_namespace_uri.make (l_uri)
								-- TODO: need UT_URI validity checking
							end
							if l_uri.is_empty then
								l_prefix := ""
							elseif l_prefix.count = 0 then
								l_prefix := shared_name_pool.suggested_prefix_for_uri (l_uri)
								if l_prefix = Void then
									-- the following arbitrary prefix will be change if it clashes
									l_prefix := "ns0"
								end
							end
						end
					end
				end
			end
			if not is_error then
				check l_uri /= Void then
					if shared_name_pool.is_name_code_allocated (l_prefix, l_uri, a_local) then
						last_name_code := shared_name_pool.name_code (l_prefix, l_uri, a_local)
					else
						shared_name_pool.allocate_name (l_prefix, l_uri, a_local)
						last_name_code := shared_name_pool.last_name_code
					end
				end
			end
		ensure
			error_or_name_code_set: is_error or else last_name_code >= -1
		end

invariant

	validation: initialized implies validation_action >= Validation_strict  and then Validation_strip <= validation_action
	name_not_void: initialized implies attribute_name /= Void
	namespace_context_not_void: namespace = Void implies namespace_context /= Void

end

