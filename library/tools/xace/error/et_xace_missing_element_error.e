indexing

	description:

		"Error: Missing child element in element error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MISSING_ELEMENT_ERROR

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_containing_element: XM_ELEMENT; an_element_name: STRING; a_position: XM_POSITION) is
			-- Create an error reporting that element `an_element_name'
			-- is missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: an_element_name.count > 0
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 3)
			parameters.put (a_containing_element.name, 1)
			parameters.put (an_element_name, 2)
			parameters.put (a_position.out, 3)
		end

feature {ANY} -- Access

	default_template: STRING is "element '$1' must have child-element '$2' $3"
			-- Default template used to built the error message

	code: STRING is "XA0002"
			-- Error code

end
