indexing

	description:

		"Eiffel tokens"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_text: like text) is
			-- Create a new token.
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			text := a_text
			make_leaf
		ensure
			text_set: text = a_text
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_text: like text; a_line, a_column: INTEGER) is
			-- Create a new token at given position.
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			text := a_text
			make_leaf_with_position (a_line, a_column)
		ensure
			text_set: text = a_text
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = no_line
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = no_column
		end

feature -- Access

	text: STRING
			-- Text of token

invariant

	text_not_void: text /= Void
	text_not_empty: text.count > 0

end
