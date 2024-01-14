note

	description:

		"Shared alias name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2018, Eric Bezault and others"
	license: "MIT License"

class ET_SHARED_ALIAS_NAME_TESTER

feature -- Access

	alias_name_tester: ET_ALIAS_NAME_TESTER
			-- Alias name equality tester
		once
			create Result
		ensure
			instance_free: class
			alias_name_tester_not_void: Result /= Void
		end

end
