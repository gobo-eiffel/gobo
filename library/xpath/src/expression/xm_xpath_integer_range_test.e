note

	description:

		"XPath expressions of the form E = N to M where E, N, and M are all expressions of type integer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_INTEGER_RANGE_TEST

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			sub_expressions, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make (a_value, a_min, a_max: XM_XPATH_EXPRESSION)
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
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			value_set: value = a_value
			minimum_bound_set: minimum_bound = a_min
			maximum_bound_set: maximum_bound = a_max
		end

feature -- Access

	value: XM_XPATH_EXPRESSION
			-- Value to be tested

	minimum_bound, maximum_bound: XM_XPATH_EXPRESSION
			-- Inclusive bounds over `value'

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (3)
			Result.set_equality_tester (expression_tester)
			Result.put (value, 1)
			Result.put (minimum_bound, 2)
			Result.put (maximum_bound, 3)
		ensure then
			three_sub_expressions: Result.count = 3
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "range test minimum<=value<=maximum ")
			std.error.put_string (a_string)
			std.error.put_new_line
			minimum_bound.display (a_level + 1)
			value.display (a_level + 1)
			maximum_bound.display (a_level + 1)
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			check
				cant_happen: False
				-- We only get one of these expressions after the operands have been optimized
			end
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_value: XM_XPATH_NUMERIC_VALUE
		do
			value.evaluate_item (a_result, a_context)
			if not attached a_result.item as l_result_item then
				a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
			elseif not l_result_item.is_error then
				l_value := l_result_item.as_numeric_value
				a_result.put (Void)
				minimum_bound.evaluate_item (a_result, a_context)
				if not attached a_result.item as l_result_item2 or else l_result_item2.is_error then
					-- nothing to do
				else
					if l_value.three_way_comparison (l_result_item2.as_numeric_value, a_context) = -1 then
						a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
					else
						a_result.put (Void)
						maximum_bound.evaluate_item (a_result, a_context)
						if not attached a_result.item as l_result_item3 or else l_result_item3.is_error then
							-- nothing to do
						else
							a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (l_value.three_way_comparison (l_result_item3.as_numeric_value, a_context) < 1))
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

invariant

	value_not_void: value /= Void
	minimum_bound_not_void: minimum_bound /= Void
	maximum_bound_not_void: maximum_bound /= Void

end

