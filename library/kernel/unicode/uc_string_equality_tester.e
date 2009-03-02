indexing

	description:

		"Equality testers between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_STRING_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [STRING]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	test (v, u: ?STRING): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- They are considered equal if they have the same number of
			-- characters and these characters (possibly unicode characters)
			-- have codes which are one by one equal.
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := STRING_.same_string (v, u)
			end
		end

end
