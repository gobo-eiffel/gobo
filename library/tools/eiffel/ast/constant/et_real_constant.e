indexing

	description:

		"Eiffel real constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REAL_CONSTANT

inherit

	ET_CONSTANT

feature -- Access

	literal: STRING
			-- Literal real absolute value

	is_negative: BOOLEAN is
			-- Is real value negative?
		do
			if sign /= Void then
				Result := sign.is_negative
			end
		end

	sign: ET_SIGN_SYMBOL
			-- Sign; Void if none

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if sign /= Void then
				Result := sign.position
			else
				Result := literal_position
			end
		end

	literal_position: ET_POSITION
			-- Position of first character of
			-- `literal' in source code

	break: ET_BREAK
			-- Break which appears just after current node

feature -- Setting

	set_sign (a_sign: like sign) is
			-- Set `sign' to `a_sign'.
		do
			sign := a_sign
		ensure
			sign_set: sign = a_sign
		end

	set_break (a_break: like break) is
			-- Set `break' to `a_break'.
		do
			break := a_break
		ensure
			break_set: break = a_break
		end

invariant

	literal_not_void: literal /= Void
	literal_position_not_void: literal_position /= Void

end
