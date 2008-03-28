indexing

	description:

		"Objects that implement the XPath avg() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AVG

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
			name := "avg"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Avg_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
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
				Result := type_factory.double_type
			elseif a_base_type.primitive_type = type_factory.integer_type.fingerprint then
				Result := type_factory.decimal_type
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
			create Result.make_atomic_sequence
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_untyped_atomic: XM_XPATH_STRING_VALUE
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
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
					a_result.put (Void)
				else
					l_item := l_iterator.item
					if l_item.is_error then
						a_result.put (l_item)
					else
						check
							item_is_atomic: l_item.is_atomic_value
							-- static typing
						end
						l_atomic_value := l_item.as_atomic_value.primitive_value
						if l_atomic_value.is_untyped_atomic then
							l_untyped_atomic := l_atomic_value.as_untyped_atomic 
							if l_untyped_atomic.is_convertible (type_factory.double_type) then
								l_untyped_atomic.convert_to_type (type_factory.double_type)
								l_numeric_value := l_untyped_atomic.converted_value.as_numeric_value
							else
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
									Xpath_errors_uri, "FORG0006", Dynamic_error))
							end
						elseif l_atomic_value.is_duration_value then
							l_duration_value := l_atomic_value.as_duration_value
							if not l_duration_value.is_months_duration and then not l_duration_value.is_seconds_duration then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains a duration value that is neither xdt:yearMonthDuration nor xdt:dayTimeDuration",
									Xpath_errors_uri, "FORG0006", Dynamic_error))
							end
						elseif l_atomic_value.is_numeric_value then
							l_numeric_value := l_atomic_value.as_numeric_value
						else
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
								Xpath_errors_uri, "FORG0006", Dynamic_error))
						end
						if a_result.item = Void then -- no error yet
							if l_numeric_value /= Void then
								if l_numeric_value.is_nan then
									a_result.put (l_numeric_value)
								else
									evaluate_numeric_average (a_result, l_numeric_value, l_iterator)
								end
							else
								evaluate_duration_average (a_result, l_duration_value, l_iterator)
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
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

feature {NONE} -- Implementation

	evaluate_numeric_average (a_result: DS_CELL [XM_XPATH_ITEM]; a_first_value: XM_XPATH_NUMERIC_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate average of a sequence of numeric values.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: an_iterator /= Void and then not an_iterator.is_error and then not an_iterator.off and then an_iterator.index = 1
		local
			l_sum, l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_integer_value: XM_XPATH_INTEGER_VALUE
			l_count: INTEGER
			l_item: XM_XPATH_ITEM
			l_untyped_atomic: XM_XPATH_STRING_VALUE
		do
			from
				l_count := 1
				l_sum := a_first_value
				an_iterator.forth
			until
				an_iterator.is_error or else an_iterator.after or  a_result.item /= Void
			loop
				l_item := an_iterator.item
				if l_item.is_error then
					a_result.put (l_item)
				else
					if l_item.is_untyped_atomic then
						l_untyped_atomic := l_item.as_untyped_atomic
						if l_untyped_atomic.is_convertible (type_factory.double_type) then
							l_untyped_atomic.convert_to_type (type_factory.double_type)
							l_numeric_value := l_untyped_atomic.converted_value.as_numeric_value
						else
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
								Xpath_errors_uri, "FORG0006", Dynamic_error))
						end
					elseif not l_item.is_numeric_value then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains mixed numeric and non-numeric values",
							Xpath_errors_uri, "FORG0006", Dynamic_error))
					else
						l_numeric_value := l_item.as_numeric_value
					end
					if a_result.item = Void then
						if l_numeric_value.is_nan then
							a_result.put (l_numeric_value)
						else
							l_sum := l_sum.arithmetic (Plus_token, l_numeric_value)
							if l_sum.is_error or else l_sum.is_nan then
								a_result.put (l_sum)
							end
						end
					end
				end
				l_count := l_count + 1
				an_iterator.forth
			end
			if an_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (an_iterator.error_value))
			elseif a_result.item = Void then -- no error
				create l_integer_value.make_from_integer (l_count)
				a_result.put (l_sum.arithmetic (Division_token, l_integer_value))
			end
		end

	evaluate_duration_average (a_result: DS_CELL [XM_XPATH_ITEM]; a_first_value: XM_XPATH_DURATION_VALUE; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate average of a sequence of duration values.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void			
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: a_iterator /= Void and then not a_iterator.is_error and then not a_iterator.off and then a_iterator.index = 1
		local
			l_sum, l_duration_value: XM_XPATH_DURATION_VALUE
			l_count: INTEGER
			l_item: XM_XPATH_ITEM
			l_is_year_month: BOOLEAN
		do
			from
				l_is_year_month := a_first_value.is_months_duration
				l_count := 1
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
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains mixed duration and non-duration values",
							Xpath_errors_uri, "FORG0006", Dynamic_error))
					else
						l_duration_value := l_item.as_atomic_value.as_duration_value
						if l_duration_value.is_months_duration /= l_is_year_month then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Input to avg() contains mixed xdt:yearMonthDuration and xdt:dayTimeDuration values",
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
				l_count := l_count + 1
				a_iterator.forth
			end
			if a_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (a_iterator.error_value))
			elseif a_result.item = Void then -- no error
				a_result.put (l_sum.multiply (1.0 / l_count))
			end
		end

end
	
