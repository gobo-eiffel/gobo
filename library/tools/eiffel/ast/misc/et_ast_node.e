indexing

	description:

		"Eiffel AST nodes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_NODE

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		deferred
		ensure
			position_not_void: Result /= Void
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		deferred
		end

feature -- Status report

	has_break: BOOLEAN is
			-- Is there a break after current node?
		do
			Result := (break /= Void)
		ensure
			definition: Result = (break /= Void)
		end

	has_comment: BOOLEAN is
			-- Is there a comment after current node?
		do
			-- TODO
		end

end -- class ET_AST_NODE
