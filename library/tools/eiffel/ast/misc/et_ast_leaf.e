indexing

	description:

		"Eiffel AST leaf nodes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_LEAF

inherit

	ET_AST_NODE
		undefine
			last_position
		redefine
			first_position
		end

	ET_COMPRESSED_POSITION
		rename
			make as make_with_position,
			make_default as make
		end

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := Current
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code
		do
			Result := Current
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := Current
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
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

end
