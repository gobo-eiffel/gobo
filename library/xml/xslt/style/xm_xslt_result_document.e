indexing

	description:

		"xsl:result-document element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RESULT_DOCUMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, make_style_element, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			is_instruction := True
			validation_action := Validation_strip
			create formatting_attributes.make_with_equality_testers (17, expression_tester, Void)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
			end

feature -- Access

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_format_attribute, an_href_attribute: STRING
			a_validation_attribute, a_type_attribute, a_value, a_message: STRING
			an_expression: XM_XPATH_EXPRESSION
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Format_attribute) then
					a_format_attribute := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (a_format_attribute); STRING_.right_adjust (a_format_attribute)
				elseif STRING_.same_string (an_expanded_name, Href_attribute) then
					an_href_attribute := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (an_href_attribute); STRING_.right_adjust (an_href_attribute)
				elseif STRING_.same_string (an_expanded_name, Use_character_maps_attribute) then
					use_character_maps := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (use_character_maps); STRING_.right_adjust (use_character_maps)
				elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
					a_validation_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Type_attribute) then
					a_type_attribute := attribute_value_by_index (a_cursor.index)
				elseif formatting_attribute_names.has (an_expanded_name) or else
					(an_expanded_name.substring_index ("#", 1) /= 0
					 and then an_expanded_name.substring_index (Gexslt_eiffel_type_uri, 1) /= 1
					 and then an_expanded_name.substring_index (Xslt_uri, 1) /= 1 ) then

					-- it's a (plausible) serialization parameter

					a_value := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_value); STRING_.right_adjust (a_value)
					generate_attribute_value_template (a_value, static_context)
					an_expression := last_generated_expression
					formatting_attributes.force (an_expression, fingerprint_from_name_code (a_name_code))
				else
					check_unknown_attribute (a_name_code) 
				end
				a_cursor.forth
			end
			if an_href_attribute /= Void then
				generate_attribute_value_template (an_href_attribute, static_context)
				href := last_generated_expression
			end
			if a_format_attribute /= Void then
				generate_name_code (a_format_attribute)
				output_fingerprint := last_generated_name_code
				if output_fingerprint = -1 then
					a_message := STRING_.concat ("XTSE1460: xsl:result-document format='", a_format_attribute)
					a_message := STRING_.appended_string (a_message, "' does not specify a valid QName")
					create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1460", Static_error)
					report_compile_error (an_error)
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

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			a_fingerprint: INTEGER
			an_attribute_name: STRING
			an_expression: XM_XPATH_EXPRESSION
		do
			check_within_template
			if href /= Void then
				type_check_expression ("href", href)
				if href.was_expression_replaced then
					href := href.replacement_expression
				end
			end
			from
				a_cursor := formatting_attributes.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_fingerprint := a_cursor.key
				an_attribute_name := shared_name_pool.display_name_from_name_code (a_fingerprint)
				an_expression := a_cursor.item
				type_check_expression (an_attribute_name, an_expression)
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end
			validated := True
		end
			
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_property_set: XM_XSLT_OUTPUT_PROPERTIES
			a_stylesheet: XM_XSLT_STYLESHEET
			namespace_context_needed: BOOLEAN
			a_fingerprint_list: DS_ARRAYED_LIST [INTEGER]
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			another_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_fingerprint: INTEGER
			an_expression,a_content: XM_XPATH_EXPRESSION
			a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			a_local_name, a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			last_generated_expression := Void
			a_stylesheet := principal_stylesheet
			if output_fingerprint = -1 or else a_stylesheet.is_named_output_property_defined (output_fingerprint) then
				a_property_set := a_stylesheet.gathered_output_properties (output_fingerprint)
				if a_property_set.is_error then
					a_message := STRING_.concat ("Two xsl:output statements specify conflicting values for attribute '", a_property_set.duplicate_attribute_name)
					a_message := STRING_.appended_string (a_message, "', in the output definition named '")
					a_message := STRING_.appended_string (a_message, shared_name_pool.display_name_from_name_code (output_fingerprint))
					a_message := STRING_.appended_string (a_message, "'.")
					create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1560", Static_error)
					report_compile_error (an_error)
				else
					create a_fingerprint_list.make (formatting_attributes.count)
					a_namespace_resolver := static_context.namespace_resolver
					from
						a_cursor := formatting_attributes.new_cursor; a_cursor.start
					until
						a_cursor.after
					loop
						a_fingerprint := a_cursor.key
						an_expression := a_cursor.item
						if an_expression.is_string_value then
							a_property_set.set_property (a_fingerprint, an_expression.as_string_value.string_value, a_namespace_resolver)
							if a_property_set.is_error then
								a_cursor.go_after
								create an_error.make_from_string (a_property_set.error_message, Gexslt_eiffel_type_uri, "OUTPUT_PROPERTY", Static_error)
								report_compile_error (an_error)
							else
								a_fingerprint_list.put_last (a_fingerprint)
							end
						else
							a_local_name := shared_name_pool.local_name_from_name_code (a_fingerprint)
							if STRING_.same_string (a_local_name, Method_attribute) or else
								STRING_.same_string (a_local_name, Cdata_section_elements_attribute) then
								namespace_context_needed := True
							end
						end
						if not a_cursor.after then a_cursor.forth end
					end
					from
						another_cursor := a_fingerprint_list.new_cursor; another_cursor.start
					variant
						a_fingerprint_list.count + 1 - another_cursor.index
					until
						another_cursor.after
					loop
						a_fingerprint := another_cursor.item
						formatting_attributes.remove (a_fingerprint)
						another_cursor.forth
					end
					if not namespace_context_needed then a_namespace_resolver := Void end
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					a_content := last_generated_expression
					if a_content = Void then create {XM_XPATH_EMPTY_SEQUENCE} a_content.make end
					create {XM_XSLT_COMPILED_RESULT_DOCUMENT} last_generated_expression.make (an_executable, a_property_set, href, base_uri, validation_action,
																													  Void, formatting_attributes, a_namespace_resolver, a_content)
				end
			else
				a_message := STRING_.concat ("Output definition named '", shared_name_pool.display_name_from_name_code (output_fingerprint))
				a_message := STRING_.appended_string (a_message, "' by the format attribute of xsl:result-document has not been defined.")
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1460", Static_error)
				report_compile_error (an_error)
			end
		end

