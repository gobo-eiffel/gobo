indexing

	description:

		"Case-insensitive string equality testers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [STRING]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	test (s1, s2: detachable STRING): BOOLEAN is
			-- Are `s1' and `s2' considered equal?
			-- Use case-insensitive comparison.
		do
			if s1 = s2 then
				Result := True
			elseif s1 = Void then
				Result := False
			elseif s2 = Void then
				Result := False
			else
				Result := STRING_.same_case_insensitive (s1, s2)
			end
		end

end
