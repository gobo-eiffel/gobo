indexing

	description:

		"XPath InstanceOf Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INSTANCE_OF_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
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

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "instance-of ")
			std.error.put_string (a_string)
			std.error.put_new_line
			source.display (a_level + 1, a_pool)
			a_string := STRING_.appended_string (indent (a_level), type_name (target_type))
			a_string := STRING_.appended_string (a_string, target.occurence_indicator)			
			std.error.put_string (a_string)
			std.error.put_new_line			
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			-- TODO
			todo ("analyze", False)
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			todo ("compute-cardinality", False)
			-- TODO
		end
	
	source: XM_XPATH_EXPRESSION
			--  TODO

	target: XM_XPATH_SEQUENCE_TYPE
			-- TODO

	target_type: INTEGER
			--  TODO

end
