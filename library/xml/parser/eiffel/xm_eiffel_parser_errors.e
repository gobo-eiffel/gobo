indexing

	description:

		"Error messages for parser (can be used as enumeration)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_PARSER_ERRORS

feature -- Scanner errors

	Error_no_cdata_end_in_content: STRING is "]]> not allowed in content"
	Error_no_dash_dash_in_comment: STRING is "-- not allowed in comment"
	Error_xml_not_allowed_pi_name: STRING is "x-m-l not allowed as start of processing instruction name"
	Error_lt_not_allowed_attribute_value: STRING is "< not allowed in attribute value"
	Error_invalid_entity_characters: STRING is "invalid characters in entity reference"
	Error_unexpected_character: STRING is "unexpected character"
	Error_unsupported_encoding: STRING is "unsupported character encoding"

feature -- Parser errors

	Error_cannot_read_file: STRING is "Cannot read file"
	Error_cannot_open_external_dtd: STRING is "Cannot read external dtd file"

	Error_incorrect_unsupported_version: STRING is "XML version misformed or not 1.0"
	Error_stand_alone_attribute: STRING is "Invalid standalone attribute in XML declaration"
	Error_invalid_numeric_entity_code: STRING is "Numeric entity code is not XML character"
	Error_unexpected_misc: STRING is "Unexpected construct in prolog or trailer"
	Error_misplaced_dtd_declaration: STRING is "Misplaced markup declaration"
	Error_xml_declaration: STRING is "Misformed XML Declaration"
	Error_prolog: STRING is "Misformed document prolog"
	Error_start_tag: STRING is "Misformed start tag"
	Error_element_content: STRING is "Error in element content"
	Error_element_end_tag: STRING is "Missing element end tag"
	Error_attribute_value: STRING is "Missing or misformed attribute value"
	Error_attribute_equal: STRING is "Missing attribute equal sign"
	Error_attribute: STRING is "Misformed attribute in tag"
	Error_attribute_duplicate: STRING is "Attribute declared twice"
	Error_end_tag: STRING is "Error in end tag"
	Error_end_tag_mismatch: STRING is "End tag does not match start tag"

	Error_entity_unresolved_external: STRING is "Unresolved external entity"
	Error_entity_xml_declaration: STRING is "Error in XML declaration"
	Error_entity_literal_in_attribute: STRING is "Literal entity expected in attribute"
	Error_entity_undefined: STRING is "Entity is not defined"

	Error_external_reference_in_quoted_value: STRING is "External reference in quoted value"
	Error_recursive_entity: STRING is "Entity cannot be recursively included"

	Error_doctype_declaration: STRING is "Misformed DOCTYPE declaration"
	Error_doctype_entity_defined_twice: STRING is "Entity defined twice"
	Error_doctype_external_no_resolver: STRING is "Parser is not configured to support external DTDs"
	Error_doctype_undefined_pe_entity: STRING is "Undefined PE entity"
	Error_doctype_element: STRING is "Misformed element type declaration"
	Error_doctype_attribute: STRING is "Misformed attribute list declaration"
	Error_doctype_attribute_item: STRING is "Misformed attribute definition declaration"
	Error_doctype_entity: STRING is "Misformed entity declaration"
	Error_doctype_notation: STRING is "Misformed entity notation"
	Error_doctype_conditional_section: STRING is "Misformed conditional section"
	Error_doctype_peref_only_in_dtd: STRING is "PE reference only allowed in DTD"

	Error_pi_xml_reserved: STRING is "xml prefix reserved in processing instruction"
	Error_unicode_invalid_character: STRING is "Unexpected unicode character"

	Error_namespaces_name_misformed: STRING is "Name misformed"
	Error_namespaces_undeclared: STRING is "Undeclared namespace"

	Error_markup_declaration_in_prolog: STRING is "Markup declaration in prolog"
	Error_markup_in_external_dtd: STRING is "Markup in external DTD"
	Error_cannot_parse_external_dtd: STRING is "Cannot parse external DTD"
	
	Error_unicode_in_ascii_string_mode: STRING is "Unexpected non-ASCII character in ASCII-only mode"
	Error_unicode_in_latin1_string_mode: STRING is "Unexpected non-latin1 character in latin1-only mode"
	Error_unicode_invalid_utf8: STRING is "Invalid UTF8 character sequence"
end
