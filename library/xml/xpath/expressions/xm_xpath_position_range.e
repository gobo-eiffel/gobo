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

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
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

	is_maximum_unbounded: BOOLEAN
			-- Do we ignore `maximum_position'?
	
feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			-- TODO
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end

invariant

	minimum_position: minimum_position > 0
	proper_range: not is_maximum_unbounded implies maximum_position >= minimum_position 
	unbounded_range: is_maximum_unbounded implies maximum_position = 0

end
