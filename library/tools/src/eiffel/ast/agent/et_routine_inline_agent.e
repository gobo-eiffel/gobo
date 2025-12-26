note

	description:

		"Eiffel inline agents with a routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2025, Eric Bezault and others"
	license: "MIT License"

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
		redefine
			set_preconditions,
			set_postconditions
		end

feature -- Access

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} actual_arguments as l_arguments then
				Result := l_arguments.last_leaf
			else
				Result := end_keyword
			end
		end

feature -- Setting

	set_preconditions (a_preconditions: like preconditions)
			-- Set `preconditions' to `a_preconditions'.
		do
			preconditions := a_preconditions
			if a_preconditions /= Void then
				a_preconditions.set_implementation_closure (Current)
			end
		end

	set_postconditions (a_postconditions: like postconditions)
			-- Set `postconditions' to `a_postconditions'.
		do
			postconditions := a_postconditions
			if a_postconditions /= Void then
				a_postconditions.set_implementation_closure (Current)
			end
		end

end
