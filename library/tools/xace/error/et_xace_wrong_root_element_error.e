indexing

	description:

		"Error: Wrong root element in Xace file"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_WRONG_ROOT_ELEMENT_ERROR

inherit

	ET_XACE_ERROR

creation

	make

feature {NONE} -- Initialization

	make (an_element_name: UC_STRING; a_position: XM_POSITION) is
			-- Create a new error reporting that Xace file does not
			-- contain the expected root element `an_element_name'.
		require
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: not an_element_name.empty
			a_position_not_void: a_position /= Void
		do
			!! parameters.make (1, 2)
			parameters.put (an_element_name.to_utf8, 1)
			parameters.put (a_position.out, 2)
		end

feature -- Access

	default_template: STRING is "Xace document must have a '$1' root-element $2"
			-- Default template used to built the error message

	code: STRING is "XA0001"
			-- Error code

end -- class ET_XACE_WRONG_ROOT_ELEMENT_ERROR
