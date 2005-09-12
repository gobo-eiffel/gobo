indexing

	description:

		"Objects that represent XPath date/time/dateTime values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CALENDAR_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

	DT_GREGORIAN_CALENDAR

feature -- Status report

	zoned: BOOLEAN
			-- Is `Current' zoned?

end

