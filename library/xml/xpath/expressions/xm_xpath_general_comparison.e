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
			display_operator, evaluate_item, analyze, effective_boolean_value
		end

	XM_XPATH_CARDINALITY

	XM_XPATH_ROLE
	
	XM_XPATH_COMPARISON_ROUTINES

creation

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

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			mark_unreplaced

			-- Analysis proceeds top-down through the sub-expressions

			first_operand.analyze (a_context)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.analyze (a_context)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				end
				if not is_error then
					first_operand.set_unsorted (False)
					second_operand.set_unsorted (False)
					operands_not_in_error_so_analyze (a_context)
				end
			end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_iterator, another_iterator, a_third_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_count: INTEGER
			finished: BOOLEAN
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			an_iterator := first_operand.iterator (a_context)
			if an_iterator.is_error then
				create Result.make (False)
				Result.set_last_error (an_iterator.error_value)
			else
				another_iterator := second_operand.iterator (a_context)
				if another_iterator.is_error then
					create Result.make (False)
					Result.set_last_error (another_iterator.error_value)
				else
					
					-- The second operand is more likely to be a singleton than the first so:
				
					create a_sequence_extent.make (another_iterator)
					a_count := a_sequence_extent.count
					if a_count = 0 then
						create Result.make (False)
					elseif a_count = 1 then
						Result := effective_boolean_value_with_second_operand_singleton (a_context, a_sequence_extent.item_at (1), an_iterator)
					else -- a_count > 1 - so nested loop comparison
						from
							an_iterator.start
						until
							finished or else is_error or else an_iterator.after
						loop
							an_atomic_value ?= an_iterator.item
							if an_atomic_value = Void then
								set_last_error_from_string ("Atomization failed for first operand of general comparison", Xpath_errors_uri, "XP0006", Type_error)
								finished := True
							else
								from
									a_third_iterator := a_sequence_extent.iterator (Void)
									a_third_iterator.start
								until
									finished or else a_third_iterator.after
								loop
									another_atomic_value ?= a_third_iterator.item
									if another_atomic_value = Void then
										set_last_error_from_string ("Atomization failed for second operand of general comparison", Xpath_errors_uri, "XP0006", Type_error)
										finished := True
									else
										create a_comparison_checker
										a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_value_operator (operator), atomic_comparer, another_atomic_value, is_backwards_compatible_mode)
										if a_comparison_checker.is_comparison_type_error then
											set_last_error (a_comparison_checker.last_type_error)
											finished := True
										elseif a_comparison_checker.last_check_result then
											create Result.make (True)
											finished := True
										end
									end
									a_third_iterator.forth
								end
							end
							an_iterator.forth
						end
					end
					if Result = Void then create Result.make (False) end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			last_evaluated_item := effective_boolean_value (a_context)
		end

