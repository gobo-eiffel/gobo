indexing

	description:

		"Objects that maintain template-matching rules (one set for each mode)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RULE_MANAGER

inherit

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- TODO.
		do
			-- TODO
		end

feature -- Access

	mode (a_mode_name_code: INTEGER): XM_XSLT_MODE is
			-- Mode corresponding to `a_mode_name_code:'
		do
			todo ("mode", False)
		end

end
	
