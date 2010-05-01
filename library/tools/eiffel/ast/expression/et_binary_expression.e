note

	description:

		"Eiffel binary expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BINARY_EXPRESSION

inherit

	ET_EXPRESSION

feature -- Access

	left: ET_EXPRESSION
			-- Left-hand-side
	
	right: ET_EXPRESSION
			-- Right-hand-side

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right.break
		end

feature -- Setting

	set_left (a_left: like left) is
			-- Set `left' to `a_left'.
		require
			a_left_not_void: a_left /= Void
		do
			left := a_left
		ensure
			left_set: left = a_left
		end

	set_right (a_right: like right) is
			-- Set `right' to `a_right'.
		require
			a_right_not_void: a_right /= Void
		do
			right := a_right
		ensure
			right_set: right = a_right
		end

invariant

	left_not_void: left /= Void
	right_not_void: right /= Void

end
