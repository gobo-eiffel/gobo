indexing

	description:

	"Objects that implement an XQuery let expression: let $x := expr return expr.%
	%Used internally by XPath for optimizing the expression tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LET_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION

creation

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			-- TODO
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
				Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create Result.make (sequence.item_type, sequence.cardinality)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "let $")
			a_string := STRING_.appended_string (a_string, declaration.name)
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
			a_string := STRING_.appended_string (indent (a_level), "return")
			action.display (a_level + 1, a_pool)
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions;		
		do
			-- TODO - more code to write
			Result := Current -- haha
		end


feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (action.cardinality)
		end
	
end
