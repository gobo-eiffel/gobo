indexing

	description:

		"Eiffel AST leaf nodes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_AST_LEAF

inherit

	ET_AST_NODE

	ET_COMPRESSED_POSITION
		rename
			make as make_with_position,
			make_default as make
		end

creation

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := Current
		end

	break: ET_BREAK
			-- Break which appears just after current node

feature -- Setting

	set_break (a_break: like break) is
			-- Set `break' to `a_break'.
		do
			break := a_break
		ensure
			break_set: break = a_break
		end

end -- class ET_AST_LEAF
