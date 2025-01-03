﻿note

	description:

		"Eiffel agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_AGENT

inherit

	ET_EXPRESSION
		redefine
			is_never_void,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

feature -- Access

	agent_keyword: ET_AGENT_KEYWORD
			-- 'agent' keyword

	target: ET_AGENT_TARGET
			-- Target

	arguments: detachable ET_AGENT_ARGUMENT_OPERANDS
			-- Arguments

	implicit_result: detachable ET_RESULT
			-- Fictitious node corresponding to the result of the
			-- associated feature when it's a query
		do
		end

feature -- Status report

	is_qualified_call: BOOLEAN
			-- Is current call qualified?
		deferred
		end

	is_procedure: BOOLEAN
			-- Is the associated feature a procedure?
		deferred
		ensure
			definition: Result = (implicit_result = Void)
		end

	is_call_agent: BOOLEAN
			-- Is current agent a call agent?
		do
			Result := False
		end

	is_inline_agent: BOOLEAN
			-- Is current agent an inline agent?
		do
			Result := False
		end

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current expression
			-- or (recursively) in one of its subexpressions?
			-- Do not take into account the code inside inline agent,
			-- just the target and arguments of the agent.
		do
			Result := target.has_result or
				attached arguments as l_arguments and then l_arguments.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current expression
			-- or (recursively) in one of its subexpressions?
			-- Do not take into account the code inside inline agent,
			-- just the target and arguments of the agent.
		do
			Result := target.has_address_expression or
				attached arguments as l_arguments and then l_arguments.has_address_expression
		end

	has_agent: BOOLEAN = True
			-- Does an agent appear in current expression
			-- or (recursively) in one of its subexpressions?

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current expression
			-- or (recursively) in one of its subexpressions?
			-- Do not take into account the code inside inline agent,
			-- just the target and arguments of the agent.
		do
			Result := target.has_typed_object_test or
				attached arguments as l_arguments and then l_arguments.has_typed_object_test
		end

feature -- Setting

	set_agent_keyword (an_agent: like agent_keyword)
			-- Set `agent_keyword' to `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			agent_keyword := an_agent
		ensure
			agent_keyword_set: agent_keyword = an_agent
		end

	set_arguments (an_arguments: like arguments)
			-- Set `arguments' to `an_arguments'.
		do
			arguments := an_arguments
		ensure
			argumnts_set: arguments = an_arguments
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
			-- Do not take into account the code inside inline agent,
			-- just the target and arguments of the agent.
		do
			target.add_old_expressions (a_list)
			if attached arguments as l_arguments then
				l_arguments.add_old_expressions (a_list)
			end
		end

feature {ET_AGENT_IMPLICIT_CURRENT_TARGET} -- Implicit node positions

	implicit_target_position: ET_AST_NODE
			-- Node used to provide a position to the implicit target if any
		deferred
		ensure
			implicit_target_position_not_void: Result /= Void
		end

feature {ET_AGENT_IMPLICIT_OPEN_ARGUMENT} -- Implicit node positions

	implicit_argument_position: ET_AST_NODE
			-- Node used to provide a position to implicit open arguments if any
		deferred
		ensure
			implicit_argument_position_not_void: Result /= Void
		end

invariant

	agent_keyword_not_void: agent_keyword /= Void
	target_not_void: target /= Void

end
