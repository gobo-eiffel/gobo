indexing

	description:

		"Error: Expected boolean value in attribute error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_BOOLEAN_EXPECTED_ERROR

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; an_attribute_name: STRING; an_actual_value: STRING; a_position: XM_POSITION) is
			-- Create an error reporting that the value of attribute `an_attribute_name'
			-- in element `an_element' should be a boolean value.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			an_actual_value_not_void: an_actual_value /= Void
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 4)
			parameters.put (an_element.name, 1)
			parameters.put (an_attribute_name, 2)
			parameters.put (an_actual_value, 3)
			parameters.put (a_position.out, 4)
		end

feature -- Access

	default_template: STRING is "attribute '$2' in element '$1' should have a boolean value $4"
			-- Default template used to built the error message

	code: STRING is "XA0005"
			-- Error code

end
