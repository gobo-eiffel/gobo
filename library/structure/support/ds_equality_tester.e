indexing

	description:

		"Equality testers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_EQUALITY_TESTER [G]

feature -- Status report

	test (v, u: G): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- (Use `equal' by default.)
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.is_equal (u)
			end
		end

end -- class DS_EQUALITY_TESTER
