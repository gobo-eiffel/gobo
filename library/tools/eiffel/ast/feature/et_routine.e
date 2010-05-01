note

	description:

		"Eiffel routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			obsolete_message
		end

	ET_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		end

feature -- Access

	is_keyword: ET_KEYWORD
			-- 'is' keyword

	obsolete_message: ET_OBSOLETE
			-- Obsolete message

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if semicolon /= Void then
				Result := semicolon
			else
				Result := end_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if semicolon /= Void then
				Result := semicolon.break
			else
				Result := end_keyword.break
			end
		end

feature -- Setting

	set_is_keyword (an_is: like is_keyword) is
			-- Set `is_keyword' to `an_is'.
		do
			is_keyword := an_is
		ensure
			is_keyword_set: is_keyword = an_is
		end

	set_obsolete_message (a_message: like obsolete_message) is
			-- Set `obsolete_message' to `a_message'.
		do
			obsolete_message := a_message
		ensure
			obsolete_message_set: obsolete_message = a_message
		end

end
