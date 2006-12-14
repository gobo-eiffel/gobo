indexing

	description:

		"Eiffel agent implicit 'Current' targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_IMPLICIT_CURRENT_TARGET

inherit

	ET_AGENT_TARGET
		redefine
			first_position, last_position
		end

create

	make

feature {NONE} -- Initialization

	make (an_agent: like agent_expression) is
			-- Create a new agent implicit 'Current' target.
		require
			an_agent_not_void: an_agent /= Void
		do
			agent_expression := an_agent
		ensure
			agent_expression_set: agent_expression = an_agent
		end

feature -- Access

	agent_expression: ET_AGENT
			-- Agent expression to which current implicit 'Current' target belongs

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_expression.implicit_target_position.position
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code;
			-- Null position is current node is empty
		do
			Result := agent_expression.implicit_target_position.first_position
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code;
			-- Null position is current node is empty
		do
			Result := agent_expression.implicit_target_position.last_position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := agent_expression.implicit_target_position.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := agent_expression.implicit_target_position.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_implicit_current_target (Current)
		end

invariant

	agent_expression_not_void: agent_expression /= Void

end
