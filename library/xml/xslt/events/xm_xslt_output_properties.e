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

	XM_XPATH_STANDARD_NAMESPACES

creation

	make, make_xml, make_html, make_xhtml, make_text

feature {NONE} -- Initialization

	make (an_import_precedence: INTEGER) is
			-- Make with defaults for XML method (apart from method itself).
		do
			initialize
			set_xml_defaults (an_import_precedence)
			method := ""
		end

	initialize is
			-- Initialize.
		do
			create string_property_map.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			create boolean_property_map.make_with_equality_testers (1, Void, string_equality_tester)
			create precedence_property_map.make_with_equality_testers (1, Void, string_equality_tester)
			create cdata_section_elements.make_default
			cdata_section_elements.set_equality_tester (string_equality_tester)			
			create used_character_maps.make_default
			used_character_maps.set_equality_tester (string_equality_tester)
			indent_spaces := 3            -- this is not specified in any way by the spec
			encoding := "UTF-8"
			
			escape_uri_attributes := True
			include_content_type := True
		ensure
			encoding_set: STRING_.same_string (encoding, "UTF-8")
			uri_attributes_escaped: escape_uri_attributes
			content_type_included: include_content_type
		end

	make_xml (an_import_precedence: INTEGER) is
			-- Make with defaults for XML method.
		do
			initialize
			set_xml_defaults (an_import_precedence)
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_xml: STRING_.same_string (method, "xml")
			no_indentation: default_indent = False
			version_1_0: STRING_.same_string (default_version, "1.0")
			text_xml: STRING_.same_string (default_media_type, "text/xml")
			hex_character_representation: STRING_.same_string (default_character_representation, "hex")
			encoding_set: STRING_.same_string (encoding, "UTF-8")
		end

	make_html (an_import_precedence: INTEGER) is
			-- Make with defaults for HTML method.
		do
			initialize
			set_html_defaults (an_import_precedence)
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_html: STRING_.same_string (method, "html")
			indentation: default_indent = True
			version_4_01: STRING_.same_string (default_version, "4.01")
			text_html: STRING_.same_string (default_media_type, "text/html")
			character_representation: STRING_.same_string (default_character_representation, "entity;decimal")
			encoding_set: STRING_.same_string (encoding, "UTF-8")
			uri_attributes_escaped: escape_uri_attributes
			content_type_included: include_content_type			
		end

	make_xhtml (an_import_precedence: INTEGER) is
			-- Make with defaults for HTML method.
		do
			initialize
			set_xhtml_defaults (an_import_precedence)
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_xhtml: STRING_.same_string (method, "xhtml")
			indentation: default_indent = True
			version_1_0: STRING_.same_string (default_version, "1.0")
			text_html: STRING_.same_string (default_media_type, "text/html")
			character_representation: STRING_.same_string (default_character_representation, "entity;decimal")
			encoding_set: STRING_.same_string (encoding, "UTF-8")
			uri_attributes_escaped: escape_uri_attributes
			content_type_included: include_content_type
		end

	make_text (an_import_precedence: INTEGER) is
			-- make with defaults for the TEXT method
		do
			initialize
			set_text_defaults (an_import_precedence)
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_text: STRING_.same_string (method, "text")
			text_plain: STRING_.same_string (default_media_type, "text/plain")
			encoding_set: STRING_.same_string (encoding, "UTF-8")
		end

