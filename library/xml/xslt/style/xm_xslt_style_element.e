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

	XM_XSLT_TRACE_DETAILS

	XM_XSLT_VALIDATION

	XM_XSLT_STRING_ROUTINES

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

	XM_XPATH_TYPE

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_EXPRESSION_CONTAINER

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
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
			make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		ensure
			error_listener_set: error_listener = an_error_listener
			configuration_set: configuration = a_configuration
			name_code_set: name_code = a_name_code
		end			
			
feature -- Access
	
	construct_type: INTEGER is
			-- Type of construct being traced
		do
			Result := fingerprint
		end

	trace_properties: DS_LIST [STRING] is
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

	trace_property (an_expanded_name: STRING): STRING is
			-- Value of trace-property
		do
			Result := attribute_value_by_name (namespace_uri_from_expanded_name (an_expanded_name), local_name_from_expanded_name (an_expanded_name))
		end

	default_collation_name: STRING is
			-- Default collation name
		local
			a_splitter: ST_SPLITTER
			some_collation_names: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_collation_name: STRING
			a_style_element: XM_XSLT_STYLE_ELEMENT
			an_error: XM_XPATH_ERROR_VALUE
		do
			if local_default_collation_name /= Void then
				create a_splitter.make
				some_collation_names := a_splitter.split (local_default_collation_name)
				from
					a_cursor := some_collation_names.new_cursor; a_cursor.start
				variant
					some_collation_names.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_collation_name := a_cursor.item
					if principal_stylesheet.collation_map.has (a_collation_name) then
						Result := a_collation_name
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
				if Result = Void then
					create an_error.make_from_string (STRING_.concat ("None of the following are recognized as a collation URI by this implementation: ", local_default_collation_name), "", "XTSE0125", Static_error)
					report_compile_error (an_error)
				end
			else
				a_style_element ?= parent
				if a_style_element /= Void then					
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

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN is
			-- Is `a_style_element' a permitted child of `Current'?
		require
			not_void: a_style_element /= Void
		do
			Result := False
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Approximate count of references by parameters of `Current' to `a_binding'
		do
			-- pre-condition cannot be met
		end
	
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

	containing_slot_manager: XM_XPATH_SLOT_MANAGER is
			-- Slot manager from containing procedure
		do
			Result := owning_procedure.slot_manager
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
			a_style_element: XM_XSLT_STYLE_ELEMENT
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
					a_style_element ?= a_node
					if a_style_element /= Void then
						if a_style_element.is_template then
							Result := a_style_element.as_template
						elseif a_style_element.is_xslt_variable then
							Result := a_style_element.as_xslt_variable
						elseif a_style_element.is_attribute_set then
							Result := a_style_element.as_attribute_set
						elseif a_style_element.is_xslt_function then
							Result := a_style_element.as_xslt_function
						elseif a_style_element.is_key then
							Result := a_style_element.as_key
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
					a_compiled_with_param ?= a_with_param.last_generated_expression
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
				if a_cursor.item.is_xslt_function and then a_cursor.item.as_xslt_function.function_fingerprint = a_fingerprint
					and then (an_arity = -1 or else a_cursor.item.as_xslt_function.arity = an_arity) then
					Result := a_cursor.item.as_xslt_function
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		ensure
			function_may_not_be_available: True
		end

	is_defined_extension_instruction_namespace (a_uri_code: INTEGER): BOOLEAN is
			-- Is `a_uri_code' defined as an extension instruction namespace in `Current'?
		local
		do
			if extension_namespaces /= Void then
				Result := extension_namespaces.has (a_uri_code)
			end
		end

	is_extension_instruction_namespace (a_uri_code: INTEGER): BOOLEAN is
			-- Is `a_uri_code' an in-scope extension instruction namespace?
		local
			an_ancestor: XM_XPATH_NODE
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			from
				an_ancestor := Current
				a_style_element := Current
			until
				Result or else a_style_element = Void
			loop
				Result := a_style_element.is_defined_extension_instruction_namespace (a_uri_code)
				if not Result then
					an_ancestor := an_ancestor.parent
					a_style_element ?= an_ancestor
				end
			end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		do
			Result := containing_stylesheet.system_id_from_module_number (a_module_number)
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

	validation_error: XM_XPATH_ERROR_VALUE

	last_generated_name_code: INTEGER
			-- Last name code generated by `generate_name_code'

	last_generated_expression: XM_XPATH_EXPRESSION
			-- Result of last call to `generate_expression' or `compile' or `compile_sequence_constructor'

	last_generated_pattern: XM_XSLT_PATTERN
			-- Result of last call to `generate_pattern'

	last_generated_sequence_type: XM_XPATH_SEQUENCE_TYPE
			-- Result of last call to `generate_sequence_type'

	name_code_error_value: XM_XPATH_ERROR_VALUE
			-- Error value created by `generate_name_code'

		
	frozen is_computed_expression: BOOLEAN is
			-- Is `Current' a computed expression?
		do
			-- `False'
		end

	is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		do
			-- `False'
		end

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
			elseif an_explain_value /= Void and then STRING_.same_string (an_explain_value, "all") then
				Result := True
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
					a_style_element := Current
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

	set_validation_error (an_error: XM_XPATH_ERROR_VALUE; a_condition: INTEGER) is
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

	report_absence (an_attribute_name: STRING) is
			-- Report absence of a compulsory attribute.
		require
			attribute_name_not_void:  an_attribute_name /= Void
		local
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_message := STRING_.appended_string ("Element must have a %"", an_attribute_name)
			a_message := STRING_.appended_string (a_message, "%" attribute")
			create an_error.make_from_string (a_message, "", "XTSE0010", Static_error)
			report_compile_error (an_error)
		end

	report_compile_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a compile error.
		require
			validation_message_not_void: an_error /= Void
		do
			error_listener.fatal_error (an_error, Current)
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
			-- do nothing
		end

	check_unknown_attribute (a_name_code: INTEGER) is
			-- Check whether an unknown attribute is permitted.
		local
			an_error: XM_XPATH_ERROR_VALUE
			an_attribute_uri, an_element_uri, a_local_name, a_message: STRING
		do
			if not is_forwards_compatible_processing_enabled then
				an_attribute_uri := shared_name_pool.namespace_uri_from_name_code (a_name_code)
				an_element_uri := uri	
				a_local_name := shared_name_pool.local_name_from_name_code (a_name_code)

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
					create an_error.make_from_string (a_message, "", "XTSE0090", Static_error)
					report_compile_error (an_error)

				end
			end
		end

	check_top_level (an_error_code: STRING) is
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

	check_empty is
			-- Check `Current' has no children (except permitted fallbacks)
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_fallback: XM_XSLT_FALLBACK
			finished: BOOLEAN
		do
			if has_child_nodes then
				if may_contain_fallback then
					from
						a_child_iterator := new_axis_iterator (Child_axis)
						a_child_iterator.start
					until
						finished or else a_child_iterator.after
					loop
						a_fallback ?= a_child_iterator.item
						if a_fallback = Void then
							finished := True
						end
						a_child_iterator.forth
					end
				end
				if not finished then
					create an_error.make_from_string (STRING_.concat (node_name, " must be empty."), "", "XTSE0260", Static_error)
					report_compile_error (an_error)
				end
			end
		end

	check_empty_with_attribute (an_attribute_name, an_error_code: STRING) is
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
				create an_error.make_from_string (a_message, "", an_error_code, Static_error)
				report_compile_error (an_error)
			end
		end

	check_not_empty_missing_attribute (an_attribute_name, an_error_code: STRING) is
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
				create an_error.make_from_string (a_message, "", an_error_code, Static_error)
				report_compile_error (an_error)
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
		local
			an_analyzed_expression: XM_XPATH_EXPRESSION
			was_replaced: BOOLEAN
			--some_trace_details: XM_XSLT_INSTRUCTION_DETAILS
			--a_trace_instruction: XM_XSLT_TRACE_INSTRUCTION
		do
			if an_expression.is_computed_expression then

				-- temporary measure, until instruction is compiled:

				an_expression.as_computed_expression.set_parent (Current)
			end
			an_expression.check_static_type (static_context)
			if an_expression.was_expression_replaced then
				an_analyzed_expression := an_expression.replacement_expression
				was_replaced := True
			else
				an_analyzed_expression := an_expression
			end
			an_analyzed_expression.resolve_calls_to_current_function
			if an_analyzed_expression.was_expression_replaced then
				an_analyzed_expression := an_analyzed_expression.replacement_expression
				was_replaced := True
			end
			if is_explaining then
				std.error.put_string ("Attribute '")
				std.error.put_string (a_name)
				std.error.put_string ("' of element '")
				std.error.put_string (node_name)
				std.error.put_string ("' at line ")
				std.error.put_string (line_number.out)
				std.error.put_string (" %N")
				if not an_analyzed_expression.is_error then
					std.error.put_string ("Static type: ")
					std.error.put_string (an_analyzed_expression.item_type.conventional_name)
					std.error.put_string (an_analyzed_expression.occurence_indicator)
					std.error.put_new_line
					std.error.put_string ("Optimized expression tree:%N")
					an_analyzed_expression.display (10)
				else
					std.error.put_string ("Expression is in error%N")
					std.error.put_string (an_analyzed_expression.error_value.error_message)
					std.error.put_new_line
				end
			end
			if an_analyzed_expression.is_error and then an_analyzed_expression.error_value.type /= Dynamic_error then
				report_compile_error (an_analyzed_expression.error_value)
			else
				if was_replaced and then not an_expression.was_expression_replaced then

					-- in case it was a Let expression, and `is_explaining' is `True':
					-- in which case, {XM_XPATH_LET_EXPRESSION}.action will have turned off replacement

					an_expression.set_replacement (an_analyzed_expression)
				end
				-- TODO: this all needs an executable
				--if configuration.is_tracing then
				--	create some_trace_details.make (Xpath_expression_in_xslt, line_numer, system_id)
				--	some_trace_details.set_trace_property (a_name, Gexslt_expression_name_pseudo_attribute)
				--	create a_trace_instruction.make (an_analyzed_expression, an_executable, some_trace_details)
				--	a_trace_expression.set_parent (Current)
				--	a_trace_expression.set_source_location (containing_stylesheet.module_number (system_id), line_number)
				--	an_expression.set_replacement (an_analyzed_expression)
				--end
			end
		end

	type_check_pattern (a_name: STRING; a_pattern: XM_XSLT_PATTERN) is
			-- Type-check `a_pattern'.
			-- This is called to check each pattern while the containing  instruction is being validated.
			-- It is not just a static type-check, it also adds code
			--  to perform any necessary run-time type checking and/or conversion
		require
			pattern_not_void: a_pattern /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		do
			a_pattern.type_check (static_context)
			if a_pattern.is_error then
				report_compile_error (a_pattern.error_value)
			end
			-- TODO: need to resolve calls to current ()
			-- probably need the full pattern expression stuff first.
		end

	check_within_template is
			-- Check `Current' is within a template.
		local	
			an_error: XM_XPATH_ERROR_VALUE
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			a_style_element ?= parent
			if a_style_element = Void or else not a_style_element.may_contain_sequence_constructor then
				create an_error.make_from_string (STRING_.concat (node_name, " may only be used within a sequence constructor"), "", "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
		end

	check_sort_comes_first (sort_required: BOOLEAN) is
			-- Check if all xsl:sort children precede all other elements
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
			a_sort: XM_XSLT_SORT
			non_sort_found, sort_found: BOOLEAN
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
		do
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				any_compile_errors or else an_iterator.after
			loop
				a_node := an_iterator.item
				a_sort ?= a_node
				if a_sort /= Void then
					if non_sort_found then
						a_message := STRING_.concat ("Within ", node_name)
						a_message := STRING_.appended_string (a_message, ", xsl:sort elements must come before all other elements")
						create an_error.make_from_string (a_message, "", "XTSE0010", Static_error)
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
				an_iterator.forth
			end
			if sort_required and then not sort_found then
				create an_error.make_from_string (STRING_.concat (node_name, " must have at least one xsl:sort child"), "", "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
		end

	check_only_with_parameter_content is
			-- Check contents of `Current' is only xsl:with-param elements.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_parameter: XM_XSLT_WITH_PARAM
			a_fallback: XM_XSLT_FALLBACK
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
					a_parameter ?= a_child_iterator.item
					if a_parameter = Void then

						-- may be a whitespace text node or xsl:fallback

						if a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
							-- do nothing
						elseif may_contain_fallback then
							a_fallback ?= a_child_iterator.item
							if a_fallback = Void then
								create an_error.make_from_string (STRING_.concat (node_name, " may only have xsl:with-param children"), "", "XTSE0010", Static_error)
								report_compile_error (an_error)
								finished := True
							end
						else
							create an_error.make_from_string (STRING_.concat (node_name, " may only have xsl:with-param children"), "", "XTSE0010", Static_error)
							report_compile_error (an_error)
							finished := True
						end
					end
					a_child_iterator.forth
				end
			end
		end

feature -- Creation

	new_trace_wrapper (a_child: XM_XPATH_EXPRESSION; an_executable: XM_XSLT_EXECUTABLE;  some_details: XM_XSLT_TRACE_DETAILS): XM_XSLT_TRACE_WRAPPER is
			-- newly created trace wrapper
		require
			child_expresion_not_void: a_child /= Void
			executable_not_void: an_executable /= Void
			trace_details_not_void: some_details /= Void
		local
			a_trace_wrapper: XM_XSLT_TRACE_WRAPPER
		do
			a_trace_wrapper ?= a_child
			if a_trace_wrapper /= Void then

				-- this can happen, for example, after optimizing a compile-time xsl:if
				
				Result := a_trace_wrapper
			else
				create {XM_XSLT_TRACE_INSTRUCTION} Result.make (a_child, an_executable, some_details)
			end
		ensure
			trace_wrapper_not_void: Result /= Void
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
					a_parser.parse (an_avt_expression, a_static_context, a_left_curly_brace + 1, Right_curly_token, line_number)
					if not a_parser.is_parse_error then
						a_parser.last_parsed_expression.simplify
						if a_parser.last_parsed_expression.was_expression_replaced then
							an_expression := a_parser.last_parsed_expression.replacement_expression
						else
							an_expression := a_parser.last_parsed_expression
						end
						append_parsed_expression (components, an_expression)
					else
						create {XM_XPATH_INVALID_VALUE} last_generated_expression.make_from_string (a_parser.first_parse_error, Xpath_errors_uri, "XTSE0360", Static_error)
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
			an_xml_prefix, a_uri, a_local_name, a_message: STRING
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
						create name_code_error_value.make_from_string (STRING_.concat ("Name pool has no room to allocate ", a_qname), Gexslt_eiffel_type_uri, "NAME_POOL", Static_error)
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
					a_message := STRING_.concat ("Namespace prefix ", an_xml_prefix)
					a_message := STRING_.appended_string (a_message, " refers to a reserved namespace")
					create name_code_error_value.make_from_string (a_message, "", "XTSE0080", Static_error)
					last_generated_name_code := -1
				else
					if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
						last_generated_name_code := shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
					else
						if not shared_name_pool.is_name_pool_full (a_uri, a_local_name) then
							shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
							last_generated_name_code := shared_name_pool.last_name_code
						else
							a_message := STRING_.concat ("Name pool has no room to allocate {", a_uri)
							a_message := STRING_.appended_string (a_message, "}")
							a_message := STRING_.appended_string (a_message, a_local_name)
							create name_code_error_value.make_from_string (a_message, Gexslt_eiffel_type_uri, "NAME_POOL", Static_error)
							last_generated_name_code := -1
						end
					end
				end
			end
			ensure
				possible_error: last_generated_name_code = -1 implies name_code_error_value /= Void
		end

	generate_expression (an_expression: STRING) is
			-- Create an expression.
		require
			expression_text_not_void: an_expression /= Void
			static_context_not_void: static_context /= Void
		local
			a_deferred_error: XM_XSLT_DEFERRED_ERROR
		do
			expression_factory.make_expression (an_expression, static_context, 1, Eof_token, line_number)
			if expression_factory.is_parse_error then
				if not is_forwards_compatible_processing_enabled then
					report_compile_error (expression_factory.parsed_error_value)
				end
				create a_deferred_error.make (expression_factory.parsed_error_value, "Xpath dynamic error")
				last_generated_expression := a_deferred_error
				a_deferred_error.set_parent (Current)
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
			an_error: XM_XPATH_ERROR_VALUE
		do
			create a_pattern_parser.make
			a_pattern_parser.parse_pattern (a_pattern, static_context, line_number)
			if not a_pattern_parser.is_parse_error then
				last_generated_pattern := a_pattern_parser.last_parsed_pattern.simplified_pattern
			else
				create an_error.make_from_string (a_pattern_parser.first_parse_error, "", "XTSE0340", Static_error)
				report_compile_error (an_error)
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
			an_error: XM_XPATH_ERROR_VALUE
		do
			if static_context = Void then
				create static_context.make (Current, configuration)
			end
			create a_pattern_parser.make
			a_pattern_parser.parse_sequence_type (a_sequence_type, static_context, line_number)
			if a_pattern_parser.is_parse_error then
				create an_error.make_from_string (a_pattern_parser.first_parse_error, "", "XTSE0340", Static_error)
				report_compile_error (an_error)
				create last_generated_sequence_type.make_any_sequence
			else
				last_generated_sequence_type := a_pattern_parser.last_parsed_sequence
			end
		ensure
			generated_sequence_type: last_generated_sequence_type /= Void
		end

feature -- Element change

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

	style_element_allocate_slots (an_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Allocate slots in the stack frame for local variables contained in `an_expression'.
			-- This version can be called by XM_XSLT_TEMPLATE, even though it redefines `allocate_slots'.
		require
			not_excluded: not is_excluded
			expression_not_replaced: an_expression /= Void and then not an_expression.was_expression_replaced
			slot_manager_not_void: a_slot_manager /= Void
		local
			a_first_slot, a_high_water_mark: INTEGER
		do
			a_first_slot := a_slot_manager.number_of_variables + 1
			an_expression.allocate_slots (a_first_slot, a_slot_manager)
			a_high_water_mark := an_expression.last_slot_number
			if a_high_water_mark > a_first_slot then
				a_slot_manager.set_number_of_variables (a_high_water_mark)
			end
		ensure
			no_fewer_slots_allocated: a_slot_manager.number_of_variables >= old a_slot_manager.number_of_variables
		end
	
	allocate_slots (an_expression: XM_XPATH_EXPRESSION; a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Allocate slots in the stack frame for local variables contained in `an_expression'.
		require
			not_excluded: not is_excluded
			expression_not_void: an_expression /= Void
			slot_manager_not_void: a_slot_manager /= Void
		do
			style_element_allocate_slots (an_expression, a_slot_manager)
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
	
	process_all_attributes is
			-- Process the attributes of this element and all its children
		require
			not_excluded: not is_excluded
			--attributes_not_prepared: not attributes_prepared		
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			create static_context.make (Current, configuration)
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
				create a_static_context.make_restricted (Current, configuration)
				expression_factory.make_expression (a_use_when_attribute, a_static_context, 1, Eof_token, line_number)
				if expression_factory.is_parse_error then
					report_compile_error (expression_factory.parsed_error_value)
				else
					an_expression := expression_factory.parsed_expression
					an_expression.check_static_type (a_static_context)
					if an_expression.is_error then
						report_compile_error (an_expression.error_value)
					else
						if an_expression.was_expression_replaced then
							an_expression := an_expression.replacement_expression
						end
						if an_expression.is_error then
							report_compile_error (an_expression.error_value)
						else
							create a_dynamic_context.make_restricted (a_static_context, principal_stylesheet.collation_map, configuration)
							an_expression.calculate_effective_boolean_value (a_dynamic_context)
							a_boolean_value := an_expression.last_boolean_value
							if a_boolean_value.is_error then
								report_compile_error (a_boolean_value.error_value)
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
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_version := attribute_value_by_expanded_name (an_attribute_name)
			if a_version /= Void then
				if a_version.index_of ('e', 1) > 0 or else a_version.index_of ('E', 1) > 0 then
					create an_error.make_from_string ("The version attribute must be a decimal literal", "", "XTSE0110", Static_error)
					set_validation_error (an_error, a_condition)
					create version.make_from_string ("2.0") -- to satisfy invariant
				else
					create version.make_from_string (a_version)
					if version.is_special then
						create an_error.make_from_string ("The version attribute must be a decimal literal", "", "XTSE0110", Static_error)
						set_validation_error (an_error, a_condition)
						create version.make_from_string ("2.0") -- to satisfy invariant
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
						a_parent ?= a_parent.parent_node
					end
				end
			end
			version_attribute_processed := True
		ensure
			version_attribute_processed: version_attribute_processed
		end

	process_default_collation_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]default-collation attribute. 
		require
			not_excluded: not is_excluded
			attributes_not_prepared: not attributes_prepared
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Default_collation_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		do
			local_default_collation_name := attribute_value_by_expanded_name (an_attribute_name)
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
			an_error: XM_XPATH_ERROR_VALUE
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
								create an_error.make_from_string ("In exclude-result-prefixes, cannot mix #all with other values", "", "XTSE0550", Static_error)
								report_compile_error (an_error)
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
			if validation_error /= Void then
				if reporting_circumstances = Report_always then
					report_compile_error (validation_error)
				elseif reporting_circumstances = Report_unless_forwards_comptible and then not is_forwards_compatible_processing_enabled then
					report_compile_error (validation_error)
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

	validate_children is
			-- Validate the children of this node, recursively.
		require
			not_excluded: not is_excluded
			validated: validated
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element, a_last_child: XM_XSLT_STYLE_ELEMENT
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
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					if contains_instructions and then not a_style_element.is_instruction and then not is_permitted_child (a_style_element) then
						a_message := STRING_.concat ("An ", node_name)
						a_message := STRING_.appended_string (a_message, " element must not contain an ")
						a_message := STRING_.appended_string (a_message, a_style_element.node_name)
						a_message := STRING_.appended_string (a_message, " element.")
						create an_error.make_from_string (a_message, "", "XTSE0010", Static_error)
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

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an expression.
		require
			not_excluded: not is_excluded
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
		deferred
		ensure
			last_generated_expression_may_be_void: True -- not all descendants actually generate an expression
		end

	compile_sequence_constructor (an_executable: XM_XSLT_EXECUTABLE; an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN) is
			-- Compile any sequence constructor child nodes to an expression.
		require
			not_excluded: not is_excluded
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
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_string_value: XM_XPATH_STRING_VALUE
		do
			last_generated_expression := Void
			a_line_number := line_number
			if an_axis_iterator.before then an_axis_iterator.start else an_axis_iterator.forth end
			if not an_axis_iterator.after then
				a_node := an_axis_iterator.item
				a_style_element ?= a_node
				if a_style_element /= Void then
					a_line_number := a_style_element.line_number -- for next text node
				end
				if a_node.node_type = Text_node then
					create a_string_value.make (a_node.string_value)
					create a_text.make (an_executable, a_string_value, False)
					a_text.set_source_location (containing_stylesheet.module_number (a_node.system_id), a_line_number)
					if not is_error and then not any_compile_errors then
						compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
						if last_generated_expression = Void then
							last_generated_expression := a_text
						else
							create a_block.make (an_executable, a_text, last_generated_expression)
							a_block.set_source_location (containing_stylesheet.module_number (a_node.system_id), a_line_number)
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

	compile_variable (an_executable: XM_XSLT_EXECUTABLE; a_variable: XM_XSLT_VARIABLE; an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN) is
			-- Compile `a_variable'.
		require
			not_excluded: not is_excluded
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
			iterator_not_void: an_axis_iterator /= Void
			variable_not_void: a_variable /= Void
		local
			a_local_variable: XM_XSLT_LOCAL_VARIABLE
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			a_required_type: XM_XPATH_SEQUENCE_TYPE
			an_expression: XM_XPATH_EXPRESSION
		do
			a_variable.compile (an_executable)
			if not is_error and then not any_compile_errors then
				if a_variable.last_generated_expression = Void then
					
					-- i.e. a redundant variable, so compile everything after it:
					
					compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
				else
					a_local_variable ?= a_variable.last_generated_expression
					check
						local_variable: a_local_variable /= Void
						-- `a_variable' is local, since we are compiling a sequence constructor
					end
					compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
					if last_generated_expression /= Void then
						a_required_type := a_local_variable.required_type
						if a_required_type = Void then create a_required_type.make_any_sequence end
						create a_range_variable.make (a_local_variable.variable_name, a_local_variable.variable_fingerprint, a_required_type)
						a_range_variable.set_reference_list (a_variable.references)
						an_expression := a_local_variable.select_expression
						if an_expression = Void then create {XM_XPATH_EMPTY_SEQUENCE} an_expression.make end
						create a_let_expression.make (a_range_variable, an_expression, last_generated_expression)
						a_let_expression.set_slot_number (a_local_variable.slot_number)
						a_variable.fixup_binding (a_let_expression)
						a_let_expression.set_source_location (containing_stylesheet.module_number (a_variable.system_id), a_variable.line_number)
						-- TODO: tracing
						last_generated_expression := a_let_expression
					else
						check
							local_variable_without_following_instructions: False
							-- because in that case, the variable's compile would have done nothing
						end
					end
				end
			end
		end
		
	fallback_processing (an_executable: XM_XSLT_EXECUTABLE; a_style_element: XM_XSLT_STYLE_ELEMENT) is
			-- Perform fallback processing.
		require
			not_excluded: not is_excluded
			executable_not_void: an_executable /= Void
			style_element_not_void: a_style_element /= Void and then a_style_element.validation_error /= Void
		local
			found_fallback: BOOLEAN
			an_iterator, another_iterator:XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_block: XM_XSLT_BLOCK
			a_fallback: XM_XSLT_FALLBACK
			a_deferred_error: XM_XSLT_DEFERRED_ERROR
			a_stylesheet: XM_XSLT_STYLESHEET
			a_fallback_expression, an_expression: XM_XPATH_EXPRESSION
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
					another_iterator := a_fallback.new_axis_iterator (Child_axis)
					a_fallback.compile_sequence_constructor (an_executable, another_iterator, True)
					an_expression := a_fallback.last_generated_expression
					if an_expression = Void then create {XM_XPATH_EMPTY_SEQUENCE} an_expression.make end
					if a_fallback_expression = Void then
						a_fallback_expression := an_expression
					else
						create a_block.make (an_executable, a_fallback_expression, an_expression)
						a_block.set_source_location (a_stylesheet.module_number (a_fallback.system_id), a_fallback.line_number)
					end
				end
				an_iterator.forth
			end
			if not found_fallback then
				create a_deferred_error.make (a_style_element.validation_error, a_style_element.node_name)
				last_generated_expression := a_deferred_error
			else
				last_generated_expression := a_fallback_expression
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
			a_third_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_ATTRIBUTE_SET]
			an_error: XM_XPATH_ERROR_VALUE
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
					report_compile_error (name_code_error_value)
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
						if another_cursor.item.is_attribute_set and then another_cursor.item.as_attribute_set.attribute_set_name_code = a_fingerprint then
							found := True
							a_list.force_last (another_cursor.item.as_attribute_set)
						end
						another_cursor.forth
					end
					if not found then
						create an_error.make_from_string (STRING_.concat ("No attribute-set exists named ", a_set_name), "", "XTSE0710", Static_error)
						report_compile_error (an_error)
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

feature -- Conversion
	
	is_apply_templates: BOOLEAN is
			-- Is `Current' an xsl:apply-templates?
		do
			Result := False
		end

	is_param: BOOLEAN is
			-- Is `Current' an xsl:param?
		do
			Result := False
		end

	is_stylesheet: BOOLEAN is
			-- Is `Current' an xsl:stylesheet or xsl:transform?
		do
			Result := False
		end

	is_for_each: BOOLEAN is
			-- Is `Current' an xsl:for-each?
		do
			Result := False
		end

	is_for_each_group: BOOLEAN is
			-- Is `Current' an xsl:for-each-group?
		do
			Result := False
		end

	is_perform_sort: BOOLEAN is
			-- Is `Current' an xsl:perform-sort?
		do
			Result := False
		end

	is_sort: BOOLEAN is
			-- Is `Current' an xsl:sort?
		do
			Result := False
		end

	is_template: BOOLEAN is
			-- Is `Current' an xsl:template?
		do
			Result := False
		end

	as_template: XM_XSLT_TEMPLATE is
			-- `Current' seen as an xsl:template
		require
			template: is_template
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_key: BOOLEAN is
			-- Is `Current' an xsl:key?
		do
			Result := False
		end

	as_key: XM_XSLT_KEY is
			-- `Current' seen as an xsl:key
		require
			key: is_key
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_output: BOOLEAN is
			-- Is `Current' an xsl:output?
		do
			Result := False
		end

	as_output: XM_XSLT_OUTPUT is
			-- `Current' seen as an xsl:output
		require
			output: is_output
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_module: BOOLEAN is
			-- Is `Current' an xsl:include/import?
		do
			Result := False
		end

	as_module: XM_XSLT_MODULE is
			-- `Current' seen as an xsl:include/import
		require
			module: is_module
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_xslt_function: BOOLEAN is
			-- Is `Current' an xsl:function?
		do
			Result := False
		end

	as_xslt_function: XM_XSLT_FUNCTION is
			-- `Current' seen as an xsl:function
		require
			xslt_function: is_xslt_function
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_namespace_alias: BOOLEAN is
			-- Is `Current' an xsl:namespace-alias?
		do
			Result := False
		end

	as_namespace_alias: XM_XSLT_NAMESPACE_ALIAS is
			-- `Current' seen as an xsl:namespace-alias
		require
			namespace_alias: is_namespace_alias
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_xslt_variable: BOOLEAN is
			-- Is `Current' an xsl:variable?
		do
			Result := False
		end

	as_xslt_variable: XM_XSLT_VARIABLE is
			-- `Current' seen as an xsl:variable
		require
			xslt_variable: is_xslt_variable
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_xslt_variable_declaration: BOOLEAN is
			-- Is `Current' an xsl:variable or xsl:param?
		do
			Result := False
		end

	as_xslt_variable_declaration: XM_XSLT_VARIABLE_DECLARATION is
			-- `Current' seen as an XSLT variable declaration
		require
			xslt_variable_declaration: is_xslt_variable_declaration
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_attribute_set: BOOLEAN is
			-- Is `Current' an xsl:attribute-set?
		do
			Result := False
		end

	as_attribute_set: XM_XSLT_ATTRIBUTE_SET is
			-- `Current' seen as an xsl:attribute-set
		require
			attribute_set: is_attribute_set
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_character_map: BOOLEAN is
			-- Is `Current' an xsl:character-map?
		do
			Result := False
		end

	as_character_map: XM_XSLT_CHARACTER_MAP is
			-- `Current' seen as an xsl:character-map
		require
			character_map: is_character_map
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
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

feature {XM_XSLT_NODE_FACTORY} -- Status setting
	
	flag_as_instruction is
			-- Flag `Current' as an XSLT instruction.
		do
			is_instruction := True
		ensure
			is_instruction: is_instruction
		end

feature {NONE} -- Implementation

	Fixed_component: INTEGER is 1
	Left_double_curly_brace_component: INTEGER is 2
	Right_double_curly_brace_component: INTEGER is 3
	Avt_component: INTEGER is 4
			-- Constants used by `generate_attribute_value_template'

	local_default_collation_name: STRING
			-- list of possible default collation names (optional)

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
					create an_atomizer.make (an_expression, configuration.are_all_nodes_untyped)
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
				create an_atomizer.make (an_expression, configuration.are_all_nodes_untyped)
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

	compile_style_element (an_executable: XM_XSLT_EXECUTABLE; a_style_element: XM_XSLT_STYLE_ELEMENT;  an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; include_parameters: BOOLEAN) is
			-- Compile a child style element.
		require
			not_excluded: not is_excluded
			not_in_error: not is_error
			no_previous_error: not any_compile_errors
			validation_complete: post_validated
			executable_not_void: an_executable /= Void
			iterator_not_void: an_axis_iterator /= Void and then an_axis_iterator.is_invulnerable
			style_element_not_void: a_style_element /= Void
		local
			a_child, a_tail: XM_XPATH_EXPRESSION
			a_block: XM_XSLT_BLOCK
		do
			if a_style_element.validation_error /= Void then
				fallback_processing (an_executable, a_style_element)
			else
				a_style_element.compile (an_executable)
				a_child := a_style_element.last_generated_expression
				if a_child /= Void and then a_child.is_computed_expression then 
					a_child.as_computed_expression.set_source_location (containing_stylesheet.module_number (a_style_element.system_id), a_style_element.line_number)
				end
				if a_child /= Void and then configuration.is_tracing and then (include_parameters or else not a_style_element.is_param) then
					a_child := new_trace_wrapper (a_child, an_executable, a_style_element)
				end
				compile_sequence_constructor (an_executable, an_axis_iterator, include_parameters)
				a_tail := last_generated_expression
				if a_tail = Void then
					last_generated_expression := a_child
				elseif a_child /= Void then
					create a_block.make (an_executable, a_child, a_tail)
					a_block.set_source_location (containing_stylesheet.module_number (system_id), line_number)
					last_generated_expression := a_block
				end
			end
		end

invariant

	inherited_version: version_attribute_processed implies version /= Void
	validation_reporting: Report_always <= reporting_circumstances and then reporting_circumstances <= Report_if_instantiated
	error_listener_not_void: error_listener /= Void
	default_collation_name_not_void: default_collation_name /= Void

end
