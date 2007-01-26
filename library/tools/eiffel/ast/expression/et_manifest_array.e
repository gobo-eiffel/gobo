indexing

	description:

		"Eiffel manifest arrays"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_ARRAY

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
			-- Create a new empty manifest array.
		do
			left_symbol := tokens.left_array_symbol
			right_symbol := tokens.right_array_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty manifest array with capacity `nb'.
		do
			left_symbol := tokens.left_array_symbol
			right_symbol := tokens.right_array_symbol
			precursor (nb)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_manifest_array (Current)
		end

end
