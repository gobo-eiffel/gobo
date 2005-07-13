indexing

	description:

		"Error: Wrong attribute value error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR

inherit

	ET_XACE_ERROR
	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; an_attribute_name: STRING; an_actual_value: STRING;
		an_expected_values: DS_LINEAR [STRING]; a_position: XM_POSITION) is
			-- Create an error reporting that the value `an_actual_value' of
			-- attribute `an_attribute_name' in element `an_element' should be
			-- one of the `an_expected_values'.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			an_actual_value_not_void: an_actual_value /= Void
			an_expected_values_not_void: an_expected_values /= Void
			an_expected_values_not_empty: not an_expected_values.is_empty
			no_void_expected_value: not an_expected_values.has (Void)
			a_position_not_void: a_position /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_string: STRING
		do
			create parameters.make (1, 5)
			parameters.put (an_element.name, 1)
			parameters.put (an_attribute_name, 2)
			parameters.put (an_actual_value, 3)
			from
				a_cursor := an_expected_values.new_cursor
				a_cursor.start
				create a_string.make (50)
				a_string.append_character ('%'')
				a_string := STRING_.appended_string (a_string, a_cursor.item)
				a_string.append_character ('%'')
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", %'")
				a_string := STRING_.appended_string (a_string, a_cursor.item)
				a_string.append_character ('%'')
				a_cursor.forth
			end
			parameters.put (a_string, 4)
			parameters.put (a_position.out, 5)
		end

feature -- Access

	default_template: STRING is "attribute '$2' in element '$1' should have one of the following values: $4 $5"
			-- Default template used to built the error message

	code: STRING is "XA0010"
			-- Error code

end
