indexing

	description:

		"XPath cast as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CAST_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION

creation

	make, make_from_sequence_type

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target_type: INTEGER; empty_ok: BOOLEAN) is
			-- TODO
		do
		end

	make_from_sequence_type (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
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

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "cast as ")
			a_string := STRING_.appended_string (a_string, type_name (target_type))
			std.error.put_string (a_string)
			std.error.put_new_line
			source.display (a_level + 1, a_pool)
		end

feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
			Result := Current
			Result.set_analyzed			
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
