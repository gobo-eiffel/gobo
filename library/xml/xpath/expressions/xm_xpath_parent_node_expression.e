indexing

	description:

		"XPath Parent Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PARENT_NODE_EXPRESSION

inherit

	XM_XPATH_SINGLE_NODE_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make is
			-- TODO
		do
		end

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "..")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
	
end