feature {NONE} -- Implementation

	is_backwards_compatible_mode: BOOLEAN
			-- Are we in XPath 1.0 compatibility mode?

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many ", Precursor)
		end

	issue_warnings (a_type, another_type: XM_XPATH_ITEM_TYPE; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Issue warnings about backwards compatibility.
		require
			context_not_void: a_context /= Void
		do
			if is_sub_type (a_type, any_node_test) and then is_sub_type (another_type, type_factory.boolean_type) then
				a_context.issue_warning ("Comparison of a node-set to a boolean has changed since XPath 1.0")
			elseif is_sub_type (a_type, type_factory.boolean_type) and then is_sub_type (another_type, any_node_test) then
				a_context.issue_warning ("Comparison of a boolean to a node-set has changed since XPath 1.0")
			elseif (is_sub_type (a_type, any_node_test) or else is_sub_type (a_type, type_factory.string_type))
				and then (is_sub_type (another_type, any_node_test) or else is_sub_type (another_type, type_factory.string_type))
				and then (operator = Less_than_token or else operator = Less_equal_token
							 or else operator = Greater_than_token or else operator = Greater_equal_token)
			then
				a_context.issue_warning ("Less-than and greater-than comparisons between strings have changed since XPath 1.0")
			end
		end

	effective_boolean_value_with_second_operand_singleton (a_context: XM_XPATH_CONTEXT; an_item: XM_XPATH_ITEM; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			finished: BOOLEAN
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			another_atomic_value ?= an_item
			if another_atomic_value = Void then
				set_last_error_from_string ("Atomization failed for second operand of general comparison", Xpath_errors_uri, "XP0006", Type_error)
			end
			from
				an_iterator.forth
			until
				finished or else is_error or else an_iterator.after
			loop
				an_atomic_value ?= an_iterator.item
				if an_atomic_value = Void then
					set_last_error_from_string ("Atomization failed for first operand of general comparison", Xpath_errors_uri, "XP0006", Type_error)
				else
					create a_comparison_checker
					a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_value_operator (operator), atomic_comparer, another_atomic_value, is_backwards_compatible_mode)
					if a_comparison_checker.is_comparison_type_error then
						set_last_error (a_comparison_checker.last_type_error)
					elseif a_comparison_checker.last_check_result then
						create Result.make (True)
						finished := True
					end
				end
				an_iterator.forth
			end
		end

	analyze_two_singletons_two_point_zero (a_context: XM_XPATH_STATIC_CONTEXT; a_type, another_type: XM_XPATH_ATOMIC_TYPE) is
			-- Use a value comparison if both arguments are singletons
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: another_type /= Void
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			if a_type = type_factory.untyped_atomic_type then
				if another_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.string_type, False)
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.string_type, False)
				elseif is_sub_type (another_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.double_type, False)
				else
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (second_operand, another_type, False)
				end
			elseif another_type = type_factory.untyped_atomic_type then
				if is_sub_type (a_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.double_type, False)
				else
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
				end	
			end
			
			create {XM_XPATH_VALUE_COMPARISON} an_expression.make (first_operand, singleton_value_operator (operator), second_operand, atomic_comparer.collator)
			an_expression.simplify
			if not an_expression.is_error then
				if an_expression.was_expression_replaced then
					an_expression := an_expression.replacement_expression
				end
				an_expression.analyze (a_context)
				if an_expression.was_expression_replaced then
					set_replacement (an_expression.replacement_expression)
				else
					set_replacement (an_expression)
				end
			end
		end

	operands_not_in_error_so_analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Analyze after operands have been analyzed.
		require
			context_not_void: a_context /= Void
		local
			an_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type, another_type: XM_XPATH_ITEM_TYPE
			an_atomic_type, another_atomic_type: XM_XPATH_ATOMIC_TYPE
			a_message: STRING
			a_range_expression: XM_XPATH_RANGE_EXPRESSION
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create a_type_checker
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode
			if is_backwards_compatible_mode then
				issue_warnings (first_operand.item_type, second_operand.item_type, a_context)
			end
			create an_atomic_sequence.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
			create a_role.make (Binary_expression_role, token_name (operator), 1)
			a_type_checker.static_type_check (a_context, first_operand, an_atomic_sequence, False, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0004", Type_error)
			else
				set_first_operand (a_type_checker.checked_expression)
				create another_role.make (Binary_expression_role, token_name (operator), 2)
				a_type_checker.static_type_check (a_context, second_operand, an_atomic_sequence, False, another_role)
				if a_type_checker.is_static_type_check_error	then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0004", Type_error)
				else
					set_second_operand (a_type_checker.checked_expression)
					a_type := first_operand.item_type
					another_type := second_operand.item_type
					if not is_backwards_compatible_mode then
						if not is_error and then not (a_type = type_factory.any_atomic_type or else a_type = type_factory.untyped_atomic_type
																or else another_type = type_factory.any_atomic_type or else another_type = type_factory.untyped_atomic_type) then
							if a_type.primitive_type /= another_type.primitive_type and then
								not (is_sub_type (a_type, type_factory.numeric_type) and then
									  is_sub_type (another_type, type_factory.numeric_type))
							 then
								a_message := STRING_.appended_string ("Cannot compare ", a_type.conventional_name)
								a_message := STRING_.appended_string (a_message, " with ")
								a_message := STRING_.appended_string (a_message, another_type.conventional_name)
								set_last_error_from_string (a_message, Xpath_errors_uri, "XP0004", Type_error)
							end
						end
					end
					if not is_error then
						if (a_type = another_type or else not is_backwards_compatible_mode) and then first_operand.cardinality_exactly_one and then second_operand.cardinality_exactly_one then
							an_atomic_type ?= a_type
							another_atomic_type ?= another_type
							check
								first_type_atomic: an_atomic_type /= Void
								second_type_atomic: another_atomic_type /= Void
								-- from earlier static type checking
							end
							analyze_two_singletons_two_point_zero (a_context, an_atomic_type, another_atomic_type)
						else -- one or both arguments are not singletons
							if	not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then
								analyze_singleton_and_empty_sequence (a_context)
							elseif not first_operand.cardinality_allows_many then
								analyze_first_operand_single (a_context)
							else
								a_range_expression ?= first_operand
								if a_range_expression /= Void and then is_sub_type (second_operand.item_type, type_factory.integer_type) and then not second_operand.cardinality_allows_many then
									analyze_n_to_m_equals_i (a_context, a_range_expression)
								else
									if operator /= Equals_token and then operator /= Not_equal_token	and then (is_sub_type (a_type, type_factory.numeric_type)
																																		 or else is_sub_type (another_type, type_factory.numeric_type)) then
										analyze_inequalities (a_context, a_type, another_type)
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
		end

	analyze_singleton_and_empty_sequence (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Analyze when neither argument allows a sequence of >1
		require
			context_not_void: a_context /= Void
		local
			a_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
		do
			create a_singleton_comparison.make (first_operand, singleton_value_operator (operator), second_operand, atomic_comparer.collator)
			a_singleton_comparison.analyze (a_context)
			if a_singleton_comparison.was_expression_replaced then
				set_replacement (a_singleton_comparison.replacement_expression)
			else
				set_replacement (a_singleton_comparison)
			end
		end


	analyze_first_operand_single (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- If first argument is a singleton, reverse the arguments
		require
			context_not_void: a_context /= Void
		local
			a_general_comparison: XM_XPATH_GENERAL_COMPARISON
		do	
			create a_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
			a_general_comparison.analyze (a_context)
			if a_general_comparison.was_expression_replaced then
				set_replacement (a_general_comparison.replacement_expression)
			else
				set_replacement (a_general_comparison)
			end
		end

	analyze_n_to_m_equals_i (a_context: XM_XPATH_STATIC_CONTEXT; a_range_expression: XM_XPATH_RANGE_EXPRESSION) is
			-- Look for (N to M = I)
		require
			context_not_void: a_context /= Void
			range_expression_not_void: a_range_expression /= void
		local
			an_integer_value, another_integer_value: XM_XPATH_INTEGER_VALUE
			a_position: XM_XPATH_POSITION
			an_expression: XM_XPATH_EXPRESSION
		do
			an_integer_value ?= a_range_expression.lower_bound
			another_integer_value ?= a_range_expression.upper_bound
			a_position ?= second_operand
			if an_integer_value /= Void and then another_integer_value /= Void and then a_position /= Void
				and then an_integer_value.is_platform_integer and then another_integer_value.is_platform_integer then
				create {XM_XPATH_POSITION_RANGE} an_expression.make (an_integer_value.as_integer, another_integer_value.as_integer)
			else
				create {XM_XPATH_INTEGER_RANGE_TEST} an_expression.make (second_operand, a_range_expression.lower_bound, a_range_expression.upper_bound)
			end
			set_replacement (an_expression)
		end

	analyze_inequalities (a_context: XM_XPATH_STATIC_CONTEXT; a_type, another_type: XM_XPATH_ITEM_TYPE) is
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
				if is_backwards_compatible_mode then
					todo ("analyze-inequalities - need atomic sequence converter - BUG!", True)
				else
					create a_numeric_type.make_numeric_sequence
					create a_role.make (Binary_expression_role, token_name (operator), 1)
					a_type_checker.static_type_check (a_context, first_operand, a_numeric_type, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0004", Type_error)
					else
						set_first_operand (a_type_checker.checked_expression)
					end
				end
			end
			if not is_error and then not is_sub_type (another_type, type_factory.numeric_type) then
				create a_type_checker
				create another_role.make (Binary_expression_role, token_name (operator), 2)
				if is_backwards_compatible_mode then
					todo ("analyze-inequalities - need atomic sequence converter - BUG!", True)
				else
					create a_numeric_type.make_numeric_sequence
					a_type_checker.static_type_check (a_context, second_operand, a_numeric_type, False, another_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0004", Type_error)
					else
						set_second_operand (a_type_checker.checked_expression)
					end
				end
			end
			if not is_error then
				create a_minimax_comparison.make (first_operand, operator, second_operand)
				a_minimax_comparison.analyze (a_context)
				if a_minimax_comparison.was_expression_replaced then
					set_replacement (a_minimax_comparison.replacement_expression)
				else
					set_replacement (a_minimax_comparison)
				end
			end
		end

	evaluate_two_constants is
			-- Evaluate the expression now if both arguments are constant
		local
			a_value, another_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			a_value ?= first_operand
			another_value ?= second_operand
			if a_value /= Void and then another_value /= Void then
				evaluate_item (Void)
				a_boolean_value ?= last_evaluated_item
					check
						a_boolean_value /= Void
						-- We are guarenteed a boolean value
					end
				set_replacement (a_boolean_value)
			end
		end

invariant
	
	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: atomic_comparer /= Void
	
end
	
