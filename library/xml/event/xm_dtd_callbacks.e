note

	description:

		"Callbacks for DTD declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_DTD_CALLBACKS

feature -- Document type definition callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration (first event).
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			a_name_not_void: a_name /= Void
			a_model_not_void: a_model /= Void
		deferred
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			an_element_name_not_void: an_element_name /= Void
			a_name_not_void: a_name /= Void
			a_model_not_void: a_model /= Void
		deferred
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; notation_name: STRING) is
			-- Entity declaration.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			entity_name_not_void: entity_name /= Void
			--internal_entity implies value /= Void
			--external_entity implies an_id /= Void
			--unparsed_entity implies an_id /= Void and notation_name /= Void
		deferred
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			notation_name_not_void: notation_name /= Void
			id_not_void: an_id /= Void
		deferred
		end
		
	on_dtd_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction within DTD.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			name_not_void: a_name /= Void
			content_not_void: a_content /= Void
		deferred
		end

	on_dtd_comment (a_content: STRING) is
			-- Processing a comment within DTD.
			-- Atomic: single comment produces single event
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		require
			a_content_not_void: a_content /= Void
		deferred
		end

	on_dtd_end is
			-- End of DTD (last event in a document).
		deferred
		end
		
end
