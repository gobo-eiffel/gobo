indexing

	description:

		"xsl:output element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, is_output, as_output
		end

	XM_XSLT_OUTPUT_ROUTINES

	XM_UNICODE_CHARACTERS_1_1

	XM_XSLT_SHARED_EMITTER_FACTORY

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			create extension_attributes.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	output_fingerprint: INTEGER
			-- Fingerprint of name

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_uri: STRING
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
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (a_name_attribute); STRING_.right_adjust (a_name_attribute)
				elseif STRING_.same_string (an_expanded_name, Method_attribute) then
					method := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (method); STRING_.right_adjust (method)
				elseif STRING_.same_string (an_expanded_name, Version_attribute) then
					output_version := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (output_version); STRING_.right_adjust (output_version)					
				elseif STRING_.same_string (an_expanded_name, Encoding_attribute) then
					encoding := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (encoding); STRING_.right_adjust (encoding)
				elseif STRING_.same_string (an_expanded_name, Omit_xml_declaration_attribute) then
					omit_xml_declaration := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (omit_xml_declaration); STRING_.right_adjust (omit_xml_declaration)
				elseif STRING_.same_string (an_expanded_name, Standalone_attribute) then
					standalone := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (standalone); STRING_.right_adjust (standalone)					
				elseif STRING_.same_string (an_expanded_name, Doctype_public_attribute) then
					doctype_public := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (doctype_public); STRING_.right_adjust (doctype_public)
				elseif STRING_.same_string (an_expanded_name, Doctype_system_attribute) then
					doctype_system := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (doctype_system); STRING_.right_adjust (doctype_system)					
				elseif STRING_.same_string (an_expanded_name, Cdata_section_elements_attribute) then
					cdata_section_elements := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (cdata_section_elements); STRING_.right_adjust (cdata_section_elements)
				elseif STRING_.same_string (an_expanded_name, Indent_attribute) then
					indent := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (indent); STRING_.right_adjust (indent)
				elseif STRING_.same_string (an_expanded_name, Include_content_type_attribute) then
					include_content_type := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (include_content_type); STRING_.right_adjust (include_content_type)
				elseif STRING_.same_string (an_expanded_name, Media_type_attribute) then
					media_type := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (media_type); STRING_.right_adjust (media_type)
				elseif STRING_.same_string (an_expanded_name, Escape_uri_attributes_attribute) then
					escape_uri_attributes := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (escape_uri_attributes); STRING_.right_adjust (escape_uri_attributes)
				elseif STRING_.same_string (an_expanded_name, Use_character_maps_attribute) then
					use_character_maps := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (use_character_maps); STRING_.right_adjust (use_character_maps)
				elseif STRING_.same_string (an_expanded_name, Undeclare_namespaces_attribute) then
					undeclare_namespaces := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (undeclare_namespaces); STRING_.right_adjust (undeclare_namespaces)
				elseif STRING_.same_string (an_expanded_name, Gexslt_character_representation_attribute) then
					character_representation := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (character_representation); STRING_.right_adjust (character_representation)
				elseif STRING_.same_string (an_expanded_name, Gexslt_indent_spaces_attribute) then
					indent_spaces := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (indent_spaces); STRING_.right_adjust (indent_spaces)
				elseif STRING_.same_string (an_expanded_name, Gexslt_next_in_chain_attribute) then
					next_in_chain := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (next_in_chain); STRING_.right_adjust (next_in_chain)
				elseif STRING_.same_string (an_expanded_name, Byte_order_mark_attribute) then
					byte_order_mark := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (byte_order_mark); STRING_.right_adjust (byte_order_mark)
				else
					a_uri := shared_name_pool.namespace_uri_from_name_code (a_name_code)
					if a_uri.count = 0 or else STRING_.same_string (a_uri, Xslt_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
						check_unknown_attribute (a_name_code)
					else
						extension_attributes.force (attribute_value_by_index (a_cursor.index), an_expanded_name)
					end
				end
				a_cursor.forth
			end
			if a_name_attribute /= Void then
				generate_name_code (a_name_attribute)
				output_fingerprint := last_generated_name_code
			else
				output_fingerprint := -1
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_top_level (Void)
			check_empty
			if output_version /= Void and then not is_nmtoken (output_version) then
					create an_error.make_from_string ("xsl:output 'version' attribute must be an 'nmtoken'", Xpath_errors_uri, "XTSE0110", Static_error)
					report_compile_error (an_error)
			end
			if method /= Void then
				if is_ncname (method) then
					if STRING_.same_string (method, "xml") or else
						STRING_.same_string (method, "xhtml") or else
						STRING_.same_string (method, "html") or else
						STRING_.same_string (method, "text") then
						-- OK
					else
						create an_error.make_from_string ("xsl:output 'method' attribute must be a QName or one of 'xml', 'xhtml', 'html' or 'text'", Xpath_errors_uri, "XTSE1570", Static_error)
						report_compile_error (an_error)
					end
				elseif not is_qname (method) then
						create an_error.make_from_string ("xsl:output 'method' attribute must be a QName or one of 'xml', 'xhtml', 'html' or 'text'", Xpath_errors_uri, "XTSE1570", Static_error)
						report_compile_error (an_error)
				end
			end
			if indent /= Void then
				if STRING_.same_string (indent, "yes") or else STRING_.same_string (indent, "no") then
					-- OK
				else
					create an_error.make_from_string ("indent must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if indent_spaces /= Void then
				if not indent_spaces.is_integer then
					report_compile_warning (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				elseif indent_spaces.to_integer <= 0 then
					report_compile_warning (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				end
			end
			if omit_xml_declaration /= Void then
				if STRING_.same_string (omit_xml_declaration, "yes") or else STRING_.same_string (omit_xml_declaration, "no") then
					-- OK
				else
					create an_error.make_from_string ("omit_xml_declaration must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if standalone /= Void then
				if STRING_.same_string (standalone, "yes") or else STRING_.same_string (standalone, "no") or else STRING_.same_string (standalone, "omit") then
					-- OK
				else
					create an_error.make_from_string ("standalone must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if cdata_section_elements /= Void then
				validate_cdata_sections (cdata_section_elements, static_context.namespace_resolver)
				if cdata_validation_error /= Void then
					report_compile_error (cdata_validation_error)
				end
			end
			if undeclare_namespaces /= Void then
				if STRING_.same_string (undeclare_namespaces, "yes") or else STRING_.same_string (undeclare_namespaces, "no") then
					-- OK
				else
					create an_error.make_from_string ("undeclare-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if include_content_type /= Void then
				if STRING_.same_string (include_content_type, "yes") or else STRING_.same_string (include_content_type, "no") then
					-- OK
				else
					create an_error.make_from_string ("include-content-type must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if escape_uri_attributes /= Void then
				if STRING_.same_string (escape_uri_attributes, "yes") or else STRING_.same_string (escape_uri_attributes, "no") then
					-- OK
				else
					create an_error.make_from_string ("undeclare-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if byte_order_mark /= Void then
				if STRING_.same_string (byte_order_mark, "yes") or else STRING_.same_string (byte_order_mark, "no") then
					-- OK
				else
					create an_error.make_from_string ("byte-order-mark must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end			
			validated := True
		end
			
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
		end

	gather_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Accumulate output properties into `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		local
			a_stylesheet: XM_XSLT_STYLESHEET
			some_used_character_maps: DS_ARRAYED_LIST [STRING]
			an_import_precedence, a_fingerprint: INTEGER
			a_splitter: ST_SPLITTER
			some_character_maps, qname_parts: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_qname, a_uri, an_xml_prefix, a_local_name, a_message, an_expanded_name: STRING
			a_character_map: XM_XSLT_CHARACTER_MAP
			an_error: XM_XPATH_ERROR_VALUE
		do
			an_import_precedence := precedence
			if method /= Void then
				if STRING_.same_string (method, "xml") then
					if a_property_set.is_higher_precedence (an_import_precedence, Method_attribute) then
						a_property_set.set_xml_defaults (an_import_precedence)
					elseif not a_property_set.is_lower_precedence (an_import_precedence, Method_attribute) and then
						not STRING_.same_string (method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (method, "html") then
					if a_property_set.is_higher_precedence (an_import_precedence, Method_attribute) then
						a_property_set.set_html_defaults (an_import_precedence)
					elseif not a_property_set.is_lower_precedence (an_import_precedence, Method_attribute) and then
						not STRING_.same_string (method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (method, "xhtml") then
					if a_property_set.is_higher_precedence (an_import_precedence, Method_attribute) then
						a_property_set.set_xhtml_defaults (an_import_precedence)
					elseif not a_property_set.is_lower_precedence (an_import_precedence, Method_attribute) and then
						not STRING_.same_string (method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (method, "text") then
					if a_property_set.is_higher_precedence (an_import_precedence, Method_attribute) then
						a_property_set.set_text_defaults (an_import_precedence)
					elseif not a_property_set.is_lower_precedence (an_import_precedence, Method_attribute) and then
						not STRING_.same_string (method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				else
					create a_splitter.make
					a_splitter.set_separators (":")
					qname_parts := a_splitter.split (method)
					if qname_parts.count /= 2 then
						a_message := STRING_.concat ("XTSE1570: ", method)
						a_message := STRING_.appended_string (a_message, " is not a lexical QName.")
						create an_error.make_from_string ("include-content-type must be 'yes' or 'no'", Xpath_errors_uri, "XTSE1570", Static_error)
						report_compile_error (an_error)
					else
						an_xml_prefix := qname_parts.item (1)
						a_uri := uri_for_prefix (an_xml_prefix, False)
						a_local_name := qname_parts.item (2)
						if a_uri = Void then
							create an_error.make_from_string (STRING_.concat (an_xml_prefix, " is not an in-scope namespace prefix."), Xpath_errors_uri, "XTSE1570", Static_error)
							report_compile_error (an_error)
						else
							if emitter_factory.is_valid_output_method (a_uri, a_local_name) then
								if a_property_set.is_higher_precedence (an_import_precedence, Method_attribute) then
									emitter_factory.set_defaults (a_uri, a_local_name, a_property_set, an_import_precedence)
								elseif not a_property_set.is_lower_precedence (an_import_precedence, Method_attribute) and then
									not STRING_.same_string (method, a_property_set.method) then
									a_property_set.set_duplication_error (Method_attribute)
								end
							else
								create an_error.make_from_string (STRING_.concat (method, " is not supported by this XSLT configuration/processor."), Xpath_errors_uri, "XTSE1570", Static_error)
								report_compile_error (an_error)
							end
						end
					end
				end
			end
			if output_version /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Version_attribute) then
					a_property_set.set_version (output_version, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Version_attribute) and then
					not STRING_.same_string (output_version, a_property_set.version) then
					a_property_set.set_duplication_error (Version_attribute)
				end
			end
			if indent /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Indent_attribute) then
					a_property_set.set_indent (STRING_.same_string (indent, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Indent_attribute) and then
					((STRING_.same_string (indent, "yes") and then not a_property_set.indent) or else
					(STRING_.same_string (indent, "no") and then a_property_set.indent)) then
					a_property_set.set_duplication_error (Indent_attribute)
				end
			end
			if indent_spaces /= Void and then not a_property_set.is_error and then indent_spaces.is_integer and then indent_spaces.to_integer > 0 then
				if a_property_set.is_higher_precedence (an_import_precedence, Gexslt_indent_spaces_attribute) then
					a_property_set.set_indent_spaces (indent_spaces.to_integer, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Gexslt_indent_spaces_attribute) and then
					indent_spaces.to_integer /= a_property_set.indent_spaces then
					a_property_set.set_duplication_error (Gexslt_indent_spaces_attribute)
				end	
			end
			if next_in_chain /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Gexslt_next_in_chain_attribute) then
					a_property_set.set_next_in_chain (next_in_chain, an_import_precedence)
					a_property_set.set_next_in_chain_base_uri (system_id)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Gexslt_indent_spaces_attribute) then
					a_property_set.set_duplication_error (Gexslt_next_in_chain_attribute)
				end	
			end
			if encoding /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Encoding_attribute) then
					a_property_set.set_encoding (encoding, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Encoding_attribute) and then
					not STRING_.same_string (encoding, a_property_set.encoding) then
					a_property_set.set_duplication_error (Encoding_attribute)
				end	
			end
			if media_type /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Media_type_attribute) then
					a_property_set.set_media_type (media_type, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Media_type_attribute) and then
					not STRING_.same_string (media_type, a_property_set.media_type) then
					a_property_set.set_duplication_error (Media_type_attribute)
				end	
			end
			if doctype_system /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Doctype_system_attribute) then
					a_property_set.set_doctype_system (doctype_system, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Doctype_system_attribute) and then
					not STRING_.same_string (doctype_system, a_property_set.doctype_system) then
					a_property_set.set_duplication_error (Doctype_system_attribute)
				end	
			end			
			if doctype_public /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Doctype_public_attribute) then
					a_property_set.set_doctype_public (doctype_public, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Doctype_public_attribute) and then
					not STRING_.same_string (doctype_public, a_property_set.doctype_public) then
					a_property_set.set_duplication_error (Doctype_public_attribute)
				end					
			end
			if omit_xml_declaration /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Omit_xml_declaration_attribute) then
					a_property_set.set_omit_xml_declaration (STRING_.same_string (omit_xml_declaration, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Omit_xml_declaration_attribute) then
					if STRING_.same_string (omit_xml_declaration, "yes") and then not a_property_set.omit_xml_declaration or else
						STRING_.same_string (omit_xml_declaration, "no") and then a_property_set.omit_xml_declaration then
						a_property_set.set_duplication_error (Omit_xml_declaration_attribute)
					end
				end
			end
			if standalone /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Standalone_attribute) then
					a_property_set.set_standalone (standalone, an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Standalone_attribute) and then
					not STRING_.same_string (standalone, a_property_set.standalone) then
					a_property_set.set_duplication_error (Standalone_attribute)
				end	
			end
			if cdata_section_expanded_names /= Void and then not a_property_set.is_error then
				a_property_set.set_cdata_sections (cdata_section_expanded_names)
			end
			if escape_uri_attributes /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Escape_uri_attributes_attribute) then
					a_property_set.set_escape_uri_attributes (STRING_.same_string (escape_uri_attributes, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Escape_uri_attributes_attribute) then
					if STRING_.same_string (escape_uri_attributes, "yes") and then not a_property_set.escape_uri_attributes or else
						STRING_.same_string (escape_uri_attributes, "no") and then a_property_set.escape_uri_attributes then
						a_property_set.set_duplication_error (Escape_uri_attributes_attribute)
					end
				end					
			end
			if use_character_maps /= Void and then not a_property_set.is_error then
				a_stylesheet := principal_stylesheet
				some_used_character_maps := a_property_set.used_character_maps
				create a_splitter.make
				some_character_maps := a_splitter.split (use_character_maps)
				from
					a_cursor := some_character_maps.new_cursor; a_cursor.start
					create a_splitter.make
					a_splitter.set_separators (":")
				variant
					some_character_maps.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_qname := a_cursor.item
					qname_parts := a_splitter.split (a_qname)
					if qname_parts.count = 0 or else qname_parts.count > 2 then
						create an_error.make_from_string (STRING_.concat (a_qname, " is not a lexical QName."), Xpath_errors_uri, "XTSE1590", Static_error)
						report_compile_error (an_error)
						a_cursor.go_after
					else
						if qname_parts.count = 1 then
							an_xml_prefix := ""
							a_uri := ""
							a_local_name := qname_parts.item (1)
						else
							an_xml_prefix := qname_parts.item (1)
							a_uri := uri_for_prefix (an_xml_prefix, False)
							a_local_name := qname_parts.item (2)
						end
						if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
							a_fingerprint := shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
						else
							shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
							a_fingerprint := shared_name_pool.last_name_code
						end
						if a_fingerprint = -1 then
							create an_error.make_from_string (STRING_.concat (a_qname, " is not a lexical QName."), Xpath_errors_uri, "XTSE1590", Static_error)
							report_compile_error (an_error)
							a_cursor.go_after
						else
							a_fingerprint := shared_name_pool.fingerprint_from_name_code (a_fingerprint)
							a_character_map := a_stylesheet.character_map (a_fingerprint)
							if a_character_map = Void then
								a_message := STRING_.concat ("No character-map named ", a_qname)
								a_message := STRING_.appended_string (a_message, " has been defined.")
								create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1590", Static_error)
								report_compile_error (an_error)
								a_cursor.go_after
							else
								an_expanded_name := STRING_.concat ("{", a_uri)
								an_expanded_name := STRING_.appended_string (an_expanded_name, "}")
								an_expanded_name := STRING_.appended_string (an_expanded_name, a_local_name)
								if not some_used_character_maps.has (an_expanded_name) then
									some_used_character_maps.force_last (an_expanded_name)
								end
								a_cursor.forth
							end
						end
					end
				end
			end
			if character_representation /= Void and then not a_property_set.is_error then
				if a_property_set.is_valid_character_representation (character_representation) then
					if a_property_set.is_higher_precedence (an_import_precedence, Gexslt_character_representation_attribute) then
						a_property_set.set_character_representation (character_representation, an_import_precedence)
					elseif not a_property_set.is_lower_precedence (an_import_precedence, Gexslt_character_representation_attribute) and then
						not STRING_.same_string (character_representation, a_property_set.character_representation) then
						a_property_set.set_duplication_error (Gexslt_character_representation_attribute)
					end
				else
					report_compile_warning (STRING_.concat (character_representation, " is not a valid value for gexslt:character-representation"))
				end
			end			
			if include_content_type /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Include_content_type_attribute) then
					a_property_set.set_include_content_type (STRING_.same_string (include_content_type, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Include_content_type_attribute) then
					if STRING_.same_string (include_content_type, "yes") and then not a_property_set.include_content_type or else
						STRING_.same_string (include_content_type, "no") and then a_property_set.include_content_type then
						a_property_set.set_duplication_error (Include_content_type_attribute)
					end
				end
			end
			if undeclare_namespaces /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Undeclare_namespaces_attribute) then
					a_property_set.set_undeclare_namespaces (STRING_.same_string (undeclare_namespaces, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Undeclare_namespaces_attribute) then
					if STRING_.same_string (undeclare_namespaces, "yes") and then not a_property_set.undeclare_namespaces or else
						STRING_.same_string (undeclare_namespaces, "no") and then a_property_set.undeclare_namespaces then
						a_property_set.set_duplication_error (Undeclare_namespaces_attribute)
					end
				end					
			end
			if byte_order_mark /= Void and then not a_property_set.is_error then
				if a_property_set.is_higher_precedence (an_import_precedence, Byte_order_mark_attribute) then
					a_property_set.set_byte_order_mark_required (STRING_.same_string (byte_order_mark, "yes"), an_import_precedence)
				elseif not a_property_set.is_lower_precedence (an_import_precedence, Byte_order_mark_attribute) then
					if STRING_.same_string (byte_order_mark, "yes") and then not a_property_set.byte_order_mark_required or else
						STRING_.same_string (byte_order_mark, "no") and then a_property_set.byte_order_mark_required then
						a_property_set.set_duplication_error (Byte_order_mark_attribute)
					end
				end
			end
			a_property_set.merge_extension_attributes (extension_attributes)
		end

feature -- Conversion

	is_output: BOOLEAN is
			-- Is `Current' an xsl:output?
		do
			Result := True
		end

	as_output: XM_XSLT_OUTPUT is
			-- `Current' seen as an xsl:output
		do
			Result := Current
		end

feature {NONE} -- Implementation

	method: STRING
			-- method value

	output_version: STRING
			-- version value

	encoding: STRING
			-- encoding value

	omit_xml_declaration: STRING
			-- omit-xml-declaration value

	standalone: STRING
			-- standalone value

	doctype_public, doctype_system: STRING
			-- DOCTYPE fpi and SYSTEM ids

	cdata_section_elements: STRING
			-- cdata-section-elements value

	indent: STRING
			-- indent value

	include_content_type: STRING
			-- Include-content-type value

	media_type: STRING
			-- media-type value

	escape_uri_attributes: STRING
			-- escape-uri-attribute value

	use_character_maps: STRING
			-- use-character-maps value

	undeclare_namespaces: STRING
			-- undeclare-namespaces value

	character_representation: STRING
			-- Extension attribute - character representation

	indent_spaces: STRING
			-- Extension attribute - number of spaces to use when indent="yes"

	next_in_chain: STRING
			-- URI of next stylesheet to be applied to output

	byte_order_mark: STRING
			-- Do we write a byte order mark?

	extension_attributes: DS_HASH_TABLE [STRING, STRING]
			-- Extension attributs for use by QName methods

invariant

	extension_attributes_not_void: extension_attributes /= Void

end

