note

	description:

		"Error messages for parser (can be used as enumeration)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

class XM_EIFFEL_PARSER_ERRORS

feature -- Scanner errors

	Error_no_cdata_end_in_content: STRING = "]]> not allowed in content"
	Error_no_dash_dash_in_comment: STRING = "-- not allowed in comment"
	Error_xml_not_allowed_pi_name: STRING = "x-m-l not allowed as start of processing instruction name"
	Error_lt_not_allowed_attribute_value: STRING = "< not allowed in attribute value"
	Error_invalid_entity_characters: STRING = "invalid characters in entity reference"
	Error_unexpected_character: STRING = "unexpected character"
	Error_unsupported_encoding: STRING = "unsupported character encoding"

feature -- Parser errors

	Error_cannot_read_file: STRING = "Cannot read file"
	Error_cannot_open_external_dtd: STRING = "Cannot read external dtd file"

	Error_incorrect_unsupported_version: STRING = "XML version misformed or not 1.0"
	Error_stand_alone_attribute: STRING = "Invalid standalone attribute in XML declaration"
	Error_invalid_numeric_entity_code: STRING = "Numeric entity code is not XML character"
	Error_unexpected_misc: STRING = "Unexpected construct in prolog or trailer"
	Error_misplaced_dtd_declaration: STRING = "Misplaced markup declaration"
	Error_xml_declaration: STRING = "Misformed XML Declaration"
	Error_prolog: STRING = "Misformed document prolog"
	Error_start_tag: STRING = "Misformed start tag"
	Error_element_content: STRING = "Error in element content"
	Error_element_end_tag: STRING = "Missing element end tag"
	Error_attribute_value: STRING = "Missing or misformed attribute value"
	Error_attribute_equal: STRING = "Missing attribute equal sign"
	Error_attribute: STRING = "Misformed attribute in tag"
	Error_attribute_duplicate: STRING = "Attribute declared twice"
	Error_end_tag: STRING = "Error in end tag"
	Error_end_tag_mismatch: STRING = "End tag does not match start tag"

	Error_entity_unresolved_external: STRING = "Unresolved external entity"
	Error_entity_xml_declaration: STRING = "Error in XML declaration"
	Error_entity_literal_in_attribute: STRING = "Literal entity expected in attribute"
	Error_entity_undefined: STRING = "Entity is not defined"

	Error_external_reference_in_quoted_value: STRING = "External reference in quoted value"
	Error_recursive_entity: STRING = "Entity cannot be recursively included"

	Error_doctype_declaration: STRING = "Misformed DOCTYPE declaration"
	Error_doctype_entity_defined_twice: STRING = "Entity defined twice"
	Error_doctype_external_no_resolver: STRING = "Parser is not configured to support external DTDs"
	Error_doctype_undefined_pe_entity: STRING = "Undefined PE entity"
	Error_doctype_element: STRING = "Misformed element type declaration"
	Error_doctype_attribute: STRING = "Misformed attribute list declaration"
	Error_doctype_attribute_item: STRING = "Misformed attribute definition declaration"
	Error_doctype_entity: STRING = "Misformed entity declaration"
	Error_doctype_notation: STRING = "Misformed entity notation"
	Error_doctype_conditional_section: STRING = "Misformed conditional section"
	Error_doctype_peref_only_in_dtd: STRING = "PE reference only allowed in DTD"

	Error_pi_xml_reserved: STRING = "xml prefix reserved in processing instruction"
	Error_unicode_invalid_character: STRING = "Unexpected unicode character"

	Error_namespaces_name_misformed: STRING = "Name misformed"
	Error_namespaces_undeclared: STRING = "Undeclared namespace"

	Error_markup_declaration_in_prolog: STRING = "Markup declaration in prolog"
	Error_markup_in_external_dtd: STRING = "Markup in external DTD"
	Error_cannot_parse_external_dtd: STRING = "Cannot parse external DTD"

	Error_unicode_in_ascii_string_mode: STRING = "Unexpected non-ASCII character in ASCII-only mode"
	Error_unicode_in_latin1_string_mode: STRING = "Unexpected non-latin1 character in latin1-only mode"
	Error_unicode_invalid_utf8: STRING = "Invalid UTF8 character sequence"
end
