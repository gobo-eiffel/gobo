indexing

	description:

		"Element nodes in an XSLT stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_STYLE_ELEMENT

inherit

	XM_XPATH_TREE_ELEMENT

	XM_XPATH_LOCATOR

	XM_XSLT_VALIDATION

	XM_XSLT_STRING_ROUTINES

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XPATH_SHARED_NO_NODE_TEST

	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XPATH_TYPE

	XM_XPATH_TOKENS

	XM_XPATH_DEBUGGING_ROUTINES

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		require
			error_listener_not_void: an_error_listener /= Void
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do
			reporting_circumstances := Report_always
			error_listener := an_error_listener
			make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		ensure
			error_listener_set: error_listener = an_error_listener
			name_code_set: name_code = a_name_code
		end			
			
feature -- Access

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	extension_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes of extension elements

	excluded_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes to be excluded from output

	default_xpath_namespace: STRING
			-- Default XPath namespace

	version: MA_DECIMAL
			-- Value of the applicable version attribute

	is_instruction: BOOLEAN
			-- Is `Current' an instruction?

	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Static context

	used_attribute_sets: DS_ARRAYED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET]
			-- Compiled attribute-sets used by `Current'

	default_xpath_namespace_code: INTEGER is
			-- Namespace code of default XPath namespace
		local
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_namespace: STRING
			finished: BOOLEAN
		do
			from
				a_style_element := Current
			until
				finished or else a_style_element = Void or else a_namespace /= Void	
			loop
				a_namespace := a_style_element.default_xpath_namespace
				if a_namespace = Void then
					a_style_element ?= a_style_element.parent_node
				else
					check
						code_allocated: shared_name_pool.is_code_for_uri_allocated (a_namespace)
						-- TODO: We must allocate it somewhere, when `default_xpath_namespace' is first set
					end
					Result := shared_name_pool.code_for_uri (a_namespace)
					finished := True
				end
			end
			if not finished then
				Result := Default_uri_code
			end
		end

	containing_stylesheet: XM_XSLT_STYLESHEET is
			-- Containing stylesheet;
			-- N.B. This may not be the principal stylersheet, it may be 
			--  an included or imported module.
		require
			well_formed_stylesheet: True -- Can't easily check, but all nodes other than XM_XSLT_STYLESHEETs must have a parent.
		local
			a_node: XM_XPATH_TREE_COMPOSITE_NODE
		do
			from
				a_node := Current
				Result ?= a_node
			until
				Result /= Void
			loop
				a_node := a_node.parent
				Result ?= a_node
			end
		ensure
			containing_stylesheet_not_void: Result /= Void
		end

	principal_stylesheet: XM_XSLT_STYLESHEET is
			-- Top-level stylesheet
		local
			another_stylesheet: XM_XSLT_STYLESHEET
		do
			from
				Result := containing_stylesheet
				another_stylesheet := Result.importer
			until
				another_stylesheet = Void
			loop
					Result := another_stylesheet
					another_stylesheet := Result.importer
			end
		ensure
			prinicpal_stylesheet_not_void: Result /= Void
		end

	stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER is
			-- Stylesheet compiler
		do
			Result := principal_stylesheet.stylesheet_compiler
		end

	owning_procedure: XM_XSLT_PROCEDURE is
			-- Owning Procedure definition, if this is a local variable
		local
			a_node, a_next_node: XM_XPATH_NODE
			a_stylesheet: XM_XSLT_STYLESHEET
			a_template: XM_XSLT_TEMPLATE
			a_variable: XM_XSLT_GENERAL_VARIABLE
			an_attribute_set: XM_XSLT_ATTRIBUTE_SET
			a_function: XM_XSLT_FUNCTION
			found: BOOLEAN
		do
			from
				a_node := Current
			until
				found
			loop
				a_next_node := a_node.parent
				a_stylesheet ?= a_next_node
				if a_stylesheet /= Void then
					found := True
					a_template ?= a_node
					if a_template /= Void then
						Result := a_template
					else
						a_variable ?=	 a_node
						if a_variable /= Void then
							Result := a_variable
						else
							an_attribute_set ?= a_node
							if an_attribute_set /= Void then
								Result := an_attribute_set
							else
								a_function ?= a_node
								Result := a_function -- might be `Void'
							end
						end
					end
				end
				a_node := a_next_node
			end
		end

	attribute_value_by_expanded_name (an_attribute_name: STRING): STRING is
			-- Value of `an_attribute_name'
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
		local
		do
			if not shared_name_pool.is_expanded_name_allocated (an_attribute_name) then
				shared_name_pool.allocate_expanded_name (an_attribute_name)
			end
			Result := attribute_value (shared_name_pool.fingerprint_from_expanded_name (an_attribute_name))
		end

	precedence: INTEGER is
			-- Import precedence of `Current'
		do
			Result := containing_stylesheet.precedence
		end

	uri_for_prefix (an_xml_prefix: STRING; use_default_namespace: BOOLEAN): STRING is
			-- URI for `an_xml_prefix' using the in-scope namespaces
		require
			prefix_not_void: an_xml_prefix /= Void
		local
			a_uri_code: INTEGER
		do
			if not use_default_namespace and then an_xml_prefix.count = 0 then
				Result := ""
			else
				a_uri_code := uri_code_for_prefix (an_xml_prefix)
				if a_uri_code /= -1 then
					Result := shared_name_pool.uri_from_uri_code (a_uri_code)
				end
			end
		end

	last_child_instruction: XM_XSLT_STYLE_ELEMENT is
			-- Last child instruction of this instruction.
			-- Returns `Void' if there are no child instructions,
			--  or if the last child is a text node.
		local
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					Result := a_style_element
				else
					Result := Void
				end
				a_child_iterator.forth
			end		
		end

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT is
			-- Namespace context
		do
			if accumulated_namespace_nodes = Void then ensure_namespace_nodes end
			create Result.make (namespace_codes_in_scope)
		end

	with_param_instructions (an_executable: XM_XSLT_EXECUTABLE; is_tunnel: BOOLEAN): DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM] is
			-- List of tunnel or non-tunnel parameters
		require
			executable_not_void: an_executable /= Void
		local
			a_parameter_count: INTEGER
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_with_param: XM_XSLT_WITH_PARAM
			a_compiled_with_param: XM_XSLT_COMPILED_WITH_PARAM
		do
			from
				an_iterator := new_axis_iterator (Child_axis)
				an_iterator.start
			until
				an_iterator.after
			loop
				a_with_param ?= an_iterator.item
				if a_with_param /= Void and then a_with_param.is_tunnel_parameter = is_tunnel then
					a_parameter_count := a_parameter_count + 1
				end
				an_iterator.forth
			end
			create Result.make (a_parameter_count)
			from
				an_iterator := new_axis_iterator (Child_axis)
				an_iterator.start
			until
				an_iterator.after
			loop
				a_with_param ?= an_iterator.item
				if a_with_param /= Void and then a_with_param.is_tunnel_parameter = is_tunnel then
					a_with_param.compile (an_executable)
					a_compiled_with_param ?= a_with_param.last_generated_instruction
					check
						with_param_instruction: a_compiled_with_param /= Void
					end
					Result.put_last (a_compiled_with_param)
				end
				an_iterator.forth
			end
		ensure
			result_list_not_void: Result /= Void
		end

	sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION] is
			-- List of sort keys
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_sort: XM_XSLT_SORT
			sort_key_count: INTEGER
		do
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				a_sort ?= an_iterator.item
				if a_sort /= Void then
					sort_key_count := sort_key_count + 1
				end
				an_iterator.forth
			end
			if sort_key_count > 0 then
				from
					an_iterator := new_axis_iterator (Child_axis); an_iterator.start
					create Result.make (sort_key_count)
				until
					an_iterator.after
				loop
					a_sort ?= an_iterator.item
					if a_sort /= Void then
						Result.put_last (a_sort.sort_key_definition)
					end
					an_iterator.forth
				end
			else
				create Result.make (0)
			end
		ensure
			sort_key_list_not_void: Result /= Void
		end

	stylesheet_function (a_fingerprint, an_arity: INTEGER): XM_XSLT_FUNCTION is
			-- Xsl:function named by `a_fingerprint' with `an_arity' arguments
		require
			positive_fingerprint: a_fingerprint >= 0
			nearly_positive_arity: an_arity >= -1 -- -1 = any arity will do
		local
			a_root: XM_XSLT_STYLESHEET
			a_top_level_element_list: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_function: XM_XSLT_FUNCTION
		do

			-- We rely on the search following the order of decreasing import precedence.

			a_root := principal_stylesheet
			a_top_level_element_list := a_root.top_level_elements
			from
				a_cursor := a_top_level_element_list.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				a_cursor.before
			loop
				a_function := as_function (a_cursor.item)
				if a_function /= Void and then a_function.function_fingerprint = a_fingerprint
					and then (an_arity = -1 or else a_function.arity = an_arity) then
					Result := a_function
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		ensure
			function_may_not_be_available: True
		end

