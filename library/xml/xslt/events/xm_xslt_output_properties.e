indexing

	description:

		"Properties of the output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_PROPERTIES

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

	KL_IMPORTED_STRING_ROUTINES

creation

	make, make_xml, make_html, make_xhtml, make_text

feature {NONE} -- Initialization

	make is
			-- Make with defaults for XML method (apart from method itself).
		do
			initialize
			set_xml_defaults
			method := ""
		end

	initialize is
			-- Initialize.
		do
			create string_property_map.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			create boolean_property_map.make_with_equality_testers (1, Void, string_equality_tester)
			create cdata_section_elements.make_default
			cdata_section_elements.set_equality_tester (string_equality_tester)			
			create used_character_maps.make_default
			used_character_maps.set_equality_tester (string_equality_tester)
			indent_spaces := 3            -- this is not specified in any way by the spec
			encoding := "UTF-8"
			
			escape_uri_attributes := True
			include_content_type := True
		end

	make_xml is
			-- Make with defaults for XML method.
		do
			initialize
			set_xml_defaults
		end

	make_html is
			-- Make with defaults for HTML method.
		do
			initialize
			set_html_defaults
		end

	make_xhtml is
			-- Make with defaults for HTML method.
		do
			initialize
			set_xhtml_defaults
		end

	make_text is
			-- make with defaults for the TEXT method
		do
			initialize
			set_text_defaults
		end

feature -- Access

	method: STRING
			-- Output method: "xml", "html", "xhtml", "text" or a QName

	version: STRING is
			-- Text of version attribute on xml declaration
		do
			if string_property_map.has ("version") then
				Result := string_property_map.item ("version")
			else
				Result := default_version
			end
		ensure
			version_not_void: Result /= Void
		end

	encoding: STRING
			-- Encoding to use

	cdata_section_elements: DS_HASH_SET [STRING]
			-- Expanded QNames of elements whose text-node children should be written as CDATA sections

	omit_xml_declaration: BOOLEAN
			-- Should the xml declaration be omitted?

	standalone: STRING
			-- Value of the standalone attribute on the xml declaration

	doctype_public: STRING
			-- Value of the PUBLIC identifier to be written on the DOCTYPE

	doctype_system: STRING
			-- Value of the SYSTEM identifier to be written on the DOCTYPE

	indent: BOOLEAN is
			-- Should the transformer add additional whitespace?
		do
			if boolean_property_map.has ("indent") then
				Result := boolean_property_map.item ("indent")
			else
				Result := default_indent
			end
		end

	media_type: STRING is
			-- MIME type to be written
		do
			if string_property_map.has ("media-type") then
				Result := string_property_map.item ("media-type")
			else
				Result := default_media_type
			end
		ensure
			media_type_not_void: Result /= Void
		end

	indent_spaces: INTEGER
			-- Number of spaces to be used for indentation when `indent' is `True' (a gexslt extension)

	used_character_maps: DS_ARRAYED_LIST [STRING]
			-- Expanded QNames of character maps that are to be used

	include_content_type: BOOLEAN
			-- Should the html/xhtml methods write a Content-type meta element within the head element?

	undeclare_namespaces: BOOLEAN
			-- Should the xml method (for version 1.1) write namespace undeclarations?

	escape_uri_attributes: BOOLEAN
			-- Should the html and xhtml methods escape non-ASCII charaters in URI attribute values?

	byte_order_mark_required: BOOLEAN
			-- Should emitter write a BOM?

	character_representation: STRING is
			-- How should characters be represented (a gexslt extension)?
		do
			if string_property_map.has ("character-representation") then
				Result := string_property_map.item ("character-representation")
			else
				Result := default_character_representation
			end
		ensure
			character_representation_not_void: Result /= Void
		end

