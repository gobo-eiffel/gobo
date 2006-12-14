indexing

	description:

		"Eiffel agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AGENT

inherit

	ET_EXPRESSION

feature -- Access

	agent_keyword: ET_AST_LEAF
			-- 'agent' keyword or '~' symbol

	target: ET_AGENT_TARGET
			-- Target

	name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: ET_AGENT_ARGUMENT_OPERANDS
			-- Arguments

feature -- Status report

	is_qualified_call: BOOLEAN is
			-- Is current call qualified?
		deferred
		end

	is_procedure: BOOLEAN is
			-- Is the associated feature a procedure?
		deferred
		end

feature -- Setting

	set_agent_keyword (an_agent: like agent_keyword) is
			-- Set `agent_keyword' to `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			agent_keyword := an_agent
		ensure
			agent_keyword_set: agent_keyword = an_agent
		end

	set_arguments (an_arguments: like arguments) is
			-- Set `arguments' to `an_arguments'.
		do
			arguments := an_arguments
		ensure
			argumnts_set: arguments = an_arguments
		end

feature {ET_AGENT_IMPLICIT_CURRENT_TARGET} -- Implicit node positions

	implicit_target_position: ET_AST_NODE is
			-- Node used to provide a position to the implicit target if any
		deferred
		ensure
			implicit_target_position_not_void: Result /= Void
		end

feature {ET_AGENT_IMPLICIT_OPEN_ARGUMENT} -- Implicit node positions

	implicit_argument_position: ET_AST_NODE is
			-- Node used to provide a position to implicit open arguments if any
		deferred
		ensure
			implicit_argument_position_not_void: Result /= Void
		end

invariant

	agent_keyword_not_void: agent_keyword /= Void
	target_not_void: target /= Void

end
