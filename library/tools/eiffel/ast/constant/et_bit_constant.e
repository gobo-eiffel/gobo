indexing

	description:

		"Eiffel bit constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_BIT_CONSTANT

inherit

	ET_CONSTANT

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Bit constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-1]+[bB]
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_literal: like literal; a_line, a_column: INTEGER) is
			-- Create a new Bit constant at given position.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-1]+[bB]
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			literal := a_literal
			make_leaf_with_position (a_line, a_column)
		ensure
			literal_set: literal = a_literal
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = no_line
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = no_column
		end

feature -- Access

	literal: STRING
			-- Literal bit value

invariant

	literal_not_void: literal /= Void
	-- valid_literal: regexp: [0-1]+[bB]

end -- class ET_BIT_CONSTANT
