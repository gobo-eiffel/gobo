indexing

	description:

		"Attributes whose name is not known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
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

	make (an_executable: XM_XSLT_EXECUTABLE; an_attribute_name, a_namespace: XM_XPATH_EXPRESSION; a_namespace_context: XM_XSLT_NAMESPACE_CONTEXT;
			a_validation_action: INTEGER; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_type_annotation: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: an_attribute_name /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip <= a_validation_action
			namespace_context_not_void: a_namespace = Void implies a_namespace_context /= Void
		do
			executable := an_executable
			namespace_context := a_namespace_context
			set_namespace (a_namespace)
			set_attribute_name (an_attribute_name)
			validation_action := a_validation_action
			type := a_simple_type
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
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := attribute_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			an_index: INTEGER
		do
			create Result.make (3)
			an_index := 1
			if select_expression /= Void then
				Result.put (select_expression, an_index)
				an_index := an_index + 1
			end
			Result.put (attribute_name, an_index)
			an_index := an_index + 1
			if namespace /= Void then
				Result.put (namespace, an_index)
			end
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
				local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:attribute ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			std.error.put_string (a_string)
			if namespace /= Void then
				namespace.display (a_level + 2)
			end
			attribute_name.display (a_level + 2)
			std.error.put_new_line
		end

feature -- Status_setting

	set_attribute_name (a_name: like attribute_name) is
			-- Set attribute name.
		require
			attribute_name_not_void: a_name /= Void
		do
			attribute_name := a_name
			adopt_child_expression (attribute_name)
		ensure
			set: attribute_name = a_name
		end

	set_namespace (a_namespace: like namespace) is
			-- Set attribute name.
		do
			namespace := a_namespace
			if namespace /= Void then
				adopt_child_expression (namespace)
			end
		ensure
			set: namespace = a_namespace
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			attribute_name.simplify
			if attribute_name.was_expression_replaced then set_attribute_name (attribute_name.replacement_expression) end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
			if namespace /= Void then
				namespace.simplify
				if namespace.was_expression_replaced then set_namespace (namespace.replacement_expression) end
				if namespace.is_error then set_last_error (namespace.error_value) end
			end
			Precursor
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_string_type: XM_XPATH_SEQUENCE_TYPE
		do
			attribute_name.check_static_type (a_context, a_context_item_type)
			if attribute_name.was_expression_replaced then set_attribute_name (attribute_name.replacement_expression) end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
			create a_role.make (Instruction_role, "xsl:attribute/name", 1, Xpath_errors_uri, "XPTY0004")
			create a_type_checker
			create a_single_string_type.make_single_string
			a_type_checker.static_type_check (a_context, attribute_name, a_single_string_type, False, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error (a_type_checker.static_type_check_error)
			else
				set_attribute_name (a_type_checker.checked_expression)
			end
			if namespace /= Void then
				namespace.check_static_type (a_context, a_context_item_type)
				if namespace.was_expression_replaced then set_namespace (namespace.replacement_expression) end
				if namespace.is_error then set_last_error (namespace.error_value) end
				create a_role.make (Instruction_role, "xsl:attribute/namespace", 1, Xpath_errors_uri, "XPTY0004")
				create a_type_checker
				a_type_checker.static_type_check (a_context, namespace, a_single_string_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_namespace (a_type_checker.checked_expression)
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			attribute_name.promote (an_offer)
			if attribute_name.was_expression_replaced then
				set_attribute_name (attribute_name.replacement_expression)
				reset_static_properties
			end
			if attribute_name.is_error then set_last_error (attribute_name.error_value) end
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

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			evaluate_name_code (a_context)
			if not is_error then
				expand_children (a_context)
				if not is_error then
					a_context.current_receiver.notify_attribute (last_name_code, 0, last_string_value, options)
				end
			else
				a_context.transformer.report_fatal_error (error_value)
			end
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	attribute_name: XM_XPATH_EXPRESSION
			-- Name

	namespace: XM_XPATH_EXPRESSION
			-- Namespace

	validation_action: INTEGER
			-- Validation action

	type_annotation: INTEGER
			-- Type annotation

	type: XM_XPATH_SCHEMA_TYPE
			--Type

	options: INTEGER
			-- Receiver options

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- namespace context

	evaluate_name_code (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name code.
		local
			l_item: XM_XPATH_ITEM
			l_error: XM_XPATH_ERROR_VALUE
			l_qname: XM_XPATH_STRING_VALUE
			l_parser: XM_XPATH_QNAME_PARSER
			l_prefix, l_local: STRING
		do
			attribute_name.evaluate_item (a_context)
			l_item := attribute_name.last_evaluated_item
			if l_item = Void then
				create l_error.make_from_string ("Attribute 'name' must be a string", Xpath_errors_uri, "XPTY0004", Dynamic_error)
				set_last_error (l_error)
			elseif l_item.is_error then
				set_last_error (l_item.error_value)
			elseif not l_item.is_string_value then
				create l_error.make_from_string ("Attribute 'name' must be a string", Xpath_errors_uri, "XPTY0004", Dynamic_error)
				set_last_error (l_error)
			else
				l_qname := l_item.as_string_value
				create l_parser.make (l_qname.string_value)
				if not l_parser.is_valid then
					create l_error.make_from_string ("Attribute 'name' must be a lexical QName", Xpath_errors_uri, "XTDE0850", Dynamic_error)
					set_last_error (l_error)
				elseif namespace = Void and STRING_.same_string (l_qname.string_value, Xmlns) then
					create l_error.make_from_string ("Attribute 'name' cannot be 'xmlns'", Xpath_errors_uri, "XTDE0855", Dynamic_error)
					set_last_error (l_error)
				else
					l_prefix := l_parser.optional_prefix
					l_local := l_parser.local_name
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

	evaluate_name_code_stage2 (a_prefix, a_local: STRING; a_context: XM_XPATH_CONTEXT) is
			-- Complete evaluation of name code.
		require
			a_prefix_not_void: a_prefix /= Void
			a_local_not_void: a_local /= Void
			a_context_not_void: a_context /= Void
			no_error_yet: not is_error
		local
			l_uri, l_prefix: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_namespace: UT_URI
		do
			l_prefix := STRING_.cloned_string (a_prefix)
			if namespace = Void then
				if l_prefix.is_empty then
					l_uri := ""
				else
					l_uri := namespace_context.uri_for_defaulted_prefix (l_prefix, False)
				end
				if l_uri = Void then
					create l_error.make_from_string ("Undeclared prefix in attribute 'name'", Xpath_errors_uri, "XTDE0860", Dynamic_error)
					set_last_error (l_error)
				end
			else
				namespace.evaluate_as_string (a_context)
				if namespace.last_evaluated_string.is_error then
					set_last_error (namespace.last_evaluated_string.error_value)
				else
					l_uri := namespace.last_evaluated_string.string_value
					if Url_encoding.has_excluded_characters (l_uri) then
						create l_error.make_from_string ("Namespace does not conform to xs:anyURI", Xpath_errors_uri, "XTDE0865", Dynamic_error)
						set_last_error (l_error)
					else
						if not l_uri.is_empty then
							create l_namespace.make (l_uri)
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
			if not is_error then
				if shared_name_pool.is_name_code_allocated (l_prefix, l_uri, a_local) then
					last_name_code := shared_name_pool.name_code (l_prefix, l_uri, a_local)
				else
					shared_name_pool.allocate_name (l_prefix, l_uri, a_local)
					last_name_code := shared_name_pool.last_name_code
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
	
