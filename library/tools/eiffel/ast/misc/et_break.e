indexing

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BREAK

inherit

	ET_COMPRESSED_POSITION
		rename
			make as old_make_with_position,
			make_default as old_make
		end

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_text: like text) is
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
			old_make
		ensure
			text_set: text = a_text
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_text: like text; a_line, a_column: INTEGER) is
			-- Create a new break at given position.
		require
			a_text_not_void: a_text /= Void
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			text := a_text
			old_make_with_position (a_line, a_column)
		ensure
			text_set: text = a_text
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = no_line
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = no_column
		end

feature -- Access

	text: STRING
			-- Text of break

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := Current
		end

invariant

	text_not_void: text /= Void

end
