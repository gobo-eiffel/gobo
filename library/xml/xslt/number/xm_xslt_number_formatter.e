indexing

	description: "Objects that format a list of integers as a chacter string under the control of a format string,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER_FORMATTER

inherit

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_format: STRING) is
			-- Tokenize `a_format'.
		require
			format_string_not_void: a_format /= Void
		do
			todo ("make", False)
		end

end

