note

	description:

		"Objects that implement the XPath sum() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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

	make
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

	item_type: XM_XPATH_ITEM_TYPE
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
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_sum: XM_XPATH_ATOMIC_VALUE
			l_duration_value: XM_XPATH_DURATION_VALUE
		do
			arguments.item (1).create_iterator (a_context)
			l_iterator := arguments.item (1).last_iterator
			if l_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
			else
				l_iterator.start
				if l_iterator.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
				elseif l_iterator.after then
					if arguments.count = 1 then
						a_result.put (create {XM_XPATH_MACHINE_INTEGER_VALUE}.make (0))
					else
						arguments.item (2).evaluate_item (a_result, a_context)
					end
				else
					check
						sum_is_atomic: l_iterator.item.is_atomic_value
						-- static typing
					end
					l_sum := l_iterator.item.as_atomic_value
					if l_sum.is_untyped_atomic then
						l_sum.convert_to_type (type_factory.double_type)
						l_sum := l_sum.converted_value
					elseif l_sum.is_duration_value then
						l_duration_value := l_sum.as_duration_value
						if not l_duration_value.is_months_duration and then not l_duration_value.is_seconds_duration then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to sum() contains a duration value that is neither xs:yearMonthDuration nor xs:dayTimeDuration",
								Xpath_errors_uri, "FORG0006", Dynamic_error))
						end
					end
					if l_sum.is_numeric_value then
						if l_sum.as_numeric_value.is_nan then
							a_result.put (l_sum)
						else
							evaluate_numeric_total (a_result, l_sum.as_numeric_value, l_iterator)
						end
					elseif l_sum.is_duration_value then
						evaluate_duration_total (a_result, l_sum.as_duration_value, l_iterator)
					else
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to sum() contains a value that is neither numeric nor a duration",
							"", "FORG0006", Dynamic_error))
					end
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, True)
				if arguments.item (1) /= l_replacement.item then
					arguments.replace (l_replacement.item, 1)
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

	evaluate_numeric_total (a_result: DS_CELL [XM_XPATH_ITEM]; a_first_value: XM_XPATH_NUMERIC_VALUE; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Evaluate total of a sequence of numeric values.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: a_iterator /= Void and then not a_iterator.is_error and then not a_iterator.off and then a_iterator.index = 1
		local
			l_sum, l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_item: XM_XPATH_ITEM
			l_finished: BOOLEAN
		do
			from
				l_numeric_value := a_first_value
				a_iterator.forth
			until
				l_finished or a_iterator.is_error or else a_iterator.after
			loop
				l_item := a_iterator.item
				if l_item.is_error then
					a_result.put (l_item)
					l_finished := True
				elseif l_item.is_untyped_atomic then
					l_item.as_untyped_atomic.convert_to_type (type_factory.double_type)
					l_sum := l_item.as_untyped_atomic.converted_value.as_numeric_value
				elseif not l_item.as_atomic_value.is_numeric_value then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to sum() contains a mix of numeric and non-numeric values",
						"", "FORG0006", Dynamic_error))
					l_finished := True
				else
					l_sum := l_item.as_atomic_value.as_numeric_value
				end
				if not l_finished then
					if l_sum.is_nan then
						a_result.put (l_sum)
						l_finished := True
					else
						l_numeric_value := l_numeric_value.arithmetic (Plus_token, l_sum)
						if l_numeric_value.is_nan then
							a_result.put (l_numeric_value)
							l_finished := True
						end
					end

				end
				a_iterator.forth
			end
			if a_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (a_iterator.error_value))
			elseif a_result.item = Void then
				a_result.put (l_numeric_value)
			end
		end

	evaluate_duration_total (a_result: DS_CELL [XM_XPATH_ITEM]; a_first_value: XM_XPATH_DURATION_VALUE; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Evaluate sum of a sequence of duration values.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: a_iterator /= Void and then not a_iterator.is_error and then not a_iterator.off and then a_iterator.index = 1
		local
			l_sum, l_duration_value: XM_XPATH_DURATION_VALUE
			l_item: XM_XPATH_ITEM
			l_is_year_month: BOOLEAN
		do
			from
				l_is_year_month := a_first_value.is_months_duration
				l_sum := a_first_value
				a_iterator.forth
			until
				a_iterator.is_error or else a_iterator.after or a_result.item /= Void
			loop
				l_item := a_iterator.item
				if l_item.is_error then
					a_result.put (l_item)
				else
					if not l_item.is_atomic_value or else not l_item.as_atomic_value.is_duration_value then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to sum() contains mixed duration and non-duration values",
							Xpath_errors_uri, "FORG0006", Dynamic_error))
					else
						l_duration_value := l_item.as_atomic_value.as_duration_value
						if l_duration_value.is_months_duration /= l_is_year_month then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to sum() contains mixed xs:yearMonthDuration and xs:dayTimeDuration values",
								Xpath_errors_uri, "FORG0006", Dynamic_error))
						end
					end
					if a_result.item = Void then
						l_item := l_sum.plus (l_duration_value)
						if l_item.is_error then
							a_result.put (l_item)
						else
							l_sum := l_item.as_atomic_value.as_duration_value
							check
								good_duration: l_sum.is_months_duration or else l_sum.is_seconds_duration
								-- plus will return an error otherwise
							end
						end
					end
				end
				a_iterator.forth
			end
			if a_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (a_iterator.error_value))
			elseif a_result.item = Void then -- no error
				a_result.put (l_sum)
			end
		end

end

