indexing

    description:

        "Class for parsing XML documents"

    status:  "See notice at end of class."
    author:  "Andreas Leitner"

class XM_EVENT_PARSER

inherit

    XM_PARSER
        undefine
            make_from_implementation
        redefine
            implementation
        end

    DP_INTERFACE
        redefine
            implementation
        end

creation

    make_from_implementation

feature {DP_CALLBACK_IMPLEMENTATION} -- Redefinable callbacks

    on_element_declaration (name: UC_STRING) is
            -- note: I removed `model' from the arguments list since it's type (POINTER) is totaly inapropriate
            -- have to look at the specs (and expat) to see how we can
            -- handle this
        require
            valid_name: name /= Void and not name.empty
            -- valid_model: model /= default_pointer
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_attribute_declaration (element_name, attribute_name, attribute_type, default_value: UC_STRING; is_required: BOOLEAN) is
        require
            valid_element: element_name /= Void and not element_name.empty
            valid_attribute: attribute_name /= Void and not attribute_name.empty
            valid_type: attribute_type /= Void and not attribute_type.empty
            valid_default: default_value = Void or else not default_value.empty
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_xml_declaration (xml_version, encoding: UC_STRING; is_standalone: BOOLEAN) is
        require
            valid_version: xml_version /= Void
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_entity_declaration (entity_name: UC_STRING; is_parameter_entity: BOOLEAN; value: UC_STRING; value_length: INTEGER; base, system_id, public_id, notation_name: UC_STRING) is
            -- TODO: lookup `value_length' in the specs and see if it is
            -- really needed.
        require
            valid_entity: entity_name /= Void and not entity_name.empty
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_start_tag (name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
            -- called whenever the parser findes a start element
            -- TODO: explain attributes
            -- TODO: better make it a DS_TRIPPLE
        require
            name_not_void: name /= Void
        do
                -- inherit from this class and redefine this feature handle
                -- this event.
        end

    on_end_tag (name, ns_prefix: UC_STRING) is
            -- called whenever the parser findes an end element
        require
            name_not_void: name /= Void
        do
                -- inherit from this class and redefine this feature handle
                -- this event.
        end

    on_content (chr_data: UC_STRING) is
            -- called whenever the parser findes character data
        require
            chr_data_not_void: chr_data /= Void
        do
                -- inherit from this class and redefine this feature handle
                -- this event.
        end

    on_processing_instruction (target, data: UC_STRING) is
            -- called whenever the parser findes a proccessing instruction.
        require
            target_not_void: target /= Void
            data_not_void: data /= Void
        do
                -- inherit from this class and redefine this feature handle
                -- this event.
        end

    on_comment (com: UC_STRING) is
            -- called whenever the parser findes a comment.
        require
            com_not_void: com /= Void
        do
                -- inherit from this class and redefine this feature handle
                -- this event.
        end

    on_start_cdata_section is
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_end_cdata_section is
        do
                -- inherit from this class and redefine this feature to
                -- handle this event.
        end

    on_default (data: UC_STRING) is
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
            -- This is called for the start of the DOCTYPE declaration, before
            -- any DTD or internal subset is parsed.
        require
            valid_name: name /= Void
        do
                -- inherit from this class and redefine this feature
                -- to handle this event.
        end

    on_end_doctype is
            -- This is called for the start of the DOCTYPE declaration when the
            -- closing > is encountered, but after processing any external subset.
        do
                -- inherit from this class and redefine this feature
                -- to handle this event.
        end

    on_notation_declaration (notation_name, base, system_id, public_id: UC_STRING) is
        require
            valid_notation: notation_name /= Void and not notation_name.empty
        do
                -- inherit from this class and redefine this feature
                -- to handle this event.
        end

    on_start_namespace_declaration (namespace_prefix, uri: UC_STRING) is
        do
                -- inherit from this class and redefine this feature
                -- to handle this event.
        end

    on_end_namespace_declaration (namespace_prefix: UC_STRING) is
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

end -- class XM_EVENT_PARSER

