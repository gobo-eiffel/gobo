note

	description:

		"Shared XPath comparsion key testers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SHARED_COMPARISON_KEY_TESTER

feature -- Access

	comparison_key_tester: XM_XPATH_COMPARISON_KEY_TESTER
			-- Comparison key equality tester
		once
			create Result
		ensure
			comparison_key_tester_not_void: Result /= Void
		end

end

