indexing

	description:

		"Eiffel infix expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_EXPRESSION

inherit

	ET_CALL_EXPRESSION
		rename
			make as make_call
		redefine
			name
		end

	ET_BINARY_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_left: like left; a_name: like name; a_right: like right) is
			-- Create a new infix feature call.
		require
			a_left_not_void: a_left /= Void
			a_name_not_void: a_name /= Void
			a_right_not_void: a_right /= Void
		do
			target := a_left
			name := a_name
			!! arguments.make (a_right)
		ensure
			left_set: left = a_left
			name_set: name = a_name
			right_set: right = a_right
		end

feature -- Access

	name: ET_INFIX_NAME
			-- Feature name

	left: ET_EXPRESSION is
			-- Left-hand-side of binary expression
		do
			Result := target
		end

	right: ET_EXPRESSION is
			-- Right-hand-side of binary expression
		do
			Result := arguments.arguments.expression
		end

invariant

	target_not_void: target /= Void
	arguments_not_void: arguments /= Void

end -- class ET_INFIX_EXPRESSION
