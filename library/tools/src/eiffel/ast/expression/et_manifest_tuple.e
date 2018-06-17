note

	description:

		"Eiffel manifest tuples"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_TUPLE

inherit

	ET_EXPRESSION
		undefine
			reset,
			is_instance_free
		redefine
			is_never_void
		end

	ET_EXPRESSION_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty manifest tuple.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty manifest tuple with capacity `nb'.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor (nb)
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_manifest_tuple (Current)
		end

end
