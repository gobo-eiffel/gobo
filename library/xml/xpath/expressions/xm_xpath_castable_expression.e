indexing

	description:

		"XPath castable as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CASTABLE_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION

	XM_XPATH_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
			-- TODO
		do
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "castable")
			std.error.put_string (a_string)
			std.error.put_new_line
			source.display (level + 1, pool)
			a_string := STRING_.appended_string (indent (level + 1), "as")
			a_string := STRING_.appended_string (a_string, type_name (target_type))
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
	
	source: XM_XPATH_EXPRESSION
			-- Castable expression 
	
	target_type: INTEGER
			-- Target type 
end
