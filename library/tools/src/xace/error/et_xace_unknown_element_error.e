note

	description:

		"Error: Unknown child element in element error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_UNKNOWN_ELEMENT_ERROR

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_containing_element: XM_ELEMENT; an_element: XM_ELEMENT; a_position: XM_POSITION)
			-- Create an error reporting that element `an_element'
			-- is not expected in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_not_void: an_element /= Void
			a_position_not_void: a_position /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (a_containing_element.name, 1)
			parameters.put (an_element.name, 2)
			parameters.put (a_position.out, 3)
		end

feature -- Access

	default_template: STRING = "found unknown element '$2' in element '$1' $3"
			-- Default template used to built the error message

	code: STRING = "XA0004"
			-- Error code

end
