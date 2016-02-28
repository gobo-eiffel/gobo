note

	description:

		"Shared identifier equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_IDENTIFIER_TESTER

feature -- Access

	identifier_tester: ET_IDENTIFIER_TESTER
			-- Identifier equality tester
		once
			create Result
		ensure
			identifier_tester_not_void: Result /= Void
		end

end
