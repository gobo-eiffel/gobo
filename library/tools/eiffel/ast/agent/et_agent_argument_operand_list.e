indexing

	description:

		"Eiffel lists of agent actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_ARGUMENT_OPERAND_LIST

inherit

	ET_AGENT_ARGUMENT_OPERANDS

	ET_AST_NODE

	ET_HEAD_LIST [ET_AGENT_ARGUMENT_OPERAND_ITEM]
		undefine
			is_empty, valid_index
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new empty agent actual argument list.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty agent actual argument list with capacity `nb'.
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset actual arguments as they were when they were last parsed.
		local
			l_actual: ET_AGENT_ARGUMENT_OPERAND_ITEM
			l_operand: ET_AGENT_ARGUMENT_OPERAND
			l_operand_comma: ET_AGENT_ARGUMENT_OPERAND_COMMA
			l_convert: ET_CONVERT_EXPRESSION
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_actual := storage.item (i)
				l_operand := l_actual.agent_actual_argument
				l_convert ?= l_operand
				if l_convert /= Void then
					l_operand := l_convert.expression
					l_operand_comma ?= l_actual
					if l_operand_comma /= Void then
						l_operand_comma.set_agent_actual_argument (l_operand)
					else
						storage.put (l_operand, i)
					end
				end
				l_operand.reset
				i := i + 1
			end
		end

feature -- Access

	actual_argument (i: INTEGER): ET_AGENT_ARGUMENT_OPERAND is
			-- Actual argument at index `i' in list
		do
			Result := item (i).agent_actual_argument
		end

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (l: like left_parenthesis) is
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis) is
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_AGENT_ARGUMENT_OPERAND_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_argument_operand_list (Current)
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end
