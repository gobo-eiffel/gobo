note

	description:

		"xsl:result-document element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RESULT_DOCUMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, make_style_element, may_contain_sequence_constructor
		end

	XM_XSLT_OUTPUT_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			is_instruction := True
			validation_action := Validation_strip
			create formatting_attributes.make_with_equality_testers (Formatting_attributes_count, expression_tester, Void)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	http_method: detachable STRING
			-- Value of gexslt:method extension attribute;
			-- Intended principally for http protocol, but value is unchecked here.

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_format_attribute, an_href_attribute: detachable STRING
			a_validation_attribute, a_type_attribute, a_value, a_message: detachable STRING
			an_expression: XM_XPATH_EXPRESSION
			an_error: XM_XPATH_ERROR_VALUE
			l_use_character_maps: like use_character_maps
			l_http_method: like http_method
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Format_attribute) then
						a_format_attribute := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (a_format_attribute); STRING_.right_adjust (a_format_attribute)
					elseif STRING_.same_string (an_expanded_name, Href_attribute) then
						an_href_attribute := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (an_href_attribute); STRING_.right_adjust (an_href_attribute)
					elseif STRING_.same_string (an_expanded_name, Use_character_maps_attribute) then
						l_use_character_maps := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_use_character_maps)
						STRING_.right_adjust (l_use_character_maps)
						use_character_maps := l_use_character_maps
					elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
						a_validation_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Type_attribute) then
						a_type_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Gexslt_method_attribute) then
						l_http_method := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_http_method)
						STRING_.right_adjust (l_http_method)
						http_method := l_http_method
					elseif formatting_attribute_names.has (an_expanded_name) or else
						(an_expanded_name.substring_index ("#", 1) /= 0
						and then an_expanded_name.substring_index (Gexslt_eiffel_type_uri, 1) /= 1
							and then an_expanded_name.substring_index (Xslt_uri, 1) /= 1 ) then

						-- it's a (plausible) serialization parameter

						a_value := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_value); STRING_.right_adjust (a_value)
						check attached static_context as l_static_context then
							generate_attribute_value_template (a_value, l_static_context)
						end
						check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_last_generated_expression then
							an_expression := l_last_generated_expression
						end
						formatting_attributes.force (an_expression, fingerprint_from_name_code (a_name_code))
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if an_href_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (an_href_attribute, l_static_context)
				end
				href := last_generated_expression
			end
			if a_format_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_format_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_last_generated_expression then
					if l_last_generated_expression.is_string_value then
						if is_qname (a_format_attribute) then
							generate_name_code (a_format_attribute)
							output_fingerprint := fingerprint_from_name_code (last_generated_name_code)
						else
							output_fingerprint := -1
						end
						if output_fingerprint = -1 then
							a_message := STRING_.concat ("XTDE1460: xsl:result-document format='", a_format_attribute)
							a_message := STRING_.appended_string (a_message, "' does not specify a valid QName")
							create an_error.make_from_string (a_message, Xpath_errors_uri, "XTDE1460", Static_error)
							report_compile_error (an_error)
						end
					else
						format_expression := last_generated_expression
					end
				end
			else
				output_fingerprint := -1
			end
			if a_validation_attribute /= Void then
				validation_action := validation_code (a_validation_attribute)
				if validation_action /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
				elseif validation_action = Validation_invalid then
					create an_error.make_from_string ("Invalid value of validation attribute", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end

			if a_type_attribute /= Void then
				create an_error.make_from_string ("The type attribute is available only with a schema-aware XSLT processor", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
			end

			if a_type_attribute /= Void and then a_validation_attribute /= Void then
				create an_error.make_from_string ("The validation and type attributes are mutually exclusive", Xpath_errors_uri, "XTSE1505", Static_error)
				report_compile_error (an_error)
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			l_fingerprint: INTEGER
			l_attribute_name: STRING
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			create l_replacement.make (Void)
			if attached href as l_href then
				type_check_expression (l_replacement, "href", l_href)
				href := l_replacement.item
			end
			if attached format_expression as l_format_expression then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "format", l_format_expression)
				format_expression := l_replacement.item
			end
			from
				l_cursor := formatting_attributes.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_fingerprint := l_cursor.key
				l_attribute_name := shared_name_pool.display_name_from_name_code (l_fingerprint)
				l_expression := l_cursor.item
				l_replacement.put (Void)
				type_check_expression (l_replacement, l_attribute_name, l_expression)
				check attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
					end
				end
				l_cursor.forth
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_global_property_set: detachable XM_XSLT_OUTPUT_PROPERTIES
			l_local_property_set: XM_XSLT_OUTPUT_PROPERTIES
			l_stylesheet: XM_XSLT_STYLESHEET
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			l_content: detachable XM_XPATH_EXPRESSION
			l_result: XM_XSLT_COMPILED_RESULT_DOCUMENT
		do
			last_generated_expression := Void
			check attached principal_stylesheet as l_principal_stylesheet then
				l_stylesheet := l_principal_stylesheet
			end
			if format_expression /= Void then
				create l_global_property_set.make (Platform.Minimum_integer)
				l_stylesheet.set_needs_dynamic_output_properties
			elseif output_fingerprint = -1 or l_stylesheet.is_named_output_property_defined (output_fingerprint) then
				l_global_property_set := l_stylesheet.gathered_output_properties (output_fingerprint)
				if l_global_property_set.is_error then
					check attached l_global_property_set.duplicate_attribute_name as l_duplicate_attribute_name then
						l_message := STRING_.concat ("Two xsl:output statements specify conflicting values for attribute '", l_duplicate_attribute_name)
					end
					l_message := STRING_.appended_string (l_message, "', in the output definition named '")
					l_message := STRING_.appended_string (l_message, shared_name_pool.display_name_from_name_code (output_fingerprint))
					l_message := STRING_.appended_string (l_message, "'.")
					create l_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1560", Static_error)
					report_compile_error (l_error)
				end
			else
				l_message := STRING_.concat ("Output definition named '", shared_name_pool.display_name_from_name_code (output_fingerprint))
				l_message := STRING_.appended_string (l_message, "' by the format attribute of xsl:result-document has not been defined.")
				create l_error.make_from_string (l_message, Xpath_errors_uri, "XTDE1460", Static_error)
				report_compile_error (l_error)
			end

			if not any_compile_errors then
				-- TODO: we can optimize by determining method now, in some cases
				create l_local_property_set.make (Platform.Minimum_integer)
				build_local_properties (l_local_property_set)
				if not any_compile_errors then
					check attached static_context as l_static_context then
						l_namespace_resolver := l_static_context.namespace_resolver
					end
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					l_content := last_generated_expression
					if l_content = Void then
						create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
					end
					check
						l_global_property_set /= Void
						attached base_uri as l_base_uri
					then
						create l_result.make (an_executable, l_global_property_set, l_local_property_set, href,
							format_expression, l_base_uri, validation_action,
							Void, formatting_attributes, l_namespace_resolver, l_content)
					end
					if http_method /= Void then
						l_result.set_http_method (http_method)
					end
					last_generated_expression := l_result
				end
			end
		end

	build_local_properties (a_local_property_set: XM_XSLT_OUTPUT_PROPERTIES)
			-- Add properties defined on `Current'.
		require
			local_properties_not_void: a_local_property_set /= Void
		local
			a_fingerprint_list: DS_ARRAYED_LIST [INTEGER]
			l_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			another_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_fingerprint: INTEGER
			an_expression: XM_XPATH_EXPRESSION
			a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			a_local_name: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			create a_fingerprint_list.make (formatting_attributes.count)
			check attached static_context as l_static_context then
				a_namespace_resolver := l_static_context.namespace_resolver
			end
			from
				l_cursor := formatting_attributes.new_cursor; l_cursor.start
			until
				l_cursor.after
			loop
				a_fingerprint := l_cursor.key
				an_expression := l_cursor.item
				if an_expression.is_string_value then
					a_local_property_set.set_property (a_fingerprint, an_expression.as_string_value.string_value, a_namespace_resolver)
					if attached a_local_property_set.error_message as l_error_message then
						check is_error: a_local_property_set.is_error end
						l_cursor.go_after
						create an_error.make_from_string (l_error_message, Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (an_error)
					else
						a_fingerprint_list.put_last (a_fingerprint)
					end
				else
					a_local_name := shared_name_pool.local_name_from_name_code (a_fingerprint)
					if STRING_.same_string (a_local_name, Method_attribute) or else
						STRING_.same_string (a_local_name, Cdata_section_elements_attribute) then
					end
				end
				if not l_cursor.after then l_cursor.forth end
			end
			from
				another_cursor := a_fingerprint_list.new_cursor; another_cursor.start
			until
				another_cursor.after
			loop
				a_fingerprint := another_cursor.item
				formatting_attributes.remove (a_fingerprint)
				another_cursor.forth
			variant
				a_fingerprint_list.count + 1 - another_cursor.index
			end
			if use_character_maps /= Void and then not a_local_property_set.is_error then
				gather_used_character_maps_property (a_local_property_set, precedence)
			end
		end

feature {NONE} -- Implementation

	Formatting_attributes_count: INTEGER = 17
			-- Number of formatting attributes

	output_fingerprint: INTEGER
			-- Fingerprint of name of output definition

	href: detachable XM_XPATH_EXPRESSION
			-- URI of output destination

	format_expression: detachable XM_XPATH_EXPRESSION
			-- Format attribute, when supplied as an AVT

	validation_action: INTEGER
			-- Validation action

	formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- Overrides of xsl:output attributes

	formatting_attribute_names: DS_HASH_SET [STRING]
			-- Names of formatting attributes permitted as AVTs;
			-- `Use_character_maps_attribute' is also permitted, but not as an AVT.
		once
			create Result.make (Formatting_attributes_count)
			Result.set_equality_tester (string_equality_tester)
			Result.put (Method_attribute)
			Result.put (Output_version_attribute)
			Result.put (Indent_attribute)
			Result.put (Encoding_attribute)
			Result.put (Media_type_attribute)
			Result.put (Doctype_system_attribute)
			Result.put (Doctype_public_attribute)
			Result.put (Normalization_form_attribute)
			Result.put (Omit_xml_declaration_attribute)
			Result.put (Standalone_attribute)
			Result.put (Escape_uri_attributes_attribute)
			Result.put (Include_content_type_attribute)
			Result.put (Undeclare_prefixes_attribute)
			Result.put (Byte_order_mark_attribute)
			Result.put (Cdata_section_elements_attribute)
			Result.put (Gexslt_character_representation_attribute)
			Result.put (Gexslt_indent_spaces_attribute)
		end

invariant

	formatting_attributes_not_void: formatting_attributes /= Void

end

