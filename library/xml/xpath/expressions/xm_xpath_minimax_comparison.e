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
			analyze, evaluate_item, effective_boolean_value
		end

creation

	make

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

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_value: XM_XPATH_VALUE
			a_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
		do
			mark_unreplaced
			Precursor (a_context)
			if not is_error and not was_expression_replaced then

				-- If either operand is a statically-known list of values, we only need
				-- to retain the minimum or maximum value, depending on the operator.

				a_value ?= first_operand
				if a_value /= Void then
					a_range :=  computed_range (a_value.iterator (Void))
					if a_range = Void then
						set_replacement (false_value)
					elseif operator = Less_than_token or else operator = Less_equal_token then
						set_first_operand (a_range.item (1))
					else
						set_first_operand (a_range.item (2))
					end
				end
				if not was_expression_replaced then
					a_value ?= second_operand
					if a_value /= Void then
						a_range :=  computed_range (a_value.iterator (Void))
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

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			first_range, second_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
		do
			first_range := computed_range (first_operand.iterator (a_context))
			second_range := computed_range (second_operand.iterator (a_context))
			if first_range = Void or else second_range = Void then
				Result := false_value
			else

				-- Now test how the min of one sequence compares to the max of the other

				inspect
					operator
				when Less_than_token then
					create Result.make (first_range.item (1).three_way_comparison (second_range.item (2)) = -1)
				when Less_equal_token then
					create Result.make (first_range.item (1).three_way_comparison (second_range.item (2)) <= 0)
				when Greater_than_token then
					create Result.make (first_range.item (2).three_way_comparison (second_range.item (1)) = 1)
				when Greater_equal_token then
					create Result.make (first_range.item (2).three_way_comparison (second_range.item (1)) >= 0)
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			last_evaluated_item := effective_boolean_value (a_context)
		end

feature {NONE} -- Implementation

	computed_range (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]): ARRAY [XM_XPATH_NUMERIC_VALUE] is
			-- Compute the range of a sequence, ignoring NaNs
		require
			iterator_not_void: an_iterator /= Void
		local
			a_number: XM_XPATH_NUMERIC_VALUE
			finished: BOOLEAN
		do
			if not an_iterator.is_error then
				from
					an_iterator.start
				until
					finished or else an_iterator.after
				loop
					a_number ?= an_iterator.item
					if a_number = Void then
						finished := True
					else
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
	
