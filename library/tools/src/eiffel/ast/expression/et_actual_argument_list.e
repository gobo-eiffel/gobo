note

	description:

		"Eiffel lists of actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_ARGUMENT_LIST

inherit

	ET_ACTUAL_ARGUMENTS

	ET_EXPRESSION_LIST
		rename
			expression as actual_argument
		undefine
			is_empty, valid_index
		redefine
			reset, make, make_with_capacity
		end

create

	make,
	make_with_capacity,
	make_bracketed,
	make_bracketed_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty actual argument list.
		do
			left_symbol := tokens.left_parenthesis_symbol
			right_symbol := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty actual argument list with capacity `nb'.
		do
			left_symbol := tokens.left_parenthesis_symbol
			right_symbol := tokens.right_parenthesis_symbol
			precursor (nb)
		end

	make_bracketed
			-- Create a new empty actual argument list
			-- to be used in Bracket_expressions.
		do
			make
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
		end

	make_bracketed_with_capacity (nb: INTEGER)
			-- Create a new empty actual argument list with capacity `nb'
			-- to be used in Bracket_expressions.
		do
			make_with_capacity (nb)
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
		end

feature -- Initialization

	reset
			-- Reset actual arguments as they were when they were last parsed.
		local
			l_actual: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_actual := storage.item (i)
				l_expression := l_actual.expression
				if attached {ET_CONVERT_EXPRESSION} l_expression as l_convert then
					l_expression := l_convert.expression
					if attached {ET_EXPRESSION_COMMA} l_actual as l_expression_comma then
						l_expression_comma.set_expression (l_expression)
					else
						storage.put (l_expression, i)
					end
				end
				l_expression.reset
				i := i + 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_actual_argument_list (Current)
		end

end
