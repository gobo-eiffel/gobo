indexing

	description:

		"Objects that implement the XPath substring-after() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUBSTRING_AFTER

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

	make is
			-- Establish invariant
		do
			name := "substring-after"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Substring_after_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
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
				if not a_result.item.is_atomic_value then
					create {XM_XPATH_STRING_VALUE} l_atomic_value.make ("")
				else
					l_atomic_value := a_result.item.as_atomic_value
				end
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				if not a_result.item.is_atomic_value then
					create {XM_XPATH_STRING_VALUE} l_other_atomic_value.make ("")
				else
					l_other_atomic_value := a_result.item.as_atomic_value
				end
				l_s1 := l_atomic_value.string_value
				l_s2 := l_other_atomic_value.string_value
				if l_s2.count = 0 then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_s1))
				elseif l_s1.count = 0 then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
				else
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (substring_after (l_s1, l_s2, l_collator)))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	substring_after (s1, s2: STRING; a_collator: ST_COLLATOR): STRING is
			-- Substring of s1 after first occurrence of s2 according to the rules of `a_collator'?
		require
			first_string_not_void: s1 /= Void
			second_string_not_void: s2 /= Void
			collator_not_void: a_collator /= Void
		local
			an_index: INTEGER
			a_substring: STRING
			found: BOOLEAN
		do
			from
				an_index := 1
			variant
				s1.count - s2.count + 1 - an_index
			until
				found or else an_index > s1.count - s2.count
			loop
				a_substring := s1.substring (an_index, an_index + s2.count - 1)
				if a_collator.three_way_comparison (a_substring, s2) = 0 then
					found := True
					if an_index + s2.count - 1 = s1.count then
						Result := ""
					else
						Result := s1.substring (an_index + s2.count, s1.count)
					end
				end
				an_index := an_index + 1
			end
			if not found then Result := "" end
		end
	
end
	
