indexing

	description:

		"Eiffel inline agents with a routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ROUTINE_INLINE_AGENT

inherit

	ET_INLINE_AGENT
		redefine
			formal_arguments,
			preconditions,
			postconditions
		end

feature -- Access

	formal_arguments: ET_FORMAL_ARGUMENT_LIST
			-- Formal arguments

	preconditions: ET_PRECONDITIONS
			-- Preconditions

	postconditions: ET_POSTCONDITIONS
			-- Postconditions

	end_keyword: ET_KEYWORD
			-- 'end' keyword

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

feature -- Setting

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_preconditions (a_preconditions: like preconditions) is
			-- Set `preconditions' to `a_preconditions'.
		do
			preconditions := a_preconditions
		ensure
			preconditions_set: preconditions = a_preconditions
		end

	set_postconditions (a_postconditions: like postconditions) is
			-- Set `postconditions' to `a_postconditions'.
		do
			postconditions := a_postconditions
		ensure
			postconditions_set: postconditions = a_postconditions
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
