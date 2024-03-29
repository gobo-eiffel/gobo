﻿note

	description:

		"Error: Expected non-empty value in attribute error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"

class ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; an_attribute_name: STRING; a_position: XM_POSITION)
			-- Create an error reporting that the value of attribute `an_attribute_name'
			-- in element `an_element' should be a non-empty value.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			a_position_not_void: a_position /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (an_element.name, 1)
			parameters.put (an_attribute_name, 2)
			parameters.put (a_position.out, 3)
		end

feature -- Access

	default_template: STRING = "attribute '$2' in element '$1' should have a non-empty value $3"
			-- Default template used to built the error message

	code: STRING = "XA0006"
			-- Error code

end
