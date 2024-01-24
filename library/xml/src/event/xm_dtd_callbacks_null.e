note

	description:

		"Null handler for document type definition callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

class XM_DTD_CALLBACKS_NULL

inherit

	XM_DTD_CALLBACKS

create

	make

feature {NONE} -- Initialization

	make
			-- Do nothing.
		do
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize current DTD callbacks.
		do
		end

feature -- Document type definuition callbacks

	on_doctype (a_name: STRING; an_id: detachable XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN)
			-- Document type declaration.
		do
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT)
			-- Element declaration.
		do
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT)
			-- Attribute declaration, one event per attribute.
		do
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: detachable STRING;
		an_id: detachable XM_DTD_EXTERNAL_ID; notation_name: detachable STRING)
			-- Entity declaration.
		do
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID)
			-- Notation declaration.
		do
		end

	on_dtd_processing_instruction (a_name, a_content: STRING)
			-- PI.
		do
		end

	on_dtd_comment (a_content: STRING)
			-- Comment.
		do
		end

	on_dtd_end
			-- End of DTD.
		do
		end

end
