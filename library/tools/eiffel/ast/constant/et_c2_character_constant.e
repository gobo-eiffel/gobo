indexing

	description:

		"Eiffel character constants of the form '%%A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_C2_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_value: CHARACTER) is
			-- Create a new character constant.
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_value: CHARACTER; a_line, a_column: INTEGER) is
			-- Create a new character constant at given position.
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			value := a_value
			make_leaf_with_position (a_line, a_column)
		ensure
			value_set: value = a_value
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = no_line
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = no_column
		end

feature -- Access

	value: CHARACTER
			-- Character value

end
