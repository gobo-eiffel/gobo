indexing

	description:

		"A numeric XPath value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NUMERIC_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

feature -- Status_report

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			Result := False
		end
	
end
