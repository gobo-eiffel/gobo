indexing

	description:

		"Eiffel obsolete clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_OBSOLETE

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (an_obsolete: like obsolete_keyword; a_message: like message) is
			-- Create a new obsolete clause.
		require
			an_obsolete_not_void: an_obsolete /= Void
			a_message_not_void: a_message /= Void
		do
			obsolete_keyword := an_obsolete
			message := a_message
		ensure
			obsolete_keyword_set: obsolete_keyword = an_obsolete
			message_set: message = a_message
		end

feature -- Access

	obsolete_keyword: ET_TOKEN
			-- 'obsolete' keyword

	message: ET_MANIFEST_STRING
			-- Obsolete message

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := obsolete_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := message.break
		end

invariant

	obsolete_keyword_not_void: obsolete_keyword /= Void
	message_not_void: message /= Void

end -- class ET_OBSOLETE
