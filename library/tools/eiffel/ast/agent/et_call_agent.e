note

	description:

		"Eiffel call agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_AGENT

inherit

	ET_AGENT
		redefine
			implicit_result,
			is_call_agent,
			reset
		end

	ET_CALL_COMPONENT
		redefine
			is_qualified_call
		end

create

	make, make_unqualified

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like qualified_name; args: like arguments) is
			-- Create a new call agent.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
			agent_keyword := tokens.agent_keyword
			target := a_target
			qualified_name := a_name
			arguments := args
		ensure
			target_set: target = a_target
			name_set: qualified_name = a_name
			arguments_set: arguments = args
		end

	make_unqualified (a_name: like qualified_name; args: like arguments) is
			-- Create a new unqualified call agent.
		require
			a_name_not_void: a_name /= Void
		do
			agent_keyword := tokens.agent_keyword
			qualified_name := a_name
			arguments := args
			create {ET_AGENT_IMPLICIT_CURRENT_TARGET} target.make (Current)
		ensure
			name_set: qualified_name = a_name
			arguments_set: arguments = args
			unqualified_call: not is_qualified_call
		end

feature -- Initialization

	reset is
			-- Reset expression as it was just after it was last parsed.
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			name.reset
			implicit_result := Void
			target.reset
			l_actuals ?= arguments
			if l_actuals /= Void then
				l_actuals.reset
			else
				arguments := Void
			end
		end

feature -- Access

	qualified_name: ET_QUALIFIED_FEATURE_NAME
			-- Qualified feature name

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := qualified_name.feature_name
		ensure then
			definition: Result = qualified_name.feature_name
		end

	implicit_result: ET_RESULT
			-- Fictitious node corresponding to the result of the
			-- associated feature when it's a query

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_keyword.position
			if Result.is_null then
				Result := target.position
			end
			if Result.is_null then
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := agent_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			l_arguments ?= arguments
			if l_arguments /= Void then
				Result := l_arguments.last_leaf
			else
				Result := qualified_name.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			l_arguments ?= arguments
			if l_arguments /= Void then
				Result := l_arguments.break
			else
				Result := qualified_name.break
			end
		end

feature -- Status report

	is_qualified_call: BOOLEAN is
			-- Is current call qualified?
		local
			l_implicit_target: ET_AGENT_IMPLICIT_CURRENT_TARGET
		do
			l_implicit_target ?= target
			Result := (l_implicit_target = Void)
		end

	is_procedure: BOOLEAN is
			-- Is the associated feature a procedure?
		do
			Result := (implicit_result = Void)
		end

	is_call_agent: BOOLEAN is True
			-- Is current agent a call agent?

feature -- Status setting

	set_procedure (b: BOOLEAN) is
			-- Set `is_procedure' to `b'.
		do
			if b then
				implicit_result := Void
			elseif implicit_result = Void then
				create implicit_result.make
			end
		ensure
			procedure_set: is_procedure = b
		end

feature {ET_AGENT_IMPLICIT_CURRENT_TARGET} -- Implicit node positions

	implicit_target_position: ET_AST_NODE is
			-- Node used to provide a position to the implicit target if any
		do
			Result := name.first_leaf
		end

feature {ET_AGENT_IMPLICIT_OPEN_ARGUMENT} -- Implicit node positions

	implicit_argument_position: ET_AST_NODE is
			-- Node used to provide a position to implicit open arguments if any
		do
			Result := name.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_call_agent (Current)
		end

invariant

	qualified_name_not_void: qualified_name /= Void

end
