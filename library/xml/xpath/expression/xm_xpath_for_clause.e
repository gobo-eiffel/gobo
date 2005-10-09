indexing

	description:

	"Objects that represent a parsed for clause"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOR_CLAUSE

create

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; a_line_number: INTEGER) is
			-- Establish_invariant.
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_not_void: a_sequence_expression /= Void
			strictly_positive_line_number: a_line_number > 0
		do
			range_variable := a_range_variable
			sequence := a_sequence_expression
			line_number := a_line_number
		ensure
			range_variable_set: range_variable = a_range_variable
			sequence_set: sequence = a_sequence_expression
			line_number_set: line_number = a_line_number
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
