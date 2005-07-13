indexing

	description:

		"Null handler for document type definition callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_CALLBACKS_NULL

inherit

	XM_DTD_CALLBACKS

create

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing.
		do
		end

feature -- Document type definuition callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		do
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		do
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; notation_name: STRING) is
			-- Entity declaration.
		do
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
		end

	on_dtd_processing_instruction (a_name, a_content: STRING) is
			-- PI.
		do
		end

	on_dtd_comment (a_content: STRING) is
			-- Comment.
		do
		end

	on_dtd_end is
			-- End of DTD.
		do
		end
end
