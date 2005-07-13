indexing

	description:

		"Eiffel manifest tuples"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_TUPLE

inherit

	ET_EXPRESSION
		undefine
			reset
		end

	ET_EXPRESSION_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new empty manifest tuple.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty manifest tuple with capacity `nb'.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor (nb)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_manifest_tuple (Current)
		end

end
