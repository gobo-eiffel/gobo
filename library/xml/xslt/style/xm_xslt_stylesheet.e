indexing

	description:

		"xsl:transform or xsl:stylesheet element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STYLESHEET

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, precedence, process_all_attributes, validate, is_global_variable_declared,
			any_compile_errors, stylesheet_compiler, system_id_from_module_number, is_stylesheet
		end

	XM_XSLT_PROCEDURE

	XM_XSLT_STRING_ROUTINES

	XM_XSLT_VALIDATION

	XM_XSLT_SHARED_FUNCTION_LIBRARY

	XM_XPATH_STANDARD_NAMESPACES

	KL_SHARED_PLATFORM
		export {NONE} all end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		local
			a_code_point_collator: ST_COLLATOR
		do
			create named_templates_index.make_map (5)
			create variables_index.make_map (5)
			create namespace_alias_list.make (5)
			create key_manager.make
			create decimal_format_manager.make
			create collation_map.make_with_equality_testers (1, Void, string_equality_tester)
			create a_code_point_collator
			declare_collation (a_code_point_collator, default_collation_name)
			create stylesheet_module_map.make_with_equality_testers (5, Void, string_equality_tester)
			create module_list.make_default
			module_list.set_equality_tester (string_equality_tester)
			default_validation := Validation_strip
			function_library := shared_function_library
			create rule_manager.make
			create slot_manager.make
			create executable.make (rule_manager, key_manager, decimal_format_manager,
											collation_map, shared_name_pool, module_list, function_library)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Map of collation names to collators

	importer: like Current
			-- The stylesheet that imported or included `Current';
			-- `Void' for the prinicpal stylesheet.

	stylesheet_compiler: XM_XSLT_STYLESHEET_COMPILER
			-- Stylesheet compiler object used to load `Current'

	top_level_elements: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			-- Top-level elements in this logical stylesheet (after include/import processing)

	import_precedence: INTEGER
			-- Import precedence for top-level elements

	minimum_import_precedence: INTEGER
			-- Lowest precedence of any stylesheet imported by `Current'

	rule_manager: XM_XSLT_RULE_MANAGER
			-- Manager of template-matching rules

	key_manager: XM_XSLT_KEY_MANAGER
			-- Manger of key definitions

	decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			-- Manager of decimal formats

	includes_processed: BOOLEAN
			-- Has import/include processing been performed?

	default_validation: INTEGER
			-- Default validation

	stripper_rules: XM_XSLT_MODE
			-- Strip/preserve whitespace rules

	function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function libraries in use (only if this is the principal stylesheet module)

	precedence: INTEGER is
			-- Import precedence of `Current'
		do
			if was_included then
				Result := importer.precedence
			else
				Result := import_precedence
			end
		end
	
	namespace_alias (a_uri_code: INTEGER): INTEGER is
			-- Declared namespace alias for a given namespace URI code if there is one.
			-- If there is more than one, we get the last.
		local
			an_index: INTEGER
		do
			Result := -1
			if has_namespace_aliases then
			
				-- if there are several matches, the last in stylesheet takes priority;
				-- but the list is in reverse stylesheet order
				
				from
					an_index := 1
				variant
					namespace_alias_uri_codes.count + 1 - an_index
				until
					an_index > namespace_alias_uri_codes.count
				loop
					if a_uri_code = namespace_alias_uri_codes.item (an_index) then
						Result := namespace_alias_namespace_codes.item (an_index)
						an_index := namespace_alias_uri_codes.count + 1
					else
						an_index := an_index + 1
					end
				end
			end
		end

	find_collator (a_collator_uri: STRING): ST_COLLATOR is
			-- Does `a_collator_uri' represent a defined collator? -- TODO rename to found_collator
		require
			collator_uri_not_void: a_collator_uri /= Void
			collator_is_defined: is_collator_defined (a_collator_uri)
		do
			Result := collation_map.item (a_collator_uri)
		ensure
			collator_not_void: Result /= Void
		end

	module_number (a_system_id: STRING): INTEGER is
			-- Module number of `a_system_id'
		require
			system_id_not_void: a_system_id /= Void
			module_registered: is_module_registered (a_system_id)
		do
			Result := stylesheet_module_map.item (a_system_id)
		end

	gathered_output_properties (a_fingerprint: INTEGER): XM_XSLT_OUTPUT_PROPERTIES is
			-- Accumulated output properties for format named by `a_fingerprint' (-1 = unnamed format)
		require
			nearly_positive_fingerprint: a_fingerprint > -2
			post_validated: post_validated
			output_properties_defined_somewhere: a_fingerprint > -1 implies is_named_output_property_defined (a_fingerprint)
		local
			l_found: BOOLEAN
			l_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if a_fingerprint = -1 then
				l_found := True
			end
			create Result.make (Platform.Minimum_integer)

			-- Note that we process backwards, so as to find highest
			--  import precedence definitions first.
			-- This makes error reporting easier.

			from
				l_cursor := top_level_elements.new_cursor; l_cursor.finish
			variant
				l_cursor.index
			until
				Result.is_error or l_cursor.before
			loop
				if l_cursor.item.is_output and then l_cursor.item.as_output.output_fingerprint = a_fingerprint then
					l_found := True
					l_cursor.item.as_output.gather_output_properties (Result)
				end
				l_cursor.back
			end
			if Result.is_error then
				if Result.is_duplication_error then
					l_message := STRING_.concat ("Two xsl:output statements specify conflicting values for attribute '", Result.duplicate_attribute_name)
					if a_fingerprint = -1 then
						l_message := STRING_.appended_string (l_message, "', in the unnamed output definition.")
					else
						l_message := STRING_.appended_string (l_message, "', in output definition named ")
						l_message := STRING_.appended_string (l_message, shared_name_pool.display_name_from_name_code (a_fingerprint))
					end
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1560", Static_error)
				else
					create l_error.make_from_string (Result.error_message, Gexslt_eiffel_type_uri, "OUTPUT+PROPERTY", Static_error)
				end
				report_compile_error (l_error)
			elseif not l_found and then a_fingerprint > -1 then
				Result := Void -- triggers an exception
			end
		ensure
			output_properties_not_void: Result /= Void
		end

	character_map (a_fingerprint: INTEGER): XM_XSLT_CHARACTER_MAP is
			-- Character map named by `a_fingerprint'
		require
			positive_fingerprint: a_fingerprint >= 0
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do

			-- Note that we process backwards, so as to find highest
			--  import precedence definitions first.
			-- This makes error reporting easier.

			from
				a_cursor := top_level_elements.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				a_cursor.before
			loop
				if a_cursor.item.is_character_map and then a_cursor.item.as_character_map.character_map_fingerprint = a_fingerprint then
					Result := a_cursor.item.as_character_map
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		do
			Result := module_list.item (a_module_number)
		end

	input_type_annotations: INTEGER
			-- Value of input-type-annotations attribute coded on `Current' and it's imports/inclusions

	Strip_annotations: INTEGER is 1
	Preserve_annotations: INTEGER is 2
			-- Bit-values for `input_type_annotations'

feature -- Status report

	any_compile_errors: BOOLEAN
			-- Have any compile errors been reported?

	was_included: BOOLEAN
			-- Was `Current' pulled in by xsl:include?

	indices_built: BOOLEAN
			-- Have the indices been built?

	is_all_explaining: BOOLEAN
			-- Should compiled instructions explain themsleves?
			-- (Only significant for the principal stylesheet)

	needs_dynamic_output_properties: BOOLEAN
			-- Does `Current' require dynamic output formats?

	is_named_output_property_defined (a_fingerprint: INTEGER): BOOLEAN is
			-- Is there an xsl:output statement for `a_fingerprint'?
		require
			nearly_positive_fingerprint: a_fingerprint > -2
			post_validated: post_validated
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do
			from
				a_cursor := top_level_elements.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				Result or else a_cursor.before
			loop
				if a_cursor.item.is_output and then a_cursor.item.as_output.output_fingerprint = a_fingerprint then
					Result := True
				end
				a_cursor.back
			end
		end

	is_module_registered (a_system_id: STRING): BOOLEAN is
			-- Is `a_system_id' registered as a module?
		require
			system_id_not_void: a_system_id /= Void
		do
			Result := stylesheet_module_map.has (a_system_id)
		end

	has_namespace_aliases: BOOLEAN is
			-- Have any namespace aliases been declared?
		do
			Result := namespace_alias_uri_codes /= Void
		end

	is_alias_result_namespace (a_uri_code: INTEGER): BOOLEAN is
			-- Is `a_uri_code' included in the result-prefix of a namespace-alias?
		local
			an_index: INTEGER
		do
			if	namespace_alias_namespace_codes /= Void then
				from
					an_index := 1
				variant
					namespace_alias_namespace_codes.count + 1 - an_index
				until
					an_index > namespace_alias_namespace_codes.count
				loop
					if a_uri_code = uri_code_from_namespace_code (namespace_alias_namespace_codes.item (an_index)) then
						Result := True
						an_index := namespace_alias_namespace_codes.count + 1
					else
						an_index := an_index + 1
					end
				end
			end
		end

	is_collator_defined (a_collator_uri: STRING): BOOLEAN is
			-- Does `a_collator_uri' represent a defined collator?
		require
			collator_uri_not_void: a_collator_uri /= Void
		do
			Result := collation_map.has (a_collator_uri)
		end

	strips_whitespace: BOOLEAN is
			-- Does this stysheet do any whitespace stripping?
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do
			from
				a_cursor := top_level_elements.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				if a_cursor.item.fingerprint = Xslt_strip_space_type_code then
					Result := True
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

	executable: XM_XSLT_EXECUTABLE
			-- Result of successfull call to `compile_stylesheet'

