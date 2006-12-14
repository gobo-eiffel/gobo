indexing

	description:

		"Eiffel inline agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INLINE_AGENT

inherit

	ET_AGENT
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_feature: like associated_feature; args: like arguments) is
			-- Create a new inline agent.
		require
			a_feature_not_void: a_feature /= Void
		do
			agent_keyword := tokens.agent_keyword
			associated_feature := a_feature
			arguments := args
			create {ET_AGENT_IMPLICIT_CURRENT_TARGET} target.make (Current)
		ensure
			associated_feature_set: associated_feature = a_feature
			arguments_set: arguments = args
		end

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			associated_feature.reset
			target.reset
			l_actuals ?= arguments
			if l_actuals /= Void then
				l_actuals.reset
			else
				arguments := Void
			end
		end

feature -- Access

	associated_feature: ET_FEATURE
			-- Associated feature

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := associated_feature.name
		ensure then
			definition: Result = associated_feature.name
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_keyword.position
			if Result.is_null then
				Result := associated_feature.position
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
				Result := associated_feature.last_leaf
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
				Result := associated_feature.break
			end
		end

feature -- Status report

	is_qualified_call: BOOLEAN is False
			-- Is current call qualified?

	is_procedure: BOOLEAN is
			-- Is the associated feature a procedure?
		do
			Result := associated_feature.is_procedure
		end

feature {ET_AGENT_IMPLICIT_CURRENT_TARGET} -- Implicit node positions

	implicit_target_position: ET_AST_NODE is
			-- Node used to provide a position to the implicit target if any
		do
			Result := associated_feature.first_leaf
		end

feature {ET_AGENT_IMPLICIT_OPEN_ARGUMENT} -- Implicit node positions

	implicit_argument_position: ET_AST_NODE is
			-- Node used to provide a position to implicit open arguments if any
		do
			Result := associated_feature.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_inline_agent (Current)
		end

invariant

	associated_feature_not_void: associated_feature /= Void

end
