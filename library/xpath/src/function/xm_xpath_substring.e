note

	description:

		"Objects that implement the XPath substring() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SUBSTRING

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	KL_IMPORTED_DOUBLE_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "substring"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Substring_function_type_code
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
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_number
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_string: STRING
			l_double_value: XM_XPATH_DOUBLE_VALUE
			l_starting_position, l_ending_position, l_count: INTEGER
			l_starts_negative_infinity: BOOLEAN
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item then
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
			elseif not a_result_item.is_error then
				l_string := a_result_item.string_value
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				if attached a_result.item as a_result_item_2 and then a_result_item_2.is_error then
					-- nothing to do
				else
					check
						second_argument_convertible_to_double: attached a_result.item as a_result_item_2 and then a_result_item_2.is_atomic_value and then a_result_item_2.as_atomic_value.is_convertible (type_factory.double_type)
						-- static typing
					then
						a_result_item_2.as_atomic_value.convert_to_type (type_factory.double_type)
						check postcondition_of_convert_to_type: attached a_result_item_2.as_atomic_value.converted_value as l_converted_value then
							l_double_value := l_converted_value.as_double_value.rounded_value
							if l_double_value.is_nan then
								a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
							elseif l_double_value.is_platform_integer or l_double_value.value = DOUBLE_.minus_infinity then
								if l_double_value.value = DOUBLE_.minus_infinity then
									l_starts_negative_infinity := True
									l_starting_position := Platform.Minimum_integer
								else
									l_starting_position := DOUBLE_.truncated_to_integer (l_double_value.value)
								end
								a_result.put (Void)
								if arguments.count = 3 then
									arguments.item (3).evaluate_item (a_result, a_context)
									if attached a_result.item as a_result_item_3 and then a_result_item_3.is_error then
										-- nothing to do
									else
										check
											third_argument_convertible_to_double: attached a_result.item as a_result_item_3 and then a_result_item_3.is_atomic_value and then a_result_item_3.as_atomic_value.is_convertible (type_factory.double_type)
											-- static typing
										then
											a_result_item_3.as_atomic_value.convert_to_type (type_factory.double_type)
											check postcondition_of_convert_to_type: attached a_result_item_3.as_atomic_value.converted_value as l_converted_value_3 then
												l_double_value := l_converted_value_3.as_double_value.rounded_value
												if l_double_value.is_nan then
													a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
												elseif l_double_value.is_platform_integer then
													l_count := DOUBLE_.truncated_to_integer (l_double_value.value)
													if l_count < 1 then
														l_count := 0
													end
													l_ending_position := l_count + l_starting_position - 1
													if l_ending_position > l_string.count then
														l_ending_position := l_string.count
													end
													a_result.put (Void)
												elseif l_double_value.value = DOUBLE_.plus_infinity then
													if l_starts_negative_infinity then
														a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
													else
														l_ending_position := l_string.count
														a_result.put (Void)
													end
												else
													a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
												end
											end
										end
									end
								else
									l_ending_position := l_string.count
								end
							else
								a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
							end
						end
					end
				end
				if a_result.item = Void then
					if l_starting_position < 1 then l_starting_position := 1 end
					if l_ending_position < l_starting_position then
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
					else
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_string.substring (l_starting_position, l_ending_position)))
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

end