feature -- Element change

	set_xml_defaults is
			-- Set defaults suitable for xml method.
		do
			method := "xml"
			default_indent := False
			default_version := "1.0"
			default_media_type := "text/xml"
			default_character_representation := "hex"
		end

	set_html_defaults is
			-- Set defaults suitable for html method.
		do
			method := "html"
			default_indent := True
			default_version := "4.01"
			default_media_type := "text/html"
			default_character_representation := "entity;decimal"
		end

	set_xhtml_defaults is
			-- Set defaults suitable for xhtml method.
		do
			set_html_defaults
			method := "xhtml"
			default_version := "1.0"
		end

	set_text_defaults is
			-- Set defaults suitable for text method.
		do
			method := "text"
			default_media_type := "text/plain"
		end

	-- TODO - check import precedence rules for clashes

	set_version (a_version: STRING) is
			--	Set `version'.
		require
			version_not_void: a_version /= Void -- and then
		do
			if not string_property_map.has ("version") then
				string_property_map.put (a_version, "version")
			end
		end

	set_indent (an_indent_value: BOOLEAN) is
			-- Set `indent'.
		do
			if not boolean_property_map.has ("indent") then
				boolean_property_map.put (an_indent_value, "indent")
			end
		end

	set_omit_xml_declaration (an_omit_xml_declaration_value: BOOLEAN) is
			-- Set `omit_xml_declaration'.
		do
			omit_xml_declaration := an_omit_xml_declaration_value
		ensure
			omit_xml_declaration_set: omit_xml_declaration = an_omit_xml_declaration_value
		end

	set_standalone (a_standalone_value: STRING) is
			-- Set `standalone'.
		do
			standalone := a_standalone_value
		ensure
			standalone_set: standalone = a_standalone_value
		end

	set_indent_spaces (a_number: INTEGER) is
			-- Set `indent_spaces'
		require
			strictly_positive: a_number > 0
		do
			indent_spaces := a_number
		ensure
			indent_spaces_set: indent_spaces = a_number
		end

	set_encoding (an_encoding: STRING) is
			-- Set `encoding'.
		require
			encoding_not_void: encoding /= Void --and then encoding.count > 0
		do
			encoding := an_encoding
		ensure
			encoding_set: encoding = an_encoding
		end

	set_media_type (a_media_type: STRING) is
			-- Set `media_type'.
		require
			media_type_not_void: a_media_type /= Void --and then a_media_type.count > 0
		do
			if not string_property_map.has ("media-type") then
				string_property_map.put (a_media_type, "media-type")
			end
		ensure
			media_type_set: STRING_.same_string (media_type , a_media_type)
		end

	set_doctype_system (a_system_id: STRING) is
			-- Set `doctype_system'.
		require
			doctype_system_not_void: a_system_id /= Void
		do
			doctype_system := a_system_id
		ensure
			doctype_system_set: STRING_.same_string (a_system_id, doctype_system)
		end

	set_doctype_public (a_public_id: STRING) is
			-- Set `doctype_public'.
		require
			doctype_public_not_void: a_public_id /= Void
		do
			doctype_public := a_public_id
		ensure
			doctype_public_set: STRING_.same_string (a_public_id, doctype_public)
		end

	set_cdata_sections (cdata_section_expanded_names:  DS_ARRAYED_LIST [STRING]) is
			-- Set `cdata_section_elements' by merger form `cdata_section_expanded_names'.
		require
			cdata_section_expanded_names_not_void: cdata_section_expanded_names /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			an_expanded_name: STRING
		do
			from
				a_cursor := cdata_section_expanded_names.new_cursor
			variant
				cdata_section_expanded_names.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expanded_name := a_cursor.item
				if cdata_section_elements.has (an_expanded_name) then
					cdata_section_elements.force (an_expanded_name)
				end
				a_cursor.forth
			end
		end

	set_undeclare_namespaces (an_undeclare_namespaces_value: BOOLEAN) is
			-- Set `undeclare_namespaces'.
		do
			undeclare_namespaces := an_undeclare_namespaces_value
		ensure
			undeclare_namespaces_set: undeclare_namespaces = an_undeclare_namespaces_value
		end

	set_character_representation (a_character_representation: STRING) is
			-- Set `character_representation'.
		do
			if not string_property_map.has ("character-representation") then
				string_property_map.put (a_character_representation, "character-representation")
			end
		ensure
			media_type_set: STRING_.same_string (character_representation , a_character_representation)			
		end

	set_include_content_type (an_include_content_type_value: BOOLEAN) is
			-- Set `include_content_type'.
		do
			include_content_type := an_include_content_type_value
		ensure
			include_content_type_set: include_content_type = an_include_content_type_value
		end

	set_escape_uri_attributes (an_escape_uri_attributes_value: BOOLEAN) is
			-- Set `escape_uri_attributes'.
		do
			escape_uri_attributes := an_escape_uri_attributes_value
		ensure
			escape_uri_attributes_set: escape_uri_attributes = an_escape_uri_attributes_value
		end
										
	set_byte_order_mark_required (an_byte_order_mark_required_value: BOOLEAN) is
			-- Set `byte_order_mark_required'.
		do
			byte_order_mark_required := an_byte_order_mark_required_value
		ensure
			byte_order_mark_required_set: byte_order_mark_required = an_byte_order_mark_required_value
		end
								
feature {NONE} -- Implementation

	string_property_map: DS_HASH_TABLE [STRING, STRING]
			-- Map of property names to string values

	boolean_property_map: DS_HASH_TABLE [BOOLEAN, STRING]
			-- Map of property names to boolean values
	
	-- Defaults which differ according to `method':

	default_indent: BOOLEAN
			-- Should the transformer add additional whitespace?

	default_version: STRING
			-- Text of version attribute on xml declaration

	default_media_type: STRING
			-- MIME type to be written

	default_character_representation: STRING
			-- How should characters be represented (a gexslt extension)?

invariant

	cdata_section_elements_not_void: cdata_section_elements /= Void
	standalone_valid: standalone /= Void implies standalone.is_equal ("yes") or else standalone.is_equal ("no")
	default_media_type_not_void: default_media_type /= Void
	used_character_maps_not_void: used_character_maps /= Void
	default_version_not_void: default_version /= Void
	encoding_not_void: encoding /= Void
	default_character_representation: default_character_representation /= Void
	method_not_void: method /= Void

end

