indexing

	description:

		"Eiffel character constants of the form '%%/code/'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_C3_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new character constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: ([0-9]+).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_literal: like literal; a_line, a_column: INTEGER) is
			-- Create a new character constant at given position.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
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
			-- Literal value of character code

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_c3_character_constant (Current)
		end

invariant

	literal_not_void: literal /= Void
	-- valid_literal: ([0-9]+).recognizes (literal)

end
