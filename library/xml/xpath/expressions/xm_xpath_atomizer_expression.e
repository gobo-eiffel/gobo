indexing

	description:

		"Objects that map a sequence by replacing nodes with their typed values. Corresponds to fn:data()"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIZER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION


creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			todo ("make", False)
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression
	
feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indent (a_level), "atomize"))
			std.error.put_new_line
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
			todo ("analyze", False)
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
			todo ("compute-cardinality", False)
		end

end

	
