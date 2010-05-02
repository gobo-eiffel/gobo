note

	description:

	"Objects that handle many-to-many A less-than B comparisons%
	%by evaluating min(A) < max (B) and similarly for greater-than, etc.%
	%This expression is only used where it is known that the comparisons%
	%will all be numeric: that is, where at least one of the operands has%
	%a static type that is a numeric sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION)
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_value: XM_XPATH_VALUE
			l_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			set_first_operand (l_replacement.item)
			if first_operand.is_error then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.optimize (l_replacement, a_context, a_context_item_type)
				set_second_operand (l_replacement.item)
				if second_operand.is_error then
					set_replacement (a_replacement, second_operand)
				end
				if a_replacement.item = Void then
					-- If either operand is a statically-known list of values, we only need
					-- to retain the minimum or maximum value, depending on the operator.
					if first_operand.is_value and not first_operand.depends_upon_implicit_timezone then
						l_value := first_operand.as_value
						l_value.create_iterator (Void)
						l_range := computed_range (l_value.last_iterator, Void)
						if l_range = Void then
							set_replacement (a_replacement, false_value)
						elseif operator = Less_than_token or else operator = Less_equal_token then
							set_first_operand (l_range.item (1))
						else
							set_first_operand (l_range.item (2))
						end
					end
					if a_replacement.item = Void then
						if second_operand.is_value and not second_operand.depends_upon_implicit_timezone then
							l_value := second_operand.as_value
							l_value.create_iterator (Void)
							l_range :=  computed_range (l_value.last_iterator, Void)
							if l_range = Void then
								set_replacement (a_replacement, false_value)
							elseif operator = Greater_than_token or else operator = Greater_equal_token then
								set_second_operand (l_range.item (1))
							else
								set_second_operand (l_range.item (2))
							end
						end
					end
					if a_replacement.item = Void then
						a_replacement.put (Current)
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			first_range, second_range: ARRAY [XM_XPATH_NUMERIC_VALUE]
		do
			first_operand.create_iterator (a_context)
			if first_operand.last_iterator.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (first_operand.last_iterator.error_value)
			else
				first_range := computed_range (first_operand.last_iterator, a_context)
				if first_operand.last_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (first_operand.last_iterator.error_value)
				else
					second_operand.create_iterator (a_context)
					if second_operand.last_iterator.is_error then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error (second_operand.last_iterator.error_value)
					else
						second_range := computed_range (second_operand.last_iterator, a_context)
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
									create last_boolean_value.make (first_range.item (1).three_way_comparison (second_range.item (2), a_context) = -1)
								when Less_equal_token then
									create last_boolean_value.make (first_range.item (1).three_way_comparison (second_range.item (2), a_context) <= 0)
								when Greater_than_token then
									create last_boolean_value.make (first_range.item (2).three_way_comparison (second_range.item (1), a_context) = 1)
								when Greater_equal_token then
									create last_boolean_value.make (first_range.item (2).three_way_comparison (second_range.item (1), a_context) >= 0)
								end
							end
						end
					end
				end
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end

feature {NONE} -- Implementation

	computed_range (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT): ARRAY [XM_XPATH_NUMERIC_VALUE]
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
							if a_number.three_way_comparison (Result.item (1), a_context) = -1 then
								Result.put (a_number, 1)
							end
							if a_number.three_way_comparison (Result.item (2), a_context) = 1 then
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

	false_value: XM_XPATH_BOOLEAN_VALUE
			-- False result
		do
			create Result.make (False)
		ensure
			false_value_not_void: Result /= Void and then not Result.value
		end

end