feature -- Access

	method: STRING
			-- Output method: "xml", "html", "xhtml", "text" or a QName

	version: STRING is
			-- Text of version attribute on xml declaration
		do
			if string_property_map.has (Version_attribute) then
				Result := string_property_map.item (Version_attribute)
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
			if boolean_property_map.has (Indent_attribute) then
				Result := boolean_property_map.item (Indent_attribute)
			else
				Result := default_indent
			end
		end

	media_type: STRING is
			-- MIME type to be written
		do
			if string_property_map.has (Media_type_attribute) then
				Result := string_property_map.item (Media_type_attribute)
			else
				Result := default_media_type
			end
		ensure
			media_type_not_void: Result /= Void
		end

	is_higher_precedence (an_import_precedence: INTEGER; a_property: STRING): BOOLEAN is
			-- Is `an_import_precedence' greater than the import precednece used when previously defining `a_property'?
		require
			valid_property_name: a_property /= Void and then a_property.count > 0
		do
			if precedence_property_map.has (a_property) then
				Result := an_import_precedence > precedence_property_map.item (a_property)
			else
				Result := True
			end
		end

	is_lower_precedence (an_import_precedence: INTEGER; a_property: STRING): BOOLEAN is
			-- Is `an_import_precedence' lower than the import precednece used when previously defining `a_property'?
		require
			valid_property_name: a_property /= Void and then a_property.count > 0
		do
			if precedence_property_map.has (a_property) then
				Result := an_import_precedence < precedence_property_map.item (a_property)
			end
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
			if string_property_map.has (Gexslt_character_representation_attribute) then
				Result := string_property_map.item (Gexslt_character_representation_attribute)
			else
				Result := default_character_representation
			end
		ensure
			character_representation_not_void: Result /= Void
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has a duplication error been reported?

	duplicate_attribute_name: STRING
			-- Name of attribute that caused a duplication error

