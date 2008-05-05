indexing

	description:

	"XPath general comparisons"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
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

	
	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			if first_operand /= l_replacement.item then
				set_first_operand (l_replacement.item)
			end
			if first_operand.is_error then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
				if second_operand /= l_replacement.item then
					set_second_operand (l_replacement.item)
				end
				if second_operand.is_error then
					set_replacement (a_replacement, second_operand)
				elseif first_operand.is_empty_sequence or second_operand.is_empty_sequence then

					-- If either operand is statically empty, evaluate as `False'.

					create l_boolean_value.make (False)
					set_replacement (a_replacement, l_boolean_value)
				else
					l_replacement.put (Void)
					first_operand.set_unsorted (l_replacement, False)
					if first_operand /= l_replacement.item then
						set_first_operand (l_replacement.item)
					end
					l_replacement.put (Void)
					second_operand.set_unsorted (l_replacement, False)
					if second_operand /= l_replacement.item then
						set_second_operand (l_replacement.item)
					end
					operands_not_in_error_so_type_check (a_replacement, a_context, a_context_item_type)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			if first_operand /= l_replacement.item then
				set_first_operand (l_replacement.item)
			end
			if first_operand.is_error then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.optimize (l_replacement, a_context, a_context_item_type)
				if second_operand /= l_replacement.item then
					set_second_operand (l_replacement.item)
				end
				if second_operand.is_error then
					set_replacement (a_replacement, second_operand)
				else

					-- If either operand is statically empty, evaluate as `False'.
					
					if first_operand.is_empty_sequence or second_operand.is_empty_sequence then
						create l_boolean_value.make (False)
						set_replacement (a_replacement, l_boolean_value)
					else
						l_replacement.put (Void)
						first_operand.set_unsorted (l_replacement, False)
						if first_operand /= l_replacement.item then
							set_first_operand (l_replacement.item)
						end
						l_replacement.put (Void)
						second_operand.set_unsorted (l_replacement, False)
						if second_operand /= l_replacement.item then
							set_second_operand (l_replacement.item)
						end
						operands_not_in_error_so_optimize (a_replacement, a_context, a_context_item_type)
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
			last_boolean_value := Void
			atomic_comparer.set_dynamic_context (a_context)
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
									a_value.create_iterator (a_context)
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
										a_comparison_checker.check_correct_general_relation_xpath2 (an_iterator.item.as_atomic_value, singleton_operator,
																											  atomic_comparer, a_third_iterator.item.as_atomic_value)
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
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
						a_comparison_checker.check_correct_general_relation_xpath2 (an_iterator.item.as_atomic_value, singleton_operator, atomic_comparer, an_item.as_atomic_value)
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

	type_check_two_singletons (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_type, a_other_type: XM_XPATH_ATOMIC_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Use a value comparison if both arguments are singletons
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: a_other_type /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if a_type = type_factory.untyped_atomic_type then
				if a_other_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.string_type, False)
					adopt_child_expression (first_operand)
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.string_type, False)
					adopt_child_expression (second_operand)
				elseif is_sub_type (a_other_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.double_type, False)
					adopt_child_expression (first_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, a_other_type, False)
					adopt_child_expression (first_operand)
				end
			elseif a_other_type = type_factory.untyped_atomic_type then
				if is_sub_type (a_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.double_type, False)
					adopt_child_expression (second_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
					adopt_child_expression (second_operand)
				end	
			end
			create l_replacement.make (Void)
			create {XM_XPATH_VALUE_COMPARISON} l_computed_expression.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			l_computed_expression.set_parent (container)
			l_computed_expression.simplify (l_replacement)
			if l_replacement.item.is_error then
				set_replacement (a_replacement, l_replacement.item)
			else
				l_expression := l_replacement.item
				l_expression.check_static_type (a_replacement, a_context, a_context_item_type)
			end
		end
	
	optimize_two_singletons (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_type, a_other_type: XM_XPATH_ATOMIC_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Use a value comparison if both arguments are singletons
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: a_other_type /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if a_type = type_factory.untyped_atomic_type then
				if a_other_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.string_type, False)
					adopt_child_expression (first_operand)
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.string_type, False)
					adopt_child_expression (second_operand)
				elseif is_sub_type (a_other_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, type_factory.double_type, False)
					adopt_child_expression (first_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} first_operand.make (second_operand, a_other_type, False)
					adopt_child_expression (first_operand)
				end
			elseif a_other_type = type_factory.untyped_atomic_type then
				if is_sub_type (a_type, type_factory.numeric_type) then
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, type_factory.double_type, False)
					adopt_child_expression (second_operand)
				else
					create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
					adopt_child_expression (second_operand)
				end	
			end
			create l_replacement.make (Void)
			create {XM_XPATH_VALUE_COMPARISON} l_computed_expression.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			l_computed_expression.set_parent (container)
			l_computed_expression.simplify (l_replacement)
			if l_replacement.item.is_error then
				set_replacement (a_replacement, l_replacement.item)
			else
				l_expression := l_replacement.item
				l_expression.optimize (a_replacement, a_context, a_context_item_type)
			end
		end


	operands_not_in_error_so_type_check (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type check after operands have been checked.
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
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
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
			else
				set_first_operand (l_type_checker.checked_expression)
				create l_other_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				l_type_checker.static_type_check (a_context, second_operand, l_atomic_sequence, False, l_other_role)
				if l_type_checker.is_static_type_check_error	then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_second_operand (l_type_checker.checked_expression)
					if first_operand.cardinality_is_empty or second_operand.cardinality_is_empty then
						create l_boolean_value.make (False)
						set_replacement (a_replacement, l_boolean_value)
					else
						l_type := first_operand.item_type
						l_other_type := second_operand.item_type
						if not (l_type = type_factory.any_atomic_type or l_type = type_factory.untyped_atomic_type or
							l_other_type = type_factory.any_atomic_type or l_other_type = type_factory.untyped_atomic_type) then
							if l_type.primitive_type /= l_other_type.primitive_type and then
								not are_types_comparable (l_type.primitive_type, l_other_type.primitive_type) then
								l_message := STRING_.appended_string ("Cannot compare ", l_type.conventional_name)
								l_message := STRING_.appended_string (l_message, " with ")
								l_message := STRING_.appended_string (l_message, l_other_type.conventional_name)
								set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error))
							end
						end
						if a_replacement.item = Void then
							if first_operand.cardinality_exactly_one and second_operand.cardinality_exactly_one and
								l_type /= type_factory.any_atomic_type and l_other_type /= type_factory.any_atomic_type and
								l_type.is_atomic_type and l_other_type.is_atomic_type then
								type_check_two_singletons (a_replacement, a_context, l_type.as_atomic_type, l_other_type.as_atomic_type, a_context_item_type)
							elseif not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then
								type_check_singleton_and_empty_sequence (a_replacement, a_context, a_context_item_type)
							elseif not first_operand.cardinality_allows_many then
								type_check_first_operand_single (a_replacement, a_context, a_context_item_type)
							else
								if operator /= Equals_token and operator /= Not_equal_token	and (is_sub_type (l_type, type_factory.numeric_type)
									or is_sub_type (l_other_type, type_factory.numeric_type)) then
									type_check_inequalities (a_replacement, a_context, l_type, l_other_type, a_context_item_type)
								end
								if a_replacement.item = Void then
									evaluate_two_constants (a_replacement, a_context)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	operands_not_in_error_so_optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize after operands have been optimized.
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_type, l_other_type: XM_XPATH_ITEM_TYPE
		do
			l_type := first_operand.item_type
			l_other_type := second_operand.item_type
			if first_operand.cardinality_exactly_one and second_operand.cardinality_exactly_one and
				l_type /= type_factory.any_atomic_type and l_other_type /= type_factory.any_atomic_type and
				l_type.is_atomic_type and l_other_type.is_atomic_type then
				optimize_two_singletons (a_replacement, a_context, l_type.as_atomic_type, l_other_type.as_atomic_type, a_context_item_type)
			elseif not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then
				optimize_singleton_and_empty_sequence (a_replacement, a_context, a_context_item_type)
			elseif not first_operand.cardinality_allows_many then
				optimize_first_operand_single (a_replacement, a_context, a_context_item_type)
			elseif first_operand.is_range_expression and is_sub_type (second_operand.item_type, type_factory.integer_type) and
				not second_operand.cardinality_allows_many then
				optimize_n_to_m_equals_i (a_replacement, a_context, first_operand.as_range_expression)
			elseif first_operand.is_integer_range and is_sub_type (second_operand.item_type, type_factory.integer_type) and
				not second_operand.cardinality_allows_many then
				optimize_n_to_m_equals_i_two (a_replacement, a_context, first_operand.as_integer_range)
			else
				evaluate_two_constants (a_replacement, a_context)
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

	type_check_singleton_and_empty_sequence (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type check when neither argument allows a sequence of >1
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
		do
			create l_singleton_comparison.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			l_singleton_comparison.check_static_type (a_replacement, a_context, a_context_item_type)
		end

	optimize_singleton_and_empty_sequence (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize when neither argument allows a sequence of >1
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
		do
			create l_singleton_comparison.make (first_operand, singleton_operator, second_operand, atomic_comparer.collator)
			l_singleton_comparison.optimize (a_replacement, a_context, a_context_item_type)
		end

	type_check_first_operand_single (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If first argument is a singleton, reverse the arguments
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_general_comparison: XM_XPATH_GENERAL_COMPARISON
		do	
			create l_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
			l_general_comparison.check_static_type (a_replacement, a_context, a_context_item_type)
		end

	optimize_first_operand_single (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If first argument is a singleton, reverse the arguments
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_general_comparison: XM_XPATH_GENERAL_COMPARISON
		do	
			create l_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
			l_general_comparison.optimize (a_replacement, a_context, a_context_item_type)
		end

	optimize_n_to_m_equals_i (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_range_expression: XM_XPATH_RANGE_EXPRESSION) is
			-- Look for (N to M = I)
		require
			context_not_void: a_context /= Void
			range_expression_not_void: a_range_expression /= void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
		do
			if a_range_expression.lower_bound.is_machine_integer_value and a_range_expression.upper_bound.is_machine_integer_value and
				second_operand.is_position_function and a_range_expression.lower_bound.as_machine_integer_value.is_platform_integer and
				a_range_expression.upper_bound.as_machine_integer_value.is_platform_integer then
				create {XM_XPATH_POSITION_RANGE} l_expression.make (a_range_expression.lower_bound.as_machine_integer_value.value.to_integer, a_range_expression.upper_bound.as_machine_integer_value.value.to_integer)
			else
				create {XM_XPATH_INTEGER_RANGE_TEST} l_expression.make (second_operand, a_range_expression.lower_bound, a_range_expression.upper_bound)
			end
			set_replacement (a_replacement, l_expression)
		end

	optimize_n_to_m_equals_i_two (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; an_integer_range: XM_XPATH_INTEGER_RANGE) is
			-- Look for (N to M = I)
		require
			context_not_void: a_context /= Void
			range_not_void: an_integer_range /= void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_integer_value, l_other_integer_value: XM_XPATH_INTEGER_VALUE
		do
			if second_operand.is_position_function then
				create {XM_XPATH_POSITION_RANGE} l_expression.make (an_integer_range.minimum, an_integer_range.maximum)
			else
				create l_integer_value.make_from_integer (an_integer_range.minimum)
				create l_other_integer_value.make_from_integer (an_integer_range.maximum)
				create {XM_XPATH_INTEGER_RANGE_TEST} l_expression.make (second_operand, l_integer_value, l_other_integer_value)
			end
			set_replacement (a_replacement, l_expression)
		end

	type_check_inequalities (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_type, a_other_type: XM_XPATH_ITEM_TYPE; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- If the operator is gt, ge, lt, le then replace X < Y by min(X) < max(Y)

			-- This optimization is done only in the case where at least one of the
			-- sequences is known to be purely numeric. It isn't safe if both sequences
			-- contain untyped atomic values, because in that case, the type of the
			-- comparison isn't known in advance. For example [(1, U1) < ("fred", U2)]
			-- involves both string and numeric comparisons.
		require
			context_not_void: a_context /= Void
			type_not_void: a_other_type /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_numeric_type: XM_XPATH_SEQUENCE_TYPE
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_minimax_comparison: XM_XPATH_MINIMAX_COMPARISON
			l_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create l_type_checker
			if not is_sub_type (a_type, type_factory.numeric_type) then
				create l_numeric_type.make_numeric_sequence
				create l_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
				l_type_checker.static_type_check (a_context, first_operand, l_numeric_type, False, l_role)
				if l_type_checker.is_static_type_check_error then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_first_operand (l_type_checker.checked_expression)
				end
			end
			if a_replacement.item = Void and not is_sub_type (a_other_type, type_factory.numeric_type) then
				create l_type_checker
				create l_other_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				create l_numeric_type.make_numeric_sequence
				l_type_checker.static_type_check (a_context, second_operand, l_numeric_type, False, l_other_role)
				if l_type_checker.is_static_type_check_error then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_second_operand (l_type_checker.checked_expression)
				end
			end
			if a_replacement.item = Void then
				create l_minimax_comparison.make (first_operand, operator, second_operand)
				l_minimax_comparison.check_static_type (a_replacement, a_context, a_context_item_type)
			end
		end

	evaluate_two_constants (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Evaluate the expression now if both arguments are constant
		require
			a_context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			if first_operand.is_value and then not first_operand.depends_upon_implicit_timezone
				and then second_operand.is_value and then not second_operand.depends_upon_implicit_timezone then
				create l_result.make (Void)
				evaluate_item (l_result, a_context.new_compile_time_context)
				check
					boolean_value: l_result.item.is_boolean_value
					-- We are guarenteed a boolean value
				end
				set_replacement (a_replacement, l_result.item.as_boolean_value)
			end
		end

invariant
	
	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: initialized implies atomic_comparer /= Void
	value_comparison: initialized implies is_value_comparison_operator (singleton_operator)

end
	
