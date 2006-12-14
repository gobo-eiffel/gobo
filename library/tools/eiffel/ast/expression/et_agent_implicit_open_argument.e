indexing

	description:

		"Eiffel agent implicit open arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_IMPLICIT_OPEN_ARGUMENT

inherit

	ET_AGENT_ARGUMENT_OPERAND
		redefine
			is_open_operand,
			first_position, last_position
		end

create

	make

feature {NONE} -- Initialization

	make (an_agent: like agent_expression; an_index: INTEGER) is
			-- Create a new agent implicit open argument.
		require
			an_agent_not_void: an_agent /= Void
			an_index_nonnegative: an_index >= 1
		do
			agent_expression := an_agent
			argument_index := an_index
		ensure
			agent_expression_set: agent_expression = an_agent
			argument_index_set: argument_index = an_index
		end

feature -- Status report

	is_open_operand: BOOLEAN is True
			-- Is current operand open?

feature -- Access

	agent_expression: ET_AGENT
			-- Agent expression to which current implicit open argument belongs

	argument_index: INTEGER
			-- Index of argument

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_expression.implicit_argument_position.position
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code;
			-- Null position is current node is empty
		do
			Result := agent_expression.implicit_argument_position.first_position
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code;
			-- Null position is current node is empty
		do
			Result := agent_expression.implicit_argument_position.last_position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := agent_expression.implicit_argument_position.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := agent_expression.implicit_argument_position.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_implicit_open_argument (Current)
		end

invariant

	agent_expression_not_void: agent_expression /= Void
	argument_index_nonnegative: argument_index >= 1

end
