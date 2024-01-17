note

	description:

		"Eiffel agent implicit 'Current' targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2018, Eric Bezault and others"
	license: "MIT License"

class ET_AGENT_IMPLICIT_CURRENT_TARGET

inherit

	ET_AGENT_TARGET
		redefine
			is_instance_free,
			break
		end

create

	make

feature {NONE} -- Initialization

	make (an_agent: like agent_expression)
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

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_expression.implicit_target_position.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := agent_expression.implicit_target_position.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := agent_expression.implicit_target_position.last_leaf
		end

	break: detachable ET_BREAK
			-- Break which appears just after current node
		do
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current operand not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := False
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_agent_implicit_current_target (Current)
		end

invariant

	agent_expression_not_void: agent_expression /= Void

end
