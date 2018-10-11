note

	description:

		"Shared equality testers between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_STRING_EQUALITY_TESTER

feature -- Access

	string_equality_tester: KL_STRING_EQUALITY_TESTER
			-- String equality tester
		once
			create Result
		ensure
			instance_free: class
			string_equality_tester_not_void: Result /= Void
		end

	case_insensitive_string_equality_tester: KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER
			-- Case-insensitive string equality tester
		once
			create Result
		ensure
			instance_free: class
			case_insensitive_string_equality_tester_not_void: Result /= Void
		end

end
