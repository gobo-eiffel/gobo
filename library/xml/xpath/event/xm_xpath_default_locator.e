note

	description:

		"Locators that provide no useful information"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEFAULT_LOCATOR

inherit

	XM_XPATH_LOCATOR

feature -- Access

	system_id: STRING = ""
			-- Current SYSTEM ID

	line_number: INTEGER = 0
			-- Approximate line number of current event, or 0 if unknown

end
