note

	description:

		"Callbacks for DTD declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_FORWARD_DTD_CALLBACKS

inherit

	XM_DTD_CALLBACKS_SOURCE

	XM_DTD_CALLBACKS

feature -- Access

	dtd_callbacks: XM_DTD_CALLBACKS
			-- Callbacks event interface to which events are forwarded;
			-- Null DTD callbacks by default

feature -- Setting

	set_dtd_callbacks (a_callbacks: like dtd_callbacks)
			-- Set `dtd_callbacks' to `a_callbacks'.
		do
			dtd_callbacks := a_callbacks
		ensure then
			dtd_callbacks_set: dtd_callbacks = a_callbacks
		end

feature {NONE} -- Document type definition callbacks

	on_doctype (name: STRING; an_id: detachable XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN)
			-- Document type declaration.
		do
			dtd_callbacks.on_doctype (name, an_id, has_internal_subset)
		ensure then
			dtd_callbacks_not_void: dtd_callbacks /= Void
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT)
			-- Element declaration.
		do
			dtd_callbacks.on_element_declaration (a_name, a_model)
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT)
			-- Attribute declaration, one event per attribute.
		do
			dtd_callbacks.on_attribute_declaration (an_element_name, a_name, a_model)
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: detachable STRING;
		an_id: detachable XM_DTD_EXTERNAL_ID; notation_name: detachable STRING)
			-- Entity declaration.
		do
			dtd_callbacks.on_entity_declaration (entity_name, is_parameter, value, an_id, notation_name)
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID)
			-- Notation declaration.
		do
			dtd_callbacks.on_notation_declaration (notation_name, an_id)
		end

	on_dtd_processing_instruction (a_name, a_content: STRING)
			-- Forward PI.
		do
			dtd_callbacks.on_dtd_processing_instruction (a_name, a_content)
		end

	on_dtd_comment (a_content: STRING)
			-- Forward comment.
		do
			dtd_callbacks.on_dtd_comment (a_content)
		end

	on_dtd_end
			-- End of DTD.
		do
			dtd_callbacks.on_dtd_end
		end

invariant

	dtd_callbacks_not_void: dtd_callbacks /= Void

end
