indexing

	description:

		"XML event based parser. Inherit and redefine the notifiers to use this parser"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_EVENT_PARSER

inherit

	XI_PARSER
		undefine
			implement, can_implement
		redefine
			last_error, last_error_description
		end

	DP_CALLBACK_IMPLEMENTATION
		redefine
			interface
		end

feature {ANY} -- Status

	last_error: INTEGER is
			-- See XM_PARSE_ERROR_CODES.
		deferred
		end

	last_error_description: STRING is
			-- Returns a text that explain what the error reported by
			-- `last_error' was all about.
		deferred
		end

feature {NONE} -- Redefinable callbacks

	on_element_declaration (name: UC_STRING) is
			-- Called for an XML element declaration (DTD)
		require
			valid_name: name /= Void and name.count > 0
			-- valid_model: model /= default_pointer
		do
			interface.on_element_declaration (name)
		end

	on_attribute_declaration (element_name, attribute_name, attribute_type, default_value: UC_STRING; is_required: BOOLEAN) is
			-- Called for an XML attribute declaration (DTD)
		do
			interface.on_attribute_declaration (element_name, attribute_name, attribute_type, default_value, is_required)
		end

	on_xml_declaration (xml_version, encoding: UC_STRING; standalone: BOOLEAN) is
			-- Called for an XML xml declaration (DTD)
		do
			interface.on_xml_declaration (xml_version, encoding, standalone)
		end

	on_entity_declaration (entity_name: UC_STRING; is_parameter_entity: BOOLEAN; value: UC_STRING; value_length: INTEGER; base, system_id, public_id, notation_name: UC_STRING) is
			-- Called for an XML entity declaration (DTD)
		do
			interface.on_entity_declaration (entity_name, is_parameter_entity, value, value_length, base, system_id, public_id, notation_name)
		end

	on_start_tag (name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
			-- Called whenever the parser findes a start element
		require
			name_not_void: name /= Void
		do
			interface.on_start_tag (name, ns_prefix, attributes)
		end

	on_end_tag (name, ns_prefix: UC_STRING) is
			-- Called whenever the parser findes an end element
		require
			name_not_void: name /= Void
		do
			interface.on_end_tag (name, ns_prefix)
		end

	on_content (chr_data: UC_STRING) is
			-- Called whenever the parser findes character data
		require
			chr_data_not_void: chr_data /= Void
		do
			interface.on_content (chr_data)
		end

	on_processing_instruction (target, data: UC_STRING) is
			-- Called whenever the parser findes a proccessing instruction.
		require
			target_not_void: target /= Void
			data_not_void: data /= Void
		do
			interface.on_processing_instruction (target, data)
		end

	on_comment (com: UC_STRING) is
			-- Called whenever the parser findes a comment.
		require
			com_not_void: com /= Void
		do
			interface.on_comment (com)
		end

	on_start_cdata_section is
			-- Called when the parser finds the beginning of a cdata section
		do
			interface.on_start_cdata_section
		end

	on_end_cdata_section is
			-- Called when the parser finds the end of a cdata section
		do
			interface.on_end_cdata_section
		end

	on_default (data: UC_STRING) is
			-- Called if the parser finds something that does not fit 
			-- into for any of the other callbacks
		do
			interface.on_default (data)
		end

	on_default_expanded (data: UC_STRING) is
		do
			interface.on_default_expanded (data)
		end

	on_start_doctype (name, system_id, public_id: UC_STRING; has_internal_subset: BOOLEAN) is
			-- Called for the start of the DOCTYPE declaration, before
			-- any DTD or internal subset is parsed.
		require
			valid_name: name /= Void
		do
			interface.on_start_doctype (name, system_id, public_id, has_internal_subset)
		end

	on_end_doctype is
			-- Called for the start of the DOCTYPE declaration when the
			-- closing > is encountered, but after processing any external subset.
		do
			interface.on_end_doctype
		end

	on_notation_declaration (notation_name, base, system_id, public_id: UC_STRING) is
			-- Called when the parser finds a XML notation declaration
		do
			interface.on_notation_declaration (notation_name, base, system_id, public_id)
		end

	on_start_namespace_declaration (namespace_prefix, uri: UC_STRING) is
			-- Called when the parser finds the beginning of a 
			-- namespace declaration
		do
			interface.on_start_namespace_declaration (namespace_prefix, uri)
		end

	on_end_namespace_declaration (namespace_prefix: UC_STRING) is
			-- Called when the parser finds the end of a namespace declaration
		do
			interface.on_end_namespace_declaration (namespace_prefix)
		end

	on_not_standalone: BOOLEAN is
		do
			Result := interface.on_not_standalone
		end

feature {NONE} -- Implementation

	interface: XM_EVENT_PARSER

end -- class XI_EVENT_PARSER

