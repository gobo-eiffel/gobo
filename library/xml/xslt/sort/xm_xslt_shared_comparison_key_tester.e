indexing

	description:

		"Shared XSLT comparsion key testers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SHARED_COMPARISON_KEY_TESTER

feature -- Access

	comparison_key_tester: XM_XSLT_COMPARISON_KEY_TESTER is
			-- Comparison key equality tester
		once
			create Result
		ensure
			comparison_key_tester_not_void: Result /= Void
		end
	
end
	
