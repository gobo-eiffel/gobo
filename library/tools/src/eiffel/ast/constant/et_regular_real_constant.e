note

	description:

		"Eiffel real constants with no underscore"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_REGULAR_REAL_CONSTANT

inherit

	ET_REAL_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal)
			-- Create a new Real constant.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {ET_REGULAR_REAL_CONSTANT}.valid_literal (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_regular_real_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?"
			-- Regular expression for `literal'

end
