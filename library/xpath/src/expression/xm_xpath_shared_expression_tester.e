note

	description:

		"Shared XPath expression equality testers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_EXPRESSION_TESTER

feature -- Access

	expression_tester: XM_XPATH_EXPRESSION_TESTER
			-- Expression equality tester
		once
			create Result
		ensure
			expression_tester_not_void: Result /= Void
		end

end