feature -- Status setting

	force_explaining is
			-- Force gexslt:explain="all" on.
		do
			is_all_explaining := True
		ensure
			explaining_forced_on: is_all_explaining
		end

	set_compile_errors is
			-- Mark this stylesheet as having compile errors
		do
			any_compile_errors := True
		ensure
			compile_errors_reported: any_compile_errors = True
		end

	set_needs_dynamic_output_properties is
			--  Set dynamic output formats needed.
		do
			needs_dynamic_output_properties := True
		ensure
			dynamic_output_formats_needed: needs_dynamic_output_properties
		end

feature -- Element change

	set_import_precedence (a_precedence: INTEGER) is
			-- Set import precedence for top-level elements
		do
			import_precedence := a_precedence
		ensure
			import_precedence_set: import_precedence = a_precedence
		end

	set_minimum_import_precedence (a_precedence: INTEGER) is
			-- Set minimum import precedence for top-level elements
		do
			minimum_import_precedence := a_precedence
		ensure
			minimum_import_precedence_set: minimum_import_precedence = a_precedence
		end

	set_importer (an_importer: like Current) is
			-- Set stylesheet that imported or included `Current'
		require
			importer_not_void: an_importer /= Void
		do
			importer := an_importer
		ensure
			importer_set: importer = an_importer
		end

	set_was_included is
			-- Mark `Current' as pulled in by xsl:include.
		do
			was_included := True
		ensure
			included: was_included = True
		end

	ensure_stripper_rules is
			-- Ensure strip/preserve whitespace rules exist
		do
			if stripper_rules = Void then
				create stripper_rules.make_stripper
			end
		ensure
			stripper_rules_not_void: stripper_rules /= Void
		end
		
	register_module (a_system_id: STRING) is
			-- Register `a_system_id' as a stylesheet module.
		require
			system_id_not_void: a_system_id /= Void
			module_not_registered: not is_module_registered (a_system_id)
		do
			if stylesheet_module_map.is_full then
				stylesheet_module_map.resize (2 * stylesheet_module_map.count)
			end
			stylesheet_module_map.put (stylesheet_module_map.count + 1, a_system_id)
			module_list.force_last (a_system_id)
		ensure
			module_registered: is_module_registered (a_system_id)
		end

	declare_collation (a_collator: ST_COLLATOR; a_name: STRING) is
			-- Declare a collation.
		require
			collation_name_not_void: a_name /= Void -- TODO and then is a URI
			collator_not_void: a_collator /= Void
		do
			if collation_map.has (a_name) then
				collation_map.replace (a_collator, a_name)
			else
				collation_map.force (a_collator, a_name)
			end
		ensure
			collator_declared: is_collator_defined (a_name)
		end

	allocate_global_slot (a_variable_name: STRING) is
			-- Allocate a slot for a global variable or parameter.
		require
			variable_name_not_empty: a_variable_name /= Void and then a_variable_name.count > 0
		do
			executable.global_slot_manager.allocate_slot_number (a_variable_name)
		ensure
			global_slot_allocated: executable.global_slot_manager.number_of_variables = old executable.global_slot_manager.number_of_variables + 1
		end																						 
		
	allocate_pattern_slots (a_variable_count: INTEGER) is
			-- Ensure there is enough space for local variables or parameters within match patterns in any template.
		require
			positive_variable_count: a_variable_count >= 0
		do
			if a_variable_count > largest_pattern_stack_frame then
				largest_pattern_stack_frame := a_variable_count
			end
		ensure
			no_smaller: largest_pattern_stack_frame >= old largest_pattern_stack_frame
		end

	merge_input_type_annotations (an_annotation_setting: INTEGER) is
			-- Merge `input_type_annotations' with `an_annotation_setting'.
		require
			valid_annotation: an_annotation_setting <= Preserve_annotations and then an_annotation_setting >= 0
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if an_annotation_setting /= 0 then
				if input_type_annotations = 0 then
					input_type_annotations := an_annotation_setting
				elseif input_type_annotations = an_annotation_setting then
					-- nothing to do
				else
					create an_error.make_from_string ("One stylesheet module specifies input-type-annotations='strip', another specifies input-type-annotations='preserve'",
																 Xpath_errors_uri, "XTSE0265", Static_error)
					report_compile_error (an_error)
				end
			end
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name, l_input_type_annotations_attribute: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_version_found: BOOLEAN
		do
			from
				l_cursor := attribute_collection.name_code_cursor
				l_cursor.start
			until
				l_cursor.after or any_compile_errors
			loop
				l_name_code := l_cursor.item
				l_expanded_name := shared_name_pool.expanded_name_from_name_code (l_name_code)
				if STRING_.same_string (l_expanded_name, Version_attribute) then
					l_version_found := True
				elseif STRING_.same_string (l_expanded_name, Extension_element_prefixes_attribute) then
					-- do nothing
				elseif STRING_.same_string (l_expanded_name, Exclude_result_prefixes_attribute) then
					-- do nothing
				elseif STRING_.same_string (l_expanded_name, Id_attribute) then
					-- do nothing
				elseif STRING_.same_string (l_expanded_name, Default_validation_attribute) then
					default_validation := validation_code (attribute_value_by_index (l_cursor.index))
					if default_validation /= Validation_preserve and then  default_validation /= Validation_strip then
						create l_error.make_from_string ("Invalid value for default-validation attribute. Permitted values are (preserve, strip)", Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (l_error)
					elseif conformance.basic_xslt_processor and then default_validation /= Validation_strip then
						create l_error.make_from_string ("Invalid value for default-validation attribute. Only 'strip' is permitted for a basic XSLT processor)", Xpath_errors_uri, "XTSE1660", Static_error)
						report_compile_error (l_error)
					end
				elseif STRING_.same_string (l_expanded_name, Input_type_annotations_attribute) then
					l_input_type_annotations_attribute := attribute_value_by_index (l_cursor.index)
				elseif STRING_.same_string (l_expanded_name, Gexslt_explain_attribute) then
					is_all_explaining := STRING_.same_string (attribute_value_by_index (l_cursor.index), "all")
				else
					check_unknown_attribute (l_name_code)
				end
				l_cursor.forth
			end
			if version = Void or not l_version_found then
				report_absence ("version")
			end
			if l_input_type_annotations_attribute /= Void then
				if STRING_.same_string (l_input_type_annotations_attribute, "strip") then
					input_type_annotations := Strip_annotations
				elseif STRING_.same_string (l_input_type_annotations_attribute, "preserve") then
					input_type_annotations := Preserve_annotations
				elseif STRING_.same_string (l_input_type_annotations_attribute, "unspecified") then
					-- nothing to do
				else
					create l_error.make_from_string ("Invalid value for input-type-annotations attribute. Permitted values are (strip, preserve, unspecified)",
					Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (l_error)
				end
			end
			attributes_prepared := True
		end

	
	set_stylesheet_compiler (a_stylesheet_compiler: like stylesheet_compiler; a_configuration: XM_XSLT_CONFIGURATION) is
			-- Set `stylesheet_compiler'.
		require
			stylesheet_compiler_not_void: a_stylesheet_compiler /= Void
			configuration_not_void: a_configuration /= Void
		local
			a_function_library: XM_XPATH_FUNCTION_LIBRARY
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_FUNCTION_LIBRARY]
		do
			create function_library.make
			executable.set_function_library (function_library)
			stylesheet_compiler := a_stylesheet_compiler
			create {XM_XSLT_SYSTEM_FUNCTION_LIBRARY} a_function_library.make
			function_library.add_function_library (a_function_library)
			create {XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY} a_function_library.make
			function_library.add_function_library (a_function_library)
			create {XM_XSLT_STYLESHEET_FUNCTION_LIBRARY} a_function_library.make (Current, True)
			function_library.add_function_library (a_function_library)
			from
				a_cursor := a_configuration.extension_functions.new_cursor; a_cursor.start
			variant
				a_configuration.extension_functions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				function_library.add_function_library (a_cursor.item)
				a_cursor.forth
			end
			create {XM_XSLT_STYLESHEET_FUNCTION_LIBRARY} a_function_library.make (Current, False)
			function_library.add_function_library (a_function_library)
		ensure
			stylesheet_compiler_set: stylesheet_compiler = a_stylesheet_compiler
			function_library_not_void: function_library /= Void
		end

	preprocess is
			-- Perform all the processing possible before the source document is available.
			-- Done once per stylesheet, so the stylesheet can be reused for multiple source documents.
		require
			indices_not_built: not indices_built
			no_compile_errors_yet: not any_compile_errors
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			-- Process any xsl:include and xsl:import elements.

			splice_includes

			-- Build indices for selected top-level elements.

			if not any_compile_errors then
				build_indices
			end
			
			-- Process the attributes of every node in the tree

			if not any_compile_errors then
				process_all_attributes
			end

			-- Collect any namespace aliases.

			if not any_compile_errors then
				collect_namespace_aliases
			end

			-- Fix up references from XPath expressions to variables and functions, for static typing

			if not any_compile_errors then
				from
					a_cursor := top_level_elements.new_cursor
					a_cursor.start
				variant
					top_level_elements.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_style_element := a_cursor.item
					a_style_element.fixup_references
					a_cursor.forth
				end
			end
			
			-- Validate the whole logical style sheet (i.e. with included and imported sheets)

			if not any_compile_errors then
				validate
				from
					a_cursor := top_level_elements.new_cursor
					a_cursor.start
				variant
					top_level_elements.count + 1 - a_cursor.index
				until
					any_compile_errors or else a_cursor.after
				loop
					a_style_element := a_cursor.item
					a_style_element.validate_subtree
					a_cursor.forth
				end
				post_validated := True
			end
		ensure
			indices_built: not any_compile_errors implies indices_built
		end

	splice_includes is
			-- Process xsl:include and xsl:import elements.
		require
			includes_not_processed: not includes_processed
		local
			l_previous_style_element: XM_XSLT_STYLE_ELEMENT
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_child: XM_XPATH_NODE
			l_data_element: XM_XSLT_DATA_ELEMENT
			l_module: XM_XSLT_MODULE
			l_found_non_import: BOOLEAN
			l_included_stylesheet: XM_XSLT_STYLESHEET
			l_error: XM_XPATH_ERROR_VALUE
		do
			create top_level_elements.make
			minimum_import_precedence := import_precedence
			l_previous_style_element := Current
			register_module (system_id)
			from
				l_child_iterator := new_axis_iterator (Child_axis)
				l_child_iterator.start
			until
				any_compile_errors or l_child_iterator.after
			loop
				l_child := l_child_iterator.item
				if l_child.node_type = Text_node then

					-- In an embedded stylesheet, white space nodes may still be there

					if not is_all_whitespace (l_child.string_value) then
						create l_error.make_from_string ("No character data is allowed between top-level elements", Xpath_errors_uri, "XTSE0120", Static_error)
						 l_previous_style_element.report_compile_error (l_error)
					end
				else
					l_data_element ?= l_child
					if l_data_element /= Void then
						l_found_non_import := True
					else
						l_previous_style_element ?= l_child
						check
							child_is_style_element: l_previous_style_element /= Void
							-- Only data elements, style elements and white-space text nodes may be present
						end
						if l_previous_style_element.is_module then
							l_module := l_previous_style_element.as_module
							l_module.create_static_context
							l_module.process_attributes
							if l_module.is_import then
								if l_found_non_import then
									create l_error.make_from_string ("xsl:import elements must come first", Xpath_errors_uri, "XTSE0200", Static_error)
									l_module.report_compile_error (l_error)
								end
							else
								l_found_non_import := True
							end
							if not any_compile_errors then
								l_included_stylesheet := l_module.included_stylesheet (Current, import_precedence)
								if l_included_stylesheet /= Void then
									if l_included_stylesheet.any_compile_errors then
										set_compile_errors
									else
										
										-- After processing the imported stylesheet and any others it brought in,
										--  adjust the import precedence of this stylesheet if necessary.
										
										if l_module.is_import then
											import_precedence := l_included_stylesheet.precedence + 1
										else
											import_precedence := l_included_stylesheet.precedence
											l_included_stylesheet.set_minimum_import_precedence (minimum_import_precedence)
											l_included_stylesheet.set_was_included
										end
										copy_top_level_elements (l_included_stylesheet)
									end
								end
							end
						else
							l_found_non_import := True
							top_level_elements.force_last (l_previous_style_element)
						end
					end
				end	
				l_child_iterator.forth
			end
		ensure
			top_level_elements_created: top_level_elements /= Void
		end

	process_all_attributes is
			-- Process the attributes of every node in the stylesheet.
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			create static_context.make (Current, configuration)
			process_attributes
			if top_level_elements /= Void then
				from
					a_cursor := top_level_elements.new_cursor
					a_cursor.start
				variant
					top_level_elements.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_style_element := a_cursor.item
					a_style_element.process_all_attributes
					a_cursor.forth
				end
			else
				-- then validation will fail later, and report the error
			end
			includes_processed := True
		ensure then
			includes_processed: includes_processed		
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			if validation_error /= Void then
				report_compile_error (validation_error)
			elseif not parent.is_document then
				create l_error.make_from_string (STRING_.concat (node_name, " must be the outermost element"), Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (l_error)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void -- `compile_stylesheet' is used instead
		end

	compile_stylesheet (a_configuration: XM_XSLT_CONFIGURATION) is
			-- Compile `Current' to an excutable instruction.
		require
			configuration_not_void: a_configuration /= Void
			no_compile_errors_so_far: not any_compile_errors
			post_validate: post_validated
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			another_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_TEMPLATE, INTEGER]
			a_third_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_FUNCTION_LIBRARY]
			a_compiled_templates_index: DS_HASH_TABLE [XM_XSLT_COMPILED_TEMPLATE, INTEGER]
			a_property_set: XM_XSLT_OUTPUT_PROPERTIES
			a_message, a_system_id: STRING
			a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]
			a_character_code_map: DS_HASH_TABLE [STRING, INTEGER]
			a_fingerprint, a_level: INTEGER
			a_function_library: XM_XPATH_FUNCTION_LIBRARY
			an_error: XM_XPATH_ERROR_VALUE
			explaining: BOOLEAN
		do
						
			-- Call compile method for each top-level object in the stylesheet

			explaining := is_all_explaining
			from
				a_cursor := top_level_elements.new_cursor
				a_cursor.start
			variant
				top_level_elements.count + 1 - a_cursor.index
			until
				any_compile_errors or else a_cursor.after
			loop
				a_system_id := a_cursor.item.system_id
				if not is_module_registered (a_system_id) then register_module (a_system_id) end
				a_cursor.item.compile (executable)
				if a_cursor.item.last_generated_expression /= Void and then a_cursor.item.last_generated_expression.is_computed_expression then
					a_cursor.item.last_generated_expression.as_computed_expression.set_source_location (module_number (a_system_id), a_cursor.item.line_number)
				end
				if explaining and then a_cursor.item.last_generated_expression /= Void then
					if a_cursor.item.is_xslt_function then
						a_level := 2
						std.error.put_string ("xsl:function name=")
						std.error.put_string (a_cursor.item.as_xslt_function.function_name)
						if a_cursor.item.as_xslt_function.arity > 0 then
							std.error.put_string (" taking ")
							std.error.put_string (a_cursor.item.as_xslt_function.arity.out)
							std.error.put_string (" parameter")
							if a_cursor.item.as_xslt_function.arity > 1 then
								std.error.put_string ("s")
							end
						end
						std.error.put_string ("%N")
					else
						a_level := 1
					end
					a_cursor.item.last_generated_expression.display (a_level)
				end
				a_cursor.forth
			end
			if not any_compile_errors then
				decimal_format_manager.fixup_default_default
				executable.set_pattern_slot_space (largest_pattern_stack_frame)
				a_property_set := gathered_output_properties (-1)
				if a_property_set.is_error then
					if a_property_set.is_duplication_error then
						a_message := STRING_.concat ("Two xsl:output statements specify conflicting values for attribute '", a_property_set.duplicate_attribute_name)
						a_message := STRING_.appended_string (a_message, "', in the unnamed output definition.")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1560", Static_error)
					else
						create an_error.make_from_string (a_property_set.error_message, Gexslt_eiffel_type_uri, "OUTPUT+PROPERTY", Static_error)
					end
					report_compile_error (an_error)
				else
					executable.set_default_output_properties (a_property_set)
					save_output_definitions
					create a_compiled_templates_index.make_map (named_templates_index.count)
					from
						another_cursor := named_templates_index.new_cursor; another_cursor.start
					until
						another_cursor.after
					loop
						a_compiled_templates_index.put (another_cursor.item.compiled_template, another_cursor.key)
						another_cursor.forth
					end
					executable.set_named_template_table (a_compiled_templates_index)
				end
				executable.set_strips_input_type_annotations (input_type_annotations = Strip_annotations)
	
				-- Build the index of named character maps.

				a_character_map_index := executable.character_map_index
				from
					a_cursor := top_level_elements.new_cursor
					a_cursor.start
				variant
					top_level_elements.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_cursor.item.is_character_map and then not a_cursor.item.as_character_map.is_redundant then
						a_fingerprint := a_cursor.item.as_character_map.character_map_fingerprint
						create a_character_code_map.make_with_equality_testers (10, string_equality_tester, Void)
						a_cursor.item.as_character_map.assemble (a_character_code_map)
						a_character_map_index.force (a_character_code_map, a_fingerprint)
					end
					a_cursor.forth
				end

				-- Build the run-time function library

				create function_library.make
				create {XM_XSLT_SYSTEM_FUNCTION_LIBRARY} a_function_library.make
				function_library.add_function_library (a_function_library)
				create {XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY} a_function_library.make
				function_library.add_function_library (a_function_library)
				create overriding_runtime_library.make
				function_library.add_function_library (overriding_runtime_library)
				from
					a_third_cursor := a_configuration.extension_functions.new_cursor; a_third_cursor.start
				variant
					a_configuration.extension_functions.count + 1 - a_third_cursor.index
				until
					a_third_cursor.after
				loop
					function_library.add_function_library (a_third_cursor.item)
					a_third_cursor.forth
				end
				create non_overriding_runtime_library.make
				function_library.add_function_library (non_overriding_runtime_library)

				from
					a_cursor := top_level_elements.new_cursor; a_cursor.start
				variant
					top_level_elements.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_cursor.item.is_xslt_function then
						if a_cursor.item.as_xslt_function.is_overriding then
							overriding_runtime_library.add_function (a_cursor.item.as_xslt_function)
						else
							non_overriding_runtime_library.add_function (a_cursor.item.as_xslt_function)
						end
					end
					a_cursor.forth
				end
				executable.set_function_library (function_library)
				if stripper_rules /= Void then
					executable.set_stripper_rules (stripper_rules)
				end
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Local

	is_global_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a global variable?
		do
			if principal_stylesheet = Current then
				Result := variables_index.has (a_fingerprint)
			else
				check
					is_global_variable_declared_called_for_non_principal_stylesheet: False
				end
			end
		end

	bind_global_variable (a_fingerprint: INTEGER; a_static_context: XM_XSLT_EXPRESSION_CONTEXT) is
			-- Bind variable to it's declaration.
		require
			variable_declared: is_global_variable_declared (a_fingerprint)
			static_context_not_void: a_static_context /= Void
		do
			a_static_context.set_last_bound_variable (variables_index.item (a_fingerprint))
		ensure
			variable_bound: a_static_context.last_bound_variable /= Void
		end

feature -- Conversion

	is_stylesheet: BOOLEAN is
			-- Is `Current' an xsl:stylesheet or xsl:transform?
		do
			Result := True
		end
	
feature {NONE} -- Implementation

	overriding_runtime_library: XM_XSLT_RUNTIME_FUNCTION_LIBRARY
			-- Compiled xsl:functions with override="yes" (or omitted)

	non_overriding_runtime_library: XM_XSLT_RUNTIME_FUNCTION_LIBRARY
			-- Compiled xsl:functions with override="no"

	named_templates_index: DS_HASH_TABLE [XM_XSLT_TEMPLATE, INTEGER]
			-- Index of named templates by `template_fingerprint'
	
	variables_index: DS_HASH_TABLE [XM_XSLT_VARIABLE_DECLARATION, INTEGER]
			-- Index of varaibles by `variable_fingerprint'

			-- These next three are only used at compile time

	namespace_alias_list: DS_ARRAYED_LIST [XM_XSLT_NAMESPACE_ALIAS]
			-- List of namespace aliases

	namespace_alias_uri_codes: ARRAY [INTEGER]
			-- URI codes for each namespace alias

	namespace_alias_namespace_codes: ARRAY [INTEGER]
			-- Namespace codes for each namespace alias

	largest_pattern_stack_frame: INTEGER
			-- Maximum number of local variables within match attribute of any template

	stylesheet_module_map: DS_HASH_TABLE [INTEGER, STRING]
			-- Map of SYSTEM IDs to module numbers

	module_list: DS_ARRAYED_LIST [STRING]
			-- List of stylesheet modules indexed by module number

	build_indices is
			-- Build indices from selected top-level declarations.
		require
			indices_not_built: not indices_built
			no_compile_errors_yet: not any_compile_errors
		local
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do
			from
				a_cursor := top_level_elements.new_cursor
				a_cursor.finish
			until
				a_cursor.before
			loop
				if a_cursor.item.is_template then
					index_named_template (a_cursor.item.as_template)
				elseif a_cursor.item.is_xslt_variable_declaration then
						index_variable_declaration (a_cursor.item.as_xslt_variable_declaration)
				elseif a_cursor.item.is_namespace_alias then
					if not namespace_alias_list.extendible (1) then
						namespace_alias_list.resize (2 * namespace_alias_list.count)
					end
					namespace_alias_list.put_last (a_cursor.item.as_namespace_alias)
				elseif a_cursor.item.is_decimal_format then
					a_cursor.item.as_decimal_format.register
				end
				a_cursor.back
			end
			indices_built := True
		ensure
			indices_built: indices_built
		end

	index_named_template (a_template: XM_XSLT_TEMPLATE) is
			-- Conditionally add an index entry for `a_template'.
		require
			indices_not_built: not indices_built
			template_not_void: a_template /= Void
		local
			l_fingerprint: INTEGER
			l_template: XM_XSLT_TEMPLATE
			l_message: STRING
		do
			a_template.ensure_template_fingerprint
			if not any_compile_errors then
				l_fingerprint := a_template.template_fingerprint
				if l_fingerprint /= -1 then
					
					-- Named template
					
					if named_templates_index.has (l_fingerprint) then
						
						-- Check the precedence.
						
						l_template := named_templates_index.item (l_fingerprint)
						if a_template.precedence = l_template.precedence then
							l_message := STRING_.concat ("Duplicate named template (see line ", l_template.line_number.out)
							l_message := STRING_.appended_string (l_message, " of ")
							l_message := STRING_.appended_string (l_message, l_template.system_id)
							l_message := STRING_.appended_string (l_message, ")")
							a_template.report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XTSE0660", Static_error))
						elseif a_template.precedence < l_template.precedence then
							a_template.set_redundant_named_template
						else
							
							-- This is not supposed to happen
							
							l_template.set_redundant_named_template
							named_templates_index.replace (a_template, l_fingerprint)
						end
					else
						if named_templates_index.is_full then
							named_templates_index.resize (2 * named_templates_index.count)
						end
						named_templates_index.put (a_template, l_fingerprint)
					end
				end
			end
		end

	index_variable_declaration (a_variable_declaration: XM_XSLT_VARIABLE_DECLARATION) is
			-- Conditionally add an index entry for `a_variable_declaration'.
		require
			indices_not_built: not indices_built
			variable_declaration_not_void: a_variable_declaration /= Void
		local
			a_fingerprint: INTEGER
			another_variable: XM_XSLT_VARIABLE_DECLARATION
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_fingerprint := a_variable_declaration.variable_fingerprint
			if a_fingerprint /= -1 then

				-- See if there is already a global variable with this precedence

				if variables_index.has (a_fingerprint) then

					-- Check the precedence

					another_variable := variables_index.item (a_fingerprint)
					if another_variable.precedence = a_variable_declaration.precedence then
						a_message := STRING_.appended_string ("Duplicate global variable declaration (see line ", another_variable.line_number.out)
						a_message := STRING_.appended_string (a_message, " of ")
						a_message := STRING_.appended_string (a_message, another_variable.system_id)
						a_message := STRING_.appended_string (a_message, ")")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0630", Static_error)
						a_variable_declaration.report_compile_error (an_error)
					elseif a_variable_declaration.precedence < another_variable.precedence then
						a_variable_declaration.set_redundant_variable
					else
						
						-- This is not supposed to happen

						check
							redundant_variable_shouldnt_happen: False
						end
						another_variable.set_redundant_variable
						variables_index.replace (a_variable_declaration, a_fingerprint)
					end
				else
					if variables_index.is_full then
						variables_index.resize (2 * variables_index.count)
					end
					variables_index.put (a_variable_declaration, a_fingerprint)
				end
			end
		end

	collect_namespace_aliases is
			-- Collect any namespace aliases.
		require
			indices_built: indices_built
			namespaces_alias_list_not_void: namespace_alias_list /= Void
		local
			l_precedence_boundary, l_current_precedence, l_precedence, l_uri_code, l_namespace_code, l_index: INTEGER
			l_alias: XM_XSLT_NAMESPACE_ALIAS
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_NAMESPACE_ALIAS]
			l_error: XM_XPATH_ERROR_VALUE
			i: INTEGER
		do
			if namespace_alias_list.count > 0 then
				create namespace_alias_namespace_codes.make (1, namespace_alias_list.count)
				create namespace_alias_uri_codes.make (1, namespace_alias_list.count)
				from
					i := 1
				until
					i > namespace_alias_list.count
				loop
					namespace_alias_namespace_codes.put (-1, i)
					namespace_alias_uri_codes.put (-1, i)
					i := i + 1
				end

				l_current_precedence := -1

				-- Note that we are processing the list in reverse stylesheet order,
				--  that is, highest precedence first (as `build_indices' proceeds in that order).

				from
					l_cursor := namespace_alias_list.new_cursor
					l_cursor.start
				variant
					namespace_alias_list.count + 1 - l_cursor.index
				until
					l_cursor.after
				loop
					l_alias := l_cursor.item
					l_uri_code := l_alias.stylesheet_uri_code
					l_namespace_code := l_alias.result_namespace_code
					l_precedence := l_alias.precedence

					-- Check that there isn't a conflict with another xsl:namespace-alias
					--  at the same precedence

					if l_current_precedence /= l_precedence then
						l_current_precedence := l_precedence
						l_precedence_boundary := l_cursor.index
					end

					from
						l_index := l_precedence_boundary
					variant
						namespace_alias_list.count + 1 - l_index
					until
						l_index > namespace_alias_list.count
					loop
						if l_uri_code = namespace_alias_uri_codes.item (l_index) then
							if uri_code_from_namespace_code (l_namespace_code) /= uri_code_from_namespace_code (namespace_alias_namespace_codes.item (l_index)) then
								create l_error.make_from_string ("Inconsistent namespace aliases", Xpath_errors_uri, "XTSE0810", Static_error)
								l_alias.report_compile_error (l_error)								
							end
						end

						l_index := l_index + 1
					end

					namespace_alias_uri_codes.put (l_uri_code, l_cursor.index)
					namespace_alias_namespace_codes.put (l_namespace_code, l_cursor.index)

					l_cursor.forth
				end
				
			end
			namespace_alias_list := Void -- Now it can be garbage-collected
		ensure
			namespaces_alias_list_void: namespace_alias_list = Void
		end

	copy_top_level_elements (an_included_stylesheet: XM_XSLT_STYLESHEET) is
			-- Copy the top-level elements of the included stylesheet into the top level of `Current'.
			--  Normally we add these elements at the end, in order, but if the precedence
			--  of an element is less than the precedence of the previous element, we promote it.
			-- This implements the requirement in the spec that when xsl:include is used to
			--  include a stylesheet, any xsl:import elements in the included document are moved
			--  up in the including document to after any xsl:import elements in the including document.
		require
			included_stylesheet: an_included_stylesheet /= Void
		local
			a_top_level_list: DS_BILINKED_LIST [XM_XSLT_STYLE_ELEMENT]
			a_cursor: DS_LINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_count: INTEGER
		do
			a_top_level_list := an_included_stylesheet.top_level_elements
			from
				a_cursor := a_top_level_list.new_cursor; a_cursor.start
			variant
				a_top_level_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_style_element := a_cursor.item
				a_count := top_level_elements.count
				if a_count = 0 or else a_style_element.precedence >= top_level_elements.item (a_count).precedence then
					top_level_elements.force_last (a_style_element)
				else
					from
					variant
						a_count
					until
						a_count = 0 or else a_style_element.precedence >= top_level_elements.item (a_count).precedence
					loop
						a_count := a_count - 1
					end
					top_level_elements.force (a_style_element, a_count + 1)
				end
				a_cursor.forth
			end
		end

	save_output_definitions is
			-- Save output definitions in `executable.
		require
			executable_not_void: executable /= Void
		local
			a_set: DS_HASH_SET [INTEGER]
			a_cursor: DS_BILINKED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_fingerprint: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
			a_message: STRING
			a_set_cursor: DS_HASH_SET_CURSOR [INTEGER]
			a_property_set: XM_XSLT_OUTPUT_PROPERTIES
		do
			create a_set.make_default
			from
				a_cursor := top_level_elements.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				any_compile_errors or else a_cursor.before
			loop
				if a_cursor.item.is_output then
					a_fingerprint := a_cursor.item.as_output.output_fingerprint
					if a_fingerprint /= -1 then a_set.force (a_fingerprint) end
				end
				a_cursor.back
			end
			if a_set.is_empty then
				if needs_dynamic_output_properties then
					a_message := "The stylesheet contains xsl:result-document instructions that calculate the output " +
						"format name at run-time, but there are no named xsl:output declarations"
					create an_error.make_from_string (a_message, Xpath_errors_uri, "XTDE1460", Static_error)
					report_compile_error (an_error)
				end
			else
				from a_set_cursor := a_set.new_cursor; a_set_cursor.start until a_set_cursor.after loop
					a_property_set := gathered_output_properties (a_set_cursor.item)
					executable.set_output_properties (a_property_set, a_set_cursor.item)
					a_set_cursor.forth
				end
			end
		end

invariant

	named_templates_index_not_void: named_templates_index /= Void
	variables_index_not_void: variables_index /= Void
	positive_largest_stack_frame: largest_pattern_stack_frame >= 0
	key_manager_not_void: key_manager /= Void
	decimal_format_manager_not_void: decimal_format_manager /= Void
	stylesheet_module_map_not_void: stylesheet_module_map /= Void
	module_list_not_void: module_list /= Void
	function_library_not_void:  function_library /= Void
	executable_not_void: executable /= Void
	valid_input_type_annotations: input_type_annotations <= Preserve_annotations and then input_type_annotations >= 0

end
