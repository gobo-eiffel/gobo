indexing

	description:

		"Warning: An attribute is obsoleted by an element"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING

inherit

	ET_XACE_WARNING

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; an_attribute_name: STRING; a_new_element: STRING; a_position: XM_POSITION) is
			-- Create a warning reporting that an attribute `an_attribute_name' of element `an_element'
			-- is obsoleted by an element `a_new_element'.
		require
			an_element_not_void: an_element /= Void
			a_new_element_not_void: a_new_element /= Void
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 4)
			parameters.put (an_element.name, 1)
			parameters.put (an_attribute_name, 2)
			parameters.put (a_new_element, 3)
			parameters.put (a_position.out, 4)
		end

feature -- Access

	default_template: STRING is "attribute '$2' of element <$1> at $4 is obsolete, use element $3 instead"
			-- Default template used to built the error message

	code: STRING is "XA0016"
			-- Error code

end
