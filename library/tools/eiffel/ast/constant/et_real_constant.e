indexing

	description:

		"Eiffel real constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_REAL_CONSTANT

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		redefine
			position
		end

	ET_CONSTANT

	ET_INDEXING_TERM

feature -- Access

	literal: STRING
			-- Literal real absolute value

	is_negative: BOOLEAN is
			-- Is real value negative?
		do
			if sign /= Void then
				Result := sign.is_minus
			end
		end

	sign: ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if sign /= Void then
				Result := sign.position
			else
				Result := Current
			end
		end

feature -- Setting

	set_sign (a_sign: like sign) is
			-- Set `sign' to `a_sign'.
		do
			sign := a_sign
		ensure
			sign_set: sign = a_sign
		end

invariant

	literal_not_void: literal /= Void

end
