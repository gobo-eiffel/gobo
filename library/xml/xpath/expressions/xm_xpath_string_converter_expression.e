indexing

	description:

		"Objects that perform string conversion in XPath 1.0 compatibility mode"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_CONVERTER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION


creation

	make

feature {NONE} -- Initialization

	make (base: XM_XPATH_EXPRESSION) is
			-- TODO
		do
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression
	
feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "convert to string: ")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end

end

	
