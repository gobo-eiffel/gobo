indexing

	description:

		"Eiffel character constants of the form '%%/code/'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_C3_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

creation

	make

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
