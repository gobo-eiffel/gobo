indexing

	description: 

		"Callbacks for DTD declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_FORWARD_DTD_CALLBACKS

inherit

	XM_DTD_CALLBACKS_SOURCE

	XM_DTD_CALLBACKS
		export
			{NONE} all
		end

feature -- Set

	set_dtd_callbacks (a: XM_DTD_CALLBACKS) is
			-- Set
		do
			dtd_callbacks := a
		ensure then
			set: dtd_callbacks = a
		end

	dtd_callbacks: XM_DTD_CALLBACKS
			-- Callbacks event interface to which events are forwarded.
			-- If void, a null callback is created on startup.

feature {NONE} -- Document type definition callbacks

	on_doctype (name: UC_STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
			check_void
			dtd_callbacks.on_doctype (name, an_id, has_internal_subset)
		end

	on_element_declaration (a_name: UC_STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		do
			check_void
			dtd_callbacks.on_element_declaration (a_name, a_model)
		end

	on_attribute_declaration (an_element_name, a_name: UC_STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		do
			check_void
			dtd_callbacks.on_attribute_declaration (an_element_name, a_name, a_model)
		end

	on_entity_declaration (entity_name: UC_STRING; is_parameter: BOOLEAN; value: UC_STRING; 
			an_id: XM_DTD_EXTERNAL_ID; notation_name: UC_STRING) is
			 -- Entity declaration.
		do
			check_void
			dtd_callbacks.on_entity_declaration (entity_name, is_parameter, value, an_id, notation_name)
		end

	on_notation_declaration (notation_name: UC_STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
			check_void
			dtd_callbacks.on_notation_declaration (notation_name, an_id)
		end

feature {NONE} -- Implementation

	check_void is
			-- Initialise with DTD callbacks if no handler.
		do
			if dtd_callbacks = Void then
				!XM_DTD_CALLBACKS_NULL! dtd_callbacks.make
			end
		ensure
			not_void: dtd_callbacks /= Void
		end

end
