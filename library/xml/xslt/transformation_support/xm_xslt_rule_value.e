indexing

	description:

		"Objects that can be returned from {XM_XSLT_MODE}.rule"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_RULE_VALUE

feature -- Access

	as_boolean: BOOLEAN is
			-- Value as a BOOLEAN
		require
			is_boolean: is_boolean
		do
			-- TODO
		end

feature -- Status report

	is_boolean: BOOLEAN
			-- Is `Current' a BOOLEAN?

end
	
