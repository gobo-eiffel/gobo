indexing

	description:

	"Objects that handle many-to-many A less-than B comparisons%
	%by evaluating min(A) < max (B) and similarly for greater-than, etc.%
	%This expression is only used where it is known that the comparisons%
	%will all be numeric: that is, where at least one of the operands has%
	%a static type that is a numeric sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MINIMAX_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			optimize, evaluate_item, calculate_effective_boolean_value, make
		end

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			a_value: XM_XPATH_VALUE
			a_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
		do
			mark_unreplaced
			first_operand.optimize (a_context)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.optimize (a_context)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				end
				if not is_error and then not was_expression_replaced then

					-- If either operand is a statically-known list of values, we only need
					-- to retain the minimum or maximum value, depending on the operator.
					
					if first_operand.is_value then
						a_value := first_operand.as_value
						a_value.create_iterator (Void)
						a_range := computed_range (a_value.last_iterator)
						if a_range = Void then
							set_replacement (false_value)
						elseif operator = Less_than_token or else operator = Less_equal_token then
							set_first_operand (a_range.item (1))
						else
							set_first_operand (a_range.item (2))
						end
					end
					if not was_expression_replaced then
						if second_operand.is_value  then
							a_value := second_operand.as_value
							a_value.create_iterator (Void)
							a_range :=  computed_range (a_value.last_iterator)
							if a_range = Void then
								set_replacement (false_value)
							elseif operator = Greater_than_token or else operator = Greater_equal_token then
								set_second_operand (a_range.item (1))
							else
								set_second_operand (a_range.item (2))
							end
						end
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			first_range, second_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
		do
			first_operand.create_iterator (a_context)
			if first_operand.last_iterator.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (first_operand.last_iterator.error_value)
			else
				first_range := computed_range (first_operand.last_iterator)
				if first_operand.last_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (first_operand.last_iterator.error_value)
				else
					second_operand.create_iterator (a_context)
					if second_operand.last_iterator.is_error then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error (second_operand.last_iterator.error_value)
					else
						second_range := computed_range (second_operand.last_iterator)
						if second_operand.last_iterator.is_error then
							create last_boolean_value.make (False)
							last_boolean_value.set_last_error (second_operand.last_iterator.error_value)
						else
							if first_range = Void or else second_range = Void then
								last_boolean_value := false_value
							else
								
								-- Now test how the min of one sequence compares to the max of the other
								
								inspect
									operator
								when Less_than_token then
									create last_boolean_value.make (first_range.item (1).three_way_comparison (second_range.item (2)) = -1)
								when Less_equal_token then
									create last_boolean_value.make (first_range.item (1).three_way_comparison (second_range.item (2)) <= 0)
								when Greater_than_token then
									create last_boolean_value.make (first_range.item (2).three_way_comparison (second_range.item (1)) = 1)
								when Greater_equal_token then
									create last_boolean_value.make (first_range.item (2).three_way_comparison (second_range.item (1)) >= 0)
								end
							end
						end
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

feature {NONE} -- Implementation

	computed_range (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]): ARRAY [XM_XPATH_NUMERIC_VALUE] is
			-- Compute the range of a sequence, ignoring NaNs;
			-- Not 100% pure - caller checks for iterators going into error status.
		require
			iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
		local
			a_number: XM_XPATH_NUMERIC_VALUE
			finished: BOOLEAN
		do
			from
				an_iterator.start
			until
				finished or else an_iterator.is_error or else an_iterator.after
			loop
				if not an_iterator.item.is_numeric_value then
					finished := True
				else
					a_number := an_iterator.item.as_numeric_value
					if not a_number.is_nan then
						if Result = Void then
							create Result.make (1,2)
							Result.put (a_number, 1)
							Result.put (a_number, 2)
						else
							if a_number.three_way_comparison (Result.item (1)) = -1 then
								Result.put (a_number, 1)
							end
							if a_number.three_way_comparison (Result.item (2)) = 1 then
								Result.put (a_number, 2)
							end							
						end
					end
				end
				an_iterator.forth
			end
		ensure
			void_or_two_numbers: Result /= Void implies Result.count = 2
		end

	false_value: XM_XPATH_BOOLEAN_VALUE is
			-- False result
		do
			create Result.make (False)
		ensure
			false_value_not_void: Result /= Void and then not Result.value
		end

end
	
