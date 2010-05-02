note

	description:

		"Shared access to conformance to XPath, XQuery and XSLT standards"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_CONFORMANCE

feature -- Access

	conformance: XM_XPATH_CONFORMANCE
			-- The shared conformance object
		once
			create Result
		end

end
