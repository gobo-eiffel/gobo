note

	description:

		"xsl:output element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

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

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			create extension_attributes.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	output_fingerprint: INTEGER
			-- Fingerprint of name

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_uri: STRING
			a_name_attribute: detachable STRING
			l_use_character_maps: like use_character_maps
			l_method: like method
			l_output_version: like output_version
			l_encoding: like encoding
			l_omit_xml_declaration: like omit_xml_declaration
			l_standalone: like standalone
			l_doctype_public: like doctype_public
			l_doctype_system: like doctype_system
			l_cdata_section_elements: like cdata_section_elements
			l_indent: like indent
			l_include_content_type: like include_content_type
			l_media_type: like media_type
			l_escape_uri_attributes: like escape_uri_attributes
			l_undeclare_prefixes: like undeclare_prefixes
			l_normalization_form: like normalization_form
			l_character_representation: like character_representation
			l_indent_spaces: like indent_spaces
			l_next_in_chain: like next_in_chain
			l_byte_order_mark: like byte_order_mark
		do
			if attached attribute_collection as l_attribute_collection then
				from
					l_cursor := l_attribute_collection.name_code_cursor
					l_cursor.start
				until
					l_cursor.after or any_compile_errors
				loop
					a_name_code := l_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Name_attribute) then
						a_name_attribute := attribute_value_by_index (l_cursor.index); STRING_.left_adjust (a_name_attribute); STRING_.right_adjust (a_name_attribute)
					elseif STRING_.same_string (an_expanded_name, Method_attribute) then
						l_method := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_method)
						STRING_.right_adjust (l_method)
						method := l_method
					elseif STRING_.same_string (an_expanded_name, Version_attribute) then
						l_output_version := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_output_version)
						STRING_.right_adjust (l_output_version)
						output_version := l_output_version
					elseif STRING_.same_string (an_expanded_name, Encoding_attribute) then
						l_encoding := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_encoding)
						STRING_.right_adjust (l_encoding)
						encoding := l_encoding
					elseif STRING_.same_string (an_expanded_name, Omit_xml_declaration_attribute) then
						l_omit_xml_declaration := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_omit_xml_declaration)
						STRING_.right_adjust (l_omit_xml_declaration)
						omit_xml_declaration := l_omit_xml_declaration
					elseif STRING_.same_string (an_expanded_name, Standalone_attribute) then
						l_standalone := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_standalone)
						STRING_.right_adjust (l_standalone)
						standalone := l_standalone
					elseif STRING_.same_string (an_expanded_name, Doctype_public_attribute) then
						l_doctype_public := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_doctype_public)
						STRING_.right_adjust (l_doctype_public)
						doctype_public := l_doctype_public
					elseif STRING_.same_string (an_expanded_name, Doctype_system_attribute) then
						l_doctype_system := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_doctype_system)
						STRING_.right_adjust (l_doctype_system)
						doctype_system := l_doctype_system
					elseif STRING_.same_string (an_expanded_name, Cdata_section_elements_attribute) then
						l_cdata_section_elements := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_cdata_section_elements)
						STRING_.right_adjust (l_cdata_section_elements)
						cdata_section_elements := l_cdata_section_elements
					elseif STRING_.same_string (an_expanded_name, Indent_attribute) then
						l_indent := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_indent)
						STRING_.right_adjust (l_indent)
						indent := l_indent
					elseif STRING_.same_string (an_expanded_name, Include_content_type_attribute) then
						l_include_content_type := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_include_content_type)
						STRING_.right_adjust (l_include_content_type)
						include_content_type := l_include_content_type
					elseif STRING_.same_string (an_expanded_name, Media_type_attribute) then
						l_media_type := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_media_type)
						STRING_.right_adjust (l_media_type)
						media_type := l_media_type
					elseif STRING_.same_string (an_expanded_name, Escape_uri_attributes_attribute) then
						l_escape_uri_attributes := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_escape_uri_attributes)
						STRING_.right_adjust (l_escape_uri_attributes)
						escape_uri_attributes := l_escape_uri_attributes
					elseif STRING_.same_string (an_expanded_name, Use_character_maps_attribute) then
						l_use_character_maps := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_use_character_maps)
						STRING_.right_adjust (l_use_character_maps)
						use_character_maps := l_use_character_maps
					elseif STRING_.same_string (an_expanded_name, Undeclare_prefixes_attribute) then
						l_undeclare_prefixes := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_undeclare_prefixes)
						STRING_.right_adjust (l_undeclare_prefixes)
						undeclare_prefixes := l_undeclare_prefixes
					elseif STRING_.same_string (an_expanded_name, Normalization_form_attribute) then
						l_normalization_form := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_normalization_form)
						STRING_.right_adjust (l_normalization_form)
						normalization_form := l_normalization_form
					elseif STRING_.same_string (an_expanded_name, Gexslt_character_representation_attribute) then
						l_character_representation := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_character_representation)
						STRING_.right_adjust (l_character_representation)
						character_representation := l_character_representation
					elseif STRING_.same_string (an_expanded_name, Gexslt_indent_spaces_attribute) then
						l_indent_spaces := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_indent_spaces)
						STRING_.right_adjust (l_indent_spaces)
						indent_spaces := l_indent_spaces
					elseif STRING_.same_string (an_expanded_name, Gexslt_next_in_chain_attribute) then
						l_next_in_chain := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_next_in_chain)
						STRING_.right_adjust (l_next_in_chain)
						next_in_chain := l_next_in_chain
					elseif STRING_.same_string (an_expanded_name, Byte_order_mark_attribute) then
						l_byte_order_mark := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_byte_order_mark)
						STRING_.right_adjust (l_byte_order_mark)
						byte_order_mark := l_byte_order_mark
					else
						a_uri := shared_name_pool.namespace_uri_from_name_code (a_name_code)
						if a_uri.count = 0 or STRING_.same_string (a_uri, Xslt_uri) or STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
							check_unknown_attribute (a_name_code)
						else
							extension_attributes.force (attribute_value_by_index (l_cursor.index), an_expanded_name)
						end
					end
					l_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - l_cursor.index
				end
			end
			if a_name_attribute /= Void then
				generate_name_code (a_name_attribute)
				output_fingerprint := fingerprint_from_name_code (last_generated_name_code)
			else
				output_fingerprint := -1
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			an_error: XM_XPATH_ERROR_VALUE
			l_message: STRING
			l_method_qname_parser: like method_qname_parser
		do
			check_top_level (Void)
			check_empty
			if attached output_version as l_output_version and then not is_nmtoken (l_output_version) then
				create an_error.make_from_string ("xsl:output 'version' attribute must be an 'nmtoken'", Xpath_errors_uri, "XTSE0110", Static_error)
				report_compile_error (an_error)
			end
			if attached method as l_method then
				if is_ncname (l_method) then
					if STRING_.same_string (l_method, "xml") or
						STRING_.same_string (l_method, "xhtml") or
						STRING_.same_string (l_method, "html") or
						STRING_.same_string (l_method, "text") then
						-- OK
					else
						create an_error.make_from_string ("xsl:output 'method' attribute must be a QName or one of 'xml', 'xhtml', 'html' or 'text'", Xpath_errors_uri, "XTSE1570", Static_error)
						report_compile_error (an_error)
					end
				elseif not is_qname (l_method) then
					create an_error.make_from_string ("xsl:output 'method' attribute must be a QName or one of 'xml', 'xhtml', 'html' or 'text'", Xpath_errors_uri, "XTSE1570", Static_error)
					report_compile_error (an_error)
				else
					create l_method_qname_parser.make (l_method)
					method_qname_parser := l_method_qname_parser
					if not l_method_qname_parser.is_valid then
						l_message := STRING_.concat (l_method, " is not a lexical QName.")
						create an_error.make_from_string (l_message, Xpath_errors_uri, "XTSE1570", Static_error)
						report_compile_error (an_error)
					else
						check
							attached l_method_qname_parser.optional_prefix as l_optional_prefix
							attached uri_for_prefix (l_optional_prefix, False) as l_uri_for_prefix
							attached l_method_qname_parser.local_name as l_local_name
						then
							if STRING_.same_string (l_uri_for_prefix, Gexslt_eiffel_type_uri)
								and STRING_.same_string (l_local_name, "chain") then
								is_chain := True
							end
						end
					end
				end
			end
			if is_chain and next_in_chain = Void then
				create an_error.make_from_string ("Output method gexslt:chain requires gexslt:next-in-chain attribute", Gexslt_eiffel_type_uri, "NEXT_IN_CHAIN_ABSENT", Static_error)
				report_compile_error (an_error)
			elseif not is_chain and next_in_chain /= Void then
				create an_error.make_from_string ("The gexslt:next-in-chain attribute is only permitted when the output method is gexslt:chian", Gexslt_eiffel_type_uri, "NEXT_IN_CHAIN_PRESENT", Static_error)
				report_compile_error (an_error)
			end
			if attached indent as l_indent then
				if STRING_.same_string (l_indent, "yes") or STRING_.same_string (l_indent, "no") then
					-- OK
				else
					create an_error.make_from_string ("indent must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached indent_spaces as l_indent_spaces then
				if not l_indent_spaces.is_integer then
					report_compile_warning (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				elseif l_indent_spaces.to_integer <= 0 then
					report_compile_warning (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				end
			end
			if attached omit_xml_declaration as l_omit_xml_declaration then
				if STRING_.same_string (l_omit_xml_declaration, "yes") or STRING_.same_string (l_omit_xml_declaration, "no") then
					-- OK
				else
					create an_error.make_from_string ("omit_xml_declaration must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached standalone as l_standalone then
				if STRING_.same_string (l_standalone, "yes") or STRING_.same_string (l_standalone, "no") or STRING_.same_string (l_standalone, "omit") then
					-- OK
				else
					create an_error.make_from_string ("standalone must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached cdata_section_elements as l_cdata_section_elements then
				check attached static_context as l_static_context then
					validate_cdata_sections (l_cdata_section_elements, l_static_context.namespace_resolver)
				end
				if attached cdata_validation_error as l_cdata_validation_error then
					report_compile_error (l_cdata_validation_error)
				end
			end
			if attached undeclare_prefixes as l_undeclare_prefixes then
				if STRING_.same_string (l_undeclare_prefixes, "yes") or STRING_.same_string (l_undeclare_prefixes, "no") then
					-- OK
				else
					create an_error.make_from_string ("undeclare-prefixes must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached normalization_form as l_normalization_form then
				if STRING_.same_string (l_normalization_form, "NFC") or STRING_.same_string (l_normalization_form, "NFD")
					or STRING_.same_string (l_normalization_form, "NFKC") or STRING_.same_string (l_normalization_form, "NFKD")
					or STRING_.same_string (l_normalization_form, "fully-normalized") or STRING_.same_string (l_normalization_form, "none")
					or is_nmtoken (l_normalization_form)
				 then
					-- OK
				else
					create an_error.make_from_string ("normalization-form must be one of 'NFC', 'NFD', 'NFKC', 'NFKD', 'fully-normalized', 'none' or an NMTOKEN", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached include_content_type as l_include_content_type then
				if STRING_.same_string (l_include_content_type, "yes") or STRING_.same_string (l_include_content_type, "no") then
					-- OK
				else
					create an_error.make_from_string ("include-content-type must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached escape_uri_attributes as l_escape_uri_attributes then
				if STRING_.same_string (l_escape_uri_attributes, "yes") or STRING_.same_string (l_escape_uri_attributes, "no") then
					-- OK
				else
					create an_error.make_from_string ("escape-uri-attribute must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			if attached byte_order_mark as l_byte_order_mark then
				if STRING_.same_string (l_byte_order_mark, "yes") or STRING_.same_string (l_byte_order_mark, "no") then
					-- OK
				else
					create an_error.make_from_string ("byte-order-mark must be 'yes' or 'no'", Xpath_errors_uri, "SEPM0016", Static_error)
					report_compile_error (an_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
		end

	gather_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES)
			-- Accumulate output properties into `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		local
			l_import_precedence: INTEGER
		do
			l_import_precedence := precedence
			if method /= Void then
				gather_method_property (a_property_set, l_import_precedence)
			end
			if output_version /= Void and then not a_property_set.is_error then
				gather_version_property (a_property_set, l_import_precedence)
			end
			if indent /= Void and then not a_property_set.is_error then
				gather_indent_property (a_property_set, l_import_precedence)
			end
			if attached indent_spaces as l_indent_spaces and then not a_property_set.is_error and then l_indent_spaces.is_integer and then l_indent_spaces.to_integer > 0 then
				gather_indent_spaces_property (a_property_set, l_import_precedence)
			end
			if next_in_chain /= Void and then not a_property_set.is_error then
				gather_next_in_chain_property (a_property_set, l_import_precedence)
			end
			if encoding /= Void and then not a_property_set.is_error then
				gather_encoding_property (a_property_set, l_import_precedence)
			end
			if media_type /= Void and then not a_property_set.is_error then
				gather_media_type_property (a_property_set, l_import_precedence)
			end
			if doctype_system /= Void and then not a_property_set.is_error then
				gather_doctype_system_property (a_property_set, l_import_precedence)
			end
			if doctype_public /= Void and then not a_property_set.is_error then
				gather_doctype_public_property (a_property_set, l_import_precedence)
			end
			if omit_xml_declaration /= Void and then not a_property_set.is_error then
				gather_omit_xml_declaration_property (a_property_set, l_import_precedence)
			end
			if standalone /= Void and then not a_property_set.is_error then
				gather_standalone_property (a_property_set, l_import_precedence)
			end
			if attached cdata_section_expanded_names as l_cdata_section_expanded_names and then not a_property_set.is_error then
				a_property_set.set_cdata_sections (l_cdata_section_expanded_names)
			end
			if escape_uri_attributes /= Void and then not a_property_set.is_error then
				gather_escape_uri_attributes_property (a_property_set, l_import_precedence)
			end
			if use_character_maps /= Void and then not a_property_set.is_error then
				gather_used_character_maps_property (a_property_set, l_import_precedence)
			end
			if character_representation /= Void and then not a_property_set.is_error then
				gather_character_representation_property (a_property_set, l_import_precedence)
			end
			if include_content_type /= Void and then not a_property_set.is_error then
				gather_include_content_type_property (a_property_set, l_import_precedence)
			end
			if undeclare_prefixes /= Void and then not a_property_set.is_error then
				gather_undeclare_prefixes_property (a_property_set, l_import_precedence)
			end
			if normalization_form /= Void and then not a_property_set.is_error then
				gather_normalization_form_property (a_property_set, l_import_precedence)
			end
			if byte_order_mark /= Void and then not a_property_set.is_error then
				gather_byte_order_mark_property (a_property_set, l_import_precedence)
			end
			a_property_set.merge_extension_attributes (extension_attributes)
		end

feature -- Conversion

	is_output: BOOLEAN
			-- Is `Current' an xsl:output?
		do
			Result := True
		end

	as_output: XM_XSLT_OUTPUT
			-- `Current' seen as an xsl:output
		do
			Result := Current
		end

feature {NONE} -- Implementation

	method: detachable STRING
			-- method value

	output_version: detachable STRING
			-- version value

	encoding: detachable STRING
			-- encoding value

	omit_xml_declaration: detachable STRING
			-- omit-xml-declaration value

	standalone: detachable STRING
			-- standalone value

	doctype_public, doctype_system: detachable STRING
			-- DOCTYPE fpi and SYSTEM ids

	cdata_section_elements: detachable STRING
			-- cdata-section-elements value

	indent: detachable STRING
			-- indent value

	include_content_type: detachable STRING
			-- Include-content-type value

	media_type: detachable STRING
			-- media-type value

	escape_uri_attributes: detachable STRING
			-- escape-uri-attribute value

	undeclare_prefixes: detachable STRING
			-- undeclare-prefixes value

	normalization_form: detachable STRING
			-- normalization-form value

	character_representation: detachable STRING
			-- Extension attribute - character representation

	indent_spaces: detachable STRING
			-- Extension attribute - number of spaces to use when indent="yes"

	next_in_chain: detachable STRING
			-- URI of next stylesheet to be applied to output

	byte_order_mark: detachable STRING
			-- Do we write a byte order mark?

	extension_attributes: DS_HASH_TABLE [STRING, STRING]
			-- Extension attributs for use by QName methods

	is_chain: BOOLEAN
			-- Is `method' gexslt:chain?

	method_qname_parser: detachable XM_XPATH_QNAME_PARSER
			-- Parser for method name

	gather_method_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set method-related properties in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		local
			l_uri: detachable STRING
		do
			check attached method as l_method then
				if STRING_.same_string (l_method, "xml") then
					if a_property_set.is_higher_precedence (a_import_precedence, Method_attribute) then
						a_property_set.set_xml_defaults (a_import_precedence)
					elseif not a_property_set.is_lower_precedence (a_import_precedence, Method_attribute) and then
						not STRING_.same_string (l_method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (l_method, "html") then
					if a_property_set.is_higher_precedence (a_import_precedence, Method_attribute) then
						a_property_set.set_html_defaults (a_import_precedence)
					elseif not a_property_set.is_lower_precedence (a_import_precedence, Method_attribute) and then
						not STRING_.same_string (l_method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (l_method, "xhtml") then
					if a_property_set.is_higher_precedence (a_import_precedence, Method_attribute) then
						a_property_set.set_xhtml_defaults (a_import_precedence)
					elseif not a_property_set.is_lower_precedence (a_import_precedence, Method_attribute) and then
						not STRING_.same_string (l_method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif STRING_.same_string (l_method, "text") then
					if a_property_set.is_higher_precedence (a_import_precedence, Method_attribute) then
						a_property_set.set_text_defaults (a_import_precedence)
					elseif not a_property_set.is_lower_precedence (a_import_precedence, Method_attribute) and then
						not STRING_.same_string (l_method, a_property_set.method) then
						a_property_set.set_duplication_error (Method_attribute)
					end
				elseif not is_chain then
					check
						attached method_qname_parser as l_method_qname_parser
						attached l_method_qname_parser.optional_prefix as l_optional_prefix
					then
						l_uri := uri_for_prefix (l_optional_prefix, False)
						if l_uri = Void then
							report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_optional_prefix, " is not an in-scope namespace prefix."), Xpath_errors_uri, "XTSE1570", Static_error))
						else
							check
								attached l_method_qname_parser.local_name as l_local_name
							then
								if emitter_factory.is_valid_output_method (l_uri, l_local_name) then
									if a_property_set.is_higher_precedence (a_import_precedence, Method_attribute) then
										emitter_factory.set_defaults (l_uri, l_local_name, a_property_set, a_import_precedence)
									elseif not a_property_set.is_lower_precedence (a_import_precedence, Method_attribute) and then
										not STRING_.same_string (l_method, a_property_set.method) then
										a_property_set.set_duplication_error (Method_attribute)
									end
								else
									report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_method, " is not supported by this XSLT configuration/processor."), Xpath_errors_uri, "XTSE1570", Static_error))
								end
							end
						end
					end
				end
			end
		end

	gather_version_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set version property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Version_attribute) then
				check attached output_version as l_output_version then
					a_property_set.set_version (l_output_version, a_import_precedence)
				end
			else
				check attached output_version as l_output_version then
					if not a_property_set.is_lower_precedence (a_import_precedence, Version_attribute) and then
						not STRING_.same_string (l_output_version, a_property_set.version) then
						a_property_set.set_duplication_error (Version_attribute)
					end
				end
			end
		end

	gather_indent_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set indent property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Indent_attribute) then
				check attached indent as l_indent then
					a_property_set.set_indent (STRING_.same_string (l_indent, "yes"), a_import_precedence)
				end
			else
				check attached indent as l_indent then
					if not a_property_set.is_lower_precedence (a_import_precedence, Indent_attribute) and then
						((STRING_.same_string (l_indent, "yes") and then not a_property_set.indent) or
							(STRING_.same_string (l_indent, "no") and then a_property_set.indent)) then
						a_property_set.set_duplication_error (Indent_attribute)
					end
				end
			end
		end

	gather_indent_spaces_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set indent-spaces property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Gexslt_indent_spaces_attribute) then
				check attached indent_spaces as l_indent_spaces then
					a_property_set.set_indent_spaces (l_indent_spaces.to_integer, a_import_precedence)
				end
			else
				check attached indent_spaces as l_indent_spaces then
					if not a_property_set.is_lower_precedence (a_import_precedence, Gexslt_indent_spaces_attribute) and then
						l_indent_spaces.to_integer /= a_property_set.indent_spaces then
						a_property_set.set_duplication_error (Gexslt_indent_spaces_attribute)
					end
				end
			end
		end

	gather_next_in_chain_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set next-in-chain property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Gexslt_next_in_chain_attribute) then
				check attached next_in_chain as l_next_in_chain then
					a_property_set.set_next_in_chain (l_next_in_chain, a_import_precedence)
					a_property_set.set_next_in_chain_base_uri (system_id)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Gexslt_indent_spaces_attribute) then
				a_property_set.set_duplication_error (Gexslt_next_in_chain_attribute)
			end
		end

	gather_encoding_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set encoding property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Encoding_attribute) then
				check attached encoding as l_encoding then
					a_property_set.set_encoding (l_encoding, a_import_precedence)
				end
			else
				check attached encoding as l_encoding then
					if not a_property_set.is_lower_precedence (a_import_precedence, Encoding_attribute) and then
						not STRING_.same_string (l_encoding, a_property_set.encoding) then
						a_property_set.set_duplication_error (Encoding_attribute)
					end
				end
			end
		end

	gather_media_type_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set media-type property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Media_type_attribute) then
				check attached media_type as l_media_type then
					a_property_set.set_media_type (l_media_type, a_import_precedence)
				end
			else
				check attached media_type as l_media_type then
					if not a_property_set.is_lower_precedence (a_import_precedence, Media_type_attribute) and then
						not STRING_.same_string (l_media_type, a_property_set.media_type) then
						a_property_set.set_duplication_error (Media_type_attribute)
					end
				end
			end
		end

	gather_doctype_system_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set doctype-system property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Doctype_system_attribute) then
				check attached doctype_system as l_doctype_system then
					a_property_set.set_doctype_system (l_doctype_system, a_import_precedence)
				end
			else
				check
					attached doctype_system as l_doctype_system
					attached a_property_set.doctype_system as l_property_set_doctype_system
				then
					if not a_property_set.is_lower_precedence (a_import_precedence, Doctype_system_attribute) and then
						not STRING_.same_string (l_doctype_system, l_property_set_doctype_system) then
						a_property_set.set_duplication_error (Doctype_system_attribute)
					end
				end
			end
		end

	gather_doctype_public_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set doctype-public property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Doctype_public_attribute) then
				check attached doctype_public as l_doctype_public then
					a_property_set.set_doctype_public (l_doctype_public, a_import_precedence)
				end
			else
				check
					attached doctype_public as l_doctype_public
					attached a_property_set.doctype_public as l_property_set_doctype_public
				then
					if not a_property_set.is_lower_precedence (a_import_precedence, Doctype_public_attribute) and then
						not STRING_.same_string (l_doctype_public, l_property_set_doctype_public) then
						a_property_set.set_duplication_error (Doctype_public_attribute)
					end
				end
			end
		end

	gather_omit_xml_declaration_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set omit-xml-declaration property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Omit_xml_declaration_attribute) then
				check attached omit_xml_declaration as l_omit_xml_declaration then
					a_property_set.set_omit_xml_declaration (STRING_.same_string (l_omit_xml_declaration, "yes"), a_import_precedence)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Omit_xml_declaration_attribute) then
				check attached omit_xml_declaration as l_omit_xml_declaration then
					if STRING_.same_string (l_omit_xml_declaration, "yes") and then not a_property_set.omit_xml_declaration or
						STRING_.same_string (l_omit_xml_declaration, "no") and then a_property_set.omit_xml_declaration then
						a_property_set.set_duplication_error (Omit_xml_declaration_attribute)
					end
				end
			end
		end

	gather_standalone_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set standalone property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Standalone_attribute) then
				check attached standalone as l_standalone then
					a_property_set.set_standalone (l_standalone, a_import_precedence)
				end
			else
				check
					attached standalone as l_standalone
					attached a_property_set.standalone as l_property_set_standalone
				then
					if not a_property_set.is_lower_precedence (a_import_precedence, Standalone_attribute) and then
						not STRING_.same_string (l_standalone, l_property_set_standalone) then
						a_property_set.set_duplication_error (Standalone_attribute)
					end
				end
			end
		end

	gather_escape_uri_attributes_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set escape-uri-attributes property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Escape_uri_attributes_attribute) then
				check attached escape_uri_attributes as l_escape_uri_attributes then
					a_property_set.set_escape_uri_attributes (STRING_.same_string (l_escape_uri_attributes, "yes"), a_import_precedence)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Escape_uri_attributes_attribute) then
				check attached escape_uri_attributes as l_escape_uri_attributes then
					if STRING_.same_string (l_escape_uri_attributes, "yes") and then not a_property_set.escape_uri_attributes or
						STRING_.same_string (l_escape_uri_attributes, "no") and then a_property_set.escape_uri_attributes then
						a_property_set.set_duplication_error (Escape_uri_attributes_attribute)
					end
				end
			end
		end

	gather_character_representation_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set character-representation property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			check attached character_representation as l_character_representation then
				if a_property_set.is_valid_character_representation (l_character_representation) then
					if a_property_set.is_higher_precedence (a_import_precedence, Gexslt_character_representation_attribute) then
						a_property_set.set_character_representation (l_character_representation, a_import_precedence)
					elseif not a_property_set.is_lower_precedence (a_import_precedence, Gexslt_character_representation_attribute) and then
						not STRING_.same_string (l_character_representation, a_property_set.character_representation) then
						a_property_set.set_duplication_error (Gexslt_character_representation_attribute)
					end
				else
					report_compile_warning (STRING_.concat (l_character_representation, " is not a valid value for gexslt:character-representation"))
				end
			end
		end

	gather_include_content_type_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set include-content-type property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Include_content_type_attribute) then
				check attached include_content_type as l_include_content_type then
					a_property_set.set_include_content_type (STRING_.same_string (l_include_content_type, "yes"), a_import_precedence)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Include_content_type_attribute) then
				check attached include_content_type as l_include_content_type then
					if STRING_.same_string (l_include_content_type, "yes") and then not a_property_set.include_content_type or
						STRING_.same_string (l_include_content_type, "no") and then a_property_set.include_content_type then
						a_property_set.set_duplication_error (Include_content_type_attribute)
					end
				end
			end
		end

	gather_undeclare_prefixes_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set undeclare-prefixes property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Undeclare_prefixes_attribute) then
				check attached undeclare_prefixes as l_undeclare_prefixes then
					a_property_set.set_undeclare_prefixes (STRING_.same_string (l_undeclare_prefixes, "yes"), a_import_precedence)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Undeclare_prefixes_attribute) then
				check attached undeclare_prefixes as l_undeclare_prefixes then
					if STRING_.same_string (l_undeclare_prefixes, "yes") and then not a_property_set.undeclare_prefixes or
						STRING_.same_string (l_undeclare_prefixes, "no") and then a_property_set.undeclare_prefixes then
						a_property_set.set_duplication_error (Undeclare_prefixes_attribute)
					end
				end
			end
		end

	gather_normalization_form_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set normalization-form property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Normalization_form_attribute) then
				check attached normalization_form as l_normalization_form then
					a_property_set.set_normalization_form (l_normalization_form, a_import_precedence)
				end
			else
				check
					attached normalization_form as l_normalization_form
					attached a_property_set.normalization_form as l_property_set_normalization_form
				then
					if not a_property_set.is_lower_precedence (a_import_precedence, Normalization_form_attribute)
						and then not STRING_.same_string (l_normalization_form, l_property_set_normalization_form) then
						a_property_set.set_duplication_error (Normalization_form_attribute)
					end
				end
			end
		end

	gather_byte_order_mark_property (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set byte-order-form property in `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			property_set_not_in_error: not a_property_set.is_error
			validated: validated
		do
			if a_property_set.is_higher_precedence (a_import_precedence, Byte_order_mark_attribute) then
				check attached byte_order_mark as l_byte_order_mark then
					a_property_set.set_byte_order_mark_required (STRING_.same_string (l_byte_order_mark, "yes"), a_import_precedence)
				end
			elseif not a_property_set.is_lower_precedence (a_import_precedence, Byte_order_mark_attribute) then
				check attached byte_order_mark as l_byte_order_mark then
					if STRING_.same_string (l_byte_order_mark, "yes") and then not a_property_set.byte_order_mark_required or
						STRING_.same_string (l_byte_order_mark, "no") and then a_property_set.byte_order_mark_required then
						a_property_set.set_duplication_error (Byte_order_mark_attribute)
					end
				end
			end
		end

invariant

	extension_attributes_not_void: extension_attributes /= Void

end