feature {NONE} -- Implementation

	as_function (an_element: XM_XSLT_STYLE_ELEMENT): XM_XSLT_FUNCTION is
			-- Reverse assignment extracted to prevent
			-- SmartEiffel bug.
		do
			Result ?= an_element
		end
		
feature -- Status_report

	is_excluded: BOOLEAN
			-- Is `Current' excluded by "use-when" processing?

	any_compile_errors: BOOLEAN is
			-- Have any compile errors been reported?
		do
			Result := principal_stylesheet.any_compile_errors
		end

	attributes_prepared: BOOLEAN
			-- Have attributes been prepared?

	validated: BOOLEAN
			-- Has `Current' been validated?

	post_validated: BOOLEAN
			-- Has `Current' been post-validated?

	children_validated: BOOLEAN
			-- Have the children of `Current' been validated?

	version_attribute_processed: BOOLEAN
			-- Has the version attribute been processed yet?

	reporting_circumstances: INTEGER
			-- Conditions under which a validation error will be reported

	validation_error_message: STRING

	last_generated_name_code: INTEGER
			-- Last name code generated by `generate_name_code'

	last_generated_expression: XM_XPATH_EXPRESSION
			-- Result of last call to `generate_expression'

	last_generated_pattern: XM_XSLT_PATTERN
			-- Result of last call to `generate_pattern'

	last_generated_sequence_type: XM_XPATH_SEQUENCE_TYPE
			-- Result of last call to `generate_sequence_type'

	error_message: STRING
			-- Error message created by `generate_name_code'

	last_generated_instruction: XM_XSLT_INSTRUCTION
			-- Instruction generated by last call to `compile'

	last_generated_instruction_list: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
			-- Instruction list generated by last call to `compile_children'

	
	is_stylesheet_in_error: BOOLEAN is
			-- is any element of the stylsheet tree compiled in error?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			if is_error then Result := True
			else

				-- recusively check all the children

				from
					a_cursor := children.new_cursor
					a_cursor.start
				variant
					children.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_style_element ?= a_cursor.item
					if a_style_element /= Void then
						if a_style_element.is_stylesheet_in_error then
							Result := True
							debug ("XSLT stylesheet compilation")
								std.error.put_string ("Style element marked in error:%N")
								std.error.put_string (a_style_element.error_value.error_message)
								print (a_style_element);print ("%N")
							end
							a_cursor.go_after
						end
					end
					if not a_cursor.after then a_cursor.forth end
				end
			end
		end

	is_forwards_compatible_processing_enabled: BOOLEAN is
			-- Is forwards-compatible mode enabled for this element?
		do
			Result := version > decimal_two
		end

	is_backwards_compatible_processing_enabled: BOOLEAN is
			-- Is backwards-compatible mode enabled for this element?
		do
			Result := version < decimal_two
		end

	is_explaining: BOOLEAN is
			-- Has "gexslt:explain" been coded on this element?
		local
			an_explain_value: STRING
		do
			an_explain_value := attribute_value_by_expanded_name (Gexslt_explain_attribute)
			if an_explain_value /= Void and then STRING_.same_string (an_explain_value, "no") then
				Result := False
			elseif an_explain_value /= Void and then STRING_.same_string (an_explain_value, "yes") then
				Result := True
			else
				an_explain_value := containing_stylesheet.attribute_value_by_expanded_name (Gexslt_explain_attribute)
				if an_explain_value /= Void then 
					Result := STRING_.same_string (an_explain_value, "all")
				end
			end
		end

	is_top_level: BOOLEAN is
			-- Is `Current' a top-level element?
		local
			a_stylesheet: XM_XSLT_STYLESHEET
		do
			a_stylesheet ?= parent_node
			Result := a_stylesheet /= Void
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent an in-scope variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		do
			Result :=  is_local_variable_declared (a_fingerprint)
				or else is_global_variable_declared (a_fingerprint)
		end

	is_defined_excluded_namespace (a_uri_code: INTEGER): BOOLEAN is
			-- Is `a_uri_code' defined as an excluded namespace within `Current'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if excluded_namespaces /= Void then
				from
					a_cursor := excluded_namespaces.new_cursor
					a_cursor.start
				variant
					excluded_namespaces.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_cursor.item = a_uri_code then
						Result := True
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
			end
		end

	is_excluded_namespace (a_uri_code: INTEGER): BOOLEAN is
			-- Is `a_uri_code' defined as an excluded namespace on this or any ancestor element?
		local
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			if a_uri_code = Xslt_uri_code then
				Result := True
			else
				from
					a_style_element ?= Current
				until
					Result or else a_style_element = Void
				loop
					if a_style_element.is_defined_excluded_namespace (a_uri_code) then
						Result := True
					else
						a_style_element ?= a_style_element.parent
					end
				end
			end
		end

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := False
		end

	may_contain_fallback: BOOLEAN is
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := may_contain_sequence_constructor
		end

feature -- Status setting

	set_validation_error (a_message: STRING; a_condition: INTEGER) is
			-- Set a validation error.
		require
			validation_message_not_void: a_message /= Void
			validation_reporting: Report_always <= a_condition and then a_condition <= Report_if_instantiated
		do
			if validation_error_message = Void
				or else a_condition < reporting_circumstances then
				validation_error_message := a_message
				reporting_circumstances := a_condition
			end
		ensure
			validation_error_message_not_void: validation_error_message /= Void
			reporting_circumstances: reporting_circumstances <= a_condition
		end

	report_absence (an_attribute_name: STRING) is
			-- Report absence of a compulsory attribute.
		require
			attribute_name_not_void:  an_attribute_name /= Void
		local
			a_message: STRING
		do
			a_message := STRING_.appended_string ("Element must have a %"", an_attribute_name)
			a_message := STRING_.appended_string (a_message, "%" attribute")
			report_compile_error (a_message)
		end

	report_compile_error (a_message: STRING) is
			-- Report a compile error.
		require
			validation_message_not_void: a_message /= Void
		do
			error_listener.fatal_error (a_message, Current)
			principal_stylesheet.set_compile_errors
		ensure
			compile_errors: any_compile_errors
		end

	report_compile_warning (a_message: STRING) is
			-- Report a compile warning.
		require
			validation_message_not_void: a_message /= Void
		do
			error_listener.warning (a_message, Current)
		end

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		do
			do_nothing
		end

	check_unknown_attribute (a_name_code: INTEGER) is
			-- Check whether an unknown attribute is permitted.
		local
			an_attribute_uri, an_element_uri, a_local_name, a_message: STRING
		do
			if not is_forwards_compatible_processing_enabled then
				an_attribute_uri := shared_name_pool.namespace_uri_from_name_code (a_name_code)
				an_element_uri := uri	
				a_local_name := shared_name_pool.local_name_from_name_code (a_name_code)

				-- Allow xsl:extension-element-prefixes etc on an extension element.

				if is_instruction and then
					STRING_.same_string (an_attribute_uri, Xslt_uri) and then
					not STRING_.same_string (an_element_uri, Xslt_uri) and then
					(
					 STRING_.same_string (a_local_name, Xpath_default_namespace_attribute) or else
					 STRING_.same_string (a_local_name, Extension_element_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Exclude_result_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Version_attribute)
					 ) then
					do_nothing

					-- Allow standard attributes on an XSLT element.

				elseif STRING_.same_string (an_element_uri, Xslt_uri) and then
					STRING_.same_string (an_attribute_uri, "") and then
					(
					 STRING_.same_string (a_local_name, Use_when_attribute) or else
					 STRING_.same_string (a_local_name, Xpath_default_namespace_attribute) or else
					 STRING_.same_string (a_local_name, Extension_element_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Exclude_result_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Version_attribute)
					 ) then
					do_nothing
				elseif STRING_.same_string (an_attribute_uri, "") or else
					STRING_.same_string (an_attribute_uri, Xslt_uri) then
					a_message := STRING_.appended_string ("Attribute ", shared_name_pool.display_name_from_name_code (a_name_code))
					a_message := STRING_.appended_string (a_message, " is not allowed on this element")
					report_compile_error (a_message)
				end
			end
		end

	check_top_level is
			-- Check `Current' is a top-level element.
		do
			if not is_top_level then
				report_compile_error (STRING_.appended_string (node_name, " must only be used at top level of stylesheet"))
			end
		end

	check_empty is
			-- Check `Current' has no children
		do
			if has_child_nodes then
				report_compile_error (STRING_.appended_string (node_name, " must be empty"))
			end
		end

	check_empty_with_attribute (an_attribute_name: STRING) is
			-- Check `Current' has no children
		require
			attribute_namer_not_void: an_attribute_name /= Void
		local
			a_message: STRING
		do
			if has_child_nodes then
				a_message := STRING_.appended_string (node_name, " must be empty when the '")
				a_message := STRING_.appended_string (a_message, an_attribute_name)
				a_message := STRING_.appended_string (a_message, "' attribute is supplied.")
				report_compile_error (a_message)
			end
		end

	check_not_empty_missing_attribute (an_attribute_name: STRING) is
			-- Check `Current' has children
		require
			attribute_namer_not_void: an_attribute_name /= Void
		local
			a_message: STRING
		do
			if not has_child_nodes then
				a_message := STRING_.appended_string (node_name, " must not be empty when the '")
				a_message := STRING_.appended_string (a_message, an_attribute_name)
				a_message := STRING_.appended_string (a_message, "' attribute is not supplied.")
				report_compile_error (a_message)
			end
		end

	type_check_expression (a_name: STRING; an_expression: XM_XPATH_EXPRESSION) is
			-- Type-check and optimize `an expression.'.
			-- This is called to check each expression while the containing  instruction is being validated.
			-- It is not just a static type-check, it also adds code
			--  to perform any necessary run-time type checking and/or conversion
		require
			expression_not_in_error: an_expression /= Void and then not an_expression.is_error
			valid_name: a_name /= Void and then a_name.count > 0
		do
			an_expression.analyze (static_context)
			if is_explaining then
				std.error.put_string ("Attribute '")
				std.error.put_string (a_name)
				std.error.put_string ("' of element '")
				std.error.put_string (node_name)
				std.error.put_string ("' at line ")
				--	std.error.put_string (line_number)
				std.error.put_string (" %N")
				if not an_expression.is_error then
					std.error.put_string ("Static type: ")
					std.error.put_string (an_expression.item_type.conventional_name)
					std.error.put_string (an_expression.occurence_indicator)
					std.error.put_new_line
					std.error.put_string ("Optimized expression tree:%N")
					an_expression.display (10)
				else
					std.error.put_string ("Expression is in error%N")
					std.error.put_string (an_expression.error_value.error_message)
					std.error.put_new_line
				end
			end
			if an_expression.is_error and then an_expression.error_value.type /= Dynamic_error then
				report_compile_error (an_expression.error_value.error_message)
			else
				allocate_slots (an_expression)
			end
		end

	type_check_pattern (a_name: STRING; a_pattern: XM_XSLT_PATTERN) is
			-- Type-check `a_pattern'.
			-- This is called to check each expression while the containing  instruction is being validated.
			-- It is not just a static type-check, it also adds code
			--  to perform any necessary run-time type checking and/or conversion
		require
			pattern_not_void: a_pattern /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		do
			a_pattern.type_check (static_context)
			if a_pattern.is_error then
				report_compile_error (a_pattern.error_value.error_message)
			end
		end

	check_within_template is
			-- Check `Current' is within a template.
		local
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			a_style_element ?= parent
			if a_style_element = Void or else not a_style_element.may_contain_sequence_constructor then
				report_compile_error (STRING_.concat (node_name, " may only be used within a sequence constructor"))
			end
		end

	check_only_with_parameter_content is
			-- Check contents of `Current' is only xsl:with-param elements.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_parameter: XM_XSLT_WITH_PARAM
			a_text_node: XM_XPATH_TEXT
			finished: BOOLEAN
		do
			if has_child_nodes then
				from
					a_child_iterator := new_axis_iterator (Child_axis)
					a_child_iterator.start
				until
					finished or else a_child_iterator.after
				loop
					a_parameter ?= a_child_iterator.item
					if a_parameter = Void then

						-- may be a whitespace text node

						a_text_node ?= a_child_iterator.item
						if a_text_node /= Void and then is_all_whitespace (a_text_node.string_value) then
							do_nothing
						else
							report_compile_error ("xsl:call-template may only have xsl:with-param children")
							finished := True
						end
					end
					a_child_iterator.forth
				end
			end
		end

feature -- Creation

	new_trace_instruction (an_instruction: XM_XSLT_INSTRUCTION): XM_XSLT_TRACE_INSTRUCTION is
			-- newly created trace instruction
		require
			base_instruction_not_void: an_instruction /= Void
		local
			a_trace_instruction: XM_XSLT_TRACE_INSTRUCTION
		do
			a_trace_instruction ?= an_instruction
			if a_trace_instruction /= Void then

				-- this can happen, for example, after optimizing a compile-time xsl:if
				
				Result := a_trace_instruction
			else
				create Result.make (an_instruction)
				set_additional_trace_properties (Result)
			end
		ensure
			trace_instruction_not_void: Result /= Void
		end

	generate_attribute_value_template (an_avt_expression: STRING; a_static_context: XM_XSLT_EXPRESSION_CONTEXT) is
			-- Generate an attribute-valued-template.
			-- The static context may be altered as a result of parsing.
		require
			avt_not_void: an_avt_expression /= Void
			static_context_not_void: a_static_context /= Void
		local
			components: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			a_leading_character, a_left_curly_brace, a_right_curly_brace, a_behaviour: INTEGER
			a_left_double_curly_brace, a_right_double_curly_brace: BOOLEAN
			a_parser: XM_XSLT_PATTERN_PARSER
			a_concat_function: XM_XPATH_CONCAT
			an_expression: XM_XPATH_EXPRESSION
		do
			create components.make (5)
			components.set_equality_tester (expression_tester)
			from
				a_leading_character := 1
			variant
				an_avt_expression.count + 1 - a_leading_character
			until
				a_leading_character > an_avt_expression.count
			loop
				a_left_curly_brace := an_avt_expression.index_of ('{', a_leading_character)
				a_left_double_curly_brace := a_left_curly_brace > 0 and then an_avt_expression.index_of ('{', a_leading_character + a_left_curly_brace) = 1
				a_right_curly_brace := an_avt_expression.index_of ('}', a_leading_character)
				a_right_double_curly_brace := a_right_curly_brace > 0 and then an_avt_expression.index_of ('}', a_leading_character + a_right_curly_brace) = 1

				if a_left_curly_brace = 0 and then a_right_curly_brace = 0 then
					a_behaviour := Fixed_component
				elseif a_left_double_curly_brace then
					a_behaviour := Left_double_curly_brace_component
				elseif a_right_double_curly_brace then
					a_behaviour := Right_double_curly_brace_component					
				elseif a_left_curly_brace > 0 and then a_right_curly_brace > a_left_curly_brace then
					a_behaviour := Avt_component
				else
					a_behaviour := Avt_component + 1 -- logic error
				end

				inspect
					a_behaviour
				when Fixed_component then
					append_fixed_component (components, an_avt_expression.substring (a_leading_character, an_avt_expression.count))
					a_leading_character := an_avt_expression.count + 1
				when Right_double_curly_brace_component then
					append_fixed_component (components, an_avt_expression.substring (a_leading_character, a_right_curly_brace))
					a_leading_character := a_right_curly_brace + 2
				when Left_double_curly_brace_component then
					append_fixed_component (components, an_avt_expression.substring (a_leading_character, a_left_curly_brace))
					a_leading_character := a_left_curly_brace + 2
				when Avt_component then
					if a_leading_character < a_left_curly_brace then
						append_fixed_component (components, an_avt_expression.substring (a_leading_character, a_left_curly_brace - 1))
					end
					create a_parser.make
					a_parser.parse (an_avt_expression, a_static_context, a_left_curly_brace + 1, Right_curly_token)
					if not a_parser.is_parse_error then
						a_parser.last_parsed_expression.simplify
						if a_parser.last_parsed_expression.was_expression_replaced then
							an_expression := a_parser.last_parsed_expression.replacement_expression
						else
							an_expression := a_parser.last_parsed_expression
						end
						append_parsed_expression (components, an_expression)
					else
						todo ("generate_attribute_value_template - error expression", True)
					end
					a_leading_character := a_right_curly_brace + 1
				end
			end

			if components.count = 0 then
				create {XM_XPATH_STRING_VALUE} last_generated_expression.make ("")
			elseif components.count = 1 then
				last_generated_expression := components.item (1)
--			elseif a_static_context.is_backwards_compatible_mode then
--				last_generated_expression := components.item (1)
			else
				create a_concat_function.make
				a_concat_function.set_arguments (components)
				last_generated_expression := a_concat_function
			end
		ensure
			attribute_value_template_not_void: last_generated_expression /= Void
		end

	generate_name_code (a_qname: STRING) is
			-- Generate a name code and register it in the name pool.
			-- `Current' is used as the context for namespace resolution.
			-- The default namespace is not used.
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_xml_prefix, a_uri, a_local_name: STRING
			a_uri_code: INTEGER			
		do
			last_generated_name_code := -1
			create a_string_splitter.make
			a_string_splitter.set_separators (":")
			qname_parts := a_string_splitter.split (a_qname)
			if qname_parts.count = 1 then
				an_xml_prefix := ""
				if shared_name_pool.is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_qname) then
					last_generated_name_code := shared_name_pool.name_code (an_xml_prefix, shared_name_pool.uri_from_uri_code (a_uri_code), a_qname)
				else
					if not shared_name_pool.is_name_pool_full_using_uri_code (a_uri_code, a_qname) then
						shared_name_pool.allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_qname)
						last_generated_name_code := shared_name_pool.last_name_code
					else
						error_message := STRING_.appended_string ("Name pool has no room to allocate ", a_qname)
						last_generated_name_code := -1
					end
				end
			else
				check
					two_parts: qname_parts.count = 2
				end
				an_xml_prefix := qname_parts.item (1)
				a_local_name := qname_parts.item (2)
				a_uri := uri_for_prefix (an_xml_prefix, False)
				if is_reserved_namespace (a_uri) then
					error_message := STRING_.appended_string ("Namespace prefix ", an_xml_prefix)
					error_message := STRING_.appended_string (error_message, " refers to a reserved namespace")
					last_generated_name_code := -1
				else
					if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
						last_generated_name_code := shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
					else
						if not shared_name_pool.is_name_pool_full (a_uri, a_local_name) then
							shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
							last_generated_name_code := shared_name_pool.last_name_code
						else
							error_message := STRING_.appended_string ("Name pool has no room to allocate {", a_uri)
							error_message := STRING_.appended_string (error_message, "}")
							error_message := STRING_.appended_string (error_message, a_local_name)
							last_generated_name_code := -1
						end
					end
				end
			end
			ensure
				possible_error: last_generated_name_code = -1 implies error_message /= Void
		end

	generate_expression (an_expression: STRING) is
			-- Create an expression.
		require
			expression_text_not_void: an_expression /= Void
			static_context_not_void: static_context /= Void
		do
			expression_factory.make_expression (an_expression, static_context, 1, Eof_token)
			if expression_factory.is_parse_error then
				if not is_forwards_compatible_processing_enabled then
					report_compile_error (expression_factory.parsed_error_value.error_message)
				end
				create {XM_XPATH_STRING_VALUE} last_generated_expression.make (expression_factory.parsed_error_value.error_message)
				last_generated_expression.set_last_error (expression_factory.parsed_error_value)
			else
				last_generated_expression := expression_factory.parsed_expression
			end
		ensure
			generated_expression: last_generated_expression /= Void
		end

	generate_pattern (a_pattern: STRING) is
			-- Create a pattern.
		require
			pattern_text_not_void: a_pattern /= Void
			static_context_not_void: static_context /= Void
		local
			a_pattern_parser: XM_XSLT_PATTERN_PARSER
		do
			create a_pattern_parser.make
			a_pattern_parser.parse_pattern (a_pattern, static_context)
			if not a_pattern_parser.is_parse_error then
				last_generated_pattern := a_pattern_parser.last_parsed_pattern.simplified_pattern
			else
				report_compile_error (a_pattern_parser.first_parse_error)
				create {XM_XSLT_NO_NODE_TEST} last_generated_pattern.make
			end
		ensure
			generated_pattern: last_generated_pattern /= Void
		end

	generate_sequence_type (a_sequence_type: STRING) is
			-- Create a sequence type.
		require
			sequence_type_not_void: a_sequence_type /= Void
		local
			a_pattern_parser: XM_XSLT_PATTERN_PARSER
		do
			if static_context = Void then
				create static_context.make (Current)
			end
			create a_pattern_parser.make
			a_pattern_parser.parse_sequence_type (a_sequence_type, static_context)
			if a_pattern_parser.is_parse_error then
				report_compile_error (a_pattern_parser.first_parse_error)
				create last_generated_sequence_type.make_any_sequence
			else
				last_generated_sequence_type := a_pattern_parser.last_parsed_sequence
			end
		ensure
			generated_sequence_type: last_generated_sequence_type /= Void
		end

