indexing

	description:

		"Objects that represent a filter of the form EXPR[position() > n]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TAIL_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
-- TODO redefinitions
creation

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION; a_start: INTEGER) is
			-- Establish invariant.
		require
			base_expression_not_void: a_base_expression /= Void
			strictly_positive_start: a_start > 0
		do
			base_expression := a_base_expression
			start := a_start
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_base_expression
			start_set: start = a_start
		end
		
feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression to be filtered

	start: INTEGER
			--  Offset of first item within `base_expression' to be included

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "tail ")
			a_string := STRING_.appended_string (a_string, start.out)
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				base_expression.display (a_level + 1, a_pool)
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
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

invariant

	strictly_positive_start: start > 0
	base_expression_not_void: base_expression /= Void

end
