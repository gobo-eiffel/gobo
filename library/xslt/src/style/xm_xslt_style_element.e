﻿note

	description:

		"Element nodes in an XSLT stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_STYLE_ELEMENT

inherit

	XM_XPATH_TREE_ELEMENT

	XM_XSLT_TRACE_DETAILS

	XM_XSLT_VALIDATION

	ST_STRING_ROUTINES

	XM_XSLT_STYLE_CONSTANTS

	XM_XPATH_SHARED_EXPRESSION_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_PROMOTION_ACTIONS
		export {NONE} all end

	XM_XPATH_TYPE

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_EXPRESSION_CONTAINER

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
	an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
	a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		require
			error_listener_not_void: an_error_listener /= Void
			document_not_void: a_document /= Void
			configuration_not_void: a_configuration /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do
			configuration := a_configuration
			reporting_circumstances := Report_always
			error_listener := an_error_listener
			create version.make_zero
			make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		ensure
			error_listener_set: error_listener = an_error_listener
			configuration_set: configuration = a_configuration
			name_code_set: name_code = a_name_code
		end

feature {XM_XSLT_NODE_FACTORY} -- Validation

	check_default_collation_name
			-- Check default collation_name is valid.
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached local_default_collation_name as l_local_default_collation_name and then default_collation_name.is_empty then
				create l_error.make_from_string (STRING_.concat ("None of the following are recognized as a collation URI by this implementation: ", l_local_default_collation_name), Xpath_errors_uri, "XTSE0125", Static_error)
				set_last_error (l_error)
			end
		end

