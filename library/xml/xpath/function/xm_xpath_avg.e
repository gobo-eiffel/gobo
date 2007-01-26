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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_untyped_atomic: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_duration_value: XM_XPATH_DURATION_VALUE
		do
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			else
				an_iterator.start
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				elseif an_iterator.after then
					last_evaluated_item := Void
				else
					an_item := an_iterator.item
					if an_item.is_error then
						last_evaluated_item := an_item
					else
						check
							item_is_atomic: an_item.is_atomic_value
							-- static typing
						end
						an_atomic_value := an_item.as_atomic_value.primitive_value
						if an_atomic_value.is_untyped_atomic then
							an_untyped_atomic := an_atomic_value.as_untyped_atomic 
							if an_untyped_atomic.is_convertible (type_factory.double_type) then
								a_numeric_value := an_untyped_atomic.convert_to_type (type_factory.double_type).as_numeric_value
							else
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
																															Xpath_errors_uri, "FORG0006", Dynamic_error)
							end
						elseif an_atomic_value.is_duration_value then
							a_duration_value := an_atomic_value.as_duration_value
							if not a_duration_value.is_months_duration and then not a_duration_value.is_seconds_duration then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains a duration value that is neither xdt:yearMonthDuration nor xdt:dayTimeDuration",
																														Xpath_errors_uri, "FORG0006", Dynamic_error)
							end
						elseif an_atomic_value.is_numeric_value then
							a_numeric_value := an_atomic_value.as_numeric_value
						else
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
																														Xpath_errors_uri, "FORG0006", Dynamic_error)
						end
						if last_evaluated_item = Void then -- no error yet
							if an_atomic_value.is_numeric_value then
								if a_numeric_value.is_nan then
									last_evaluated_item := a_numeric_value
								else
									evaluate_numeric_average (a_numeric_value, an_iterator)
								end
							else
								evaluate_duration_average (a_duration_value, an_iterator)
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
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

	evaluate_numeric_average (a_first_value: XM_XPATH_NUMERIC_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate average of a sequence of numeric values.
		require
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: an_iterator /= Void and then not an_iterator.is_error and then not an_iterator.off and then an_iterator.index = 1
		local
			a_sum, a_numeric_value: XM_XPATH_NUMERIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			count: INTEGER
			an_item: XM_XPATH_ITEM
			an_untyped_atomic: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			from
				count := 1
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
					if an_item.is_untyped_atomic then
						an_untyped_atomic := an_item.as_untyped_atomic
						if an_untyped_atomic.is_convertible (type_factory.double_type) then
							a_numeric_value := an_untyped_atomic.convert_to_type (type_factory.double_type).as_numeric_value
						else
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains a value that is neither numeric, nor a duration",
																														Xpath_errors_uri, "FORG0006", Dynamic_error)
						end
					elseif not an_item.is_numeric_value then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains mixed numeric and non-numeric values",
																													Xpath_errors_uri, "FORG0006", Dynamic_error)
					else
						a_numeric_value := an_item.as_numeric_value
					end
					if last_evaluated_item = Void then
						if a_numeric_value.is_nan then
							last_evaluated_item := a_numeric_value
						else
							a_sum := a_sum.arithmetic (Plus_token, a_numeric_value)
							if a_sum.is_error or else a_sum.is_nan then
								last_evaluated_item := a_sum
							end
						end
					end
				end
				count := count + 1
				an_iterator.forth
			end
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			elseif last_evaluated_item = Void then -- no error
				create an_integer_value.make_from_integer (count)
				last_evaluated_item := a_sum.arithmetic (Division_token, an_integer_value)
			end
		end

	evaluate_duration_average (a_first_value: XM_XPATH_DURATION_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate average of a sequence of duration values.
		require
			first_value_not_void: a_first_value /= Void
			sequence_on_first_position: an_iterator /= Void and then not an_iterator.is_error and then not an_iterator.off and then an_iterator.index = 1
		local
			a_sum, a_duration_value: XM_XPATH_DURATION_VALUE
			count: INTEGER
			an_item: XM_XPATH_ITEM
			is_year_month: BOOLEAN
		do
			from
				is_year_month := a_first_value.is_months_duration
				count := 1
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
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains mixed duration and non-duration values",
																													Xpath_errors_uri, "FORG0006", Dynamic_error)
					else
						a_duration_value := an_item.as_atomic_value.as_duration_value
						if a_duration_value.is_months_duration /= is_year_month then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to avg() contains mixed xdt:yearMonthDuration and xdt:dayTimeDuration values",
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
				count := count + 1
				an_iterator.forth
			end
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			elseif last_evaluated_item = Void then -- no error
				last_evaluated_item := a_sum.multiply (1.0 / count)
			end
		end

end
	
