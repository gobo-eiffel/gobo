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

		--  RE-WORK as a hash-table, with default values

creation

	make, make_xml, make_html, make_xhtml, make_text

feature {NONE} -- Initialization

	make is
			-- Make with defaults for XML method (apart from method itself).
		do
			create string_property_map.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			create boolean_property_map.make_with_equality_testers (1, Void, string_equality_tester)
			create cdata_section_elements.make_default
			create use_character_maps.make_default
			cdata_section_elements.set_equality_tester (string_equality_tester)
			indent_spaces := 3            -- this is not specified in any way by the spec
			encoding := "UTF-8"
			default_version := "1.0"
			default_media_type := "text/xml"
			default_character_representation := "hex"
			
			escape_uri_attributes := True
			include_content_type := True
		end

	make_xml is
			-- Make with defaults for XML method.
		do
			method := "xml"
			make
		end

	make_html is
			-- Make with defaults for HTML method.
		do
			method := "html"
			make
			default_indent := True
			default_version := "4.01"
			default_media_type := "text/html"
			default_character_representation := "entity;decimal"
			include_content_type := True
		end

	make_xhtml is
			-- Make with defaults for HTML method.
		do
			make_html
			method := "xhtml"
			default_version := "1.0"
		end

	make_text is
			-- make with defaults for the TEXT method
		do
			method := "text"
			make
			default_media_type := "text/plain"
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

	cdata_section_elements: DS_ARRAYED_LIST [STRING]
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

	use_character_maps: DS_ARRAYED_LIST [STRING]
			-- Expanded QNames of character maps that are to be used

	include_content_type: BOOLEAN
			-- Should the html/xhtml methods write a Contet-type meta element within the head element?

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
	use_character_maps_not_void: use_character_maps /= Void
	default_version_not_void: default_version /= Void
	encoding_not_void: encoding /= Void
	default_character_representation: default_character_representation /= Void
	
end

