indexing

	description:

		"Eiffel lists of actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_ARGUMENT_LIST

inherit

	ET_EXPRESSION_LIST
		redefine
			make, make_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new empty actual argument list.
		do
			left_symbol := tokens.left_parenthesis_symbol
			right_symbol := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty actual argument list with capacity `nb'.
		do
			left_symbol := tokens.left_parenthesis_symbol
			right_symbol := tokens.right_parenthesis_symbol
			precursor (nb)
		end

feature -- Status report

	is_one_argument: BOOLEAN is
			-- Is there exactly one argument?
		do
			Result := (count = 1)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_actual_argument_list (Current)
		end

end