feature -- Element change

	set_additional_trace_properties (a_trace_instruction: XM_XSLT_TRACE_INSTRUCTION) is
			-- Set additional properties on `a_trace_instruction'.
		require
			trace_instruction_not_void: a_trace_instruction /= Void
		do
			-- default does nothing
		end

	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		require
			variable_declared: is_variable_declared (a_fingerprint)
		do
			if is_local_variable_declared (a_fingerprint) then
				bind_local_variable (a_fingerprint)
			else
				principal_stylesheet.bind_global_variable (a_fingerprint, static_context)
			end
		ensure
			variable_bound: static_context.last_bound_variable /= Void
		end

	fixup_references is
			-- Fix up references from XPath expressions.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					a_style_element.fixup_references
				end
				a_child_iterator.forth
			end				
		end

	allocate_slots (an_expression: XM_XPATH_EXPRESSION) is
			-- Allocate slots in the stack frame for local variables contained in `an_expression'.
		require
			not_excluded: not is_excluded
			expression_not_void: an_expression /= Void
		local
			a_procedure: XM_XSLT_PROCEDURE
			a_template: XM_XSLT_TEMPLATE
			a_first_slot: INTEGER
		do
			a_procedure := owning_procedure
			a_template ?= Current
			
			-- If `Current' is not part of a procedure, then
			--  it needs it's own stack frame to contain its variables.
			-- Also, expressions in the match pattern of an xsl:template
			--  can be evaluated without a stack fram being created

			if a_procedure = Void or else a_template /= Void then 
				an_expression.allocate_slots (1)
				containing_stylesheet.allocate_local_slots (an_expression.last_slot_number)
			else
				a_first_slot := a_procedure.number_of_variables + 1
				an_expression.allocate_slots (a_first_slot)
				if an_expression.last_slot_number > a_first_slot then
					containing_stylesheet.allocate_local_slots (an_expression.last_slot_number)
					a_procedure.set_number_of_variables (an_expression.last_slot_number)

					-- This algorithm is not very efficient because it never reuses
					--  a slot when a variable goes out of scope. But at least it is safe.
					-- Note that range variables within XPath expressions need to maintain
					--  a slot until the instruction they are part of finishes, e.g. in
					--  xsl:for-each.
				 
				end
			end
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			static_context_not_void: static_context /= Void
		deferred
		ensure
			attributes_prepared: attributes_prepared
		end

	process_attributes is
			-- Process the attribute list for the element.
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			static_context_not_void: static_context /= Void
		do
			prepare_attributes
			if is_error then
				if is_forwards_compatible_processing_enabled then
					todo ("process_attributes (forward comptibility)", True)
				end
				todo ("process_attributes", True)
			end
		ensure
			attributes_prepared: attributes_prepared
		end
	
	process_all_attributes is
			-- Process the attributes of this element and all its children
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared		
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			create static_context.make (Current)
			process_attributes
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					a_style_element.process_all_attributes
				end
				a_child_iterator.forth
			end
		ensure
			attributes_prepared: attributes_prepared
		end

	process_use_when_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]use-when attribute. 
		require
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Use_when_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			a_static_context: XM_XSLT_EXPRESSION_CONTEXT
			a_use_when_attribute: STRING
			an_expression: XM_XPATH_EXPRESSION
			a_dynamic_context: XM_XSLT_EVALUATION_CONTEXT
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			a_use_when_attribute := attribute_value_by_expanded_name (an_attribute_name)
			if a_use_when_attribute /= Void then
				create a_static_context.make_restricted (Current)
				expression_factory.make_expression (a_use_when_attribute, a_static_context, 1, Eof_token)
				if expression_factory.is_parse_error then
					report_compile_error (expression_factory.parsed_error_value.error_message)
				else
					an_expression := expression_factory.parsed_expression
					an_expression.analyze (a_static_context)
					if an_expression.is_error then
						report_compile_error (an_expression.error_value.error_message)
					else
						if an_expression.was_expression_replaced then
							an_expression := an_expression.replacement_expression
						end
						if an_expression.is_error then
							report_compile_error (an_expression.error_value.error_message)
						else
							create a_dynamic_context.make_restricted (a_static_context)
							a_boolean_value := an_expression.effective_boolean_value (a_dynamic_context)
							if a_boolean_value.is_error then
								report_compile_error (a_boolean_value.error_value.error_message)
							else
								is_excluded := not a_boolean_value.value
							end
						end
					end
				end
			end
		end

	process_default_xpath_namespace_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]default-xpath-namespace attribute. 
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Xpath_default_namespace_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		do
			default_xpath_namespace := attribute_value_by_expanded_name (an_attribute_name)
		end

	process_version_attribute (an_attribute_name: STRING; a_condition: INTEGER) is
			--	Process the [xsl:]version attribute. 
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			version_attribute_not_processed: not version_attribute_processed
			validation_reporting: Report_always <= a_condition and then a_condition <= Report_if_instantiated
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Version_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			a_version: STRING
			a_parent: XM_XSLT_STYLE_ELEMENT
			finished: BOOLEAN
		do
			a_version := attribute_value_by_expanded_name (an_attribute_name)
			if a_version /= Void then
				if a_version.index_of ('e', 1) > 0 or else a_version.index_of ('E', 1) > 0 then
					set_validation_error ("The version attribute must be a decimal literal", a_condition)
				else
					create version.make_from_string (a_version)
					if version.is_special then
						set_validation_error ("The version attribute must be a decimal literal", a_condition)
					end
				end
			else

				-- Find non-`Void' value on nearest ancestor

				from
					a_parent ?= parent_node
				until
					finished
				loop
					if a_parent = Void then
						finished := True
					else
						if a_parent.version /= Void then
							version := a_parent.version
							finished := True
						end
						a_parent ?= parent_node
					end
				end
			end
			version_attribute_processed := True
		ensure
			version_attribute_processed: version_attribute_processed
		end

	process_extension_element_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]extension-element-prefixes attribute. 
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Extension_element_prefixes_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			extensions, an_extension: STRING
			a_splitter: ST_SPLITTER
			an_extension_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			extensions := attribute_value_by_expanded_name (an_attribute_name)
			if extensions /= Void then
				create a_splitter.make
				an_extension_list := a_splitter.split (extensions)
				if an_extension_list.count > 0 then
					create extension_namespaces.make (an_extension_list.count)
					from
						a_cursor := an_extension_list.new_cursor
						a_cursor.start
					variant
						an_extension_list.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						an_extension := a_cursor.item
						if STRING_.same_string (an_extension, "#default") then
							an_extension := ""
						end
						extension_namespaces.put_last (uri_code_for_prefix (an_extension))
						a_cursor.forth
					end
				end
			end
		end

	process_excluded_namespaces_attribute (an_attribute_name: STRING) is
			--	Process the  [xsl:]exclude-result-prefixes attribute.
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Exclude_result_prefixes_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			exclusions, an_exclusion: STRING
			a_splitter: ST_SPLITTER
			an_exclusion_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			exclusions := attribute_value_by_expanded_name (an_attribute_name)
			if exclusions /= Void then
				STRING_.left_adjust (exclusions)
				STRING_.right_adjust (exclusions)
				if STRING_.same_string (exclusions, "#all") then
					todo ("process_excluded_namespaces_attribute - #all", True)
				else
					create a_splitter.make
					an_exclusion_list := a_splitter.split (exclusions)
					if an_exclusion_list.count > 0 then
						create excluded_namespaces.make (an_exclusion_list.count)
						from
							a_cursor := an_exclusion_list.new_cursor
							a_cursor.start
						variant
							an_exclusion_list.count + 1 - a_cursor.index
						until
							a_cursor.after
						loop
							an_exclusion := a_cursor.item
							if STRING_.same_string (an_exclusion, "#default") then
								an_exclusion := ""
							elseif STRING_.same_string (an_exclusion, "#all") then
								report_compile_error ("In exclude-result-prefixes, cannot mix #all with other values")
								a_cursor.go_after
							end
							if not shared_name_pool.is_code_for_prefix_allocated (an_exclusion) then
								shared_name_pool.allocate_code_for_prefix (an_exclusion)
							end
							excluded_namespaces.put_last (uri_code_for_prefix (an_exclusion))
							a_cursor.forth
						end
					end					
				end
			end
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		require
			not_excluded: not is_excluded
			attributes_prepared: attributes_prepared
			not_validated: not validated
		do
			validated := True
		end

	post_validate is
			-- Hook to allow additional validation of a parent element
			--  immediately after its children have been validated.
		require
			not_excluded: not is_excluded
			children_validated: children_validated
			post_validate_not_run: not post_validated
		do
			post_validated := True
		end

	validate_subtree is
			-- Recursively walk through the stylesheet to validate all nodes.
		require
			not_excluded: not is_excluded
			not_validated: not validated
		do
			if validation_error_message /= Void then
				if reporting_circumstances = Report_always then
					report_compile_error (validation_error_message)
				elseif reporting_circumstances = Report_unless_forwards_comptible and then not is_forwards_compatible_processing_enabled then
					report_compile_error (validation_error_message)
				end
			else
				validate
				if validated and not any_compile_errors then
					validate_children
					if children_validated and not any_compile_errors then
						post_validate
					end
				end
			end
		end

	validate_children is
			-- Validate the children of this node, recursively.
		require
			not_excluded: not is_excluded
			validated: validated
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element, a_last_child: XM_XSLT_STYLE_ELEMENT
			a_variable: XM_XSLT_VARIABLE
			a_stylesheet: XM_XSLT_STYLESHEET
		do
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					a_style_element.validate_subtree
					a_last_child := a_style_element
				end
				a_child_iterator.forth
			end
			a_variable ?= a_last_child 
			if a_variable /= Void then
				a_stylesheet ?= Current
				if a_stylesheet = Void then
					report_compile_warning ("A variable with no following sibling instructions has no effect")
				end
			end
			children_validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		require
			not_excluded: not is_excluded
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
		deferred
		end

	compile_children (an_executable: XM_XSLT_EXECUTABLE; an_instruction: XM_XSLT_INSTRUCTION) is
			-- Compile the children of `an_instruction' on the stylesheet tree, adding the
			--  subordinate instructions to the parent instruction on the execution tree.
		require
			not_excluded: not is_excluded
			executable_not_void: an_executable /= Void
			instruction_not_void: an_instruction /=Void
		local
			a_stylesheet:XM_XSLT_STYLESHEET
			an_iterator:XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_instruction_list: DS_LINKED_LIST [XM_XSLT_INSTRUCTION]
			a_node: XM_XPATH_NODE
			a_text_instruction: XM_XSLT_COMPILED_TEXT
			a_module_number: INTEGER
			a_style_element: XM_XSLT_STYLE_ELEMENT
			another_instruction: XM_XSLT_INSTRUCTION
			a_string_value: XM_XPATH_STRING_VALUE
		do
			an_instruction.set_executable (an_executable)
			a_stylesheet := principal_stylesheet
			create an_instruction_list.make
			from
				an_iterator := new_axis_iterator (Child_axis)
				an_iterator.start
			until
				an_iterator.after
			loop
				a_node := an_iterator.item
				if a_node.node_type = Text_node then
					create a_text_instruction.make (an_executable, False)
					create a_string_value.make (a_node.string_value)
					a_text_instruction.set_select_expression (a_string_value)
					check
						module_registered: a_stylesheet.is_module_registered (a_node.system_id)
					end
					a_text_instruction.set_source_location (a_stylesheet.module_number (a_node.system_id), a_node.line_number)
					an_instruction_list.put_last (a_text_instruction)
				else
					a_style_element ?= a_node
					if a_style_element /= Void then
						if validation_error_message /= Void then
							fallback_processing (an_executable, a_style_element, an_instruction_list)
						else
							a_style_element.compile (an_executable)
							another_instruction := a_style_element.last_generated_instruction
							if another_instruction /= Void then
								another_instruction.set_executable (an_executable)
								check
									module_registered: a_stylesheet.is_module_registered (a_style_element.system_id)
								end
								another_instruction.set_source_location (a_stylesheet.module_number (a_style_element.system_id), a_style_element.line_number)
								if stylesheet_compiler.configuration.is_tracing then
									another_instruction := a_style_element.new_trace_instruction (another_instruction)
								end
								an_instruction_list.put_last (another_instruction)
							end
						end
					else
						check
							only_text_and_style_elements: False
						end
					end
				end
				an_iterator.forth
			end
			create last_generated_instruction_list.make_from_linear (an_instruction_list)
			an_instruction.set_children (last_generated_instruction_list)
		ensure
			instruction_children_not_void: an_instruction.children /= Void
		end

	fallback_processing (an_executable: XM_XSLT_EXECUTABLE; a_style_element: XM_XSLT_STYLE_ELEMENT; an_instruction_list: DS_LINKED_LIST [XM_XSLT_INSTRUCTION]) is
			-- Perform fallback processing.
		require
			not_excluded: not is_excluded
			executable_not_void: an_executable /= Void
			style_element_not_void: a_style_element /= Void and then a_style_element.validation_error_message /= Void
			intruction_list_not_void: an_instruction_list /= Void
		local
			found_fallback: BOOLEAN
			an_iterator:XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_block: XM_XSLT_BLOCK
			a_fallback: XM_XSLT_FALLBACK
			a_deferred_error: XM_XSLT_DEFERRED_ERROR
			a_stylesheet: XM_XSLT_STYLESHEET
		do

			-- Process any xsl:fallback children; if there are none,
			--  generate code to report the original failure reason

			from
				an_iterator := a_style_element.new_axis_iterator (Child_axis)
				an_iterator.start
			until
				an_iterator.after
			loop
				a_fallback ?= an_iterator.item
				if a_fallback /= Void then
					found_fallback := True
					a_stylesheet := principal_stylesheet
					check
						module_registered: a_stylesheet.is_module_registered (a_fallback.system_id)
					end
					create a_block.make_fallback (an_executable)
					a_block.set_source_location (a_stylesheet.module_number (a_fallback.system_id), a_fallback.line_number)
					a_fallback.compile_children (an_executable, a_block)
					an_instruction_list.put_last (a_block)
				end
				an_iterator.forth
			end
			if not found_fallback then
				create a_deferred_error.make (an_executable, a_style_element.validation_error_message, a_style_element.node_name)
			end
		end

	accumulate_attribute_sets (used_sets: STRING; a_usage_list: DS_ARRAYED_LIST [XM_XSLT_ATTRIBUTE_SET]) is
			-- Accumulate attribute sets associated with `Current'
		require
			not_excluded: not is_excluded
			used_attribute_sets_not_void: used_sets /= Void
		local
			a_list: DS_ARRAYED_LIST [XM_XSLT_ATTRIBUTE_SET]
			a_stylesheet: XM_XSLT_STYLESHEET
			top_level_elements: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			a_splitter: ST_SPLITTER
			an_attribute_set_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_set_name: STRING
			a_fingerprint: INTEGER
			found: BOOLEAN
			another_cursor: DS_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			an_attribute_set: XM_XSLT_ATTRIBUTE_SET
			a_third_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_ATTRIBUTE_SET]
		do
			if a_usage_list = Void then
				create a_list.make_default
			else
				a_list := a_usage_list
			end
			a_stylesheet := principal_stylesheet
			top_level_elements := a_stylesheet.top_level_elements
			create a_splitter.make
			an_attribute_set_list := a_splitter.split (used_sets)
			from
				a_cursor := an_attribute_set_list.new_cursor; a_cursor.start
			variant
				an_attribute_set_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_set_name := a_cursor.item
				generate_name_code (a_set_name)
				a_fingerprint := fingerprint_from_name_code (last_generated_name_code)
				if a_fingerprint = -1 then
					report_compile_error (error_message)
					a_cursor.go_after
				else
					found := False

					-- Ssearch for the named attribute set, using all of them if there are several with the same name
					
					from
						another_cursor := top_level_elements.new_cursor; another_cursor.start
					variant
						top_level_elements.count + 1 - another_cursor.index
					until
						another_cursor.after
					loop
						an_attribute_set ?= another_cursor.item
						if an_attribute_set /= Void and then an_attribute_set.qname_fingerprint = a_fingerprint then
							found := True
							a_list.force_last (an_attribute_set)
						end
						another_cursor.forth
					end
					if not found then
						report_compile_error (STRING_.concat ("No attribute-set exists named ", a_set_name))
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
			end
			if not any_compile_errors then
				create used_attribute_sets.make (a_list.count)
				from
					a_third_cursor := a_list.new_cursor; a_third_cursor.start
				variant
					a_list.count + 1 - a_third_cursor.index
				until
					a_third_cursor.after
				loop
					a_third_cursor.item.increment_reference_count
					used_attribute_sets.put_last (a_third_cursor.item.instruction)
					a_third_cursor.forth
				end
			end
		ensure
			accumulated_list_not_void: not any_compile_errors implies used_attribute_sets /= Void
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Local

	is_local_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent an in-scope local variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node, a_previous_node: XM_XPATH_NODE
			a_stylesheet: XM_XSLT_STYLESHEET
			a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			finished, finished_inner: BOOLEAN
		do
			if not is_top_level then
				from
					a_previous_node := Current
					a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
					a_preceding_iterator.start
				until
					finished
				loop
					if a_preceding_iterator.after then
						from
							finished_inner := False
							a_node := Void
						until
							finished_inner or else a_node /= Void
						loop
							a_node := a_previous_node.parent
							a_previous_node := a_node
							a_stylesheet ?= a_node.parent
							if a_stylesheet /= Void then
								finished_inner := True
							else
								a_preceding_iterator := a_node.new_axis_iterator (Preceding_sibling_axis)
								a_preceding_iterator.start
								if not a_preceding_iterator.after then
									a_node := a_preceding_iterator.item
								else
									a_node := Void
								end
							end
						end
					else
						a_node := a_preceding_iterator.item
					end
					a_stylesheet ?= a_node.parent
					if a_stylesheet /= Void then
						finished := True
					else
						a_variable_declaration ?= a_node
						if a_variable_declaration /= Void then
							Result := a_variable_declaration.variable_fingerprint = a_fingerprint
							if Result then finished := True end
						end
					end
					if not finished and then not a_preceding_iterator.after then a_preceding_iterator.forth end
				end
			end
		end
	
	is_global_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a global variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		do
			Result := principal_stylesheet.is_global_variable_declared (a_fingerprint)
		end

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := any_item
		ensure
			returned_item_type_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	Fixed_component: INTEGER is 1
	Left_double_curly_brace_component: INTEGER is 2
	Right_double_curly_brace_component: INTEGER is 3
	Avt_component: INTEGER is 4
			-- Constants used by `generate_attribute_value_template'
	
	common_child_item_type: XM_XPATH_ITEM_TYPE is
			-- Most general type of item returned by the children of this instruction
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
			a_style_element: XM_XSLT_STYLE_ELEMENT
			finished: BOOLEAN
		do
			Result := empty_item
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				finished or else a_child_iterator.after
			loop
				a_node := a_child_iterator.item
				if a_node = Void then
					finished := True
				else
					a_style_element ?= a_node
					if a_style_element /= Void then
						Result := common_super_type (Result, a_style_element.returned_item_type)
					else
						Result := common_super_type (Result, text_node_kind_test)
					end
					if Result = any_item then
						finished := True
					else
						a_child_iterator.forth
					end
				end
			end
		ensure
			common_child_item_type_not_void: Result /= Void	
		end

	append_fixed_component (components: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; a_string_component: STRING) is
			--	Append `a_string_component' onto `components'.
		require
			components_not_void: components /= Void
			string_component_not_void: a_string_component /= Void
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create a_string_value.make (a_string_component)
			if not components.extendible (1) then
				components.resize (2 * components.count)
			end
			components.put_last (a_string_value)
		ensure
			one_more: components.count = old components.count + 1
		end

	append_parsed_expression (components: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; an_expression: XM_XPATH_EXPRESSION) is
			-- Append `an_expression' onto `components'.
		require
			components_not_void: components /= Void
			expression_not_void: an_expression /= Void
		local
			a_result_expression: XM_XPATH_EXPRESSION
			an_atomizer: XM_XPATH_ATOMIZER_EXPRESSION
			a_first_item_expression: XM_XPATH_FIRST_ITEM_EXPRESSION
			an_atomic_sequence_converter: XM_XPATH_ATOMIC_SEQUENCE_CONVERTER
			a_string_join_function: XM_XPATH_STRING_JOIN
			arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			a_blank: XM_XPATH_STRING_VALUE
		do
			if is_backwards_compatible_processing_enabled then
				if is_sub_type (an_expression.item_type, type_factory.any_atomic_type) then
					a_result_expression := an_expression
				else
					create an_atomizer.make (an_expression)
					a_result_expression := an_atomizer
				end
				if a_result_expression.cardinality_allows_many then
					create a_first_item_expression.make (a_result_expression)
					a_result_expression := a_first_item_expression
				end
				if not is_sub_type (a_result_expression.item_type, type_factory.string_type) then
					create an_atomic_sequence_converter.make (a_result_expression, type_factory.string_type)
					a_result_expression := an_atomic_sequence_converter
				end
			else
				create an_atomizer.make (an_expression)
				create an_atomic_sequence_converter.make (an_atomizer, type_factory.string_type)
				create a_string_join_function.make
				create arguments.make (2)
				arguments.set_equality_tester (expression_tester)
				arguments.put (an_atomic_sequence_converter, 1)
				create a_blank.make (" ")
				arguments.put (a_blank, 2)
				a_string_join_function.set_arguments (arguments)
				a_result_expression := a_string_join_function
			end
			if not components.extendible (1) then
				components.resize (2 * components.count)
			end
			components.put_last (a_result_expression)
		ensure
			at_least_one_more: components.count > old components.count
		end

	decimal_two: MA_DECIMAL is
			-- 2.0
		once
			create Result.make_from_integer (2)
		ensure
			result_not_void: Result /= Void
		end

	bind_local_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		require
			variable_declared: is_local_variable_declared (a_fingerprint)
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node, a_previous_node: XM_XPATH_NODE
			a_stylesheet: XM_XSLT_STYLESHEET
			a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			finished, finished_inner: BOOLEAN
		do			
			from
				a_previous_node := Current
				a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
				a_preceding_iterator.start
			until
				finished
			loop
				if a_preceding_iterator.after then
					from
						finished_inner := False
						a_node := Void
					until
						finished_inner or else a_node /= Void
					loop
						a_node := a_previous_node.parent
						a_previous_node := a_node
						a_stylesheet ?= a_node.parent
						if a_stylesheet /= Void then
							finished_inner := True
						else
							a_preceding_iterator := a_node.new_axis_iterator (Preceding_sibling_axis)
							a_preceding_iterator.start
							if not a_preceding_iterator.after then
								a_node := a_preceding_iterator.item
							else
								a_node := Void
							end
						end
					end
				else
					a_node := a_preceding_iterator.item
				end
				a_stylesheet ?= a_node.parent
				if a_stylesheet /= Void then
					finished := True
				else
					a_variable_declaration ?= a_node
					if a_variable_declaration /= Void then
						if a_variable_declaration.variable_fingerprint = a_fingerprint then
							static_context.set_last_bound_variable (a_variable_declaration)
							finished := True
						end
					end
				end
				if not finished and then not a_preceding_iterator.after then a_preceding_iterator.forth end
			end
		ensure
			variable_bound: static_context.last_bound_variable /= Void
		end

invariant

	inherited_verion: version_attribute_processed implies version /= Void
	validation_reporting: Report_always <= reporting_circumstances and then reporting_circumstances <= Report_if_instantiated
	error_listener_not_void: error_listener /= Void

end
