note

	description:

		"Objects that implement the XPath contains() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTAINS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, check_static_type
		redefine
			evaluate_item
		end

	XM_XPATH_COLLATING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "contains"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Contains_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number < 3 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

	is_test_for_zero: BOOLEAN
			-- If this is set we return 0 for a zero length string, 1 for any other;
			-- Set by the optimizer.

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_collator: ST_COLLATOR
			l_atomic_value, l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_s1, l_s2: STRING
		do
			l_collator := collator (3, a_context, True)
			if l_collator = Void then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error))
			else
				arguments.item (1).evaluate_item (a_result, a_context)
				if a_result.item = Void or else a_result.item.is_error then
					-- nothing to do
				else
					if not a_result.item.is_atomic_value then
						create {XM_XPATH_STRING_VALUE} l_atomic_value.make ("")
					else
						l_atomic_value := a_result.item.as_atomic_value
					end
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					if a_result.item = Void or else a_result.item.is_error then
						-- nothing to do
					else
						if not a_result.item.is_atomic_value then
							create {XM_XPATH_STRING_VALUE} l_other_atomic_value.make ("")
						else
							l_other_atomic_value := a_result.item.as_atomic_value
						end
						l_s1 := l_atomic_value.string_value
						l_s2 := l_other_atomic_value.string_value
						if l_s2.count = 0 then
							a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (True))
						elseif l_s1.count = 0 then
							a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
						else
							a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (collation_contains (l_s1, l_s2, l_collator)))
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

feature {NONE} -- Implementation

	collation_contains (s1, s2: STRING; a_collator: ST_COLLATOR): BOOLEAN
			-- Does `s1' contain `s2' according to the rules of `a_collator'?
		require
			first_string_not_void: s1 /= Void
			second_string_not_void: s2 /= Void
			collator_not_void: a_collator /= Void
		local
			l_index, l_ct_1, l_ct_2: INTEGER
			l_substring: STRING
		do
			-- Implementation for Unicode code point collator only
			l_ct_1 := s1.count
			l_ct_2 := s2.count
			if l_ct_1 = l_ct_2 then
				Result := STRING_.same_string (s1, s2)
			elseif l_ct_2 < l_ct_1 then
				from
					l_index := 1
				until
					Result or else l_index > l_ct_1 - l_ct_2 + 1
				loop
					l_substring := s1.substring (l_index, l_index + l_ct_2 - 1)
					Result := a_collator.three_way_comparison (l_substring, s2) = 0
					l_index := l_index + 1
				variant
					l_ct_1 - l_ct_2 + 2 - l_index
				end
			end
		end

end

