indexing

	description:

	"Objects that represent a parsed for clause"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOR_CLAUSE

creation

	make

feature {NONE} -- Initialization

	make (rv: XM_XPATH_RANGE_VARIABLE_DECLARATION; seq: XM_XPATH_EXPRESSION; ln: INTEGER) is
			-- Establish_invariant.
		require
			range_variable_not_void: rv /= Void
			sequence_not_void: seq /= Void
			strictly_positive_line_number: ln > 0
		do
			range_variable := rv
			sequence := seq
			line_number := ln
		ensure
			range_variable_set: range_variable = rv
			sequence_set: sequence = seq
			line_number_set: line_number = ln
		end

feature -- Access

	range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

	sequence: XM_XPATH_EXPRESSION
			-- In clause
	
	line_number: INTEGER
			-- Line number

invariant
	
	range_variable_not_void: range_variable /= Void
	sequence_not_void: sequence /= Void
	strictly_positive_line_number: line_number > 0

end
