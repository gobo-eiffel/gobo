indexing

	description:

	"XPath 1.0-compatible comparisons"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2005, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_COMPATIBLE_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			display_operator, evaluate_item, check_static_type, optimize,
			calculate_effective_boolean_value, compute_cardinality, is_node_sequence
		end

	XM_XPATH_CARDINALITY

	XM_XPATH_ROLE

	XM_XPATH_TYPE
	
	XM_XPATH_COMPARISON_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_ATOMIZING_FUNCTION
		export {NONE} all end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NUMERIC_ROUTINES
		export {NONE} all end

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
			atomize_first_operand  := True
			atomize_second_operand  := True
			maybe_first_operand_boolean := True
			maybe_second_operand_boolean := True
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

feature -- Status report

	is_node_sequence: BOOLEAN is
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := False
		end
	
feature -- Optimization	

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			check
				backwards_compatible_mode: a_context.is_backwards_compatible_mode
			end
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
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			check
				backwards_compatible_mode: a_context.is_backwards_compatible_mode
			end
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
					first_operand.set_unsorted (False)
					if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
					second_operand.set_unsorted (False)
					if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
					if first_operand.is_value and then not first_operand.depends_upon_implicit_timezone
						and then second_operand.is_value and then not second_operand.depends_upon_implicit_timezone then
						evaluate_item (Void)
						check
							boolean_value: last_evaluated_item.is_boolean_value
							-- We are guarenteed a boolean value
						end
						set_replacement (last_evaluated_item.as_boolean_value)
					else
						optimize_stage_2 (a_context, a_context_item_type)
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			last_boolean_value := Void
			if	maybe_first_operand_boolean then
				first_operand.create_iterator (a_context)
				an_iterator := first_operand.last_iterator
				if not an_iterator.is_error then
					an_iterator.start
				end
				if an_iterator.is_error then
					create last_boolean_value.make (False); last_boolean_value.set_last_error (an_iterator.error_value); set_last_error (last_boolean_value.error_value)
				elseif not an_iterator.after then
					if an_iterator.item.is_boolean_value then
						second_operand.calculate_effective_boolean_value (a_context)
						if second_operand.is_error then
							create last_boolean_value.make (False); last_boolean_value.set_last_error (second_operand.error_value); set_last_error (last_boolean_value.error_value)
						else
							create a_comparison_checker
							a_comparison_checker.check_correct_general_relation (an_iterator.item.as_boolean_value, singleton_operator,
																								  atomic_comparer, second_operand.last_boolean_value, True)
							if a_comparison_checker.is_comparison_type_error then
								create last_boolean_value.make (False); last_boolean_value.set_last_error (a_comparison_checker.last_type_error); set_last_error (last_boolean_value.error_value)
							elseif a_comparison_checker.last_check_result then
								create last_boolean_value.make (True)
							end
						end
					end
				elseif not maybe_second_operand_boolean then
					create last_boolean_value.make (False)
				end
			end
			if last_boolean_value = Void and then maybe_second_operand_boolean then
				second_operand.create_iterator (a_context)
				another_iterator := second_operand.last_iterator
				if not another_iterator.is_error then
					another_iterator.start
				end
				if another_iterator.is_error then
					create last_boolean_value.make (False); last_boolean_value.set_last_error (another_iterator.error_value); set_last_error (last_boolean_value.error_value)
				elseif not another_iterator.after then
					if another_iterator.item.is_boolean_value then
						first_operand.calculate_effective_boolean_value (a_context)
						if first_operand.is_error then
							create last_boolean_value.make (False); last_boolean_value.set_last_error (first_operand.error_value); set_last_error (last_boolean_value.error_value)
						else
							create a_comparison_checker
							a_comparison_checker.check_correct_general_relation (first_operand.last_boolean_value, singleton_operator,
																								  atomic_comparer, another_iterator.item.as_boolean_value, True)
							if a_comparison_checker.is_comparison_type_error then
								create last_boolean_value.make (False); last_boolean_value.set_last_error (a_comparison_checker.last_type_error); set_last_error (last_boolean_value.error_value)
							elseif a_comparison_checker.last_check_result then
								create last_boolean_value.make (True)
							end
						end
					end
				elseif not maybe_first_operand_boolean then
					create last_boolean_value.make (False)
				end
			end
			if last_boolean_value = Void then
				if an_iterator = Void then
					first_operand.create_iterator (a_context)
					an_iterator := first_operand.last_iterator
				else
					an_iterator := an_iterator.another
				end
				if another_iterator = Void then
					second_operand.create_iterator (a_context)
					another_iterator := second_operand.last_iterator
				else
					another_iterator := another_iterator.another
				end
				calculate_effective_boolean_value_not_booleans (a_context, an_iterator, another_iterator)
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

		
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			create last_mapped_item.make_item (item_to_double (an_item))
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

	atomize_first_operand, atomize_second_operand: BOOLEAN
			-- For communication between routines

	maybe_first_operand_boolean, maybe_second_operand_boolean: BOOLEAN
			-- For communication between routines

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many (1.0)", Precursor)
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

	optimize_stage_2 (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize after operands have been optimized.
		require
			no_previous_error: not is_error
			context_not_void: a_context /= Void
			xpath_1_mode: a_context.is_backwards_compatible_mode	
		local
			a_type, another_type: XM_XPATH_ITEM_TYPE
			maybe_first_operand_numeric, maybe_second_operand_numeric: BOOLEAN
			is_first_operand_numeric, is_second_operand_numeric: BOOLEAN
			a_general_comparison: XM_XPATH_GENERAL_COMPARISON
			a_relationship, another_relationship: INTEGER
			an_expression: XM_XPATH_EXPRESSION
		do
			a_type := first_operand.item_type
			another_type := second_operand.item_type
			if a_type.is_atomic_type then
				atomize_first_operand  := False
			end
			if another_type.is_atomic_type then
				atomize_second_operand  := False
			end
			if type_relationship (a_type, type_factory.boolean_type) = Disjoint_types then
				maybe_first_operand_boolean := False
			end
			if type_relationship (another_type, type_factory.boolean_type) = Disjoint_types then
				maybe_second_operand_boolean := False
			end
			if not maybe_first_operand_boolean and then not maybe_second_operand_boolean then
				a_relationship := type_relationship (a_type, type_factory.numeric_type)
				another_relationship := type_relationship (another_type, type_factory.numeric_type)
				maybe_first_operand_numeric := a_relationship /= Disjoint_types
				maybe_second_operand_numeric := another_relationship /= Disjoint_types
				is_first_operand_numeric := a_relationship = Subsumed_type or else a_relationship = Same_item_type
				is_second_operand_numeric := another_relationship = Subsumed_type or else another_relationship = Same_item_type

				if (is_first_operand_numeric and then is_second_operand_numeric)
					or else (not maybe_first_operand_numeric and then not maybe_second_operand_numeric) then
					
					-- Use the XPath 2.0 route if we don't have to deal with the possibility of boolean values,
					--  or the complications of converting values to numbers
					
					create a_general_comparison.make (first_operand, operator, second_operand, atomic_comparer.collator)
					a_general_comparison.check_static_type (a_context, a_context_item_type)
					if a_general_comparison.is_error then
						set_last_error (a_general_comparison.error_value)
					elseif a_general_comparison.was_expression_replaced then
						an_expression := a_general_comparison.replacement_expression
					else
						an_expression := a_general_comparison
					end
					if not is_error then
						an_expression.optimize (a_context, a_context_item_type)
						if an_expression.is_error then
							set_last_error (an_expression.error_value)
						elseif an_expression.was_expression_replaced then
							set_replacement (an_expression.replacement_expression)
						else
							set_replacement (an_expression)
						end
					end
				end
			end
		end

	calculate_effective_boolean_value_not_booleans (a_context: XM_XPATH_CONTEXT; an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Effective boolean value when neither operand is a boolean value.
		require
			first_iterator_before: an_iterator /= Void and then an_iterator.is_error or else an_iterator.before
			second_iterator_before: another_iterator /= Void and then another_iterator.is_error or else another_iterator.before
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_ATOMIC_VALUE]
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			a_sequence, another_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			last_boolean_value := Void
			if an_iterator.is_error then
				create last_boolean_value.make (False); last_boolean_value.set_last_error (an_iterator.error_value); set_last_error (last_boolean_value.error_value)
			end
			if another_iterator.is_error then
				create last_boolean_value.make (False); last_boolean_value.set_last_error (an_iterator.error_value); set_last_error (last_boolean_value.error_value)
			end
			if last_boolean_value = Void then
				if atomize_first_operand then
					a_sequence := shared_atomizing_function.new_atomizing_iterator (an_iterator)
				else
					a_sequence := an_iterator
				end
				if atomize_second_operand then
					another_sequence := shared_atomizing_function.new_atomizing_iterator (another_iterator)
				else
					another_sequence := another_iterator
				end

				-- If the operator is one of <, >, <=, >=, then convert both operands to sequences of xs:double
				--  using the number() function

				if operator = Less_than_token or else operator = Less_equal_token or else
					operator = Greater_than_token or else operator = Greater_equal_token then
					create {XM_XPATH_MAPPING_ITERATOR} a_sequence.make (a_sequence, Current, Void)
					create {XM_XPATH_MAPPING_ITERATOR} another_sequence.make (another_sequence, Current, Void)
				end

				-- Compare all pairs of atomic values in the two atomized sequences

				from
					create a_list.make_default; a_sequence.start
				until
					last_boolean_value /= Void or else a_sequence.after
				loop
					if a_sequence.is_error then
						create last_boolean_value.make (False); last_boolean_value.set_last_error (a_sequence.error_value); set_last_error (last_boolean_value.error_value)
					else
						an_atomic_value := a_sequence.item.as_atomic_value
						if an_atomic_value.is_error then
							create last_boolean_value.make (False); last_boolean_value.set_last_error (an_atomic_value.error_value); set_last_error (last_boolean_value.error_value)
						elseif not another_sequence.before and then another_sequence.after then
							from
								create a_comparison_checker
								a_cursor := a_list.new_cursor; a_cursor.start
							variant
								a_list.count + 1 - a_cursor.index
							until
								a_cursor.after
							loop
								a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_operator, atomic_comparer, a_cursor.item, True)
								if a_comparison_checker.is_comparison_type_error then
									create last_boolean_value.make (False); last_boolean_value.set_last_error (a_comparison_checker.last_type_error); set_last_error (last_boolean_value.error_value)
									a_cursor.go_after
								elseif a_comparison_checker.last_check_result then
									create last_boolean_value.make (True); a_cursor.go_after
								else
									a_cursor.forth
								end
							end
						else
							compare_value_with_sequence (an_atomic_value, another_sequence, a_list)
						end
					end
					if last_boolean_value = Void and then not a_sequence.is_error and then not a_sequence.after then a_sequence.forth end
				end
				if last_boolean_value = Void then create last_boolean_value.make (False) end
			end
		ensure
			value_not_void_but_may_be_in_error: last_boolean_value /= Void
		end

	compare_value_with_sequence (an_atomic_value: XM_XPATH_ATOMIC_VALUE; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]) is
			-- Compare `an_atomic_value' with all of `an_iterator'.
		require
			last_boolean_value_not_set: last_boolean_value = Void
			atomic_value_not_in_error: an_atomic_value /= Void and then not an_atomic_value.is_error
			sequence_not_after: an_iterator /= Void and then not an_iterator.is_error and then (an_iterator.before or else not an_iterator.after)
			list_not_void: a_list /= Void
		local
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			another_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			from
				create a_comparison_checker
				if an_iterator.before then
					an_iterator.start
				else
					an_iterator.forth
				end
			until
				last_boolean_value /= Void or else an_iterator.after
			loop
				another_atomic_value := an_iterator.item.as_atomic_value
				a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_operator, atomic_comparer, another_atomic_value, True)
				if a_comparison_checker.is_comparison_type_error then
					create last_boolean_value.make (False); last_boolean_value.set_last_error (a_comparison_checker.last_type_error); set_last_error (last_boolean_value.error_value)
				elseif a_comparison_checker.last_check_result then
					create last_boolean_value.make (True)
				else

					-- cache the atomic value to avoid re-creating the iterator

					a_list.force_last (another_atomic_value)
				end
				if not an_iterator.after then an_iterator.forth end
			end
		end

invariant
	
	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: initialized implies atomic_comparer /= Void
	value_comparison: initialized implies is_value_comparison_operator (singleton_operator)

end
	
