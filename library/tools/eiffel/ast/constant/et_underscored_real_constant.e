indexing

	description:

		"Eiffel real constants with underscores"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNDERSCORED_REAL_CONSTANT

inherit

	ET_REAL_CONSTANT

create

	make

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
			line_set: line = no_line
			column_set: column = no_column
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
