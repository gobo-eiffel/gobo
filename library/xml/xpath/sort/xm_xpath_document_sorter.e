indexing

	description:

		"Expressions that sort a sequence of nodes into document order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_SORTER

inherit

		XM_XPATH_COMPUTED_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			base_expression := an_expression
		end

feature -- Access

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			-- TODO
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "Sort into Document Order")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1, a_pool)
		end

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

end
	
