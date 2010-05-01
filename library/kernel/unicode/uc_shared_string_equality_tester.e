note

	description:

		"Shared equality testers between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_SHARED_STRING_EQUALITY_TESTER

feature -- Access

	string_equality_tester: UC_STRING_EQUALITY_TESTER is
			-- String equality tester
		once
			create Result
		ensure
			string_equality_tester_not_void: Result /= Void
		end

end
