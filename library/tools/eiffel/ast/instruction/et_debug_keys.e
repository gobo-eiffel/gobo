indexing

	description:

		"Eiffel debug keys"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_DEBUG_KEYS

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (l: like left_parenthesis; r: like right_parenthesis) is
			-- Create a new debug keys.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left_parenthesis := l
			right_parenthesis := r
		ensure
			left_parenthesis_set: left_parenthesis = l
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Access

	keys: DS_ARRAYED_LIST [ET_MANIFEST_STRING_ITEM]
			-- Debug keys

	left_parenthesis: ET_SYMBOL
	right_parenthesis: ET_SYMBOL
			-- Parentheses

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_keys (a_keys: like keys) is
			-- Set `keys' to `a_keys'.
		require
			no_void_key: a_keys /= Void implies not a_keys.has (Void)
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
		end

invariant

	no_void_key: keys /= Void implies not keys.has (Void)
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end -- class ET_DEBUG_KEYS
