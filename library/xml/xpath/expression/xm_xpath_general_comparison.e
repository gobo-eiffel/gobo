indexing

	description:

	"XPath general comparisons"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_GENERAL_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			display_operator, evaluate_item, check_static_type, optimize,
			calculate_effective_boolean_value, compute_cardinality
		end

	XM_XPATH_CARDINALITY

	XM_XPATH_ROLE

	XM_XPATH_TYPE
	
	XM_XPATH_COMPARISON_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			general_comparison_operator: is_general_comparison_operator (a_token)
		do
			make_binary_expression (an_operand_one, a_token, an_operand_two)
			create atomic_comparer.make (a_collator)
			singleton_operator := singleton_value_operator (operator)
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
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

	
	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			mark_unreplaced
			first_operand.check_static_type (a_context, a_context_item_type)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.check_static_type (a_context, a_context_item_type)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				end
				if not is_error then

					-- If either operand is statically empty, evaluate as `False'.

					if first_operand.is_empty_sequence
						or else second_operand.is_empty_sequence then
						create a_boolean_value.make (False)
						set_replacement (a_boolean_value)
					else
						first_operand.set_unsorted (False)
						if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
						second_operand.set_unsorted (False)
						if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
						operands_not_in_error_so_type_check (a_context, a_context_item_type)
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			mark_unreplaced
			first_operand.optimize (a_context, a_context_item_type)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.optimize (a_context, a_context_item_type)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				else
					
					-- If either operand is statically empty, evaluate as `False'.
					
					if first_operand.is_empty_sequence
						or else second_operand.is_empty_sequence then
						create a_boolean_value.make (False)
						set_replacement (a_boolean_value)
					else
						first_operand.set_unsorted (False)
						if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
						second_operand.set_unsorted (False)
						if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
						operands_not_in_error_so_optimize (a_context, a_context_item_type)
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			an_iterator, another_iterator, a_third_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_count: INTEGER
			a_value: XM_XPATH_VALUE
			finished: BOOLEAN
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			first_operand.create_iterator (a_context)
			an_iterator := first_operand.last_iterator
			if an_iterator.is_error then
				create last_boolean_value.make (False); last_boolean_value.set_last_error (an_iterator.error_value); set_last_error (an_iterator.error_value)
			else
				second_operand.create_iterator (a_context)
				another_iterator := second_operand.last_iterator
				if another_iterator.is_error then
					create last_boolean_value.make (False); last_boolean_value.set_last_error (another_iterator.error_value); set_last_error (another_iterator.error_value)
				else
					
					-- The second operand is more likely to be a singleton than the first so:
					
					expression_factory.create_sequence_extent (another_iterator)
					a_value := expression_factory.last_created_closure
					a_count := a_value.count
					if a_count = 0 then
						create last_boolean_value.make (False)
					elseif a_count = 1 then
						calculate_effective_boolean_value_with_second_operand_singleton (a_context, a_value.item_at (1), an_iterator)
					else -- a_count > 1 - so nested loop comparison
						from
							an_iterator.start
						until
							finished or else is_error or else an_iterator.after
						loop
							if an_iterator.is_error then
								create last_boolean_value.make (False)
								last_boolean_value.set_last_error (an_iterator.error_value)
								set_last_error (an_iterator.error_value)
							elseif not an_iterator.item.is_atomic_value then
								create last_boolean_value.make (False)
								last_boolean_value.set_last_error_from_string ("Atomization failed for first operand of general comparison", Xpath_errors_uri, "XPTY0004", Type_error)
								set_last_error (last_boolean_value.error_value)
								finished := True
							else
								from
									a_value.create_iterator (Void)
									a_third_iterator := a_value.last_iterator
									if not a_third_iterator.is_error then a_third_iterator.start end
								until
									finished or else a_third_iterator.is_error or else a_third_iterator.after
								loop
									if not a_third_iterator.item.is_atomic_value then
										create last_boolean_value.make (False)
										last_boolean_value.set_last_error_from_string ("Atomization failed for second operand of general comparison", Xpath_errors_uri, "XPTY0004", Type_error)
										set_last_error (last_boolean_value.error_value)
										finished := True
									else
										create a_comparison_checker
										a_comparison_checker.check_correct_general_relation (an_iterator.item.as_atomic_value, singleton_operator,
																											  atomic_comparer, a_third_iterator.item.as_atomic_value, False)
										if a_comparison_checker.is_comparison_type_error then
											create last_boolean_value.make (False); last_boolean_value.set_last_error (a_comparison_checker.last_type_error); set_last_error (last_boolean_value.error_value)
											finished := True
										elseif a_comparison_checker.last_check_result then
											create last_boolean_value.make (True)
											finished := True
										end
									end
									a_third_iterator.forth
								end
							end
							an_iterator.forth
						end
					end
					if last_boolean_value = Void then create last_boolean_value.make (False) end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	singleton_operator: INTEGER
			-- Singleton version of `operator'

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many ", Precursor)
		end

	calculate_effective_boolean_value_with_second_operand_singleton (a_context: XM_XPATH_CONTEXT; an_item: XM_XPATH_ITEM; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Effective boolean value
		local
			finished: BOOLEAN
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			last_boolean_value := Void
			if not an_item.is_atomic_value then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error_from_string ("Atomization failed for second operand of general comparison", Xpath_errors_uri, "XPTY0004", Type_error)
				set_last_error (last_boolean_value.error_value)
			else
				from
					an_iterator.forth
				until
					finished or else an_iterator.is_error or else an_iterator.after
				loop
					if not an_iterator.item.is_atomic_value then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error_from_string ("Atomization failed for first operand of general comparison", Xpath_errors_uri, "XPTY0004", Type_error)
						set_last_error (last_boolean_value.error_value)
						finished := True
					else
						create a_comparison_checker
						a_comparison_checker.check_correct_general_relation (an_iterator.item.as_atomic_value, singleton_operator, atomic_comparer, an_item.as_atomic_value, False)
						if a_comparison_checker.is_comparison_type_error then
							create last_boolean_value.make (False)
							last_boolean_value.set_last_error (a_comparison_checker.last_type_error)
						elseif a_comparison_checker.last_check_result then
							create last_boolean_value.make (True)
							finished := True
						end
					end
					an_iterator.forth
				end
				if an_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (an_iterator.error_value)
				elseif last_boolean_value = Void then
					create last_boolean_value.make (False)
				end
			end
		ensure
			last_boolean_value_not_void: last_boolean_value /= Void			
		end

	type_check_two_singletons (a_context: XM_XPATH_STATIC_CONTEXT; a_type, another_type: XM_XPATH_ATOMIC_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Use a value comparison if both arguments are singletons
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: another_type /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if a_type = type_factory.untyped_atomic_type then
				if another_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.string_type, False)
					adopt_child_expression (first_operand)
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.string_type, False)
					adopt_child_expression (second_operand)
				elseif is_sub_type (another_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.double_type, False)
					adopt_child_expression (first_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, another_type, False)
					adopt_child_expression (first_operand)
				end
			elseif another_type = type_factory.untyped_atomic_type then
				if is_sub_type (a_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.double_type, False)
					adopt_child_expression (second_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
					adopt_child_expression (second_operand)
				end	
			end
			
			create {XM_XPATH_VALUE_COMPARISON} l_computed_expression.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			l_computed_expression.set_parent (container)
			l_computed_expression.simplify
			if not l_computed_expression.is_error then
				if l_computed_expression.was_expression_replaced then
					l_expression := l_computed_expression.replacement_expression
				else
					l_expression := l_computed_expression
				end
				l_expression.check_static_type (a_context, a_context_item_type)
				if l_expression.was_expression_replaced then
					set_replacement (l_expression.replacement_expression)
				else
					set_replacement (l_expression)
				end
			end
		end
	
	optimize_two_singletons (a_context: XM_XPATH_STATIC_CONTEXT; a_type, another_type: XM_XPATH_ATOMIC_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Use a value comparison if both arguments are singletons
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: another_type /= Void
		local
			an_expression: XM_XPATH_EXPRESSION
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if a_type = type_factory.untyped_atomic_type then
				if another_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.string_type, False)
					adopt_child_expression (first_operand)
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.string_type, False)
					adopt_child_expression (second_operand)
				elseif is_sub_type (another_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.double_type, False)
					adopt_child_expression (first_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (second_operand, another_type, False)
					adopt_child_expression (first_operand)
				end
			elseif another_type = type_factory.untyped_atomic_type then
				if is_sub_type (a_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.double_type, False)
					adopt_child_expression (second_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
					adopt_child_expression (second_operand)
				end	
			end
			
			create {XM_XPATH_VALUE_COMPARISON} a_computed_expression.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			a_computed_expression.set_parent (container)
			a_computed_expression.simplify
			if not a_computed_expression.is_error then
				if a_computed_expression.was_expression_replaced then
					an_expression := a_computed_expression.replacement_expression
				else
					an_expression := a_computed_expression
				end
				an_expression.optimize (a_context, a_context_item_type)
				if an_expression.was_expression_replaced then
					set_replacement (an_expression.replacement_expression)
				else
					set_replacement (an_expression)
				end
			end
		end


	operands_not_in_error_so_type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type check after operands have been checked.
		require
			context_not_void: a_context /= Void
		local
			l_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_type, l_other_type: XM_XPATH_ITEM_TYPE
			l_message: STRING
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create l_type_checker
			create l_atomic_sequence.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
			create l_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
			l_type_checker.static_type_check (a_context, first_operand, l_atomic_sequence, False, l_role)
			if l_type_checker.is_static_type_check_error then
				set_last_error (l_type_checker.static_type_check_error)
			else
				set_first_operand (l_type_checker.checked_expression)
				create l_other_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				l_type_checker.static_type_check (a_context, second_operand, l_atomic_sequence, False, l_other_role)
				if l_type_checker.is_static_type_check_error	then
					set_last_error (l_type_checker.static_type_check_error)
				else
					set_second_operand (l_type_checker.checked_expression)
					if not is_error and then (first_operand.cardinality_is_empty or second_operand.cardinality_is_empty) then
						create l_boolean_value.make (False)
						set_replacement (l_boolean_value)
					else
						l_type := first_operand.item_type
						l_other_type := second_operand.item_type
						if not is_error and then not (l_type = type_factory.any_atomic_type or else l_type = type_factory.untyped_atomic_type
							or else l_other_type = type_factory.any_atomic_type or else l_other_type = type_factory.untyped_atomic_type) then
							if l_type.primitive_type /= l_other_type.primitive_type and then
								not are_types_comparable (l_type.primitive_type, l_other_type.primitive_type) then
									l_message := STRING_.appended_string ("Cannot compare ", l_type.conventional_name)
									l_message := STRING_.appended_string (l_message, " with ")
									l_message := STRING_.appended_string (l_message, l_other_type.conventional_name)
									set_last_error_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error)
							end
						end
						if not is_error then
							if first_operand.cardinality_exactly_one and then second_operand.cardinality_exactly_one and then
								l_type /= type_factory.any_atomic_type and then l_other_type /= type_factory.any_atomic_type and then
								l_type.is_atomic_type and then l_other_type.is_atomic_type then
									type_check_two_singletons (a_context, l_type.as_atomic_type, l_other_type.as_atomic_type, a_context_item_type)
							elseif not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then
								type_check_singleton_and_empty_sequence (a_context, a_context_item_type)
							elseif not first_operand.cardinality_allows_many then
								type_check_first_operand_single (a_context, a_context_item_type)
							else
								if operator /= Equals_token and then operator /= Not_equal_token	and then (is_sub_type (l_type, type_factory.numeric_type)
									or else is_sub_type (l_other_type, type_factory.numeric_type)) then
										type_check_inequalities (a_context, l_type, l_other_type, a_context_item_type)
								end
								if not was_expression_replaced then
									evaluate_two_constants
								end
							end
						end
					end
				end
			end
		end

	operands_not_in_error_so_optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize after operands have been optimized.
		require
			context_not_void: a_context /= Void
		local
			a_type, another_type: XM_XPATH_ITEM_TYPE
		do
			a_type := first_operand.item_type
			another_type := second_operand.item_type
			if first_operand.cardinality_exactly_one and then second_operand.cardinality_exactly_one and then
				a_type /= type_factory.any_atomic_type and then another_type /= type_factory.any_atomic_type and then
				a_type.is_atomic_type and then another_type.is_atomic_type then
				optimize_two_singletons (a_context, a_type.as_atomic_type, another_type.as_atomic_type, a_context_item_type)
			elseif not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then
				optimize_singleton_and_empty_sequence (a_context, a_context_item_type)
			elseif not first_operand.cardinality_allows_many then
				optimize_first_operand_single (a_context, a_context_item_type)
			elseif first_operand.is_range_expression and then is_sub_type (second_operand.item_type, type_factory.integer_type) and then not second_operand.cardinality_allows_many then
				optimize_n_to_m_equals_i (a_context, first_operand.as_range_expression)
			elseif first_operand.is_integer_range and then is_sub_type (second_operand.item_type, type_factory.integer_type) and then not second_operand.cardinality_allows_many then
				optimize_n_to_m_equals_i_two (a_context, first_operand.as_integer_range)
			elseif not was_expression_replaced then
				evaluate_two_constants
			end
		end

	type_check_singleton_and_empty_sequence (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type check when neither argument allows a sequence of >1
		require
			context_not_void: a_context /= Void
		local
			a_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
		do
			create a_singleton_comparison.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			a_singleton_comparison.check_static_type (a_context, a_context_item_type)
			if a_singleton_comparison.was_expression_replaced then
				set_replacement (a_singleton_comparison.replacement_expression)
			else
				set_replacement (a_singleton_comparison)
			end
		end

	optimize_singleton_and_empty_sequence (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize when neither argument allows a sequence of >1
		require
			context_not_void: a_context /= Void
		local
			a_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
		do
			create a_singleton_comparison.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			a_singleton_comparison.optimize (a_context, a_context_item_type)
			if a_singleton_comparison.was_expression_replaced then
				set_replacement (a_singleton_comparison.replacement_expression)
			else
				set_replacement (a_singleton_comparison)
			end
		end

	type_check_first_operand_single (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If first argument is a singleton, reverse the arguments
		require
			context_not_void: a_context /= Void
		local
			a_general_comparison: XM_XPATH_GENERAL_COMPARISON
		do	
			create a_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
			a_general_comparison.check_static_type (a_context, a_context_item_type)
			if a_general_comparison.was_expression_replaced then
				set_replacement (a_general_comparison.replacement_expression)
			else
				set_replacement (a_general_comparison)
			end
		end

	optimize_first_operand_single (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If first argument is a singleton, reverse the arguments
		require
			context_not_void: a_context /= Void
		local
			a_general_comparison: XM_XPATH_GENERAL_COMPARISON
		do	
			create a_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
			a_general_comparison.optimize (a_context, a_context_item_type)
			if a_general_comparison.was_expression_replaced then
				set_replacement (a_general_comparison.replacement_expression)
			else
				set_replacement (a_general_comparison)
			end
		end

	optimize_n_to_m_equals_i (a_context: XM_XPATH_STATIC_CONTEXT; a_range_expression: XM_XPATH_RANGE_EXPRESSION) is
			-- Look for (N to M = I)
		require
			context_not_void: a_context /= Void
			range_expression_not_void: a_range_expression /= void
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			if a_range_expression.lower_bound.is_integer_value and then a_range_expression.upper_bound.is_integer_value
				and then second_operand.is_position_function and then a_range_expression.lower_bound.as_integer_value.is_platform_integer
				and then a_range_expression.upper_bound.as_integer_value.is_platform_integer then
				create {XM_XPATH_POSITION_RANGE} an_expression.make (a_range_expression.lower_bound.as_integer_value.as_integer, a_range_expression.upper_bound.as_integer_value.as_integer)
			else
				create {XM_XPATH_INTEGER_RANGE_TEST} an_expression.make (second_operand, a_range_expression.lower_bound, a_range_expression.upper_bound)
			end
			set_replacement (an_expression)
		end

	optimize_n_to_m_equals_i_two (a_context: XM_XPATH_STATIC_CONTEXT; an_integer_range: XM_XPATH_INTEGER_RANGE) is
			-- Look for (N to M = I)
		require
			context_not_void: a_context /= Void
			range_not_void: an_integer_range /= void
		local
			an_expression: XM_XPATH_EXPRESSION
			an_integer_value, another_integer_value: XM_XPATH_INTEGER_VALUE
		do
			if second_operand.is_position_function then
				create {XM_XPATH_POSITION_RANGE} an_expression.make (an_integer_range.minimum, an_integer_range.maximum)
			else
				create an_integer_value.make_from_integer (an_integer_range.minimum)
				create another_integer_value.make_from_integer (an_integer_range.maximum)
				create {XM_XPATH_INTEGER_RANGE_TEST} an_expression.make (second_operand, an_integer_value, another_integer_value)
			end
			set_replacement (an_expression)
		end

	type_check_inequalities (a_context: XM_XPATH_STATIC_CONTEXT; a_type, another_type: XM_XPATH_ITEM_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If the operator is gt, ge, lt, le then replace X < Y by min(X) < max(Y)

			-- This optimization is done only in the case where at least one of the
			-- sequences is known to be purely numeric. It isn't safe if both sequences
			-- contain untyped atomic values, because in that case, the type of the
			-- comparison isn't known in advance. For example [(1, U1) < ("fred", U2)]
			-- involves both string and numeric comparisons.
		require
			context_not_void: a_context /= Void
			type_not_void: another_type /= Void
		local
			a_numeric_type: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_minimax_comparison: XM_XPATH_MINIMAX_COMPARISON
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create a_type_checker
			if not is_sub_type (a_type, type_factory.numeric_type) then
				create a_numeric_type.make_numeric_sequence
				create a_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (a_context, first_operand, a_numeric_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_first_operand (a_type_checker.checked_expression)
				end
			end
			if not is_error and then not is_sub_type (another_type, type_factory.numeric_type) then
				create a_type_checker
				create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				create a_numeric_type.make_numeric_sequence
				a_type_checker.static_type_check (a_context, second_operand, a_numeric_type, False, another_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_second_operand (a_type_checker.checked_expression)
				end
			end
			if not is_error then
				create a_minimax_comparison.make (first_operand, operator, second_operand)
				a_minimax_comparison.check_static_type (a_context, a_context_item_type)
				if a_minimax_comparison.was_expression_replaced then
					set_replacement (a_minimax_comparison.replacement_expression)
				else
					set_replacement (a_minimax_comparison)
				end
			end
		end

	evaluate_two_constants is
			-- Evaluate the expression now if both arguments are constant
		do
			if first_operand.is_value and then not first_operand.depends_upon_implicit_timezone
				and then second_operand.is_value and then not second_operand.depends_upon_implicit_timezone then
				evaluate_item (Void)
				check
					boolean_value: last_evaluated_item.is_boolean_value
					-- We are guarenteed a boolean value
				end
				set_replacement (last_evaluated_item.as_boolean_value)
			end
		end

invariant
	
	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: initialized implies atomic_comparer /= Void
	value_comparison: initialized implies is_value_comparison_operator (singleton_operator)

end
	
