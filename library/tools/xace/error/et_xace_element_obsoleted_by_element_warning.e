note

	description:

		"Warning: Element is obsoleted by another one"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING

inherit

	ET_XACE_WARNING

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; a_new_element: STRING; a_position: XM_POSITION)
			-- Create a warning reporting that an element `an_element'
			-- is obsoleted by an element `a_new_element'.
		require
			an_element_not_void: an_element /= Void
			a_new_element_not_void: a_new_element /= Void
			a_position_not_void: a_position /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (an_element.name, 1)
			parameters.put (a_new_element, 2)
			parameters.put (a_position.out, 3)
		end

feature -- Access

	default_template: STRING = "element <$1> at $3 is obsolete, use element $2 instead"
			-- Default template used to built the error message

	code: STRING = "XA0013"
			-- Error code

end
