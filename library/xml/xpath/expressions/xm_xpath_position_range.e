indexing

	description:

		"XPath Expressions that test whether a position() is within a certain range"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_POSITION_RANGE

inherit

	XM_XPATH_COMPUTED_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (an_integer, another_integer: INTEGER) is
			-- Establish invariant.
		require
			strictly_positive_lower_bound: an_integer > 0
			valid_upper_bound: another_integer >= an_integer
		do
			minimum_position := an_integer
			maximum_position := another_integer
			compute_static_properties
		ensure
			minumum_set: minimum_position = an_integer
			maxumum_set: maximum_position = another_integer
		end
			
feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	minimum_position: INTEGER
			-- Minimum position

	maximum_position: INTEGER
			-- Maximum position

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "positionRange(")
			a_string := STRING_.appended_string (a_string, minimum_position.out)
			a_string := STRING_.appended_string (a_string, ",")
			a_string := STRING_.appended_string (a_string, maximum_position.out)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	
feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			set_analyzed
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			todo ("compute-cardinality", False)
			-- TODO
		end

invariant

	minimum_position: minimum_position > 0
	proper_range: maximum_position >= minimum_position 

end
