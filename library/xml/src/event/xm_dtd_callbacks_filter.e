﻿note

	description:

		"DTD event filter that can forward events to 'next' filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"

class XM_DTD_CALLBACKS_FILTER

inherit

	XM_DTD_CALLBACKS

	XM_DTD_CALLBACKS_SOURCE
		rename
			set_dtd_callbacks as set_next
		end

create

	make_next,
	make_null

feature  {NONE} -- Initialization

	make_next (a_next: like next)
			-- Create a new DTD event filter with `a_next' as next filter.
		require
			a_next_not_void: a_next /= Void
		do
			initialize
			set_next (a_next)
		ensure
			next_set: next = a_next
		end

	make_null
			-- Next is null processor.
		do
			make_next (null_dtd_callbacks)
		end

	initialize
			-- Initialize current DTD callbacks.
		do
		end

feature -- Document type definition callbacks

	on_doctype (a_name: STRING; an_id: detachable XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN)
			-- Document type declaration.
		do
			next.on_doctype (a_name, an_id, has_internal_subset)
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT)
		do
			next.on_element_declaration (a_name, a_model)
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT)
			-- Attribute declaration, one event per attribute.
		do
			next.on_attribute_declaration (an_element_name, a_name, a_model)
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: detachable STRING;
		an_id: detachable XM_DTD_EXTERNAL_ID; notation_name: detachable STRING)
			-- Entity declaration.
		do
			next.on_entity_declaration (entity_name, is_parameter, value, an_id, notation_name)
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID)
			-- Notation declaration.
		do
			next.on_notation_declaration (notation_name, an_id)
		end

	on_dtd_processing_instruction (a_name, a_content: STRING)
			-- PI.
		do
			next.on_dtd_processing_instruction (a_name, a_content)
		end

	on_dtd_comment (a_content: STRING)
			-- Comment.
		do
			next.on_dtd_comment (a_content)
		end

	on_dtd_end
			-- End of DTD.
		do
			next.on_dtd_end
		end

feature -- Access

	next: XM_DTD_CALLBACKS
			-- Receiver for forwarded events

	set_next (a_next: like next)
			-- Set receiver of forwarded events.
		do
			next := a_next
		ensure then
			next_set: next = a_next
		end

invariant

	next_not_void: next /= Void

end
