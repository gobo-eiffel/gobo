indexing

	description:

		"Equality testers between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [STRING]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	test (v, u: STRING): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- They are considered equal if they have the same number of
			-- characters and these characters (possibly unicode characters)
			-- have codes which are one by one equal.
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := STRING_.same_unicode_string (v, u)
			end
		end
end
