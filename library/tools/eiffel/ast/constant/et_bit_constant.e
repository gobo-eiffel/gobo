indexing

	description:

		"Eiffel bit constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BIT_CONSTANT

inherit

	ET_CONSTANT
		undefine
			first_position, last_position
		redefine
			is_bit_constant
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Bit constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: ([0-1]+[bB]).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Status report

	is_bit_constant: BOOLEAN is True
			-- Is current constant a BIT constant?

feature -- Access

	literal: STRING
			-- Literal bit value

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count - 1)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_bit_constant (Current)
		end

invariant

	literal_not_void: literal /= Void
	-- valid_literal: ([0-1]+[bB]).recognizes (literal)

end
