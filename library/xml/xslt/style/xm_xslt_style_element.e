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

	XM_UNICODE_CHARACTERS_1_1

	XM_XSLT_VALIDATION

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_TOKENS

	XM_XPATH_DEBUGGING_ROUTINES

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		require
			error_listener_not_void: an_error_listener /= Void
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
			base_uri_not_void: a_base_uri /= Void
		do
			reporting_circumstances := Report_always
			error_listener := an_error_listener
			make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
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
						code_allocated: target_name_pool.is_code_for_uri_allocated (a_namespace)
						-- TODO: We must allocate it somewhere, when `default_xpath_namespace' is first set
					end
					Result := target_name_pool.code_for_uri (a_namespace)
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

	target_name_pool: XM_XPATH_NAME_POOL is
			-- Name pool to be used at run-time;
			-- This namepool holds the names used in
			--  all XPath expressions and patterns.
		do
			Result := principal_stylesheet.target_name_pool
		ensure
			target_name_pool_not_void: Result /= Void
		end

	attribute_value_by_expanded_name (an_attribute_name: STRING): STRING is
			-- Value of `an_attribute_name'
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
		local
		do
			if not document.name_pool.is_expanded_name_allocated (an_attribute_name) then
				document.name_pool.allocate_expanded_name (an_attribute_name)
			end
			Result := attribute_value (document.name_pool.fingerprint_from_expanded_name (an_attribute_name))
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
			if not use_default_namespace and then STRING_.same_string (an_xml_prefix, "") then
				Result := ""
			else
				a_uri_code := uri_code_for_prefix (an_xml_prefix)
				Result := document.name_pool.uri_from_uri_code (a_uri_code)
			end
		ensure
			uri_not_void: Result /= Void
		end

feature -- Status_report

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

	check_unknown_attribute (a_name_code: INTEGER) is
			-- Check whether an unknown attribute is permitted.
		local
			an_attribute_uri, an_element_uri, a_local_name, a_message: STRING
		do
			if not is_forwards_compatible_processing_enabled then
				an_attribute_uri := document.name_pool.namespace_uri_from_name_code (a_name_code)
				an_element_uri := uri
				a_local_name := document.name_pool.local_name_from_name_code (a_name_code)

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
					 STRING_.same_string (a_local_name, Xpath_default_namespace_attribute) or else
					 STRING_.same_string (a_local_name, Extension_element_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Exclude_result_prefixes_attribute) or else
					 STRING_.same_string (a_local_name, Version_attribute)
					 ) then
					do_nothing
				elseif STRING_.same_string (an_attribute_uri, "") or else
					STRING_.same_string (an_attribute_uri, Xslt_uri) then
					a_message := STRING_.appended_string ("Attribute ", document.name_pool.display_name_from_name_code (a_name_code))
					a_message := STRING_.appended_string (a_message, " is not allowed on this element")
					report_compile_error (a_message)
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
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element, a_previous_style_element: XM_XSLT_STYLE_ELEMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			finished, finished_inner: BOOLEAN
		do
			Result :=  is_local_variable_declared (a_fingerprint)
				or else is_global_variable_declared (a_fingerprint)
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
			error_listener.error (a_message)
		end

	report_compile_warning (a_message: STRING) is
			-- Report a compile warning.
		require
			validation_message_not_void: a_message /= Void
		do
			error_listener.warning (a_message)
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
			a_name_pool: XM_XPATH_NAME_POOL
		do
			a_name_pool := target_name_pool
			create a_string_splitter.make
			a_string_splitter.set_separators (":")
			qname_parts := a_string_splitter.split (a_qname)
			if qname_parts.count = 1 then
				an_xml_prefix := ""
				if a_name_pool.is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_qname) then
					last_generated_name_code := a_name_pool.name_code (an_xml_prefix, a_name_pool.uri_from_uri_code (a_uri_code), a_qname)
				else
					if not a_name_pool.is_name_pool_full_using_uri_code (a_uri_code, a_qname) then
						a_name_pool.allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_qname)
						last_generated_name_code := a_name_pool.last_name_code
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
					if a_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
						last_generated_name_code := a_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
					else
						if not a_name_pool.is_name_pool_full (a_uri, a_local_name) then
							a_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
							last_generated_name_code := a_name_pool.last_name_code
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
			create a_pattern_parser
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
			create a_pattern_parser
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

	allocate_slots (an_expr: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			todo ("allocate_slots", False)
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		require
			attributes_not_prepared: not attributes_prepared
			static_context_not_void: static_context /= Void
		deferred
		ensure
			attributes_prepared: attributes_prepared
		end

	process_attributes is
			-- Process the attribute list for the element.
	require
		attributes_not_prepared: not attributes_prepared
		static_context_not_void: static_context /= Void
		do
			prepare_attributes
			if is_error then
				if is_forwards_compatible_processing_enabled then
					-- TODO
				end
				todo ("process_attributes", True)
			end
		ensure
			attributes_prepared: attributes_prepared
		end
	
	process_all_attributes is
			-- Process the attributes of this element and all its children
	require
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

	process_default_xpath_namespace_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]default-xpath-namespace attribute. 
		require
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
				exclusions.left_adjust
				exclusions.right_adjust
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
			attributes_prepared: attributes_prepared
			not_validated: not validated
		do
			validated := True
		end

	post_validate is
			-- Hook to allow additional validation of a parent element
			--  immediately after its children have been validated.
		require
			children_validated: children_validated
			post_validate_not_run: not post_validated
		do
			post_validated := True
		end

	validate_subtree is
			-- Recursively walk through the stylesheet to validate all nodes.
		require
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
				if validated then
					validate_children
					if children_validated then
						post_validate
					end
				end
			end
		end

	validate_children is
			-- Validate the children of this node, recursively.
		require
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
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		require
			no_previous_error: not is_error
			compile_to_eiffel_not_supported: not compile_to_eiffel
			validation_complete: post_validated
		deferred
		ensure
			instruction_generated: not compile_to_eiffel and then not is_error implies last_generated_instruction /= Void
		end
			
