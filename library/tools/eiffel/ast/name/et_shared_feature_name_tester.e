indexing

	description:

		"Shared feature name equality testers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SHARED_FEATURE_NAME_TESTER

feature -- Access

	feature_name_tester: ET_FEATURE_NAME_TESTER is
			-- Feature name equality tester
		once
			!! Result
		ensure
			feature_name_tester_not_void: Result /= Void
		end

end -- class ET_SHARED_FEATURE_NAME_TESTER
