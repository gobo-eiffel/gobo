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
			validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	output_fingerprint: INTEGER
			-- Fingerprint of name

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute: STRING
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
					report_compile_warning ("cdata-section-elements (method='xml' only) is not yet supported!") 
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
				elseif STRING_.same_string (an_expanded_name, Gexslt_byte_order_mark_attribute) then
					encoding := attribute_value_by_index (a_cursor.index); STRING_.left_adjust (encoding); STRING_.right_adjust (encoding)
				else
					-- TODO - confine this check to xslt and gexslt namespaces,
					--  and allow other namespaces for use with QName methods

					check_unknown_attribute (a_name_code) 
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
		do
			check_top_level
			check_empty
			-- TODO - validate output_version as NMTOKEN, method as QName but not NCName (except for 4 values)
			if indent /= Void then
				if STRING_.same_string (indent, "yes") or else STRING_.same_string (indent, "no") then
					-- OK
				else
					report_compile_error ("indent must be 'yes' or 'no'")
				end
			end
			if indent_spaces /= Void then
				if not indent_spaces.is_integer then
					report_compile_error (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				elseif indent_spaces.to_integer <= 0 then
					report_compile_error (STRING_.concat (Gexslt_indent_spaces_attribute, " must be a strictly positive integer"))
				end
			end
--			if encoding /= Void and then encoding.count = 0 then
--				report_compile_error ("encoding must be a non-zero-length string")
--			end
--			if media_type /= Void and then media_type.count = 0 then
--				report_compile_error ("media-type must be a non-zero-length string")
			--			end
			if omit_xml_declaration /= Void then
				if STRING_.same_string (omit_xml_declaration, "yes") or else STRING_.same_string (omit_xml_declaration, "no") then
					-- OK
				else
					report_compile_error ("omit_xml_declaration must be 'yes' or 'no'")
				end
			end
			if standalone /= Void then
				if STRING_.same_string (standalone, "yes") or else STRING_.same_string (standalone, "no") then
					-- OK
				else
					report_compile_error ("standalone must be 'yes' or 'no'")
				end
			end
			if cdata_section_elements /= Void then
				validate_cdata_sections
			end
			if undeclare_namespaces /= Void then
				if STRING_.same_string (undeclare_namespaces, "yes") or else STRING_.same_string (undeclare_namespaces, "no") then
					-- OK
				else
					report_compile_error ("undeclare-namespaces must be 'yes' or 'no'")
				end
			end
			if use_character_maps /= Void then
				report_compile_error ("Character maps are not supported yet")
			end
			if include_content_type /= Void then
				if STRING_.same_string (include_content_type, "yes") or else STRING_.same_string (include_content_type, "no") then
					-- OK
				else
					report_compile_error ("include-content-type must be 'yes' or 'no'")
				end
			end
			if escape_uri_attributes /= Void then
				if STRING_.same_string (escape_uri_attributes, "yes") or else STRING_.same_string (escape_uri_attributes, "no") then
					-- OK
				else
					report_compile_error ("undeclare-namespaces must be 'yes' or 'no'")
				end
			end
			if byte_order_mark /= Void then
				if STRING_.same_string (byte_order_mark, "yes") or else STRING_.same_string (byte_order_mark, "no") then
					-- OK
				else
					report_compile_error ("undeclare-namespaces must be 'yes' or 'no'")
				end
			end			
			validated := True
		end
			
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_instruction := Void
		end

	gather_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Accumulate output properties into `a_property_set'.
		require
			property_set_not_void: a_property_set /= Void
			validated: validated
		do 
			if method /= Void then
				if STRING_.same_string (method, "xml") then
					a_property_set.set_xml_defaults
				elseif STRING_.same_string (method, "html") then
					a_property_set.set_html_defaults
				elseif STRING_.same_string (method, "xhtml") then
					a_property_set.set_xhtml_defaults
				elseif STRING_.same_string (method, "text") then
					a_property_set.set_text_defaults
				else
					todo ("gather_output_properties (QName)", true)
				end
			end
			if output_version /= Void then
				a_property_set.set_version (output_version)
			end
			if indent /= Void then
				a_property_set.set_indent (STRING_.same_string (indent, "yes"))
			end
			if indent_spaces /= Void then
				a_property_set.set_indent_spaces (indent_spaces.to_integer)
			end
			if encoding /= Void then
				a_property_set.set_encoding (encoding)
			end
			if media_type /= Void then
				a_property_set.set_media_type (media_type)
			end
			if doctype_system /= Void then
				a_property_set.set_doctype_system (doctype_system)
			end			
			if doctype_public /= Void then
				a_property_set.set_doctype_public (doctype_public)
			end
			if omit_xml_declaration /= Void then
				a_property_set.set_omit_xml_declaration (STRING_.same_string (omit_xml_declaration, "yes"))
			end
			if standalone /= Void then
				a_property_set.set_standalone (standalone)
			end
			if cdata_section_expanded_names /= Void then
				a_property_set.set_cdata_sections (cdata_section_expanded_names)
			end
			if escape_uri_attributes /= Void then
				a_property_set.set_escape_uri_attributes (STRING_.same_string (escape_uri_attributes, "yes"))
			end
			if use_character_maps /= Void then
				report_compile_error ("Character maps are not supported yet")
			end
			if character_representation /= Void then
				a_property_set.set_character_representation (character_representation)
			end			
			if include_content_type /= Void then
				a_property_set.set_include_content_type (STRING_.same_string (include_content_type, "yes"))
			end
			if undeclare_namespaces /= Void then
				a_property_set.set_undeclare_namespaces (STRING_.same_string (undeclare_namespaces, "yes"))
			end
			if byte_order_mark /= Void then
				a_property_set.set_byte_order_mark_required (STRING_.same_string (byte_order_mark, "yes"))
			end
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

	cdata_section_expanded_names: DS_ARRAYED_LIST [STRING]
			-- Expanded names of elements whose text children are to be output as CDATA sections

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

	byte_order_mark: STRING
			-- Extension attribute - do we write a byte order mark?

	validate_cdata_sections is
			-- Validate cdata-section-elements attribute.
		require
			cdata_section_elements_not_void: cdata_section_elements /= Void	
		local
			a_string_splitter, another_string_splitter: ST_SPLITTER
			a_cdata_name_list, qname_parts: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_qname, a_local_name, an_xml_prefix, a_uri, an_expanded_name: STRING
		do
			create a_string_splitter.make
			a_cdata_name_list := a_string_splitter.split (cdata_section_elements)
			from
				a_cursor := a_cdata_name_list.new_cursor; a_cursor.start
				create cdata_section_expanded_names.make (a_cdata_name_list.count)
			variant
				a_cdata_name_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_qname := a_cursor.item
				if not is_qname (a_qname) then
					report_compile_error (STRING_.concat ("Invalid CDATA element name. ", a_qname))
					a_cursor.go_after
				else
					create another_string_splitter.make
					another_string_splitter.set_separators (":")
					qname_parts := another_string_splitter.split (a_qname)
					if qname_parts.count = 1 then
						a_local_name := qname_parts.item (1)
						an_xml_prefix := ""
					else
						a_local_name := qname_parts.item (2)
						an_xml_prefix := qname_parts.item (1)
					end
					a_uri := uri_for_prefix (an_xml_prefix, True)
					if a_uri = Void then
						report_compile_error (STRING_.concat ("Invalid CDATA element prefix. ", an_xml_prefix))
						a_cursor.go_after
					else
						an_expanded_name := STRING_.concat ("{", a_uri)
						an_expanded_name := STRING_.appended_string (an_expanded_name, "}")
						an_expanded_name := STRING_.appended_string (an_expanded_name, a_local_name)
						cdata_section_expanded_names.put_last (an_expanded_name)
					end
				end
				a_cursor.forth
			end
		end

end

