indexing

	description:

		"XPath expressions of the form E = N to M where E, N, and M are all expressions of type integer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTEGER_RANGE_TEST

inherit

	XM_XPATH_COMPUTED_EXPRESSION
	
creation

	make

feature {NONE} -- Initialization

	make (a_value, a_min, a_max: XM_XPATH_EXPRESSION)is
			-- Establish invariant.
		require
			value_not_void: a_value /= Void
			minimum_bound_not_void: a_min /= Void
			maximum_bound_not_void: a_max /= Void
		do
			value := a_value
			minimum_bound := a_min
			maximum_bound := a_max
			compute_static_properties
		ensure
			value_set: value = a_value
			minimum_bound_set: minimum_bound = a_min
			maximum_bound_set: maximum_bound = a_max
		end

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	value: XM_XPATH_EXPRESSION
			-- Value to be tested

	minimum_bound, maximum_bound: XM_XPATH_EXPRESSION
			-- Inclusive bounds over `value'


feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "range test minimum<=value<=maximum ")
			std.error.put_string (a_string)
			std.error.put_new_line
			minimum_bound.display (a_level + 1, a_pool)
			value.display (a_level + 1, a_pool)
			maximum_bound.display (a_level + 1, a_pool)
		end

feature -- Optimization

		analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			-- TODO
			todo ("analyze", True)
			Result := Current
			Result.set_analyzed			
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			todo ("compute-cardinality", False)
			-- TODO
		end
	
invariant

	value_not_void: value /= Void
	minimum_bound_not_void: minimum_bound /= Void
	maximum_bound_not_void: maximum_bound /= Void

end
	
