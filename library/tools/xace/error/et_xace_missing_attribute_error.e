note

	description:

		"Error: Missing child attribute in element error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MISSING_ATTRIBUTE_ERROR

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_containing_element: XM_ELEMENT; an_attribute_name: STRING; a_position: XM_POSITION)
			-- Create an error reporting that attribute `an_attribute_name'
			-- is missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 3)
			parameters.put (a_containing_element.name, 1)
			parameters.put (an_attribute_name, 2)
			parameters.put (a_position.out, 3)
		end

feature -- Access

	default_template: STRING = "element '$1' must have attribute '$2' $3"
			-- Default template used to built the error message

	code: STRING = "XA0003"
			-- Error code

end
