indexing

	description:

		"Shared alias name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_ALIAS_NAME_TESTER

feature -- Access

	alias_name_tester: ET_ALIAS_NAME_TESTER is
			-- Alias name equality tester
		once
			create Result
		ensure
			alias_name_tester_not_void: Result /= Void
		end

end
