note

	description:

		"Eiffel agent actual argument followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_ARGUMENT_OPERAND_COMMA

inherit

	ET_AGENT_ARGUMENT_OPERAND_ITEM

create

	make

feature {NONE} -- Initialization

	make (an_argument: like agent_actual_argument; a_comma: like comma)
			-- Create a new agent_actual_argument-comma.
		require
			an_argument_not_void: an_argument /= Void
			a_comma_not_void: a_comma /= Void
		do
			agent_actual_argument := an_argument
			comma := a_comma
		ensure
			agent_actual_argument_set: agent_actual_argument = an_argument
			comma_set: comma = a_comma
		end

feature -- Access

	agent_actual_argument: ET_AGENT_ARGUMENT_OPERAND
			-- Agent actual argument in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_actual_argument.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := agent_actual_argument.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Setting

	set_agent_actual_argument (an_actual: like agent_actual_argument)
			-- Set `agent_actual_argument' to `an_actual'.
		require
			an_actual_not_void: an_actual /= Void
		do
			agent_actual_argument := an_actual
		ensure
			agent_actual_argument_set: agent_actual_argument = an_actual
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_agent_argument_operand_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
