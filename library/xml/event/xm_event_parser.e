indexing

	description:

		"XML event based parser. Inherit and redefine the notifiers to use this parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EVENT_PARSER

obsolete "Use XM_EIFFEL_PARSER or XM_EXPAT_PARSER(_FACTORY)"

inherit

	XM_BRIDGED_PARSER
		redefine
			implementation
		end

creation

	make_from_implementation

feature {DP_CALLBACK_IMPLEMENTATION} -- Redefinable callbacks

	on_element_declaration (name: UC_STRING; model: POINTER) is
			-- Called for an XML element declaration (DTD)
		require
			valid_name: name /= Void and name.count > 0
			valid_model: model /= default_pointer
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_attribute_declaration (element_name, attribute_name, attribute_type, default_value: UC_STRING; is_required: BOOLEAN) is
			-- Called for an XML attribute declaration (DTD)
		require
			valid_element: element_name /= Void and element_name.count > 0
			valid_attribute: attribute_name /= Void and attribute_name.count > 0
			valid_type: attribute_type /= Void and attribute_type.count > 0
			valid_default: default_value = Void or else default_value.count > 0
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_xml_declaration (xml_version, encoding: UC_STRING; is_standalone: BOOLEAN) is
			-- Called for an XML xml declaration (DTD)
		require
			valid_version: xml_version /= Void
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_entity_declaration (entity_name: UC_STRING; is_parameter_entity: BOOLEAN; value: UC_STRING; value_length: INTEGER; base, system_id, public_id, notation_name: UC_STRING) is
			-- Called for an XML entity declaration (DTD)
		require
			valid_entity: entity_name /= Void and entity_name.count > 0
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_start_tag (name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
			-- Called whenever the parser findes a start element
		require
			name_not_void: name /= Void
		do
			-- inherit from this class and redefine this feature handle
			-- this event.
		end

	on_end_tag (name, ns_prefix: UC_STRING) is
			-- Called whenever the parser findes an end element
		require
			name_not_void: name /= Void
		do
			-- inherit from this class and redefine this feature handle
			-- this event.
		end

	on_content (chr_data: UC_STRING) is
			-- Called whenever the parser findes character data
		require
			chr_data_not_void: chr_data /= Void
		do
			-- inherit from this class and redefine this feature handle
			-- this event.
		end

	on_processing_instruction (target, data: UC_STRING) is
			-- Called whenever the parser findes a proccessing instruction.
		require
			target_not_void: target /= Void
			data_not_void: data /= Void
		do
			-- inherit from this class and redefine this feature handle
			-- this event.
		end

	on_comment (com: UC_STRING) is
			-- Called whenever the parser findes a comment.
		require
			com_not_void: com /= Void
		do
			-- inherit from this class and redefine this feature handle
			-- this event.
		end

	on_start_cdata_section is
			-- Called when the parser finds the beginning of a cdata section
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_end_cdata_section is
			-- Called when the parser finds the end of a cdata section
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_default (data: UC_STRING) is
			-- Called if the parser finds something that does not fit
			-- into for any of the other callbacks
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_default_expanded (data: UC_STRING) is
		do
			-- inherit from this class and redefine this feature to
			-- handle this event.
		end

	on_start_doctype (name, system_id, public_id: UC_STRING; has_internal_subset: BOOLEAN) is
			-- Called for the start of the DOCTYPE declaration, before
			-- any DTD or internal subset is parsed.
		require
			valid_name: name /= Void
		do
			-- inherit from this class and redefine this feature
			-- to handle this event.
		end

	on_end_doctype is
			-- Called for the start of the DOCTYPE declaration when the
			-- closing > is encountered, but after processing any external subset.
		do
			-- inherit from this class and redefine this feature
			-- to handle this event.
		end

	on_notation_declaration (notation_name, base, system_id, public_id: UC_STRING) is
			-- Called when the parser finds a XML notation declaration
		require
			valid_notation: notation_name /= Void and notation_name.count > 0
		do
			-- inherit from this class and redefine this feature
			-- to handle this event.
		end

	on_start_namespace_declaration (namespace_prefix, uri: UC_STRING) is
			-- Called when the parser finds the beginning of a
			-- namespace declaration
		do
			-- inherit from this class and redefine this feature
			-- to handle this event.
		end

	on_end_namespace_declaration (namespace_prefix: UC_STRING) is
			-- Called when the parser finds the end of a namespace declaration
		do
			-- inherit from this class and redefine this feature
			-- to handle this event.
		end

	on_not_standalone: BOOLEAN is
		do
				-- inherit from this class and redefine this feature
				-- to handle this event.
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_EVENT_PARSER

end
