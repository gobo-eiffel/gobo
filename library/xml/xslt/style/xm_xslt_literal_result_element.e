indexing

	description:

		"Literal result elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	trace_property (an_expanded_name: STRING): STRING is
			-- Value of trace-property
		do
			if STRING_.same_string (an_expanded_name, Gexslt_name_pseudo_attribute) then
				Result := shared_name_pool.display_name_from_name_code (name_code)
			else
				Result := Precursor (an_expanded_name)
			end
		end
	
	construct_type: INTEGER is
			-- Type of construct being traced
		do
			Result := Literal_result_element
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			an_index, a_name_code, a_uri_code, a_fingerprint: INTEGER
			an_inherit_namespaces_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			create attribute_name_codes.make (number_of_attributes)
			create attribute_values.make (number_of_attributes)
			attribute_values.set_equality_tester (expression_tester)
			create attribute_clean_flags.make (number_of_attributes)
			if number_of_attributes > 0 then
				from
					an_index := 1
				variant
					number_of_attributes + 1 - an_index
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
							create an_error.make_from_string (STRING_.concat ("Unknown XSL attribute ", shared_name_pool.display_name_from_name_code (a_name_code)), Xpath_errors_uri, "XTSE0090", Static_error)
							report_compile_error (an_error)
						end
					else
						attribute_name_codes.put_last (a_name_code)
						generate_attribute_value_template (attribute_value_by_index (an_index), static_context)
						attribute_values.put_last (last_generated_expression)
						attribute_clean_flags.put_last (is_attribute_checked_clean (last_generated_expression))
					end
					an_index := an_index + 1
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_element_uri_code, a_namespace_code: INTEGER
			a_stylesheet: XM_XSLT_STYLESHEET
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]
		do
			result_name_code := name_code
			an_element_uri_code := shared_name_pool.uri_code_from_name_code (result_name_code)
			if is_top_level then
				validate_top_level_element (an_element_uri_code)
			else
				a_stylesheet := principal_stylesheet
				
				-- Build the list of output namespace nodes
				
				if should_namespaces_be_omitted (an_element_uri_code) then
					create namespace_codes.make (0)
				else
					namespace_codes := namespace_codes_in_scope
				end
				apply_namespace_aliases (an_element_uri_code, a_stylesheet)				
				validate_special_attributes
				establish_attribute_names (a_stylesheet)
				remove_excluded_namespaces (a_stylesheet)
				
				create a_namespace_code_list.make (namespace_codes.count - excluded_namespace_count)
				if namespace_codes.count  > 0 then
					from
						a_cursor := namespace_codes.new_cursor
						a_cursor.start
					variant
						namespace_codes.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_namespace_code := a_cursor.item
						if a_namespace_code /= -1 then
							a_namespace_code_list.put_last (a_namespace_code)
						end
						a_cursor.forth
					end
				end
				namespace_code_list := a_namespace_code_list
			end
			validated := True
		end

		validate_children is
			-- Validate the children of this node, recursively.
		do
			if not is_top_level then
				Precursor
			end
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_fixed_element: XM_XSLT_FIXED_ELEMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_fixed_attribute: XM_XSLT_FIXED_ATTRIBUTE
			a_content: XM_XPATH_EXPRESSION
		do
			last_generated_expression := Void
			if not is_top_level then
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				a_content := last_generated_expression
				if attribute_name_codes.count > 0 then

					-- Since we cannot output an attribute once we have seen child content,
					--  we must place the attributes in the content block prior to any existing
					--  content. So we process the attributes back-to-front so they come out
					--  in FIFO order.

					a_stylesheet := principal_stylesheet
					from
						a_cursor := attribute_name_codes.new_cursor
						a_cursor.finish
					variant
						a_cursor.index
					until
						a_cursor.before
					loop
						create a_fixed_attribute.make (an_executable, a_cursor.item, Validation_strip, Void, -1)
						a_fixed_attribute.set_select_expression (attribute_values.item (a_cursor.index))
						check
							module_registered: a_stylesheet.is_module_registered (system_id)
						end
						a_fixed_attribute.set_source_location (a_stylesheet.module_number (system_id), line_number)
						if attribute_clean_flags.item (a_cursor.index) then
							a_fixed_attribute.set_no_special_characters
						end
						if a_content = Void then
							a_content := a_fixed_attribute
						else
							create {XM_XSLT_BLOCK} a_content.make (an_executable, a_fixed_attribute, a_content, principal_stylesheet.module_number (system_id), line_number)
						end
						a_cursor.back
					end
				end
				if a_content = Void then create {XM_XPATH_EMPTY_SEQUENCE} a_content.make end
				create a_fixed_element.make (an_executable, result_name_code, namespace_codes, Void, Void, validation, is_inherit_namespaces, a_content)
				last_generated_expression := a_fixed_element
			end
		end

	constructed_stylesheet (a_compiler: XM_XSLT_STYLESHEET_COMPILER): XM_XPATH_TREE_DOCUMENT is
			-- Simlified stylesheet constructed around `Current'
		require
			stylesheet_compiler_exists: a_compiler /= Void
		local
			an_xslt_prefix, a_version: STRING
		do
			an_xslt_prefix := prefix_for_uri (Xslt_uri)
			if an_xslt_prefix = Void then
				if STRING_.same_string (local_part, "transform")
					or else STRING_.same_string (local_part, "stylesheet") then
					a_compiler.report_error ("Namespace for stylesheet element should be " + Xslt_uri)
				else
					a_compiler.report_error ("The document does not appear to be a stylesheet")
				end
			else

				-- Find mandatory xsl:version attribute, and copy it to the new xsl:transform element

				a_version := attribute_value (Xslt_version_type_code)
				if a_version = Void then
					a_compiler.report_error ("Simplified stylesheet: xsl:version attribute is missing")
				else
					Result := grafted_stylesheet (a_compiler, a_version)
				end
			end
		ensure
			error_or_result_not_void: not a_compiler.load_stylesheet_module_failed implies Result /= Void
		end

feature {NONE} -- Implementation

	-- The next three lists constitute a triple:

	attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes for non-XSLT attributes

	attribute_values:  DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Values for non-XSLT attributes
	
	attribute_clean_flags: DS_ARRAYED_LIST [BOOLEAN]
			-- Flags for non-XSLT attributes indicating whether they are clean for XML output

	result_name_code: INTEGER
			-- Name code for the resulting output (after namespace-aliasing is taken into account)

	namespace_codes: DS_ARRAYED_LIST [INTEGER]

	validation: INTEGER
			-- Validation level

	is_inherit_namespaces: BOOLEAN
		-- Do we inherit namespaces?

	grafted_stylesheet (a_compiler: XM_XSLT_STYLESHEET_COMPILER; a_version: STRING): XM_XPATH_TREE_DOCUMENT is
			-- Simlified stylesheet constructed around `Current'
		require
			stylesheet_compiler_exists: a_compiler /= Void
			version_exists: a_version /= Void
		local
			a_builder: XM_XPATH_TREE_BUILDER
		do
			create a_builder.make (a_compiler.node_factory)
			a_builder.set_system_id (system_id)
			a_builder.open; a_builder.start_document
			a_builder.start_element (Xslt_transform_type_code, Untyped_type_code, 0)
			a_builder.notify_namespace (Xslt_uri_code, 0)
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Version_attribute) then
				shared_name_pool.allocate_name (Null_uri, Null_uri, Version_attribute)
			end
			a_builder.notify_attribute (shared_name_pool.name_code (Null_uri, Null_uri, Version_attribute), Untyped_Atomic_Type_Code, a_version, 0)
			a_builder.start_content

			a_builder.start_element (Xslt_template_type_code, Untyped_type_code, 0)
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Match_attribute) then
				shared_name_pool.allocate_name (Null_uri, Null_uri, Match_attribute)
			end
			a_builder.notify_attribute (shared_name_pool.name_code (Null_uri, Null_uri, Match_attribute), Untyped_Atomic_Type_Code, "/", 0)
			a_builder.start_content

			a_builder.graft_element (Current)

			a_builder.end_element
			a_builder.end_element
			a_builder.end_document; a_builder.close
			if a_builder.has_error then
				a_compiler.report_error (a_builder.last_error)
			else	
				Result := a_builder.tree_document
			end
		ensure
			error_or_result_not_void: not a_compiler.load_stylesheet_module_failed implies Result /= Void
		rescue
			if a_builder.has_error then
				a_compiler.report_error (a_builder.last_error)
			end
		end

	is_attribute_checked_clean (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression' guarenteed free of special characters?
		require
			expression_not_void: an_expression /= Void
		local
			a_string: STRING
			an_index, a_character_code: INTEGER
		do

			-- If we can be sure the attribute value contains no special XML/HTML characters,
			--  we can save the trouble of checking it each time it is output.
			-- Note that the check includes characters that need to be escaped in a URL if the
			--  output method turns out to be HTML (we don't know the method at compile time).

			if last_generated_expression.is_string_value then
				a_string := last_generated_expression.as_string_value.string_value
				Result := True
				from
					an_index := 1
				variant
					a_string.count + 1 - an_index
				until
					Result = False or else an_index > a_string.count
				loop
					a_character_code := a_string.item_code (an_index)
					if a_character_code < 33 or else a_character_code > 126
						or else a_character_code = ('>').code
						or else a_character_code = ('<').code
						or else a_character_code = ('&').code
						or else a_character_code = ('%"').code then
						Result := False
					end
					an_index := an_index + 1
				end
			end
		end

	validate_top_level_element (an_element_uri_code: INTEGER) is
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

	should_namespaces_be_omitted (an_element_uri_code: INTEGER): BOOLEAN is
			-- Should namespaces be omitted on output?
		require
			not_top_level: not is_top_level
			positive_uri_code: an_element_uri_code >= 0
		local
			a_literal_result_element: XM_XSLT_LITERAL_RESULT_ELEMENT
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do

			-- If this LRE has a parent that is also an LRE,
			--  and if this LRE has no namespace declarations
			--  and if this element name is in the same namespace as its parent,
			--  and if there are no attributes in a non-null namespace,
			--  then we don't need to output any namespace declarations to the result.

			a_literal_result_element ?= parent
			if a_literal_result_element /= Void and then
				namespace_code_list.count = 0 and then
				an_element_uri_code = shared_name_pool.uri_code_from_name_code (parent.fingerprint) then
				Result := True
			end

			if Result then
				from
					a_cursor := attribute_collection.name_code_cursor
					a_cursor.start
				variant
					attribute_collection.number_of_attributes + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if shared_name_pool.prefix_from_name_code (a_cursor.item).count > 0 then
						Result := False
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
			end
		end

	apply_namespace_aliases (an_element_uri_code: INTEGER; a_stylesheet: XM_XSLT_STYLESHEET) is
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
				from
					a_cursor := namespace_codes.new_cursor
					a_cursor.start
				variant
					namespace_codes.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_source_uri_code := uri_code_from_namespace_code (a_cursor.item)
					a_namespace_alias_code := a_stylesheet.namespace_alias (a_source_uri_code)
					if a_namespace_alias_code /= -1 and then uri_code_from_namespace_code (a_namespace_alias_code) /= a_source_uri_code then
						a_cursor.replace (a_namespace_alias_code)
					end
					a_cursor.forth
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

	validate_special_attributes is
			-- Validate special attributes.
		local
			a_use_attribute_sets_attribute, a_type_attribute, a_validation_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_use_attribute_sets_attribute := attribute_value (Xslt_use_attribute_sets_type_code)
			if a_use_attribute_sets_attribute /= Void then
				todo ("validate_special_attributes", True)
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
				validation := containing_stylesheet.default_validation
			end
		end

	establish_attribute_names (a_stylesheet: XM_XSLT_STYLESHEET) is
			-- Establish the names to be used for all the output attributes.
			-- Also type-check the AVT expressions
		require
			stylesheet_not_void: a_stylesheet /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			an_alias, a_uri_code, another_uri_code, a_namespace_code: INTEGER
			an_xml_prefix, a_local_name: STRING
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := attribute_name_codes.new_cursor
				a_cursor.start
			variant
				attribute_name_codes.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_alias := a_cursor.item
				a_uri_code := shared_name_pool.uri_code_from_name_code (an_alias)
				if a_uri_code /= 0 then -- attribute has a namespace prefix
					a_namespace_code := a_stylesheet.namespace_alias (a_uri_code)
					another_uri_code := uri_code_from_namespace_code (a_namespace_code)
					if a_namespace_code /= -1 and then another_uri_code /= a_uri_code then
						a_uri_code := another_uri_code
						an_xml_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_code)
						a_local_name := shared_name_pool.local_name_from_name_code (a_cursor.item)
						if shared_name_pool.is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name) then
							an_alias := shared_name_pool.name_code (an_xml_prefix, shared_name_pool.uri_from_uri_code (a_uri_code), a_local_name)
						else
							shared_name_pool.allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
							an_alias := shared_name_pool.last_name_code
						end
					end
				end
				--translate (an_alias)
				--a_cursor.replace (last_translated_name_code)
				an_expression := attribute_values.item (a_cursor.index)
				type_check_expression (shared_name_pool.display_name_from_name_code (an_alias), an_expression)
				if an_expression.was_expression_replaced then
					attribute_values.replace (an_expression.replacement_expression, a_cursor.index)
				end
				a_cursor.forth
			end
		end

	excluded_namespace_count: INTEGER
			-- Number of namespaces excluded

	remove_excluded_namespaces (a_stylesheet: XM_XSLT_STYLESHEET) is
			-- Remove any namespace that is on the exclude-result-prefixes list,
			--  unless it is the namespace of the element or an attribute.
		require
			no_namespaces_excluded_yet: excluded_namespace_count = 0
			stylesheet_not_void: a_stylesheet /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_uri_code: INTEGER
		do
			from
				a_cursor := namespace_codes.new_cursor
				a_cursor.start
			variant
				namespace_codes.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_uri_code := uri_code_from_namespace_code (a_cursor.item)
				if is_excluded_namespace (a_uri_code) and then
					not a_stylesheet.is_alias_result_namespace (a_uri_code) then

					-- Exclude it from the output namespace list.

					namespace_codes.replace (-1, a_cursor.index)
					excluded_namespace_count := excluded_namespace_count + 1
				end
				a_cursor.forth
			end
		end

	-- TODO transform_to_stylesheet is
	-- Implement "Literal Result Element As Stylesheet" facility.

invariant

	attribute_lists_not_void: attributes_prepared implies attribute_name_codes /= Void and attribute_values /= Void and attribute_clean_flags /= Void
	attribute_lists_consistent_length: attributes_prepared implies attribute_name_codes.count = attribute_values.count and attribute_values.count = attribute_clean_flags.count
	positive_excluded_namespace_count: excluded_namespace_count >= 0

end
