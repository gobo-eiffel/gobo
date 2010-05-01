note

	description:

		"Eiffel inline agents with a routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ROUTINE_INLINE_AGENT

inherit

	ET_INLINE_AGENT
		undefine
			formal_arguments,
			preconditions,
			postconditions
		end

	ET_ROUTINE_CLOSURE
		rename
			arguments as formal_arguments
		end

feature -- Access

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			l_arguments ?= actual_arguments
			if l_arguments /= Void then
				Result := l_arguments.last_leaf
			else
				Result := end_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			l_arguments ?= actual_arguments
			if l_arguments /= Void then
				Result := l_arguments.break
			else
				Result := end_keyword.break
			end
		end

end