feature -- Access

	construct_type: INTEGER
			-- Type of construct being traced
		do
			Result := fingerprint
		end

	trace_properties: DS_LIST [STRING]
			-- Additional trace properties
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_attribute: XM_XPATH_TREE_ATTRIBUTE
		do
			create {DS_ARRAYED_LIST [STRING]} Result.make_default
			Result.set_equality_tester (string_equality_tester)
			from
				an_iterator := new_axis_iterator (Attribute_axis); an_iterator.start
			until
				an_iterator.after
			loop
				an_attribute := an_iterator.item.as_tree_node.as_tree_attribute
				Result.force_last (shared_name_pool.expanded_name_from_name_code (an_attribute.fingerprint))
				an_iterator.forth
			end
		end

	trace_property (an_expanded_name: STRING): STRING
			-- Value of trace-property
		do
			check attached attribute_value_by_name (namespace_uri_from_expanded_name (an_expanded_name), local_name_from_expanded_name (an_expanded_name)) as l_trace_property then
				Result := l_trace_property
			end
		end

	default_collation_name: STRING
			-- Default collation name
		local
			a_splitter: ST_SPLITTER
			some_collation_names: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_collation_name: STRING
			l_result: detachable STRING
		do
			if attached local_default_collation_name as l_local_default_collation_name then
				create a_splitter.make
				some_collation_names := a_splitter.split (l_local_default_collation_name)
				from
					a_cursor := some_collation_names.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_collation_name := a_cursor.item
					check attached principal_stylesheet as l_principal_stylesheet then
						if l_principal_stylesheet.collation_map.has (a_collation_name) then
							l_result := a_collation_name
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end
				variant
					some_collation_names.count + 1 - a_cursor.index
				end
				if l_result /= Void then
					Result := l_result
				else
					Result := ""
				end
			else
				if attached {XM_XSLT_STYLE_ELEMENT} parent as a_style_element then
					Result := a_style_element.default_collation_name
				else
					Result := Unicode_codepoint_collation_uri
				end
			end
		end

	configuration: XM_XSLT_CONFIGURATION
			-- System configuration

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	local_default_xpath_namespace: detachable STRING
			-- Default XPath namespace

	version: MA_DECIMAL
			-- Value of the applicable version attribute

	is_instruction: BOOLEAN
			-- Is `Current' an instruction?

	static_context: detachable XM_XSLT_EXPRESSION_CONTEXT
			-- Static context

	used_attribute_sets: detachable DS_ARRAYED_LIST [INTEGER]
			-- Names of attribute-sets used by `Current'

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN
			-- Is `a_style_element' a permitted child of `Current'?
		require
			not_void: a_style_element /= Void
		do
			Result := False
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER
			-- Approximate count of references by parameters of `Current' to `a_binding'
		do
			-- pre-condition cannot be met
		end

	default_xpath_namespace: STRING
			-- Namespace URI of default XPath namespace
		local
			l_style_element: detachable XM_XSLT_STYLE_ELEMENT
			l_namespace: detachable STRING
			l_result: detachable STRING
		do
			from
				l_style_element := Current
			until
				l_result /= Void or l_style_element = Void or l_namespace /= Void
			loop
				l_namespace := l_style_element.local_default_xpath_namespace
				if l_namespace = Void then
					if attached {XM_XSLT_STYLE_ELEMENT} l_style_element.parent_node as l_style_element_parent_node then
						l_style_element := l_style_element_parent_node
					else
						l_style_element := Void
					end
				else
					l_result := l_namespace
				end
			end
			if l_result /= Void then
				Result := l_result
			else
				Result := Null_uri
			end
		end

	containing_slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager from containing procedure
		do
			check attached owning_procedure as l_owning_procedure then
				Result := l_owning_procedure.slot_manager
			end
		end

	containing_stylesheet: detachable XM_XSLT_STYLESHEET
			-- Containing stylesheet;
			-- N.B. This may not be the principal stylersheet, it may be
			--  an included or imported module.
		require
			-- commented out - see post-condition comments
			-- well_formed_stylesheet: True -- Can't easily check, but all nodes other than XM_XSLT_STYLESHEETs must have a parent.
		local
			l_node: detachable XM_XPATH_TREE_COMPOSITE_NODE
			l_finished: BOOLEAN
		do
			from
				l_node := Current
				if attached {XM_XSLT_STYLESHEET} l_node as l_stylesheet then
					Result := l_stylesheet
				end
				l_finished := Result /= Void
			until
				l_finished
			loop
				if l_node = Void then
					l_finished := True
				else
					l_node := l_node.parent
					if attached {XM_XSLT_STYLESHEET} l_node as l_stylesheet then
						Result := l_stylesheet
					end
					l_finished := Result /= Void
				end
			end
		ensure
			-- in the presence of compile errors, the next line won't necessarily be true
			-- but any_compile_errors calls this routine.
			-- containing_stylesheet_not_void: Result /= Void
		end

	principal_stylesheet: detachable XM_XSLT_STYLESHEET
			-- Top-level stylesheet
		local
			another_stylesheet: detachable XM_XSLT_STYLESHEET
		do
			from
				Result := containing_stylesheet
				if Result /= Void then
					another_stylesheet := Result.importer
				end
			until
				another_stylesheet = Void
			loop
				Result := another_stylesheet
				another_stylesheet := Result.importer
			end
		ensure
			-- the next line is true except in the case of well-formedness errors
			-- prinicpal_stylesheet_not_void: Result /= Void
		end

	stylesheet_compiler: detachable XM_XSLT_STYLESHEET_COMPILER
			-- Stylesheet compiler
		do
			check attached principal_stylesheet as l_principal_stylesheet then
				Result := l_principal_stylesheet.stylesheet_compiler
			end
		end

	owning_procedure: detachable XM_XSLT_PROCEDURE
			-- Owning Procedure definition, if this is a local variable
		local
			a_node: XM_XPATH_NODE
			a_next_node: detachable XM_XPATH_NODE
			found: BOOLEAN
		do
			from
				a_node := Current
			until
				found
			loop
				a_next_node := a_node.parent
				if attached {XM_XSLT_STYLESHEET} a_next_node as a_stylesheet then
					found := True
					if attached {XM_XSLT_STYLE_ELEMENT} a_node as a_style_element then
						if a_style_element.is_template then
							Result := a_style_element.as_template
						elseif a_style_element.is_xslt_variable_declaration then
							Result := a_style_element.as_xslt_variable_declaration
						elseif a_style_element.is_attribute_set then
							Result := a_style_element.as_attribute_set
						elseif a_style_element.is_xslt_function then
							Result := a_style_element.as_xslt_function
						elseif a_style_element.is_key then
							Result := a_style_element.as_key
						end
					end
				end
				check a_next_node /= Void then
					a_node := a_next_node
				end
			end
		end

	attribute_value_by_expanded_name (an_attribute_name: STRING): detachable STRING
			-- Value of `an_attribute_name'
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
		do
			if not shared_name_pool.is_expanded_name_allocated (an_attribute_name) then
				shared_name_pool.allocate_expanded_name (an_attribute_name)
			end
			Result := attribute_value (shared_name_pool.fingerprint_from_expanded_name (an_attribute_name))
		end

	precedence: INTEGER
			-- Import precedence of `Current'
		do
			check attached containing_stylesheet as l_containing_stylesheet then
				Result := l_containing_stylesheet.precedence
			end
		end

	uri_for_prefix (an_xml_prefix: STRING; use_default_namespace: BOOLEAN): detachable STRING
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

	last_child_instruction: detachable XM_XSLT_STYLE_ELEMENT
			-- Last child instruction of this instruction.
			-- Returns `Void' if there are no child instructions,
			--  or if the last child is a text node.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				if attached {XM_XSLT_STYLE_ELEMENT} a_child_iterator.item as a_style_element then
					Result := a_style_element
				else
					Result := Void
				end
				a_child_iterator.forth
			end
		end

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Namespace context
		do
			create Result.make (namespace_codes_in_scope)
		end

	with_param_instructions (an_executable: XM_XSLT_EXECUTABLE; is_tunnel: BOOLEAN): DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- List of tunnel or non-tunnel parameters
		require
			executable_not_void: an_executable /= Void
		local
			a_parameter_count: INTEGER
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			from
				an_iterator := new_axis_iterator (Child_axis)
				an_iterator.start
			until
				an_iterator.after
			loop
				if attached {XM_XSLT_WITH_PARAM} an_iterator.item as a_with_param and then a_with_param.is_tunnel_parameter = is_tunnel then
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
				if attached {XM_XSLT_WITH_PARAM} an_iterator.item as a_with_param and then a_with_param.is_tunnel_parameter = is_tunnel then
					a_with_param.compile (an_executable)
					check
						with_param_instruction: attached {XM_XSLT_COMPILED_WITH_PARAM} a_with_param.last_generated_expression as a_compiled_with_param
					then
						Result.put_last (a_compiled_with_param)
					end
				end
				an_iterator.forth
			end
		ensure
			result_list_not_void: Result /= Void
		end

	sort_keys: detachable DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			-- List of sort keys

	assemble_sort_keys
			-- Create and assemble sort keys
		require
			no_previous_error: not any_compile_errors
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_sort_key_count: INTEGER
			l_sort_keys: like sort_keys
		do
			from
				l_iterator := new_axis_iterator (Child_axis); l_iterator.start
			until
				l_iterator.after or any_compile_errors
			loop
				if attached {XM_XSLT_SORT} l_iterator.item as l_sort then
					if l_sort_key_count /= 0 and l_sort.stable_attribute_value /= Void then
						report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("stable attribute may appear only on the first xsl:sort element", Xpath_errors_uri, "XTSE1017", Static_error))
					end
					l_sort_key_count := l_sort_key_count + 1
				end
				l_iterator.forth
			end
			if not any_compile_errors and l_sort_key_count > 0 then
				from
					l_iterator := new_axis_iterator (Child_axis); l_iterator.start
					create l_sort_keys.make (l_sort_key_count)
					sort_keys := l_sort_keys
				until
					l_iterator.after or any_compile_errors
				loop
					if attached {XM_XSLT_SORT} l_iterator.item as l_sort then
						check attached l_sort.sort_key_definition as l_sort_key_definition then
							l_sort_keys.put_last (l_sort_key_definition)
						end
					end
					l_iterator.forth
				end
			else
				create sort_keys.make (0)
			end
		ensure
			sort_key_list_not_void: sort_keys /= Void
		end

	stylesheet_function (a_fingerprint, an_arity: INTEGER): detachable XM_XSLT_FUNCTION
			-- Xsl:function named by `a_fingerprint' with `an_arity' arguments
		require
			positive_fingerprint: a_fingerprint >= 0
			nearly_positive_arity: an_arity >= -1 -- -1 = any arity will do
		local
			a_root: XM_XSLT_STYLESHEET
			a_top_level_element_list: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do

			-- We rely on the search following the order of decreasing import precedence.

			check attached principal_stylesheet as l_principal_stylesheet then
				a_root := l_principal_stylesheet
			end
			check attached a_root.top_level_elements as l_root_top_level_elements then
				a_top_level_element_list := l_root_top_level_elements
			end
			from
				a_cursor := a_top_level_element_list.new_cursor; a_cursor.finish
			until
				a_cursor.before
			loop
				if a_cursor.item.is_xslt_function and then a_cursor.item.as_xslt_function.function_fingerprint = a_fingerprint
					and then (an_arity = -1 or else a_cursor.item.as_xslt_function.arity = an_arity) then
						Result := a_cursor.item.as_xslt_function
						a_cursor.go_before
				else
					a_cursor.back
				end
			variant
				a_cursor.index
			end
		ensure
			function_may_not_be_available: True
		end

	is_extension_instruction_namespace (a_uri_code: INTEGER): BOOLEAN
			-- Is `a_uri_code' an in-scope extension instruction namespace?
		local
			a_style_element: detachable XM_XSLT_STYLE_ELEMENT
		do
			from
				a_style_element := Current
			until
				Result or else a_style_element = Void
			loop
				Result := a_style_element.is_defined_extension_instruction_namespace (a_uri_code)
				if not Result then
					if attached {XM_XSLT_STYLE_ELEMENT} a_style_element.parent as l_style_element then
						a_style_element := l_style_element
					else
						a_style_element := Void
					end
				end
			end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING
			-- System identifier
		do
			check attached principal_stylesheet as l_principal_stylesheet then
				Result := l_principal_stylesheet.system_id_from_module_number (a_module_number)
			end
		end

feature -- Status_report

	any_compile_errors: BOOLEAN
			-- Have any compile errors been reported?
		local
			l_stylesheet: detachable like principal_stylesheet
		do
			l_stylesheet := principal_stylesheet
			if l_stylesheet /= Void then
				Result := l_stylesheet.any_compile_errors
			end
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

	validation_error: detachable XM_XPATH_ERROR_VALUE

	last_generated_name_code: INTEGER
			-- Last name code generated by `generate_name_code'

	last_generated_expression: detachable XM_XPATH_EXPRESSION
			-- Result of last call to `generate_expression' or `compile' or `compile_sequence_constructor'

	last_generated_pattern: detachable XM_XSLT_PATTERN
			-- Result of last call to `generate_pattern'

	last_generated_sequence_type: detachable XM_XPATH_SEQUENCE_TYPE
			-- Result of last call to `generate_sequence_type'

	name_code_error_value: detachable XM_XPATH_ERROR_VALUE
			-- Error value created by `generate_name_code'

	frozen is_computed_expression: BOOLEAN
			-- Is `Current' a computed expression?
		do
			-- `False'
		end

	is_absent_extension_element: BOOLEAN
			-- Is `Current' and `XM_XSLT_ABSENT_EXTENSION_ELEMENT'?
		do
			Result := False
		end

	is_user_function: BOOLEAN
			-- Is `Current' a compiled user function?
		do
			-- `False'
		end

	is_stylesheet_in_error: BOOLEAN
			-- is any element of the stylsheet tree compiled in error?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
		do
			if is_error then Result := True
			else

				-- recusively check all the children

				from
					a_cursor := children.new_cursor
					a_cursor.start
				until
					a_cursor.after
				loop
					if attached {XM_XSLT_STYLE_ELEMENT} a_cursor.item as a_style_element then
						if a_style_element.is_stylesheet_in_error then
							Result := True
							a_cursor.go_after
						end
					end
					if not a_cursor.after then a_cursor.forth end
				variant
					children.count + 1 - a_cursor.index
				end
			end
		end

	is_forwards_compatible_processing_enabled: BOOLEAN
			-- Is forwards-compatible mode enabled for this element?
		do
			Result := version > decimal_two
		end

	is_backwards_compatible_processing_enabled: BOOLEAN
			-- Is backwards-compatible mode enabled for this element?
		do
			Result := version < decimal_two
		end

	is_explaining: BOOLEAN
			-- Has "gexslt:explain" been coded on this or any child element?

	is_top_level: BOOLEAN
			-- Is `Current' a top-level element?
		do
			Result := attached {XM_XSLT_STYLESHEET} parent_node
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent an in-scope variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		do
			Result :=  is_local_variable_declared (a_fingerprint)
				or else is_global_variable_declared (a_fingerprint)
		end

	is_excluded_namespace (a_uri_code: INTEGER): BOOLEAN
			-- Is `a_uri_code' defined as an excluded namespace on this or any ancestor element?
		local
			a_style_element: detachable XM_XSLT_STYLE_ELEMENT
		do
			if a_uri_code = Xslt_uri_code then
				Result := True
			elseif is_extension_instruction_namespace (a_uri_code) then
				Result := True
			else
				from
					a_style_element := Current
				until
					Result or else a_style_element = Void
				loop
					if a_style_element.is_defined_excluded_namespace (a_uri_code) then
						Result := True
					else
						if attached {XM_XSLT_STYLE_ELEMENT} a_style_element.parent as l_style_element_parent then
							a_style_element := l_style_element_parent
						else
							a_style_element := Void
						end
					end
				end
			end
		end

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := False
		end

	may_contain_fallback: BOOLEAN
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := may_contain_sequence_constructor
		end

	is_apply_templates: BOOLEAN
			-- Is `Current' an xsl:apply-templates?
		do
			Result := False
		end

	is_param: BOOLEAN
			-- Is `Current' an xsl:param?
		do
			Result := False
		end

	is_stylesheet: BOOLEAN
			-- Is `Current' an xsl:stylesheet or xsl:transform?
		do
			Result := False
		end

	is_for_each: BOOLEAN
			-- Is `Current' an xsl:for-each?
		do
			Result := False
		end

	is_for_each_group: BOOLEAN
			-- Is `Current' an xsl:for-each-group?
		do
			Result := False
		end

	is_perform_sort: BOOLEAN
			-- Is `Current' an xsl:perform-sort?
		do
			Result := False
		end

	is_sort: BOOLEAN
			-- Is `Current' an xsl:sort?
		do
			Result := False
		end

	is_template: BOOLEAN
			-- Is `Current' an xsl:template?
		do
			Result := False
		end

	is_xslt_variable: BOOLEAN
			-- Is `Current' an xsl:variable?
		do
			Result := False
		end

	is_character_map: BOOLEAN
			-- Is `Current' an xsl:character-map?
		do
			Result := False
		end

	is_attribute_set: BOOLEAN
			-- Is `Current' an xsl:attribute-set?
		do
			Result := False
		end

	is_xslt_variable_declaration: BOOLEAN
			-- Is `Current' an xsl:variable or xsl:param?
		do
			Result := False
		end

	is_namespace_alias: BOOLEAN
			-- Is `Current' an xsl:namespace-alias?
		do
			Result := False
		end

	is_xslt_function: BOOLEAN
			-- Is `Current' an xsl:function?
		do
			Result := False
		end

	is_module: BOOLEAN
			-- Is `Current' an xsl:include/import?
		do
			Result := False
		end

	is_output: BOOLEAN
			-- Is `Current' an xsl:output?
		do
			Result := False
		end

	is_key: BOOLEAN
			-- Is `Current' an xsl:key?
		do
			Result := False
		end

	is_fallback: BOOLEAN
			-- Is `Current' an xsl:fallback?
		do
			Result := False
		end

	is_matching_substring: BOOLEAN
			-- Is `Current' an xsl:matching-substring?
		do
			Result := False
		end

	is_non_matching_substring: BOOLEAN
			-- Is `Current' an xsl:non-matching-substring?
		do
			Result := False
		end

	is_decimal_format: BOOLEAN
			-- Is `Current' an xsl:decimal_format?
		do
			Result := False
		end

	is_gexslt_document: BOOLEAN
			-- Is `Current' a gexslt:document?
		do
			Result := False
		end

	is_gexslt_collection: BOOLEAN
			-- Is `Current' a gexslt:collection?
		do
			Result := False
		end

feature -- Status setting

	set_validation_error (an_error: XM_XPATH_ERROR_VALUE; a_condition: INTEGER)
			-- Set a validation error.
		require
			error_not_void: an_error /= Void
			validation_reporting: Report_always <= a_condition and then a_condition <= Report_if_instantiated
		do
			if validation_error = Void
				or else a_condition < reporting_circumstances then
					validation_error := an_error
					reporting_circumstances := a_condition
			end
		ensure
			validation_error_not_void: validation_error /= Void
			reporting_circumstances: reporting_circumstances <= a_condition
		end

	report_absence (an_attribute_name: STRING)
			-- Report absence of a compulsory attribute.
		require
			attribute_name_not_void:  an_attribute_name /= Void
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_message := STRING_.appended_string ("Element must have a %"", an_attribute_name)
			a_message := STRING_.appended_string (a_message, "%" attribute")
			create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0010", Static_error)
			report_compile_error (an_error)
		end

	report_compile_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Report a compile error.
		require
			validation_message_not_void: a_error /= Void
		local
			l_stylesheet: detachable XM_XSLT_STYLESHEET
		do
			if not system_id.is_empty and then not a_error.is_location_known then a_error.set_location (system_id, line_number) end
			error_listener.fatal_error (a_error)
			l_stylesheet := principal_stylesheet
			if l_stylesheet /= Void then
				l_stylesheet.set_compile_errors
			end
		ensure
			compile_errors: principal_stylesheet /= Void implies any_compile_errors
		end

	report_compile_warning (a_message: STRING)
			-- Report a compile warning.
		require
			validation_message_not_void: a_message /= Void
		do
			error_listener.warning (a_message, Current)
		end

	mark_tail_calls
			-- Mark tail-recursive calls on templates and functions.
		do
			-- do nothing
		end

	check_unknown_attribute (a_name_code: INTEGER)
			-- Check whether an unknown attribute is permitted.
		local
			an_error: XM_XPATH_ERROR_VALUE
			an_attribute_uri, an_element_uri, a_local_name, a_message: STRING
			an_explain_value: detachable STRING
		do
			an_attribute_uri := shared_name_pool.namespace_uri_from_name_code (a_name_code)
			an_element_uri := uri
			a_local_name := shared_name_pool.local_name_from_name_code (a_name_code)

			if STRING_.same_string (an_attribute_uri, Gexslt_eiffel_type_uri) and then
				STRING_.same_string (a_local_name, Gexslt_explain_name) then
					an_explain_value := attribute_value_by_expanded_name (Gexslt_explain_attribute)
				if an_explain_value /= Void and then STRING_.same_string (an_explain_value, "no") then
					is_explaining := False
				elseif an_explain_value /= Void and then STRING_.same_string (an_explain_value, "yes") then
					is_explaining := True
				elseif an_explain_value /= Void and then STRING_.same_string (an_explain_value, "all") then
					is_explaining := True
				end
			elseif not is_forwards_compatible_processing_enabled then

				-- Allow standard on an Extension Instruction or a user-defined Data Element.

				if is_instruction and then
					STRING_.same_string (an_attribute_uri, Xslt_uri) and then
					STRING_.same_string (an_element_uri, Gexslt_eiffel_type_uri) and then
					(
						STRING_.same_string (a_local_name, Use_when_attribute) or else
						STRING_.same_string (a_local_name, Xpath_default_namespace_attribute) or else
						STRING_.same_string (a_local_name, Extension_element_prefixes_attribute) or else
						STRING_.same_string (a_local_name, Exclude_result_prefixes_attribute) or else
						STRING_.same_string (a_local_name, Version_attribute) or else
						STRING_.same_string (a_local_name, Default_collation_attribute)
					) then
						-- do nothing

						-- Allow standard attributes on an XSLT element.

				elseif STRING_.same_string (an_element_uri, Xslt_uri) and then
					STRING_.same_string (an_attribute_uri, "") and then
					(
						STRING_.same_string (a_local_name, Use_when_attribute) or else
						STRING_.same_string (a_local_name, Xpath_default_namespace_attribute) or else
						STRING_.same_string (a_local_name, Extension_element_prefixes_attribute) or else
						STRING_.same_string (a_local_name, Exclude_result_prefixes_attribute) or else
						STRING_.same_string (a_local_name, Version_attribute) or else
						STRING_.same_string (a_local_name, Default_collation_attribute)
					) then
						-- do nothing
				elseif STRING_.same_string (an_attribute_uri, "") or else
					STRING_.same_string (an_attribute_uri, Xslt_uri) then
						a_message := STRING_.appended_string ("Attribute ", shared_name_pool.display_name_from_name_code (a_name_code))
						a_message := STRING_.appended_string (a_message, " is not allowed on this element")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0090", Static_error)
						report_compile_error (an_error)

				end
			end
		end

	check_top_level (an_error_code: detachable STRING)
			-- Check `Current' is a top-level element.
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_code: STRING
		do
			if not is_top_level then
				if an_error_code = Void then
					a_code := "XTSE0010"
				else
					a_code := an_error_code
				end
				create an_error.make_from_string (STRING_.concat (node_name, " must only be used at top level of stylesheet"), "", a_code, Static_error)
				report_compile_error (an_error)
			end
		end

	check_empty
			-- Check `Current' has no children (except permitted fallbacks)
		local
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_error_found: BOOLEAN
		do
			if has_child_nodes then
				if may_contain_fallback then
					from
						l_child_iterator := new_axis_iterator (Child_axis)
						l_child_iterator.start
					until
						l_error_found or else l_child_iterator.after
					loop
						if not attached {XM_XSLT_FALLBACK} l_child_iterator.item then
							l_error_found := True
						end
						l_child_iterator.forth
					end
				else
					l_error_found := True
				end
				if l_error_found then
					report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (node_name, " must be empty."), Xpath_errors_uri, "XTSE0260", Static_error))
				end
			end
		end

	check_empty_with_attribute (an_attribute_name, an_error_code: STRING)
			-- Check `Current' has no children
		require
			attribute_name_not_void: an_attribute_name /= Void
			error_code_not_void: an_error_code /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
		do
			if has_child_nodes then
				a_message := STRING_.appended_string (node_name, " must be empty when the '")
				a_message := STRING_.appended_string (a_message, an_attribute_name)
				a_message := STRING_.appended_string (a_message, "' attribute is supplied.")
				create an_error.make_from_string (a_message, Xpath_errors_uri, an_error_code, Static_error)
				report_compile_error (an_error)
			end
		end

	check_not_empty_missing_attribute (an_attribute_name, an_error_code: STRING)
			-- Check `Current' has children
		require
			attribute_name_not_void: an_attribute_name /= Void
			error_code_not_void: an_error_code /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
		do
			if not has_child_nodes then
				a_message := STRING_.appended_string (node_name, " must not be empty when the '")
				a_message := STRING_.appended_string (a_message, an_attribute_name)
				a_message := STRING_.appended_string (a_message, "' attribute is not supplied.")
				create an_error.make_from_string (a_message, Xpath_errors_uri, an_error_code, Static_error)
				report_compile_error (an_error)
			end
		end

	type_check_expression (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];	a_name: STRING; a_expression: XM_XPATH_EXPRESSION)
			-- Type-check and optimize `an expression.'.
			-- This is called to check each expression while the containing  instruction is being validated.
			-- It is not just a static type-check, it also adds code
			--  to perform any necessary run-time type checking and/or conversion
		require
			expression_not_in_error: a_expression /= Void and then not a_expression.is_error
			valid_name: a_name /= Void and then a_name.count > 0
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_analyzed_expression: XM_XPATH_EXPRESSION
		do
			if a_expression.is_computed_expression then

				-- temporary measure, until instruction is compiled:

				a_expression.as_computed_expression.set_parent (Current)
			end
			check attached static_context as l_static_context then
				a_expression.check_static_type (a_replacement, l_static_context, any_item)
			end
			check postcondition_of_check_static_type: attached a_replacement.item as l_replacement_item then
				l_analyzed_expression := l_replacement_item
			end
			if attached l_analyzed_expression.error_value as l_error_value then
				check is_error: l_analyzed_expression.is_error end
				if l_error_value.type /= Dynamic_error then
					report_compile_error (l_error_value)
				end
			else
				a_replacement.put (Void)
				l_analyzed_expression.resolve_calls_to_current_function (a_replacement)
				check postcondition_of_resolve_calls_to_current_function: attached a_replacement.item as l_replacement_item then
					l_analyzed_expression := l_replacement_item
				end
				if attached l_analyzed_expression.error_value as l_error_value and then l_error_value.type /= Dynamic_error then
					check is_error: l_analyzed_expression.is_error end
					report_compile_error (l_error_value)
				end
			end
		end

	type_check_pattern (a_name: STRING; a_pattern: XM_XSLT_PATTERN)
			-- Type-check `a_pattern'.
			-- This is called to check each pattern while the containing  instruction is being validated.
			-- It is not just a static type-check, it also adds code
			--  to perform any necessary run-time type checking and/or conversion
		require
			pattern_not_void: a_pattern /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		local
			l_uses_current, l_name_code_created: BOOLEAN
			l_sub_expressions: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			l_name_code, l_counter: INTEGER
			l_required_type: XM_XPATH_SEQUENCE_TYPE
			l_sequence_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			l_offer: XM_XPATH_PROMOTION_OFFER
			l_local_name_prefix, l_local_name: STRING
		do
			check attached static_context as l_static_context then
				a_pattern.type_check (l_static_context, any_node_test)
			end
			if attached a_pattern.error_value as l_error_value then
				check is_error: a_pattern.is_error end
				-- TODO - this should be a dynamic error
				report_compile_error (l_error_value)
			end
			if a_pattern.is_location_pattern then
				from
					l_sub_expressions := a_pattern.sub_expressions.new_cursor
					l_sub_expressions.start
				until
					l_sub_expressions.after
				loop
					if l_sub_expressions.item.calls_function (Current_function_type_code) then
						l_uses_current := True
						l_sub_expressions.go_after
					else
						l_sub_expressions.forth
					end
				end
				if l_uses_current then
					from
						l_local_name_prefix := "current_"; l_counter := 0
					until
						l_name_code_created
					loop
						l_local_name := STRING_.concat (l_local_name_prefix, l_counter.out)
						if not shared_name_pool.is_name_code_allocated ("gexslt_system_usage", Gexslt_examples_uri, l_local_name) then
							shared_name_pool.allocate_name ("gexslt_system_usage", Gexslt_examples_uri, l_local_name)
							l_name_code_created := True
							l_name_code := shared_name_pool.last_name_code
						else
							l_counter := l_counter + 1
						end
					end
					create l_required_type.make_single_item
					create l_range_variable.make ("gexslt_system_usage:current_function", l_name_code, l_required_type)
					create l_sequence_expression.make_current
					create l_let_expression.make (l_range_variable, l_sequence_expression, create {XM_XPATH_EMPTY_SEQUENCE}.make)
					create l_offer.make (Replace_current, Void, l_let_expression, False, False)
					a_pattern.as_location_pattern.resolve_current (l_let_expression, l_offer)
					allocate_slots (l_let_expression, containing_slot_manager)
					l_range_variable.fix_up_references (l_let_expression)
				end
			end
		end

	check_within_template
			-- Check `Current' is within a template.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do

			-- TODO: review - parents should all check their children, not vice-versa

			if not attached {XM_XSLT_STYLE_ELEMENT} parent as a_style_element or else not a_style_element.may_contain_sequence_constructor then
				create an_error.make_from_string (STRING_.concat (node_name, " may only be used within a sequence constructor"), Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
		end

	check_sort_comes_first (sort_required: BOOLEAN)
			-- Check if all xsl:sort children precede all other elements
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
			non_sort_found, sort_found: BOOLEAN
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
		do
			from
				l_iterator := new_axis_iterator (Child_axis); l_iterator.start
			until
				any_compile_errors or else l_iterator.after
			loop
				a_node := l_iterator.item
				if attached {XM_XSLT_SORT} a_node as l_sort then
					if non_sort_found then
						a_message := STRING_.concat ("Within ", node_name)
						a_message := STRING_.appended_string (a_message, ", xsl:sort elements must come before all other elements")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
					sort_found := True
				elseif a_node.node_type = Text_node then

					-- with xml:space=preserve, white space nodes may still be there

					if	not is_all_whitespace (a_node.string_value) then
						non_sort_found := True
					end
				else
					non_sort_found := True
				end
				l_iterator.forth
			end
			if sort_required and then not sort_found then
				create an_error.make_from_string (STRING_.concat (node_name, " must have at least one xsl:sort child"), Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
		end

	check_only_with_parameter_content
			-- Check contents of `Current' is only xsl:with-param elements.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
		do
			if has_child_nodes then
				from
					a_child_iterator := new_axis_iterator (Child_axis)
					a_child_iterator.start
				until
					finished or else a_child_iterator.after
				loop
					if not attached {XM_XSLT_WITH_PARAM} a_child_iterator.item as a_parameter then

						-- may be a whitespace text node or xsl:fallback

						if a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
							-- do nothing
						elseif may_contain_fallback then
							if not attached {XM_XSLT_FALLBACK} a_child_iterator.item as a_fallback then
								create an_error.make_from_string (STRING_.concat (node_name, " may only have xsl:with-param children"), Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (an_error)
								finished := True
							end
						else
							create an_error.make_from_string (STRING_.concat (node_name, " may only have xsl:with-param children"), Xpath_errors_uri, "XTSE0010", Static_error)
							report_compile_error (an_error)
							finished := True
						end
					end
					a_child_iterator.forth
				end
			end
		end

feature -- Creation

	new_trace_wrapper (a_child: XM_XPATH_EXPRESSION; an_executable: XM_XSLT_EXECUTABLE;  some_details: XM_XSLT_TRACE_DETAILS): XM_XSLT_TRACE_WRAPPER
			-- newly created trace wrapper
		require
			child_expresion_not_void: a_child /= Void
			executable_not_void: an_executable /= Void
			trace_details_not_void: some_details /= Void
		do
			if attached {XM_XSLT_TRACE_WRAPPER} a_child as a_trace_wrapper then

				-- this can happen, for example, after optimizing a compile-time xsl:if

				Result := a_trace_wrapper
			else
				create {XM_XSLT_TRACE_INSTRUCTION} Result.make (a_child, an_executable, some_details)
			end
		ensure
			trace_wrapper_not_void: Result /= Void
		end

	generate_attribute_value_template (a_avt: STRING; a_static_context: XM_XSLT_EXPRESSION_CONTEXT)
			-- Generate an attribute-valued-template.
			-- The static context may be altered as a result of parsing.
		require
			avt_not_void: a_avt /= Void
			static_context_not_void: a_static_context /= Void
		local
			l_avt: XM_XSLT_AVT_PARSER
			l_concat_function: XM_XPATH_CONCAT
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_last_generated_expression: like last_generated_expression
		do
			create l_avt.make (a_avt, a_static_context, configuration.are_all_nodes_untyped)
			l_avt.parse_components (line_number)

			if attached l_avt.error_value as l_error_value then
				create {XM_XPATH_INVALID_VALUE} l_last_generated_expression.make (l_error_value)
			elseif l_avt.components.count = 0 then
				create {XM_XPATH_STRING_VALUE} l_last_generated_expression.make ("")
			elseif l_avt.components.count = 1 then
				create l_replacement.make (Void)
				l_avt.components.item (1).simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					l_last_generated_expression := l_replacement_item
				end
			else
				create l_concat_function.make
				l_concat_function.set_arguments (l_avt.components)
				create l_replacement.make (Void)
				l_concat_function.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					l_last_generated_expression := l_replacement_item
				end
			end
			last_generated_expression := l_last_generated_expression
			if attached l_last_generated_expression.error_value as l_error_value then
				check is_error: l_last_generated_expression.is_error end
				report_compile_error (l_error_value)
			end
		ensure
			attribute_value_template_not_void: last_generated_expression /= Void
		end

	generate_name_code (a_qname: STRING)
			-- Generate a name code and register it in the name pool.
			-- `Current' is used as the context for namespace resolution.
			-- The default namespace is not used.
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: detachable STRING
			l_message: STRING
			l_uri_code: INTEGER
		do
			last_generated_name_code := -1
			create l_parser.make (a_qname)
			if not l_parser.is_prefix_present then
				check attached l_parser.local_name as l_local_name then
					if shared_name_pool.is_name_code_allocated_using_uri_code ("", l_uri_code, l_local_name) then
						last_generated_name_code := shared_name_pool.name_code ("", shared_name_pool.uri_from_uri_code (l_uri_code), l_local_name)
					else
						if not shared_name_pool.is_name_pool_full_using_uri_code (l_uri_code, l_local_name) then
							shared_name_pool.allocate_name_using_uri_code ("", l_uri_code, l_local_name)
							last_generated_name_code := shared_name_pool.last_name_code
						else
							create name_code_error_value.make_from_string (STRING_.concat ("Name pool has no room to allocate ", a_qname), Gexslt_eiffel_type_uri, "NAME_POOL", Static_error)
							last_generated_name_code := -1
						end
					end
				end
			else
				check is_prefix_present: attached l_parser.optional_prefix as l_optional_prefix then
					l_uri := uri_for_prefix (l_optional_prefix, False)
					if l_uri = Void then
						l_message := STRING_.concat ("Namespace prefix ", l_optional_prefix)
						l_message := STRING_.appended_string (l_message, " does not have an in-scope binding")
						create name_code_error_value.make_from_string (l_message, Xpath_errors_uri, "XTSE0280", Static_error)
					elseif is_reserved_namespace (l_uri) then
						l_message := STRING_.concat ("Namespace prefix ", l_optional_prefix)
						l_message := STRING_.appended_string (l_message, " refers to a reserved namespace")
						create name_code_error_value.make_from_string (l_message, Xpath_errors_uri, "XTSE0080", Static_error)
						last_generated_name_code := -1
					else
						check attached l_parser.local_name as l_local_name then
							if shared_name_pool.is_name_code_allocated (l_optional_prefix, l_uri, l_local_name) then
								last_generated_name_code := shared_name_pool.name_code (l_optional_prefix, l_uri, l_local_name)
							else
								if not shared_name_pool.is_name_pool_full (l_uri, l_local_name) then
									shared_name_pool.allocate_name (l_optional_prefix, l_uri, l_local_name)
									last_generated_name_code := shared_name_pool.last_name_code
								else
									l_message := STRING_.concat ("Name pool has no room to allocate ", l_uri)
									l_message := STRING_.appended_string (l_message, "#")
									l_message := STRING_.appended_string (l_message, l_local_name)
									create name_code_error_value.make_from_string (l_message, Gexslt_eiffel_type_uri, "NAME_POOL", Static_error)
									last_generated_name_code := -1
								end
							end
						end
					end
				end
			end
		ensure
			possible_error: last_generated_name_code = -1 implies name_code_error_value /= Void
		end

	generate_expression (a_expression: STRING)
			-- Create an expression.
		require
			expression_text_not_void: a_expression /= Void
			static_context_not_void: static_context /= Void
		local
			l_deferred_error: XM_XSLT_DEFERRED_ERROR
			l_module_number: INTEGER
			l_last_generated_expression: like last_generated_expression
		do
			check precondition_static_context_not_void: attached static_context as l_static_context then
				expression_factory.make_expression (a_expression, l_static_context, 1, Eof_token, line_number, system_id)
			end
			if expression_factory.is_parse_error then
				check attached expression_factory.parsed_error_value as l_parsed_error_value then
					create l_deferred_error.make (l_parsed_error_value, "Xpath dynamic error")
				end
				check attached principal_stylesheet as l_principal_stylesheet then
					if l_principal_stylesheet.is_module_registered (system_id) then
						l_module_number := l_principal_stylesheet.module_number (system_id)
					else
						l_module_number := 0
					end
				end
				l_deferred_error.set_source_location (l_module_number, line_number)
				last_generated_expression := l_deferred_error
				l_deferred_error.set_parent (Current)
			else
				l_last_generated_expression := expression_factory.parsed_expression
				last_generated_expression := l_last_generated_expression
				if l_last_generated_expression.is_computed_expression then
					check attached principal_stylesheet as l_principal_stylesheet then
						if l_principal_stylesheet.is_module_registered (system_id) then
							l_module_number := l_principal_stylesheet.module_number (system_id)
						else
							l_module_number := 0
						end
					end
					l_last_generated_expression.as_computed_expression.set_source_location (l_module_number, line_number)
				end
			end
		ensure
			generated_expression: last_generated_expression /= Void
		end

	generate_pattern (a_pattern: STRING)
			-- Create a pattern.
		require
			pattern_text_not_void: a_pattern /= Void
			static_context_not_void: static_context /= Void
		local
			l_pattern_parser: XM_XSLT_PATTERN_PARSER
			l_error: XM_XPATH_ERROR_VALUE
			l_code: STRING
		do
			check precondition_static_context_not_void: attached static_context as l_static_context then
				create l_pattern_parser.make_pattern
				l_pattern_parser.parse_pattern (a_pattern, l_static_context, line_number)
				if not l_pattern_parser.is_parse_error then
					last_generated_pattern := l_pattern_parser.last_parsed_pattern.simplified_pattern
				else
					check attached l_pattern_parser.first_parse_error_code as l_first_parse_error_code then
						if l_first_parse_error_code.substring_index ("XTSE", 1) > 0 then
							l_code := l_first_parse_error_code
						else
							l_code := "XTSE0340"
						end
					end
					create l_error.make_from_string (l_pattern_parser.first_parse_error, Xpath_errors_uri, l_code, Static_error)
					report_compile_error (l_error)
					create {XM_XSLT_NO_NODE_TEST} last_generated_pattern.make
				end
			end
		ensure
			generated_pattern: last_generated_pattern /= Void
		end

	generate_sequence_type (a_sequence_type: STRING)
			-- Create a sequence type.
		require
			sequence_type_not_void: a_sequence_type /= Void
		local
			a_pattern_parser: XM_XSLT_PATTERN_PARSER
			an_error: XM_XPATH_ERROR_VALUE
			l_static_context: like static_context
		do
			l_static_context := static_context
			if l_static_context = Void then
				create l_static_context.make (Current, configuration)
				static_context := l_static_context
			end
			create a_pattern_parser.make_pattern
			a_pattern_parser.parse_sequence_type (a_sequence_type, l_static_context, line_number)
			if a_pattern_parser.is_parse_error then
				create an_error.make_from_string (a_pattern_parser.first_parse_error, Xpath_errors_uri, "XTSE0340", Static_error)
				report_compile_error (an_error)
				create last_generated_sequence_type.make_any_sequence
			else
				last_generated_sequence_type := a_pattern_parser.last_parsed_sequence
			end
		ensure
			generated_sequence_type: last_generated_sequence_type /= Void
		end

feature -- Element change

	bind_variable (a_fingerprint: INTEGER)
			-- Bind variable to it's declaration.
		require
			variable_declared: is_variable_declared (a_fingerprint)
		do
			if is_local_variable_declared (a_fingerprint) then
				bind_local_variable (a_fingerprint)
			else
				check
					attached principal_stylesheet as l_principal_stylesheet
					attached static_context as l_static_context
				then
					l_principal_stylesheet.bind_global_variable (a_fingerprint, l_static_context)
				end
			end
		ensure
			variable_bound: attached static_context as l_static_context and then l_static_context.last_bound_variable /= Void
		end

	fixup_references
			-- Fix up references from XPath expressions.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				if attached {XM_XSLT_STYLE_ELEMENT} a_child_iterator.item as a_style_element then
					a_style_element.fixup_references
				end
				a_child_iterator.forth
			end
		end

	style_element_allocate_slots (a_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- Allocate slots in the stack frame for local variables contained in `an_expression'.
			-- This version can be called by XM_XSLT_TEMPLATE, even though it redefines `allocate_slots'.
		require
			expression_not_in_error: a_expression /= Void and then not a_expression.is_error
			slot_manager_not_void: a_slot_manager /= Void
		local
			a_first_slot, a_high_water_mark: INTEGER
		do
			a_first_slot := a_slot_manager.number_of_variables + 1
			if a_expression.last_slot_number > a_first_slot then
				a_first_slot := a_expression.last_slot_number + 1
			end
			a_expression.allocate_slots (a_first_slot, a_slot_manager)
			a_high_water_mark := a_expression.last_slot_number
			if a_high_water_mark > a_first_slot then
				a_slot_manager.set_number_of_variables (a_high_water_mark)
			end
		ensure
			no_fewer_slots_allocated: a_slot_manager.number_of_variables >= old a_slot_manager.number_of_variables
		end

	allocate_slots (a_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- Allocate slots in the stack frame for local variables contained in `an_expression'.
		require
			expression_not_in_error: a_expression /= Void and then not a_expression.is_error
			slot_manager_not_void: a_slot_manager /= Void
		do
			style_element_allocate_slots (a_expression, a_slot_manager)
		end

	prepare_attributes
			-- Set the attribute list for the element.
		require
			attributes_not_prepared: not attributes_prepared
			static_context_not_void: static_context /= Void
		deferred
		ensure
			attributes_prepared: attributes_prepared
		end

	process_attributes
			-- Process the attribute list for the element.
		require
			--attributes_not_prepared: not attributes_prepared
			static_context_not_void: static_context /= Void
		do
			if not attributes_prepared then prepare_attributes end
			if is_error then
				if is_forwards_compatible_processing_enabled then
					todo ("process_attributes (forward comptibility)", True)
				end
				todo ("process_attributes", True)
			end
		ensure
			attributes_prepared: attributes_prepared
		end

	process_all_attributes
			-- Process the attributes of this element and all its children.
		require
			--attributes_not_prepared: not attributes_prepared
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			create static_context.make (Current, configuration)
			process_attributes
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				if attached {XM_XSLT_STYLE_ELEMENT} a_child_iterator.item as a_style_element then
					a_style_element.process_all_attributes
					if a_style_element.is_explaining then
						is_explaining := True
					end
				end
				a_child_iterator.forth
			end
		ensure
			attributes_prepared: attributes_prepared
		end

	process_default_xpath_namespace_attribute (an_attribute_name: STRING)
			--	Process the [xsl:]default-xpath-namespace attribute.
		require
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
					and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Xpath_default_namespace_attribute)
						and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		do
			local_default_xpath_namespace := attribute_value_by_expanded_name (an_attribute_name)
			if attached local_default_xpath_namespace as l_local_default_xpath_namespace then
				STRING_.left_adjust (l_local_default_xpath_namespace)
				STRING_.right_adjust (l_local_default_xpath_namespace)
			end
		end

	process_version_attribute (an_attribute_name: STRING; a_condition: INTEGER)
			--	Process the [xsl:]version attribute.
		require
			attributes_not_prepared: not attributes_prepared
			version_attribute_not_processed: not version_attribute_processed
			validation_reporting: Report_always <= a_condition and then a_condition <= Report_if_instantiated
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
					and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Version_attribute)
						and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			a_version: detachable STRING
			a_parent: detachable XM_XSLT_STYLE_ELEMENT
			finished: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_version := attribute_value_by_expanded_name (an_attribute_name)
			if a_version /= Void then
				STRING_.left_adjust (a_version)
				STRING_.right_adjust (a_version)
				if a_version.index_of ('e', 1) > 0 or else a_version.index_of ('E', 1) > 0 then
					create an_error.make_from_string ("The version attribute must be a decimal literal", Xpath_errors_uri, "XTSE0110", Static_error)
					set_validation_error (an_error, a_condition)
					create version.make_from_string ("2.0") -- to satisfy invariant
				else
					create version.make_from_string (a_version)
					if version.is_special then
						create an_error.make_from_string ("The version attribute must be a decimal literal", Xpath_errors_uri, "XTSE0110", Static_error)
						set_validation_error (an_error, a_condition)
						create version.make_from_string ("2.0") -- to satisfy invariant
					end
				end
			else

				-- Find non-`Void' value on nearest ancestor

				from
					if attached {XM_XSLT_STYLE_ELEMENT} parent_node as l_parent_node then
						a_parent := l_parent_node
					end
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
						if attached {XM_XSLT_STYLE_ELEMENT} a_parent.parent_node as l_parent_parent_node then
							a_parent := l_parent_parent_node
						else
							a_parent := Void
						end
					end
				end
			end
			version_attribute_processed := True
		ensure
			version_attribute_processed: version_attribute_processed
		end

	process_default_collation_attribute (an_attribute_name: STRING)
			--	Process the [xsl:]default-collation attribute.
		require
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
					and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Default_collation_attribute)
						and then (namespace_uri_from_expanded_name (an_attribute_name).count = 0
							or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		do
			local_default_collation_name := attribute_value_by_expanded_name (an_attribute_name)
		end

	process_extension_element_attribute (an_attribute_name: STRING)
			--	Process the [xsl:]extension-element-prefixes attribute.
		require
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
					and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Extension_element_prefixes_attribute)
						and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			extensions: detachable STRING
			an_extension: STRING
			a_splitter: ST_SPLITTER
			an_extension_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_code: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
			l_extension_namespaces: like extension_namespaces
		do
			extensions := attribute_value_by_expanded_name (an_attribute_name)
			if extensions /= Void then
				create a_splitter.make
				an_extension_list := a_splitter.split (extensions)
				if an_extension_list.count > 0 then
					create l_extension_namespaces.make (an_extension_list.count)
					extension_namespaces := l_extension_namespaces
					from
						a_cursor := an_extension_list.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						an_extension := a_cursor.item
						if STRING_.same_string (an_extension, "#default") then
							an_extension := ""
						end
						a_code := uri_code_for_prefix (an_extension)
						if a_code = - 1 then
							create an_error.make_from_string (STRING_.concat ("Prefix in extension-element-prefixes is not bound to a namespace: ", an_extension), Xpath_errors_uri, "XTSE1430", Static_error)
							report_compile_error (an_error)
							a_cursor.go_after
						else
							l_extension_namespaces.put_last (a_code)
							a_cursor.forth
						end
					variant
						an_extension_list.count + 1 - a_cursor.index
					end
				end
			end
		end

	process_excluded_namespaces_attribute (a_attribute_name: STRING)
			--	Process the  [xsl:]exclude-result-prefixes attribute.
		require
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: a_attribute_name /= Void
				and then	is_valid_expanded_name (a_attribute_name)
					and then STRING_.same_string (local_name_from_expanded_name (a_attribute_name), Exclude_result_prefixes_attribute)
						and then ( namespace_uri_from_expanded_name (a_attribute_name).count = 0
							or else STRING_.same_string (namespace_uri_from_expanded_name (a_attribute_name), Xslt_uri))
		local
			l_exclusions: detachable STRING
			l_exclusion: STRING
			l_splitter: ST_SPLITTER
			l_exclusion_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_error: XM_XPATH_ERROR_VALUE
			l_code: INTEGER
			l_namespaces: DS_ARRAYED_LIST [INTEGER]
			l_excluded_namespaces: like excluded_namespaces
		do
			l_exclusions := attribute_value_by_expanded_name (a_attribute_name)
			if l_exclusions /= Void then
				STRING_.left_adjust (l_exclusions)
				STRING_.right_adjust (l_exclusions)
				if STRING_.same_string (l_exclusions, "#all") then
					l_namespaces := namespace_codes_in_scope
					create l_excluded_namespaces.make_from_linear (l_namespaces)
					excluded_namespaces := l_excluded_namespaces
					l_namespaces.do_all_with_index (agent exclude_namespace)
				else
					create l_splitter.make
					l_exclusion_list := l_splitter.split (l_exclusions)
					if l_exclusion_list.count > 0 then
						create l_excluded_namespaces.make (l_exclusion_list.count)
						excluded_namespaces := l_excluded_namespaces
						from
							l_cursor := l_exclusion_list.new_cursor
							l_cursor.start
						until
							l_cursor.after
						loop
							l_exclusion := l_cursor.item
							if STRING_.same_string (l_exclusion, "#default") then
								l_exclusion := ""
							elseif STRING_.same_string (l_exclusion, "#all") then
								create l_error.make_from_string ("In exclude-result-prefixes, cannot mix #all with other values", Xpath_errors_uri, "XTSE0550", Static_error)
								report_compile_error (l_error)
								l_cursor.go_after
							end
							if not shared_name_pool.is_code_for_prefix_allocated (l_exclusion) then
								shared_name_pool.allocate_code_for_prefix (l_exclusion)
							end
							l_code := uri_code_for_prefix (l_exclusion)
							if l_code = -1 then
								create l_error.make_from_string (STRING_.concat ("No namespace declaration for prefix ", l_exclusion), Xpath_errors_uri, "XTSE0808", Static_error)
								report_compile_error (l_error)
								l_cursor.go_after
							elseif l_code = 0 and l_exclusion.is_empty then
								create l_error.make_from_string ("No declaration for default namespace", Xpath_errors_uri, "XTSE0809", Static_error)
								report_compile_error (l_error)
								l_cursor.go_after
							else
								l_excluded_namespaces.put_last (l_code)
								l_cursor.forth
							end
						variant
							l_exclusion_list.count + 1 - l_cursor.index
						end
					end
				end
			end
		end

	validate
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		require
			attributes_prepared: attributes_prepared
			not_validated: not validated
		do
			validated := True
		end

	post_validate
			-- Hook to allow additional validation of a parent element
			--  immediately after its children have been validated.
		require
			children_validated: children_validated
			post_validate_not_run: not post_validated
		do
			post_validated := True
		end

	validate_subtree
			-- Recursively walk through the stylesheet to validate all nodes.
		require
			not_validated: not validated
		do
			if attached validation_error as l_validation_error then
				if reporting_circumstances = Report_always then
					report_compile_error (l_validation_error)
				elseif reporting_circumstances = Report_unless_forwards_comptible and then not is_forwards_compatible_processing_enabled then
					report_compile_error (l_validation_error)
				end
			end
			if not any_compile_errors then
				validate
				if validated and not any_compile_errors then
					validate_children
					if children_validated and not any_compile_errors then
						post_validate
					end
				end
			end
		end

	validate_children
			-- Validate the children of this node, recursively.
		require
			validated: validated
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_last_child: detachable XM_XSLT_STYLE_ELEMENT
			contains_instructions: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
		do
			contains_instructions := may_contain_sequence_constructor
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				if attached {XM_XSLT_STYLE_ELEMENT} a_child_iterator.item as a_style_element then
					if contains_instructions and then not a_style_element.is_instruction and then not is_permitted_child (a_style_element) then
						a_message := STRING_.concat ("An ", node_name)
						a_message := STRING_.appended_string (a_message, " element must not contain an ")
						a_message := STRING_.appended_string (a_message, a_style_element.node_name)
						a_message := STRING_.appended_string (a_message, " element.")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					else
						a_style_element.validate_subtree
						a_last_child := a_style_element
					end
				end
				a_child_iterator.forth
			end
			if a_last_child /= Void and then a_last_child.is_xslt_variable then
				if not is_stylesheet then
					report_compile_warning ("A variable with no following sibling instructions has no effect")
				end
			end
			children_validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an expression.
		require
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validated: validated
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
		deferred
		ensure
			last_generated_expression_may_be_void: True -- not all descendants actually generate an expression
		end

	compile_sequence_constructor (an_executable: XM_XSLT_EXECUTABLE; an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN)
			-- Compile any sequence constructor child nodes to an expression.
		require
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
			iterator_invulnerable: an_axis_iterator /= Void and then an_axis_iterator.is_invulnerable
		local
			a_line_number: INTEGER
			a_node: XM_XPATH_NODE
			a_text: XM_XSLT_COMPILED_VALUE_OF
			a_block: XM_XSLT_BLOCK
			a_style_element: detachable XM_XSLT_STYLE_ELEMENT
			a_string_value: XM_XPATH_STRING_VALUE
		do
			last_generated_expression := Void
			a_line_number := line_number
			if an_axis_iterator.before then an_axis_iterator.start else an_axis_iterator.forth end
			if not an_axis_iterator.after then
				a_node := an_axis_iterator.item
				if attached {XM_XSLT_STYLE_ELEMENT} a_node as l_style_element then
					a_style_element := l_style_element
					a_line_number := a_style_element.line_number -- for next text node
				end
				if a_node.node_type = Text_node then
					create a_string_value.make_untyped_atomic (a_node.string_value)
					check attached principal_stylesheet as l_principal_stylesheet then
						create a_text.make (an_executable, a_string_value, False, l_principal_stylesheet.module_number (a_node.system_id), a_line_number)
					end
					if not is_error and then not any_compile_errors then
						compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
						if any_compile_errors then
							-- nothing else to do
						elseif not attached last_generated_expression as l_last_generated_expression then
							last_generated_expression := a_text
						else
							check attached principal_stylesheet as l_principal_stylesheet then
								create a_block.make (an_executable, a_text, l_last_generated_expression, l_principal_stylesheet.module_number (a_node.system_id), a_line_number)
							end
							last_generated_expression := a_block
						end
					end
				elseif not is_error and then not any_compile_errors then
					if a_style_element /= Void and then a_style_element.is_xslt_variable then
						compile_variable (an_executable, a_style_element.as_xslt_variable, an_axis_iterator, include_parameters)
					elseif a_style_element /= Void then
						compile_style_element (an_executable, a_style_element, an_axis_iterator, include_parameters)
					end
				end
			end
		ensure
			last_generated_expression_may_be_void: True -- sequence constructors aren't compulsory in all descendants
		end

	compile_variable (an_executable: XM_XSLT_EXECUTABLE; a_variable: XM_XSLT_VARIABLE; an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN)
			-- Compile `a_variable'.
		require
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
			iterator_not_void: an_axis_iterator /= Void
			variable_not_void: a_variable /= Void
		local
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			a_required_type: detachable XM_XPATH_SEQUENCE_TYPE
			an_expression: detachable XM_XPATH_EXPRESSION
		do
			a_variable.compile (an_executable)
			if not is_error and then not any_compile_errors then
				if a_variable.last_generated_expression = Void then

					-- i.e. a redundant variable, so compile everything after it:

					compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
				else
					check
						local_variable: attached {XM_XSLT_LOCAL_VARIABLE} a_variable.last_generated_expression as a_local_variable
						-- `a_variable' is local, since we are compiling a sequence constructor
					then
						compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
						if attached last_generated_expression as l_last_generated_expression then
							a_required_type := a_local_variable.required_type
							if a_required_type = Void then create a_required_type.make_any_sequence end
							create a_range_variable.make (a_local_variable.variable_name, a_local_variable.variable_fingerprint, a_required_type)
							a_range_variable.set_reference_list (a_variable.references)
							an_expression := a_local_variable.select_expression
							if an_expression = Void then
								create {XM_XPATH_EMPTY_SEQUENCE} an_expression.make
							end
							create a_let_expression.make (a_range_variable, an_expression, l_last_generated_expression)
							a_let_expression.set_slot_number (a_local_variable.slot_number)
							a_variable.fixup_binding (a_let_expression)
							check attached principal_stylesheet as l_principal_stylesheet then
								a_let_expression.set_source_location (l_principal_stylesheet.module_number (a_variable.system_id), a_variable.line_number)
							end
							-- TODO: tracing
							last_generated_expression := a_let_expression
						elseif not any_compile_errors then
							check
								local_variable_without_following_instructions: False
								-- because in that case, the variable's compile would have done nothing
							end
						end
					end
				end
			end
		end

	fallback_processing (a_executable: XM_XSLT_EXECUTABLE; a_style_element: XM_XSLT_STYLE_ELEMENT)
			-- Perform fallback processing.
		require
			executable_not_void: a_executable /= Void
			style_element_not_void: a_style_element /= Void and then a_style_element.validation_error /= Void
		local
			l_found_fallback: BOOLEAN
			l_iterator, l_other_iterator:XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_deferred_error: XM_XSLT_DEFERRED_ERROR
			l_stylesheet: XM_XSLT_STYLESHEET
			l_fallback_expression: detachable XM_XPATH_EXPRESSION
			l_expression: detachable XM_XPATH_EXPRESSION
			l_module_number: INTEGER
		do

			-- Process any xsl:fallback children; if there are none,
			--  generate code to report the original failure reason

			from
				l_iterator := a_style_element.new_axis_iterator (Child_axis)
				l_iterator.start
			until
				l_iterator.after
			loop
				if attached {XM_XSLT_FALLBACK} l_iterator.item as l_fallback then
					l_found_fallback := True
					check attached principal_stylesheet as l_principal_stylesheet then
						l_stylesheet := l_principal_stylesheet
					end
					check
						module_registered: l_stylesheet.is_module_registered (l_fallback.system_id)
					end
					l_other_iterator := l_fallback.new_axis_iterator (Child_axis)
					l_fallback.compile_sequence_constructor (a_executable, l_other_iterator, True)
					l_expression := l_fallback.last_generated_expression
					if l_expression = Void then
						create {XM_XPATH_EMPTY_SEQUENCE} l_expression.make
					end
					if l_fallback_expression = Void then
						l_fallback_expression := l_expression
					else
						create {XM_XSLT_BLOCK} l_fallback_expression.make (a_executable, l_fallback_expression, l_expression, l_stylesheet.module_number (l_fallback.system_id), l_fallback.line_number)
					end
				end
				l_iterator.forth
			end
			if not l_found_fallback then
				check attached a_style_element.validation_error as l_style_element_validation_error then
					create l_deferred_error.make (l_style_element_validation_error, a_style_element.node_name)
					if not system_id.is_empty and then not l_style_element_validation_error.is_location_known then
						check attached principal_stylesheet as l_principal_stylesheet then
							if l_principal_stylesheet.is_module_registered (system_id) then
								l_module_number := l_principal_stylesheet.module_number (system_id)
							else
								l_module_number := 0
							end
						end
						l_deferred_error.set_source_location (l_module_number, line_number)
						l_deferred_error.set_parent (Current)
						l_style_element_validation_error.set_location (system_id, line_number)
					end
					last_generated_expression := l_deferred_error
				end
			else
				last_generated_expression := l_fallback_expression
			end
		end

	accumulate_attribute_sets (a_sets: STRING; a_usage_list: detachable DS_ARRAYED_LIST [XM_XSLT_ATTRIBUTE_SET])
			-- Accumulate attribute sets associated with `Current'
		require
			used_attribute_sets_not_void: a_sets /= Void
		local
			l_list: DS_ARRAYED_LIST [XM_XSLT_ATTRIBUTE_SET]
			l_stylesheet: XM_XSLT_STYLESHEET
			l_top_level_elements: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			l_splitter: ST_SPLITTER
			l_attribute_set_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_set_name: STRING
			l_fingerprint: INTEGER
			found: BOOLEAN
			l_second_cursor: DS_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			l_third_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_ATTRIBUTE_SET]
			l_error: XM_XPATH_ERROR_VALUE
			l_used_attribute_sets: like used_attribute_sets
		do
			if a_usage_list = Void then
				create l_list.make_default
			else
				l_list := a_usage_list
			end
			check attached principal_stylesheet as l_principal_stylesheet then
				l_stylesheet := l_principal_stylesheet
			end
			check attached l_stylesheet.top_level_elements as l_stylesheet_top_level_elements then
				l_top_level_elements := l_stylesheet_top_level_elements
			end
			create l_splitter.make
			l_attribute_set_list := l_splitter.split (a_sets)
			from
				l_cursor := l_attribute_set_list.new_cursor; l_cursor.start
			until
				l_cursor.after
			loop
				l_set_name := l_cursor.item
				if is_qname (l_set_name) then
					generate_name_code (l_set_name)
					l_fingerprint := fingerprint_from_name_code (last_generated_name_code)
					if l_fingerprint = -1 then
						check attached name_code_error_value as l_name_code_error_value then
							report_compile_error (l_name_code_error_value)
						end
						l_cursor.go_after
					else
						found := False
						-- Search for the named attribute set, using all of them if there are several with the same name
						from
							l_second_cursor := l_top_level_elements.new_cursor; l_second_cursor.start
						until
							l_second_cursor.after
						loop
							if l_second_cursor.item.is_attribute_set and then fingerprint_from_name_code (l_second_cursor.item.as_attribute_set.attribute_set_name_code) = l_fingerprint then
								found := True
								l_list.force_last (l_second_cursor.item.as_attribute_set)
							end
							l_second_cursor.forth
						variant
							l_top_level_elements.count + 1 - l_second_cursor.index
						end
						if not found then
							create l_error.make_from_string (STRING_.concat ("No attribute-set exists named ", l_set_name), Xpath_errors_uri, "XTSE0710", Static_error)
							report_compile_error (l_error)
							l_cursor.go_after
						else
							l_cursor.forth
						end
					end
				else
					create l_error.make_from_string (STRING_.concat ("Attribute-set name is not a valid lexical QName: ", l_set_name), Xpath_errors_uri, "XTSE0710", Static_error)
					report_compile_error (l_error)
					l_cursor.go_after
				end
			variant
				l_attribute_set_list.count + 1 - l_cursor.index
			end
			if not any_compile_errors then
				create l_used_attribute_sets.make (l_list.count)
				used_attribute_sets := l_used_attribute_sets
				from
					l_third_cursor := l_list.new_cursor; l_third_cursor.start
				until
					l_third_cursor.after
				loop
					l_third_cursor.item.increment_reference_count
					l_used_attribute_sets.put_last (l_third_cursor.item.attribute_set_name_code)
					l_third_cursor.forth
				variant
					l_list.count + 1 - l_third_cursor.index
				end
			end
		ensure
			accumulated_list_not_void: not any_compile_errors implies used_attribute_sets /= Void
		end

feature -- Conversion

	as_template: XM_XSLT_TEMPLATE
			-- `Current' seen as an xsl:template
		require
			template: is_template
		do
			check template: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_param: XM_XSLT_PARAM
			-- `Current' seen as an xsl:param
		require
			parameter: is_param
		do
			check parameter: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_key: XM_XSLT_KEY
			-- `Current' seen as an xsl:key
		require
			key: is_key
		do
			check key: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_output: XM_XSLT_OUTPUT
			-- `Current' seen as an xsl:output
		require
			output: is_output
		do
			check output: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_module: XM_XSLT_MODULE
			-- `Current' seen as an xsl:include/import
		require
			module: is_module
		do
			check module: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_xslt_function: XM_XSLT_FUNCTION
			-- `Current' seen as an xsl:function
		require
			xslt_function: is_xslt_function
		do
			check xslt_function: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_namespace_alias: XM_XSLT_NAMESPACE_ALIAS
			-- `Current' seen as an xsl:namespace-alias
		require
			namespace_alias: is_namespace_alias
		do
			check namespace_alias: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_xslt_variable: XM_XSLT_VARIABLE
			-- `Current' seen as an xsl:variable
		require
			xslt_variable: is_xslt_variable
		do
			check xslt_variable: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_xslt_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			-- `Current' seen as an XSLT variable declaration
		require
			xslt_variable_declaration: is_xslt_variable_declaration
		do
			check xslt_variable_declaration: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_attribute_set: XM_XSLT_ATTRIBUTE_SET
			-- `Current' seen as an xsl:attribute-set
		require
			attribute_set: is_attribute_set
		do
			check attribute_set: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_character_map: XM_XSLT_CHARACTER_MAP
			-- `Current' seen as an xsl:character-map
		require
			character_map: is_character_map
		do
			check character_map: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_matching_substring: XM_XSLT_MATCHING_SUBSTRING
			-- `Current' seen as an xsl:matching-substring
		require
			matching_substring: is_matching_substring
		do
			check matching_substring: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_non_matching_substring: XM_XSLT_NON_MATCHING_SUBSTRING
			-- `Current' seen as an xsl:non-matching-substring
		require
			non_matching_substring: is_non_matching_substring
		do
			check non_matching_substring: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_decimal_format: XM_XSLT_DECIMAL_FORMAT
			-- `Current' seen as an xsl:decimal_format
		require
			decimal_format: is_decimal_format
		do
			check decimal_format: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Local

	is_defined_excluded_namespace (a_uri_code: INTEGER): BOOLEAN
			-- Is `a_uri_code' defined as an excluded namespace within `Current'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if attached excluded_namespaces as l_excluded_namespaces then
				from
					a_cursor := l_excluded_namespaces.new_cursor
					a_cursor.start
				until
					a_cursor.after
				loop
					if a_cursor.item = a_uri_code then
						Result := True
						a_cursor.go_after
					else
						a_cursor.forth
					end
				variant
					l_excluded_namespaces.count + 1 - a_cursor.index
				end
			end
		end

	is_defined_extension_instruction_namespace (a_uri_code: INTEGER): BOOLEAN
			-- Is `a_uri_code' defined as an extension instruction namespace in `Current'?
		local
		do
			if attached extension_namespaces as l_extension_namespaces then
				Result := l_extension_namespaces.has (a_uri_code)
			end
		end

	is_local_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent an in-scope local variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		local
			l_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_node: detachable XM_XPATH_NODE
			l_previous_node: XM_XPATH_NODE
			l_finished, l_finished_inner: BOOLEAN
		do
			if not is_top_level then
				from
					l_previous_node := Current
					l_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
					l_preceding_iterator.start
				until
					l_finished
				loop
					if l_preceding_iterator.after then
						from
							l_finished_inner := False
							l_node := Void
						until
							l_node /= Void
						loop
							l_node := l_previous_node.parent
							if attached {XM_XSLT_FALLBACK} l_node then
								-- Siblings of xsl:fallback are ignored
								l_node := l_node.parent
							end
							check l_node /= Void then
								l_previous_node := l_node
								if attached {XM_XSLT_STYLESHEET} l_node.parent then
									l_finished_inner := True
								else
									l_preceding_iterator := l_node.new_axis_iterator (Preceding_sibling_axis)
									l_preceding_iterator.start
									if not l_preceding_iterator.after then
										l_node := l_preceding_iterator.item
									else
										l_node := Void
									end
								end
							end
						end
					else
						l_node := l_preceding_iterator.item
					end
					if attached {XM_XSLT_STYLESHEET} l_node.parent then
						l_finished := True
					else
						if attached {XM_XSLT_VARIABLE_DECLARATION} l_node as l_variable_declaration then
							Result := l_variable_declaration.variable_fingerprint = a_fingerprint
							if Result then l_finished := True end
						end
					end
					if not l_finished and then not l_preceding_iterator.after then l_preceding_iterator.forth end
				end
			end
		end

	is_global_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a global variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		do
			check attached principal_stylesheet as l_principal_stylesheet then
				Result := l_principal_stylesheet.is_global_variable_declared (a_fingerprint)
			end
		end

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := any_item
		ensure
			returned_item_type_not_void: Result /= Void
		end

feature {XM_XSLT_NODE_FACTORY} -- Status setting

	flag_as_instruction
			-- Flag `Current' as an XSLT instruction.
		do
			is_instruction := True
		ensure
			is_instruction: is_instruction
		end

feature {NONE} -- Implementation

	local_default_collation_name: detachable STRING
			-- list of possible default collation names (optional)

	excluded_namespaces: detachable DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes to be excluded from output

	extension_namespaces: detachable DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes of extension elements

	exclude_namespace (a_namespace_code, a_index: INTEGER)
			-- Mark `a_namespace_code' as excluded.
		require
			excluded_namespaces_not_void: attached excluded_namespaces as l_excluded_namespaces
			a_index_strictly_positive: a_index > 0
			a_index_small_enough: a_index <= l_excluded_namespaces.count
		do
			check precondition_excluded_namespaces_not_void: attached excluded_namespaces as l_excluded_namespaces then
				l_excluded_namespaces.replace (INTEGER_.bit_and (a_namespace_code, 0x0000ffff), a_index)
			end
		end

	common_child_item_type: XM_XPATH_ITEM_TYPE
			-- Most general type of item returned by the children of this instruction
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
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
					if attached {XM_XSLT_STYLE_ELEMENT} a_node as a_style_element then
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

	decimal_two: MA_DECIMAL
			-- 2.0
		once
			create Result.make_from_integer (2)
		ensure
			result_not_void: Result /= Void
		end

	bind_local_variable (a_fingerprint: INTEGER)
			-- Bind variable to it's declaration.
		require
			variable_declared: is_local_variable_declared (a_fingerprint)
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: detachable XM_XPATH_NODE
			a_previous_node: XM_XPATH_NODE
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
						a_node /= Void
					loop
						check attached a_previous_node.parent as l_previous_node_parent then
							a_node := l_previous_node_parent
						end
						a_previous_node := a_node
						if attached {XM_XSLT_STYLESHEET} a_node.parent then
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
				if attached {XM_XSLT_STYLESHEET} a_node.parent then
					finished := True
				else
					if attached {XM_XSLT_VARIABLE_DECLARATION} a_node as a_variable_declaration then
						if a_variable_declaration.variable_fingerprint = a_fingerprint then
							check attached static_context as l_static_context then
								l_static_context.set_last_bound_variable (a_variable_declaration)
							end
							finished := True
						end
					end
				end
				if not finished and then not a_preceding_iterator.after then a_preceding_iterator.forth end
			end
		ensure
			variable_bound: attached static_context as l_static_context and then l_static_context.last_bound_variable /= Void
		end

	compile_style_element (an_executable: XM_XSLT_EXECUTABLE; a_style_element: XM_XSLT_STYLE_ELEMENT;  an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN)
			-- Compile a child style element.
		require
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
			iterator_not_void: an_axis_iterator /= Void and then an_axis_iterator.is_invulnerable
			style_element_not_void: a_style_element /= Void
		local
			a_child, a_tail: detachable XM_XPATH_EXPRESSION
			a_block: XM_XSLT_BLOCK
			a_system_id: STRING
			a_line_number: INTEGER
		do
			if a_style_element.validation_error /= Void and not a_style_element.is_absent_extension_element then
				fallback_processing (an_executable, a_style_element)
			else
				a_style_element.compile (an_executable)
				if not any_compile_errors then
					a_child := a_style_element.last_generated_expression
					if a_child /= Void and then a_child.is_computed_expression then
						check attached principal_stylesheet as l_principal_stylesheet then
							a_child.as_computed_expression.set_source_location (l_principal_stylesheet.module_number (a_style_element.system_id), a_style_element.line_number)
						end
					end
					if a_child /= Void and then configuration.is_tracing and then (include_parameters or else not a_style_element.is_param) then
						a_child := new_trace_wrapper (a_child, an_executable, a_style_element)
					end
					compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
					if not any_compile_errors then
						a_tail := last_generated_expression
						if a_tail = Void then
							last_generated_expression := a_child
						elseif a_child /= Void then
							if a_child.is_computed_expression then
								a_system_id := a_child.as_computed_expression.system_id
								a_line_number := a_child.as_computed_expression.line_number
							else
								a_system_id := a_style_element.system_id
								a_line_number := a_style_element.line_number
							end
							check attached principal_stylesheet as l_principal_stylesheet then
								create a_block.make (an_executable, a_child, a_tail, l_principal_stylesheet.module_number (a_system_id), a_line_number)
							end
							last_generated_expression := a_block
						end
					end
				end
			end
		end

	new_dummy_context: XM_XPATH_CONTEXT
			-- New dummy context
		local
			l_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			create l_function_library.make
			create {XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT} Result.make_restricted (l_function_library)
		ensure
			new_dummy_context_not_void: Result /= Void
		end

invariant

	validation_reporting: Report_always <= reporting_circumstances and then reporting_circumstances <= Report_if_instantiated
	error_listener_not_void: error_listener /= Void
	default_collation_name_not_void: default_collation_name /= Void
	version_not_void: version /= Void

end