feature {NONE} -- Implementation

	output_fingerprint: INTEGER
			-- Fingerprint of name of output definition

	href: XM_XPATH_EXPRESSION
			-- URI of output destination

	use_character_maps: STRING
			-- Character maps to be used

	validation_action: INTEGER
			-- Validation action

	formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- Overrides of xsl:output attributes

	formatting_attribute_names: DS_HASH_SET [STRING] is
			-- Names of formatting attributes permitted as AVTs;
			-- `Use_character_maps_attribute' is also permitted, but not as an AVT.
		once
			create Result.make (16)
			Result.set_equality_tester (string_equality_tester)
			Result.put (Method_attribute)
			Result.put (Output_version_attribute)
			Result.put (Indent_attribute)
			Result.put (Encoding_attribute)
			Result.put (Media_type_attribute)
			Result.put (Doctype_system_attribute)
			Result.put (Doctype_public_attribute)
			Result.put (Omit_xml_declaration_attribute)
			Result.put (Standalone_attribute)
			Result.put (Escape_uri_attributes_attribute)
			Result.put (Include_content_type_attribute)
			Result.put (Undeclare_namespaces_attribute)
			Result.put (Byte_order_mark_attribute)
			Result.put (Cdata_section_elements_attribute)
			Result.put (Gexslt_character_representation_attribute)
			Result.put (Gexslt_indent_spaces_attribute)
		end

invariant

	formatting_attributes_not_void: formatting_attributes /= Void

end

