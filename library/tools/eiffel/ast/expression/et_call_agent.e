indexing

	description:

		"Eiffel call agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_AGENT

inherit

	ET_EXPRESSION
		redefine
			reset
		end

	ET_CALL_COMPONENT

create

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like qualified_name; args: like arguments) is
			-- Create a new call agent.
		require
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

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			name.reset
			is_procedure := False
			if target /= Void then
				target.reset
			end
			l_actuals ?= arguments
			if l_actuals /= Void then
				l_actuals.reset
			else
				arguments := Void
			end
		end

feature -- Access

	agent_keyword: ET_AST_LEAF
			-- 'agent' keyword or '~' symbol

	target: ET_AGENT_TARGET
			-- Target

	qualified_name: ET_QUALIFIED_FEATURE_NAME
			-- Qualified feature name

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := qualified_name.feature_name
		ensure then
			definition: Result = qualified_name.feature_name
		end

	arguments: ET_AGENT_ARGUMENT_OPERANDS
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if target /= Void and use_tilde then
				Result := target.position
			else
				Result := agent_keyword.position
				if Result.is_null then
					if target /= Void then
						Result := target.position
					end
				end
			end
			if Result.is_null then
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if target /= Void and use_tilde then
				Result := target.first_leaf
			else
				Result := agent_keyword
			end
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

	is_procedure: BOOLEAN
			-- Is the associated feature a procedure?

	use_tilde: BOOLEAN is
			-- Is the old syntax with '~' used?
		local
			a_symbol: ET_SYMBOL
		do
			a_symbol ?= agent_keyword
			Result := a_symbol /= Void
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

feature -- Status setting

	set_procedure (b: BOOLEAN) is	
			-- Set `is_procedure' to `b'.
		do
			is_procedure := b
		ensure
			procedure_set: is_procedure = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_call_agent (Current)
		end

invariant

	agent_keyword_not_void: agent_keyword /= Void
	qualified_name_not_void: qualified_name /= Void

end
