indexing

	description:

	"Objects that represent a parsed for clause"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOR_CLAUSE

feature -- Access

	range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

	sequence: XM_XPATH_EXPRESSION
			-- In clause
	
	line_number: INTEGER
			-- Line number
end
