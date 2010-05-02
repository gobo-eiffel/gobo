note

	description:

		"Eiffel lists of bracket actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACKET_ARGUMENT_LIST

inherit

	ET_ACTUAL_ARGUMENT_LIST
		redefine
			make, make_with_capacity,
			process
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty actual argument list.
		do
			precursor
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty actual argument list with capacity `nb'.
		do
			precursor (nb)
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_bracket_argument_list (Current)
		end

end