feature -- Status setting

	set_duplication_error (an_attribute_name: STRING) is
			-- Indicate `an_attribute_name' is invalidly specified twice.
		require
			attribute_name_not_void: an_attribute_name /= Void and then an_attribute_name.count > 0
		do
			duplicate_attribute_name := an_attribute_name
			is_error := True
		ensure
			in_error: is_error
			name_set: STRING_.same_string (duplicate_attribute_name, an_attribute_name)
		end
		
feature -- Element change

	set_xml_defaults (an_import_precedence: INTEGER) is
			-- Set defaults suitable for xml method.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Method_attribute)
		do
			method := "xml"
			precedence_property_map.force (an_import_precedence, Method_attribute)
			default_indent := False
			default_version := "1.0"
			default_media_type := "text/xml"
			default_character_representation := "hex"
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_xml: STRING_.same_string (method, "xml")
			no_indentation: default_indent = False
			version_1_0: STRING_.same_string (default_version, "1.0")
			text_xml: STRING_.same_string (default_media_type, "text/xml")
			hex_character_representation: STRING_.same_string (default_character_representation, "hex")
		end

	set_html_defaults (an_import_precedence: INTEGER) is
			-- Set defaults suitable for html method.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Method_attribute)		
		do
			precedence_property_map.force (an_import_precedence, Method_attribute)
			method := "html"
			default_indent := True
			default_version := "4.01"
			default_media_type := "text/html"
			default_character_representation := "entity;decimal"
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_html: STRING_.same_string (method, "html")
			indentation: default_indent = True
			version_4_01: STRING_.same_string (default_version, "4.01")
			text_html: STRING_.same_string (default_media_type, "text/html")
			character_representation: STRING_.same_string (default_character_representation, "entity;decimal")			
		end

	set_xhtml_defaults (an_import_precedence: INTEGER) is
			-- Set defaults suitable for xhtml method.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Method_attribute)		
		do
			set_html_defaults (an_import_precedence)
			method := "xhtml"
			default_version := "1.0"
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_xhtml: STRING_.same_string (method, "xhtml")
			indentation: default_indent = True
			version_1_0: STRING_.same_string (default_version, "1.0")
			text_html: STRING_.same_string (default_media_type, "text/html")
			character_representation: STRING_.same_string (default_character_representation, "entity;decimal")	
		end

	set_text_defaults (an_import_precedence: INTEGER) is
			-- Set defaults suitable for text method.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Method_attribute)		
		do
			precedence_property_map.force (an_import_precedence, Method_attribute)
			method := "text"
			default_media_type := "text/plain"
		ensure
			import_precedence_set: precedence_property_map.has (Method_attribute) and then precedence_property_map.item (Method_attribute) = an_import_precedence
			method_is_text: STRING_.same_string (method, "text")
			text_plain: STRING_.same_string (default_media_type, "text/plain")
		end

	set_version (a_version: STRING; an_import_precedence: INTEGER) is
			--	Set `version'.
		require
			version_not_void: a_version /= Void -- and then
			higher_precedence: is_higher_precedence (an_import_precedence, Version_attribute)
		do
			precedence_property_map.force (an_import_precedence, Version_attribute)
			string_property_map.force (a_version, Version_attribute)
		ensure
			import_precedence_set: precedence_property_map.has (Version_attribute) and then precedence_property_map.item (Version_attribute) = an_import_precedence
			version_set: string_property_map.has (Version_attribute) and then STRING_.same_string (string_property_map.item (Version_attribute), a_version)
		end

	set_indent (an_indent_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `indent'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Indent_attribute)		
		do
			precedence_property_map.force (an_import_precedence, Indent_attribute)
			boolean_property_map.force (an_indent_value, Indent_attribute)
		ensure
			import_precedence_set: precedence_property_map.has (Indent_attribute) and then precedence_property_map.item (Indent_attribute) = an_import_precedence
			indent_set: boolean_property_map.has (Indent_attribute) and then boolean_property_map.item (Indent_attribute) = an_indent_value
		end

	set_omit_xml_declaration (an_omit_xml_declaration_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `omit_xml_declaration'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Omit_xml_declaration_attribute)	
		do
			precedence_property_map.force (an_import_precedence, Omit_xml_declaration_attribute)
			omit_xml_declaration := an_omit_xml_declaration_value
		ensure
			import_precedence_set: precedence_property_map.has (Omit_xml_declaration_attribute) and then precedence_property_map.item (Omit_xml_declaration_attribute) = an_import_precedence
			omit_xml_declaration_set: omit_xml_declaration = an_omit_xml_declaration_value
		end

	set_standalone (a_standalone_value: STRING; an_import_precedence: INTEGER) is
			-- Set `standalone'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Standalone_attribute)			
		do
			precedence_property_map.force (an_import_precedence, Standalone_attribute)
			standalone := a_standalone_value
		ensure
			import_precedence_set: precedence_property_map.has (Standalone_attribute) and then precedence_property_map.item (Standalone_attribute) = an_import_precedence
			standalone_set: standalone = a_standalone_value
		end

	set_indent_spaces (a_number: INTEGER; an_import_precedence: INTEGER) is
			-- Set `indent_spaces'
		require
			strictly_positive: a_number > 0
			higher_precedence: is_higher_precedence (an_import_precedence, Gexslt_indent_spaces_attribute)
		do
			precedence_property_map.force (an_import_precedence, Gexslt_indent_spaces_attribute)
			indent_spaces := a_number
		ensure
			import_precedence_set: precedence_property_map.has (Gexslt_indent_spaces_attribute) and then precedence_property_map.item (Gexslt_indent_spaces_attribute) = an_import_precedence
			indent_spaces_set: indent_spaces = a_number
		end

	set_encoding (an_encoding: STRING; an_import_precedence: INTEGER) is
			-- Set `encoding'.
		require
			encoding_not_void: encoding /= Void --and then encoding.count > 0
			higher_precedence: is_higher_precedence (an_import_precedence, Encoding_attribute)
		do
			precedence_property_map.force (an_import_precedence, Encoding_attribute)
			encoding := an_encoding
		ensure
			import_precedence_set: precedence_property_map.has (Encoding_attribute) and then precedence_property_map.item (Encoding_attribute) = an_import_precedence
			encoding_set: encoding = an_encoding
		end

	set_media_type (a_media_type: STRING; an_import_precedence: INTEGER) is
			-- Set `media_type'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Media_type_attribute)
			media_type_not_void: a_media_type /= Void --and then a_media_type.count > 0
		do
			precedence_property_map.force (an_import_precedence, Media_type_attribute)
			if not string_property_map.has (Media_type_attribute) then
				string_property_map.put (a_media_type, Media_type_attribute)
			end
		ensure
			import_precedence_set: precedence_property_map.has (Media_type_attribute) and then precedence_property_map.item (Media_type_attribute) = an_import_precedence
			media_type_set: STRING_.same_string (media_type , a_media_type)
		end

	set_doctype_system (a_system_id: STRING; an_import_precedence: INTEGER) is
			-- Set `doctype_system'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Doctype_system_attribute)
			doctype_system_not_void: a_system_id /= Void
		do
			precedence_property_map.force (an_import_precedence, Doctype_system_attribute)
			doctype_system := a_system_id
		ensure
			import_precedence_set: precedence_property_map.has (Doctype_system_attribute) and then precedence_property_map.item (Doctype_system_attribute) = an_import_precedence
			doctype_system_set: STRING_.same_string (a_system_id, doctype_system)
		end

	set_doctype_public (a_public_id: STRING; an_import_precedence: INTEGER) is
			-- Set `doctype_public'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Doctype_public_attribute)
			doctype_public_not_void: a_public_id /= Void
		do
			precedence_property_map.force (an_import_precedence, Doctype_public_attribute)
			doctype_public := a_public_id
		ensure
			import_precedence_set: precedence_property_map.has (Doctype_public_attribute) and then precedence_property_map.item (Doctype_public_attribute) = an_import_precedence
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

	set_undeclare_namespaces (an_undeclare_namespaces_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `undeclare_namespaces'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Undeclare_namespaces_attribute)
		do
			precedence_property_map.force (an_import_precedence, Undeclare_namespaces_attribute)
			undeclare_namespaces := an_undeclare_namespaces_value
		ensure
			import_precedence_set: precedence_property_map.has (Undeclare_namespaces_attribute) and then precedence_property_map.item (Undeclare_namespaces_attribute) = an_import_precedence
			undeclare_namespaces_set: undeclare_namespaces = an_undeclare_namespaces_value
		end

	set_character_representation (a_character_representation: STRING; an_import_precedence: INTEGER) is
			-- Set `character_representation'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Gexslt_character_representation_attribute)
			character_representation_not_void: a_character_representation /= Void
		do
			precedence_property_map.force (an_import_precedence, Gexslt_character_representation_attribute)
			if not string_property_map.has (Gexslt_character_representation_attribute) then
				string_property_map.put (a_character_representation, Gexslt_character_representation_attribute)
			end
		ensure
			import_precedence_set: precedence_property_map.has (Gexslt_character_representation_attribute) and then precedence_property_map.item (Gexslt_character_representation_attribute) = an_import_precedence
			media_type_set: STRING_.same_string (character_representation , a_character_representation)			
		end

	set_include_content_type (an_include_content_type_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `include_content_type'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Include_content_type_attribute)		
		do
			precedence_property_map.force (an_import_precedence, Include_content_type_attribute)
			include_content_type := an_include_content_type_value
		ensure
			import_precedence_set: precedence_property_map.has (Include_content_type_attribute) and then precedence_property_map.item (Include_content_type_attribute) = an_import_precedence
			include_content_type_set: include_content_type = an_include_content_type_value
		end

	set_escape_uri_attributes (an_escape_uri_attributes_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `escape_uri_attributes'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Escape_uri_attributes_attribute)
		do
			precedence_property_map.force (an_import_precedence, Escape_uri_attributes_attribute)
			escape_uri_attributes := an_escape_uri_attributes_value
		ensure
			import_precedence_set: precedence_property_map.has (Escape_uri_attributes_attribute) and then precedence_property_map.item (Escape_uri_attributes_attribute) = an_import_precedence
			escape_uri_attributes_set: escape_uri_attributes = an_escape_uri_attributes_value
		end
										
	set_byte_order_mark_required (an_byte_order_mark_required_value: BOOLEAN; an_import_precedence: INTEGER) is
			-- Set `byte_order_mark_required'.
		require
			higher_precedence: is_higher_precedence (an_import_precedence, Gexslt_byte_order_mark_attribute)			
		do
			precedence_property_map.force (an_import_precedence, Gexslt_byte_order_mark_attribute)
			byte_order_mark_required := an_byte_order_mark_required_value
		ensure
			import_precedence_set: precedence_property_map.has ( Gexslt_byte_order_mark_attribute) and then precedence_property_map.item ( Gexslt_byte_order_mark_attribute) = an_import_precedence
			byte_order_mark_required_set: byte_order_mark_required = an_byte_order_mark_required_value
		end
								
feature {NONE} -- Implementation

	string_property_map: DS_HASH_TABLE [STRING, STRING]
			-- Map of property names to string values

	boolean_property_map: DS_HASH_TABLE [BOOLEAN, STRING]
			-- Map of property names to boolean values

	precedence_property_map: DS_HASH_TABLE [INTEGER, STRING]
			-- Map of property names to import precedences

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
	string_property_map_not_void: string_property_map /= Void
	boolean_property_map_not_void: boolean_property_map /= Void
	precedence_property_map_not_void: precedence_property_map /= Void
	unique_property_names: True -- forall (a) string_property_map.has (a) implies not boolean_property_map.has (a) and vice-versa

end

