indexing

	description:

		"Eiffel real constants with underscores"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNDERSCORED_REAL_CONSTANT

inherit

	ET_REAL_CONSTANT

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Real constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: (((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
		end

	make_with_position (a_literal: like literal; a_line, a_column: INTEGER) is
			-- Create a new Real constant at given position.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_underscored_real_constant (Current)
		end

invariant

	-- valid_literal: (((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?).recognizes (literal)

end
