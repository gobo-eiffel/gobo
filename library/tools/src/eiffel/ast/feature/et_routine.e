note

	description:

		"Eiffel routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ROUTINE

inherit

	ET_FEATURE
		undefine
			arguments,
			preconditions,
			postconditions,
			reset_preconditions,
			reset_postconditions
		redefine
			is_routine,
			obsolete_message
		end

	ET_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			first_note,
			is_static,
			implementation_feature
		end

feature -- Status report

	is_routine: BOOLEAN = True
			-- Is feature a routine?

feature -- Access

	is_keyword: detachable ET_KEYWORD
			-- 'is' keyword

	obsolete_message: detachable ET_OBSOLETE
			-- Obsolete message

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached semicolon as l_semicolon then
				Result := l_semicolon
			else
				Result := end_keyword
			end
		end

feature -- Setting

	set_is_keyword (an_is: like is_keyword)
			-- Set `is_keyword' to `an_is'.
		do
			is_keyword := an_is
		ensure
			is_keyword_set: is_keyword = an_is
		end

	set_obsolete_message (a_message: like obsolete_message)
			-- Set `obsolete_message' to `a_message'.
		do
			obsolete_message := a_message
		ensure
			obsolete_message_set: obsolete_message = a_message
		end

end
