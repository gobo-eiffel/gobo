indexing

	description:

		"XPath is-last Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IS_LAST_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
-- TODO redefine simplify (et.al?)
creation

	make

feature {NONE} -- Initialization

	make (a_condition: BOOLEAN) is
			-- Set condition.
		do
			condition := a_condition
		ensure
			condition_set: condition = a_condition
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end

	condition: BOOLEAN
			-- Is position() eq last()?

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "isLast()")
			std.error.put_string (a_string)
			std.error.put_new_line
			end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			Result := Current
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end
	
end
