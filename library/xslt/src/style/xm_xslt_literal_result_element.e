note

	description:

		"Literal result elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_LITERAL_RESULT_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, validate_children, may_contain_sequence_constructor, trace_property, construct_type, make_style_element
		end

	XM_XSLT_TRACE_CONSTANTS

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			is_instruction := True
			is_inherit_namespaces := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	is_inherit_namespaces: BOOLEAN
		-- Do we inherit namespaces?

	trace_property (an_expanded_name: STRING): STRING
			-- Value of trace-property
		do
			if STRING_.same_string (an_expanded_name, Gexslt_name_pseudo_attribute) then
				Result := shared_name_pool.display_name_from_name_code (name_code)
			else
				Result := Precursor (an_expanded_name)
			end
		end

	construct_type: INTEGER
			-- Type of construct being traced
		do
			Result := Literal_result_element
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			an_index, a_name_code, a_uri_code, a_fingerprint: INTEGER
			an_inherit_namespaces_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
			l_attribute_values: like attribute_values
			l_attribute_name_codes: like attribute_name_codes
			l_attribute_clean_flags: like attribute_clean_flags
		do
			create l_attribute_name_codes.make (number_of_attributes)
			attribute_name_codes := l_attribute_name_codes
			create l_attribute_values.make (number_of_attributes)
			l_attribute_values.set_equality_tester (expression_tester)
			attribute_values := l_attribute_values
			create l_attribute_clean_flags.make (number_of_attributes)
			attribute_clean_flags := l_attribute_clean_flags
			if number_of_attributes > 0 then
				from
					an_index := 1
				until
					any_compile_errors or else an_index > number_of_attributes
				loop
					a_name_code := attribute_name_code (an_index)
					a_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
					if a_uri_code = Xslt_uri_code then
						a_fingerprint := shared_name_pool.fingerprint_from_name_code (a_name_code)
						if a_fingerprint = Xslt_use_attribute_sets_type_code then -- deal with this later
						elseif a_fingerprint = Xslt_use_when_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_extension_element_prefixes_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_exclude_result_prefixes_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_version_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_xpath_default_namespace_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_default_collation_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_type_type_code then -- deal with this later
						elseif a_fingerprint = Xslt_validation_type_code then -- deal with this later
						elseif a_fingerprint = Xslt_inherit_namespaces_type_code then
							an_inherit_namespaces_attribute := attribute_value_by_index (an_index)
							STRING_.left_adjust (an_inherit_namespaces_attribute)
							STRING_.right_adjust (an_inherit_namespaces_attribute)
							if STRING_.same_string (an_inherit_namespaces_attribute, "no") then
								is_inherit_namespaces := False
							elseif STRING_.same_string (an_inherit_namespaces_attribute, "yes") then
								is_inherit_namespaces := True
							else
								create an_error.make_from_string ("Value of xsl:inherit-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
								report_compile_error (an_error)
							end
						else
							create an_error.make_from_string (STRING_.concat ("Unknown XSL attribute ", shared_name_pool.display_name_from_name_code (a_name_code)), Xpath_errors_uri, "XTSE0805", Static_error)
							report_compile_error (an_error)
						end
					else
						l_attribute_name_codes.put_last (a_name_code)
						check precondition_static_context_not_void: attached static_context as l_static_context then
							generate_attribute_value_template (attribute_value_by_index (an_index), l_static_context)
						end
						check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_last_generated_expression then
							l_attribute_values.put_last (l_last_generated_expression)
							l_attribute_clean_flags.put_last (is_attribute_checked_clean (l_last_generated_expression))
						end
					end
					an_index := an_index + 1
				variant
					number_of_attributes + 1 - an_index
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_element_uri_code: INTEGER
			l_stylesheet: XM_XSLT_STYLESHEET
		do
			result_name_code := name_code
			l_element_uri_code := shared_name_pool.uri_code_from_name_code (result_name_code)
			if is_top_level then
				validate_top_level_element (l_element_uri_code)
			else
				check attached principal_stylesheet as l_principal_stylesheet then
					l_stylesheet := l_principal_stylesheet
				end

				-- Build the list of output namespace nodes

				if should_namespaces_be_omitted (l_element_uri_code) then
					create namespace_codes.make (0)
				else
					namespace_codes := namespace_codes_in_scope
				end
				apply_namespace_aliases (l_element_uri_code, l_stylesheet)
				validate_special_attributes
				establish_attribute_names (l_stylesheet)
				remove_excluded_namespaces (l_stylesheet)
				check attached namespace_codes as l_namespace_codes then
					l_namespace_codes.delete (-1)
				end
			end
			validated := True
		end

		validate_children
			-- Validate the children of this node, recursively.
		do
			if not is_top_level then
				Precursor
			end
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_fixed_element: XM_XSLT_FIXED_ELEMENT
			l_stylesheet: XM_XSLT_STYLESHEET
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_fixed_attribute: XM_XSLT_FIXED_ATTRIBUTE
			l_content: detachable XM_XPATH_EXPRESSION
			l_attributes_usage: XM_XSLT_ATTRIBUTE_USAGE
		do
			last_generated_expression := Void
			if not is_top_level then
				compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
				l_content := last_generated_expression
				check attached attribute_name_codes as l_attribute_name_codes then
					if l_attribute_name_codes.count > 0 then

						-- Since we cannot output an attribute once we have seen child content,
						--  we must place the attributes in the content block prior to any existing
						--  content. So we process the attributes back-to-front so they come out
						--  in FIFO order.

						check attached principal_stylesheet as l_principal_stylesheet then
							l_stylesheet := l_principal_stylesheet
						end
						from
							l_cursor := l_attribute_name_codes.new_cursor
							l_cursor.finish
						until
							l_cursor.before
						loop
							create l_fixed_attribute.make (a_executable, l_cursor.item, Validation_strip, Void, -1)
							check attached attribute_values as l_attribute_values then
								l_fixed_attribute.set_select_expression (l_attribute_values.item (l_cursor.index))
							end
							check
								module_registered: l_stylesheet.is_module_registered (system_id)
							end
							l_fixed_attribute.set_source_location (l_stylesheet.module_number (system_id), line_number)
							check attached attribute_clean_flags as l_attribute_clean_flags then
								if l_attribute_clean_flags.item (l_cursor.index) then
									l_fixed_attribute.set_no_special_characters
								end
							end
							if l_content = Void then
								l_content := l_fixed_attribute
							else
								check attached principal_stylesheet as l_principal_stylesheet then
									create {XM_XSLT_BLOCK} l_content.make (a_executable, l_fixed_attribute, l_content, l_principal_stylesheet.module_number (system_id), line_number)
								end
							end
							l_cursor.back
						variant
							l_cursor.index
						end
					end
				end
				check attached used_attribute_sets as l_used_attribute_sets then
					if not l_used_attribute_sets.is_empty then
						create l_attributes_usage.make (a_executable, l_used_attribute_sets)
						if l_content = Void then
							l_content := l_attributes_usage
						else
							check attached principal_stylesheet as l_principal_stylesheet then
								create {XM_XSLT_BLOCK} l_content.make (a_executable, l_attributes_usage, l_content, l_principal_stylesheet.module_number (system_id), line_number)
							end
						end
					end
				end
				if l_content = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
				end
				check attached namespace_codes as l_namespace_codes then
					create l_fixed_element.make (a_executable, result_name_code, l_namespace_codes, Void, Void, validation, is_inherit_namespaces, l_content)
				end
				l_fixed_element.set_base_uri (base_uri)
				last_generated_expression := l_fixed_element
			end
		end

	constructed_stylesheet (a_compiler: XM_XSLT_STYLESHEET_COMPILER): detachable XM_XPATH_TREE_DOCUMENT
			-- Simlified stylesheet constructed around `Current'
		require
			stylesheet_compiler_not_void: a_compiler /= Void
		local
			an_xslt_prefix, a_version: detachable STRING
		do
			an_xslt_prefix := prefix_for_uri (Xslt_uri)
			if an_xslt_prefix = Void then
				if STRING_.same_string (local_part, "transform")
					or else STRING_.same_string (local_part, "stylesheet") then
					a_compiler.report_fatal_error ("Namespace for stylesheet element should be " + Xslt_uri, "XTSE0165")
				else
					a_compiler.report_fatal_error ("The document does not appear to be a stylesheet", "XTSE0165")
				end
			else

				-- Find mandatory xsl:version attribute, and copy it to the new xsl:transform element

				a_version := attribute_value (Xslt_version_type_code)
				if a_version = Void then
					a_compiler.report_fatal_error ("Simplified stylesheet: xsl:version attribute is missing", "XTSE0150")
				else
					Result := grafted_stylesheet (a_compiler, a_version)
				end
			end
		ensure
			error_or_result_not_void: not a_compiler.load_stylesheet_module_failed implies Result /= Void
		end

feature {NONE} -- Implementation

	-- The next three lists constitute a triple:

	attribute_name_codes: detachable DS_ARRAYED_LIST [INTEGER]
			-- Name codes for non-XSLT attributes

	attribute_values:  detachable DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Values for non-XSLT attributes

	attribute_clean_flags: detachable DS_ARRAYED_LIST [BOOLEAN]
			-- Flags for non-XSLT attributes indicating whether they are clean for XML output

	result_name_code: INTEGER
			-- Name code for the resulting output (after namespace-aliasing is taken into account)

	namespace_codes: detachable DS_ARRAYED_LIST [INTEGER]

	validation: INTEGER
			-- Validation level

	grafted_stylesheet (a_compiler: XM_XSLT_STYLESHEET_COMPILER; a_version: STRING): detachable XM_XPATH_TREE_DOCUMENT
			-- Simlified stylesheet constructed around `Current'
		require
			stylesheet_compiler_not_void: a_compiler /= Void
			version_not_void: a_version /= Void
		local
			l_builder: detachable XM_XPATH_TREE_BUILDER
			l_uri: UT_URI
		do
			create l_uri.make (system_id)
			create l_builder.make (a_compiler.node_factory, system_id, l_uri)
			l_builder.open
			l_builder.start_document
			l_builder.start_element (Xslt_transform_type_code, Untyped_type_code, 0)
			l_builder.notify_namespace (Xslt_uri_code, 0)
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Version_attribute) then
				shared_name_pool.allocate_name (Null_uri, Null_uri, Version_attribute)
			end
			l_builder.notify_attribute (shared_name_pool.name_code (Null_uri, Null_uri, Version_attribute), Untyped_atomic_type_code, a_version, 0)
			l_builder.start_content

			l_builder.start_element (Xslt_template_type_code, Untyped_type_code, 0)
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Match_attribute) then
				shared_name_pool.allocate_name (Null_uri, Null_uri, Match_attribute)
			end
			l_builder.notify_attribute (shared_name_pool.name_code (Null_uri, Null_uri, Match_attribute), Untyped_atomic_type_code, "/", 0)
			l_builder.start_content

			l_builder.graft_element (Current)

			l_builder.end_element
			l_builder.end_element
			l_builder.end_document
			l_builder.close
			if attached l_builder.last_error as l_last_error then
				check has_error: l_builder.has_error end
				a_compiler.report_error (l_last_error)
			else
				Result := l_builder.tree_document
			end
		ensure
			error_or_result_not_void: not a_compiler.load_stylesheet_module_failed implies Result /= Void
		rescue
			if l_builder /= Void and then attached l_builder.last_error as l_last_error then
				check has_error: l_builder.has_error end
				a_compiler.report_error (l_last_error)
			end
		end

	is_attribute_checked_clean (an_expression: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `an_expression' guarenteed free of special characters?
		require
			expression_not_void: an_expression /= Void
		local
			a_string: STRING
			an_index: INTEGER
			a_character_code: NATURAL_32
		do

			-- If we can be sure the attribute value contains no special XML/HTML characters,
			--  we can save the trouble of checking it each time it is output.
			-- Note that the check includes characters that need to be escaped in a URL if the
			--  output method turns out to be HTML (we don't know the method at compile time).

			check attached last_generated_expression as l_last_generated_expression then
				if l_last_generated_expression.is_string_value then
					a_string := l_last_generated_expression.as_string_value.string_value
					Result := True
					from
						an_index := 1
					until
						Result = False or else an_index > a_string.count
					loop
						a_character_code := a_string.code (an_index)
						if a_character_code < 33 or else a_character_code > 126
							or else a_character_code = ('>').natural_32_code
							or else a_character_code = ('<').natural_32_code
							or else a_character_code = ('&').natural_32_code
							or else a_character_code = ('%"').natural_32_code then
							Result := False
						end
						an_index := an_index + 1
					variant
						a_string.count + 1 - an_index
					end
				end
			end
		end

	validate_top_level_element (an_element_uri_code: INTEGER)
			-- Validate a top-level LRE.
		require
			top_level_element: is_top_level
		local
			an_error: XM_XPATH_ERROR_VALUE
		do

			-- A top-level element can never be a "real" literal result element,
			-- but this class gets used for unknown elements found at the top level

			if an_element_uri_code = 0 then
				create an_error.make_from_string ("Top level elements must have a non-null namespace URI", Xpath_errors_uri, "XTSE0130", Static_error)
				report_compile_error (an_error)
			end
		end

	should_namespaces_be_omitted (an_element_uri_code: INTEGER): BOOLEAN
			-- Should namespaces be omitted on output?
		require
			not_top_level: not is_top_level
			positive_uri_code: an_element_uri_code >= 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do

			-- If this LRE has a parent that is also an LRE,
			--  and if this LRE has no namespace declarations
			--  and if the parent doesn't specify inherit-namespaces="no",
			--  and if this element name is in the same namespace as its parent,
			--  and if there are no attributes in a non-null namespace,
			--  then we don't need to output any namespace declarations to the result.

			check attached namespace_code_list as l_namespace_code_list then
				if (attached {XM_XSLT_LITERAL_RESULT_ELEMENT} parent as a_literal_result_element and then a_literal_result_element.is_inherit_namespaces) and then
					l_namespace_code_list.count = 0 and then
					an_element_uri_code = shared_name_pool.uri_code_from_name_code (a_literal_result_element.fingerprint) then
					Result := True
				end
			end

			if Result then
				check attached attribute_collection as l_attribute_collection then
					from
						a_cursor := l_attribute_collection.name_code_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						check attached shared_name_pool.prefix_from_name_code (a_cursor.item) as l_prefix_from_name_code then
							if l_prefix_from_name_code.count > 0 then
								Result := False
								a_cursor.go_after
							else
								a_cursor.forth
							end
						end
					variant
						l_attribute_collection.number_of_attributes + 1 - a_cursor.index
					end
				end
			end
		end

	apply_namespace_aliases (an_element_uri_code: INTEGER; a_stylesheet: XM_XSLT_STYLESHEET)
			-- Apply any aliases required to create the list of output namespaces.
		require
			not_top_level: not is_top_level
			positive_uri_code: an_element_uri_code >= 0
			stylesheet_not_void: a_stylesheet /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_source_uri_code, a_namespace_alias_code: INTEGER
			an_xml_prefix: STRING
			a_uri_code: INTEGER
		do
			if a_stylesheet.has_namespace_aliases then
				check attached namespace_codes as l_namespace_codes then
					from
						a_cursor := l_namespace_codes.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						a_source_uri_code := uri_code_from_namespace_code (a_cursor.item)
						a_namespace_alias_code := a_stylesheet.namespace_alias (a_source_uri_code)
						if a_namespace_alias_code /= -1 and then uri_code_from_namespace_code (a_namespace_alias_code) /= a_source_uri_code then
							a_cursor.replace (a_namespace_alias_code)
						end
						a_cursor.forth
					variant
						l_namespace_codes.count + 1 - a_cursor.index
					end
				end

				-- Determine if there is an alias for the namespace of the element name.

				a_namespace_alias_code := a_stylesheet.namespace_alias (an_element_uri_code)
				if a_namespace_alias_code /= -1 then
					a_uri_code := uri_code_from_namespace_code (a_namespace_alias_code)
					an_xml_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_alias_code)
					if a_uri_code /= an_element_uri_code then
						if shared_name_pool.is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, local_part) then
							result_name_code := shared_name_pool.name_code (an_xml_prefix, shared_name_pool.uri_from_uri_code (a_uri_code), local_part)
						else
							shared_name_pool.allocate_name_using_uri_code (an_xml_prefix, a_uri_code, local_part)
							result_name_code := shared_name_pool.last_name_code
						end
					end
				end
			end
		end

	validate_special_attributes
			-- Validate special attributes.
		local
			a_use_attribute_sets_attribute, a_type_attribute, a_validation_attribute: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_use_attribute_sets_attribute := attribute_value (Xslt_use_attribute_sets_type_code)
			if a_use_attribute_sets_attribute /= Void then
				accumulate_attribute_sets (a_use_attribute_sets_attribute, Void)
			else
				create used_attribute_sets.make (0)
			end
			a_type_attribute := attribute_value (Xslt_type_type_code)
			if a_type_attribute /= Void then
				create an_error.make_from_string ("The type attribute is available only with a schema-aware XSLT processor", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
			end
			a_validation_attribute := attribute_value (Xslt_validation_type_code)
			if a_validation_attribute /= Void then
				validation := validation_code (a_validation_attribute)
				if validation /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
					report_compile_error (an_error)
				end
			else
				check attached containing_stylesheet as l_containing_stylesheet then
					validation := l_containing_stylesheet.default_validation
				end
			end
		end

	establish_attribute_names (a_stylesheet: XM_XSLT_STYLESHEET)
			-- Establish the names to be used for all the output attributes.
			-- Also type-check the AVT expressions
		require
			stylesheet_not_void: a_stylesheet /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_alias, l_uri_code, l_other_uri_code, l_namespace_code: INTEGER
			l_xml_prefix, l_local_name: STRING
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check
				attached attribute_name_codes as l_attribute_name_codes
				attached attribute_values as l_attribute_values
			then
				from
					l_cursor := l_attribute_name_codes.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_alias := l_cursor.item
					l_uri_code := shared_name_pool.uri_code_from_name_code (l_alias)
					if l_uri_code /= 0 then -- attribute has a namespace prefix
						l_namespace_code := -1
						if a_stylesheet.has_namespace_aliases then
							l_namespace_code := a_stylesheet.namespace_alias (l_uri_code)
						end
						l_other_uri_code := uri_code_from_namespace_code (l_namespace_code)
						if l_namespace_code /= -1 and then l_other_uri_code /= l_uri_code then
							l_uri_code := l_other_uri_code
							l_xml_prefix := shared_name_pool.prefix_from_namespace_code (l_namespace_code)
							l_local_name := shared_name_pool.local_name_from_name_code (l_cursor.item)
							if shared_name_pool.is_name_code_allocated_using_uri_code (l_xml_prefix, l_uri_code, l_local_name) then
								l_alias := shared_name_pool.name_code (l_xml_prefix, shared_name_pool.uri_from_uri_code (l_uri_code), l_local_name)
							else
								shared_name_pool.allocate_name_using_uri_code (l_xml_prefix, l_uri_code, l_local_name)
								l_alias := shared_name_pool.last_name_code
							end
						end
					end
					l_cursor.replace (l_alias)
					l_expression := l_attribute_values.item (l_cursor.index)
					create l_replacement.make (Void)
					type_check_expression (l_replacement, shared_name_pool.display_name_from_name_code (l_alias), l_expression)
					if l_expression /= l_replacement.item then
						check attached l_replacement.item as l_replacement_item then
							l_attribute_values.replace (l_replacement_item, l_cursor.index)
						end
					end
					l_cursor.forth
				variant
					l_attribute_name_codes.count + 1 - l_cursor.index
				end
			end
		end

	excluded_namespace_count: INTEGER
			-- Number of namespaces excluded

	remove_excluded_namespaces (a_stylesheet: XM_XSLT_STYLESHEET)
			-- Remove any namespace that is on the exclude-result-prefixes list,
			--  unless it is the namespace of the element or an attribute.
		require
			no_namespaces_excluded_yet: excluded_namespace_count = 0
			stylesheet_not_void: a_stylesheet /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_uri_code: INTEGER
		do
			check attached namespace_codes as l_namespace_codes then
				from
					l_cursor := l_namespace_codes.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_uri_code := uri_code_from_namespace_code (l_cursor.item)
					if is_excluded_namespace (l_uri_code) and then
						not a_stylesheet.is_alias_result_namespace (l_uri_code) then

						-- Exclude it from the output namespace list.

						l_namespace_codes.replace (-1, l_cursor.index)
						excluded_namespace_count := excluded_namespace_count + 1
					end
					l_cursor.forth
				variant
					l_namespace_codes.count + 1 - l_cursor.index
				end
			end
		end

invariant

	attribute_lists_not_void: attributes_prepared implies attribute_name_codes /= Void and attribute_values /= Void and attribute_clean_flags /= Void
	attribute_lists_consistent_length: attributes_prepared implies (attached attribute_name_codes as l_attribute_name_codes and attached attribute_values as l_attribute_values and attached attribute_clean_flags as l_attribute_clean_flags) and then (l_attribute_name_codes.count = l_attribute_values.count and l_attribute_values.count = l_attribute_clean_flags.count)
	positive_excluded_namespace_count: excluded_namespace_count >= 0

end
