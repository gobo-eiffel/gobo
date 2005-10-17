indexing

	description:

		"Objects that implement the XPath sum() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUM

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_arguments
		end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "sum"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Sum_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		local
			a_base_type: XM_XPATH_ITEM_TYPE
		do
			a_base_type := arguments.item (1).atomized_item_type (False)
			if a_base_type = type_factory.untyped_atomic_type then
				a_base_type := type_factory.double_type
			end
			if arguments.item (1).cardinality_allows_zero then
				if arguments.count = 1 then
					Result := common_super_type (a_base_type, type_factory.integer_type)
				else
					Result := common_super_type (a_base_type, arguments.item (2).item_type)
				end
			else
				Result := a_base_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_atomic_sequence
			when 2 then
				create Result.make_optional_atomic
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_sum: XM_XPATH_ATOMIC_VALUE
			a_duration_value: XM_XPATH_DURATION_VALUE
		do
			last_evaluated_item := Void
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			else
				an_iterator.start
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				elseif an_iterator.after then
					if arguments.count = 1 then
						create {XM_XPATH_INTEGER_VALUE} last_evaluated_item.make_from_integer (0)
					else
						arguments.item (2).evaluate_item (a_context)
						last_evaluated_item := arguments.item (2).last_evaluated_item
					end
				else
					check
						sum_is_atomic: an_iterator.item.is_atomic_value
						-- static typing
					end
					a_sum := an_iterator.item.as_atomic_value
					if a_sum.is_untyped_atomic then
						a_sum := a_sum.convert_to_type (type_factory.double_type)
					elseif a_sum.is_duration_value then
						a_duration_value := a_sum.as_duration_value
						if not a_duration_value.is_months_duration and then not a_duration_value.is_seconds_duration then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains a duration value that is neither xdt:yearMonthDuration nor xdt:dayTimeDuration",
																														Xpath_errors_uri, "FORG0006", Dynamic_error)
						end
					end
					if a_sum.is_numeric_value then
						if a_sum.as_numeric_value.is_nan then
							last_evaluated_item := a_sum
						else
							evaluate_numeric_total (a_sum.as_numeric_value, an_iterator)
						end
					elseif a_sum.is_duration_value then
						evaluate_duration_total (a_sum.as_duration_value, an_iterator)
					else
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains a value that is neither numeric nor a duration",
																													"", "FORG0006", Dynamic_error)
					end
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			arguments.item (1).set_unsorted (True)
			if arguments.item (1).was_expression_replaced then
				arguments.replace (arguments.item (1).replacement_expression, 1)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	evaluate_numeric_total (a_first_value: XM_XPATH_NUMERIC_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate total of a sequence of numeric values.
		require
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: an_iterator /= Void and then not an_iterator.is_error and then not an_iterator.off and then an_iterator.index = 1
		local
			a_sum, a_numeric_value: XM_XPATH_NUMERIC_VALUE
			an_item: XM_XPATH_ITEM
			finished: BOOLEAN
		do			
			from
				a_numeric_value := a_first_value; an_iterator.forth
			until
				finished or else an_iterator.is_error or else an_iterator.after
			loop
				an_item := an_iterator.item
				if an_item.is_error then
					last_evaluated_item := an_item; finished := True
				elseif an_item.is_untyped_atomic then
					a_sum := an_item.as_untyped_atomic.convert_to_type (type_factory.double_type).as_numeric_value
				elseif an_item.as_atomic_value.is_convertible (type_factory.double_type) then
					a_sum := an_item.as_atomic_value.convert_to_type (type_factory.double_type).as_numeric_value
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains a mix of numeric and non-numeric values",
																												"", "FORG0006", Dynamic_error); finished := True
				end
				if not finished then
					if a_sum.is_nan then
						last_evaluated_item := a_sum; finished := True
					else
						a_numeric_value := a_numeric_value.arithmetic (Plus_token, a_sum)
						if a_numeric_value.is_nan then
							last_evaluated_item := a_sum; finished := True
						end
					end

				end
				an_iterator.forth
			end
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			elseif last_evaluated_item = Void then
				if not a_numeric_value.item_type.is_same_type (item_type) then
					last_evaluated_item := a_numeric_value.convert_to_type (item_type)
				else
					last_evaluated_item := a_numeric_value
				end
			end
		end

	evaluate_duration_total (a_first_value: XM_XPATH_DURATION_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate sum of a sequence of duration values.
		require
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: an_iterator /= Void and then not an_iterator.is_error and then not an_iterator.off and then an_iterator.index = 1
		local
			a_sum, a_duration_value: XM_XPATH_DURATION_VALUE
			an_item: XM_XPATH_ITEM
			is_year_month: BOOLEAN
		do
			from
				is_year_month := a_first_value.is_months_duration
				last_evaluated_item := Void
				a_sum := a_first_value
				an_iterator.forth
			until
				an_iterator.is_error or else an_iterator.after or else last_evaluated_item /= Void
			loop
				an_item := an_iterator.item
				if an_item.is_error then
					last_evaluated_item := an_item
				else
					if not an_item.is_atomic_value or else not an_item.as_atomic_value.is_duration_value then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains mixed duration and non-duration values",
																													Xpath_errors_uri, "FORG0006", Dynamic_error)
					else
						a_duration_value := an_item.as_atomic_value.as_duration_value
						if a_duration_value.is_months_duration /= is_year_month then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains mixed xdt:yearMonthDuration and xdt:dayTimeDuration values",
																														Xpath_errors_uri, "FORG0006", Dynamic_error)
						end
					end
					if last_evaluated_item = Void then
						an_item := a_sum.plus (a_duration_value)
						if an_item.is_error then
							last_evaluated_item := an_item
						else
							a_sum := an_item.as_atomic_value.as_duration_value
							check
								good_duration: a_sum.is_months_duration or else a_sum.is_seconds_duration
								-- plus will return an error otherwise
							end							
						end
					end
				end
				an_iterator.forth
			end
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			elseif last_evaluated_item = Void then -- no error
				last_evaluated_item := a_sum
			end
		end

end
	
