note

	description:

		"Shared call name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_CALL_NAME_TESTER

feature -- Access

	call_name_tester: ET_CALL_NAME_TESTER is
			-- Call name equality tester
		once
			create Result
		ensure
			call_name_tester_not_void: Result /= Void
		end

end