feature {XM_XSLT_STYLE_ELEMENT} -- Local

	is_local_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent an in-scope local variable?
		require
			positive_fingerprint: a_fingerprint >= 0
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element, a_previous_style_element: XM_XSLT_STYLE_ELEMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			finished, finished_inner: BOOLEAN
		do
			if not is_top_level then
				from
					a_style_element := Current
					a_previous_style_element := Current
					a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
					a_preceding_iterator.start
				until
					finished
				loop
					if a_preceding_iterator.after then
						finished := True
					else
						a_style_element ?= a_preceding_iterator.item
						from
							finished_inner := False
						until
							finished_inner or else a_style_element /= Void
						loop
							a_style_element ?= a_previous_style_element.parent
							a_previous_style_element := a_style_element
							a_stylesheet ?= a_style_element.parent
							if a_stylesheet /= Void then
								finished_inner := True
							else
								a_preceding_iterator := a_style_element.new_axis_iterator (Preceding_sibling_axis)
								a_preceding_iterator.start
								if not a_preceding_iterator.after then
									a_style_element ?= a_preceding_iterator.item
								else
									a_style_element := Void
								end
							end
						end
						a_stylesheet ?= a_style_element.parent
						if a_stylesheet /= Void then
							finished := True
						else
							a_variable_declaration ?= a_style_element
							if a_variable_declaration /= Void then
								Result := a_variable_declaration.variable_fingerprint = a_fingerprint
								if Result then finished := True end
							end
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

feature {NONE} -- Implementation

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
			a_style_element, a_previous_style_element: XM_XSLT_STYLE_ELEMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION
			finished, finished_inner: BOOLEAN
		do
			from
				a_style_element := Current
				a_previous_style_element := Current
				a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
				a_preceding_iterator.start
			until
				finished
			loop
				if a_preceding_iterator.after then
					finished := True
				else
					a_style_element ?= a_preceding_iterator.item
					from
						finished_inner := False
					until
						finished_inner or else a_style_element /= Void
					loop
						a_style_element ?= a_previous_style_element.parent
						a_previous_style_element := a_style_element
						a_stylesheet ?= a_style_element.parent
						if a_stylesheet /= Void then
							finished_inner := True
						else
							a_preceding_iterator := a_style_element.new_axis_iterator (Preceding_sibling_axis)
							a_preceding_iterator.start
							if not a_preceding_iterator.after then
								a_style_element ?= a_preceding_iterator.item
							else
								a_style_element := Void
							end
						end
					end
					a_stylesheet ?= a_style_element.parent
					if a_stylesheet /= Void then
						finished := True
					else
						a_variable_declaration ?= a_style_element
						if a_variable_declaration /= Void and then  a_variable_declaration.variable_fingerprint = a_fingerprint then
							static_context.set_last_bound_variable (a_variable_declaration)
						end
					end
					if not finished and then not a_preceding_iterator.after then a_preceding_iterator.forth end
				end
			end
		ensure
			variable_bound: static_context.last_bound_variable /= Void
		end

invariant

	inherited_verion: version_attribute_processed implies version /= Void
	validation_reporting: Report_always <= reporting_circumstances and then reporting_circumstances <= Report_if_instantiated
	error_listener_not_void: error_listener /= Void

end
