note

	description:

		"XPath 1.0-compatible comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

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

	XM_XPATH_ITEM_MAPPING_FUNCTION

	XM_XPATH_NUMERIC_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR)
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			general_comparison_operator: is_general_comparison_operator (a_token)
		do
			create atomic_comparer.make (a_collator)
			make_binary_expression (an_operand_one, a_token, an_operand_two)
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_node_sequence: BOOLEAN
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := False
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check
				backwards_compatible_mode: a_context.is_backwards_compatible_mode
			end
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					a_replacement.put (Current)
				else
					set_first_operand (l_replacement_item)
					l_replacement.put (Void)
					second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item_2 then
						if not l_replacement_item_2.is_error then
							set_second_operand (l_replacement_item_2)
						end
					end
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check
				backwards_compatible_mode: a_context.is_backwards_compatible_mode
			end
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					a_replacement.put (Current)
				else
					set_first_operand (l_replacement_item)
					l_replacement.put (Void)
					second_operand.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item_2 then
						if l_replacement_item_2.is_error then
							a_replacement.put (Current)
						else
							set_second_operand (l_replacement_item_2)
							l_replacement.put (Void)
							first_operand.set_unsorted (l_replacement, False)
							check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item_3 then
								set_first_operand (l_replacement_item_3)
							end
							l_replacement.put (Void)
							second_operand.set_unsorted (l_replacement, False)
							check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item_4 then
								set_second_operand (l_replacement_item_4)
							end
							if first_operand.is_value and then not first_operand.depends_upon_implicit_timezone
								and then second_operand.is_value and then not second_operand.depends_upon_implicit_timezone then
								create  l_result.make (Void)
								evaluate_item (l_result, a_context.new_compile_time_context)
								check
									boolean_value: attached l_result.item as l_result_item and then l_result_item.is_boolean_value
									-- We are guarenteed a boolean value
								then
									if not is_error then
										set_replacement (a_replacement, l_result_item.as_boolean_value)
									end
								end
							else
								optimize_stage_2 (a_replacement, a_context, a_context_item_type)
							end
						end
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			l_iterator, l_other_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_iterator_cell, l_other_iterator_cell: DS_CELL [detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]]
			l_last_boolean_value: like last_boolean_value
		do
			last_boolean_value := Void
			atomic_comparer.set_dynamic_context (a_context)
			create l_iterator_cell.make (Void)
			create l_other_iterator_cell.make (Void)
			if	maybe_first_operand_boolean then
				evaluate_possible_first_boolean_value  (l_iterator_cell, a_context)
			end
			if last_boolean_value = Void and then maybe_second_operand_boolean then
				evaluate_possible_second_boolean_value  (l_other_iterator_cell, a_context)
			end
			if last_boolean_value = Void then
				if not attached l_iterator_cell.item as l_iterator_cell_item then
					first_operand.create_iterator (a_context)
					check postcondition_of_create_iterator: attached first_operand.last_iterator as l_last_iterator then
						l_iterator := l_last_iterator
					end
				else
					l_iterator := l_iterator_cell_item.another
				end
				if not attached l_other_iterator_cell.item as l_other_iterator_cell_item then
					second_operand.create_iterator (a_context)
					check postcondition_of_create_iterator: attached second_operand.last_iterator as l_last_iterator then
						l_other_iterator := l_last_iterator
					end
				else
					l_other_iterator := l_other_iterator_cell_item.another
				end
				atomic_comparer.set_dynamic_context (a_context)
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					create l_last_boolean_value.make (False)
					last_boolean_value := l_last_boolean_value
					l_last_boolean_value.set_last_error (l_error_value)
					set_last_error (l_error_value)
				end
				if attached l_other_iterator.error_value as l_error_value then
					check is_error: l_other_iterator.is_error end
					create l_last_boolean_value.make (False)
					last_boolean_value := l_last_boolean_value
					l_last_boolean_value.set_last_error (l_error_value)
					set_last_error (l_error_value)
				end
				if last_boolean_value = Void then
					calculate_effective_boolean_value_not_booleans (a_context, l_iterator, l_other_iterator)
				end
			end
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end


	mapped_item (a_item: XM_XPATH_ITEM): detachable XM_XPATH_ITEM
			-- Map `a_item' to another item
		do
			Result := item_to_double (a_item)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
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

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many (1.0)", Precursor)
		end

	issue_warnings (a_type, another_type: XM_XPATH_ITEM_TYPE; a_context: XM_XPATH_STATIC_CONTEXT)
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

	optimize_stage_2 (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Optimize after operands have been optimized.
		require
			no_previous_error: not is_error
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
			xpath_1_mode: a_context.is_backwards_compatible_mode
		local
			l_type, l_other_type: XM_XPATH_ITEM_TYPE
			l_maybe_first_operand_numeric, l_maybe_second_operand_numeric: BOOLEAN
			l_is_first_operand_numeric, l_is_second_operand_numeric: BOOLEAN
			l_general_comparison: XM_XPATH_GENERAL_COMPARISON
			l_relationship, l_other_relationship: INTEGER
			l_expression: XM_XPATH_EXPRESSION
		do
			l_type := first_operand.item_type
			l_other_type := second_operand.item_type
			if l_type.is_atomic_type then
				atomize_first_operand  := False
			end
			if l_other_type.is_atomic_type then
				atomize_second_operand  := False
			end
			if type_relationship (l_type, type_factory.boolean_type) = Disjoint_types then
				maybe_first_operand_boolean := False
			end
			if type_relationship (l_other_type, type_factory.boolean_type) = Disjoint_types then
				maybe_second_operand_boolean := False
			end
			if not maybe_first_operand_boolean and not maybe_second_operand_boolean then
				l_relationship := type_relationship (l_type, type_factory.numeric_type)
				l_other_relationship := type_relationship (l_other_type, type_factory.numeric_type)
				l_maybe_first_operand_numeric := l_relationship /= Disjoint_types
				l_maybe_second_operand_numeric := l_other_relationship /= Disjoint_types
				l_is_first_operand_numeric := l_relationship = Subsumed_type or else l_relationship = Same_item_type
				l_is_second_operand_numeric := l_other_relationship = Subsumed_type or else l_other_relationship = Same_item_type

				if (l_is_first_operand_numeric and then l_is_second_operand_numeric)
					or else (not l_maybe_first_operand_numeric and then not l_maybe_second_operand_numeric) then

					-- Use the XPath 2.0 route if we don't have to deal with the possibility of boolean values,
					--  or the complications of converting values to numbers

					create l_general_comparison.make (first_operand, operator, second_operand, atomic_comparer.collator)
					l_general_comparison.check_static_type (a_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached a_replacement.item as l_replacement_item then
						if not l_replacement_item.is_error then
							l_expression := l_replacement_item
							a_replacement.put (Void)
							l_expression.optimize (a_replacement, a_context, a_context_item_type)
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	calculate_effective_boolean_value_not_booleans (a_context: XM_XPATH_CONTEXT; a_iterator, a_other_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Effective boolean value when neither operand is a boolean value.
		require
			first_iterator_before: a_iterator /= Void and then a_iterator.is_error or else a_iterator.before
			second_iterator_before: a_other_iterator /= Void and then a_other_iterator.is_error or else a_other_iterator.before
		local
			l_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_ATOMIC_VALUE]
			l_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			l_sequence, l_other_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_last_boolean_value: like last_boolean_value
		do
			if atomize_first_operand then
				l_sequence := shared_atomizing_function.new_atomizing_iterator (a_iterator)
			else
				l_sequence := a_iterator
			end
			if atomize_second_operand then
				l_other_sequence := shared_atomizing_function.new_atomizing_iterator (a_other_iterator)
			else
				l_other_sequence := a_other_iterator
			end

			-- If the operator is one of <, >, <=, >=, then convert both operands to sequences of xs:double
			--  using the number() function

			if operator = Less_than_token or else operator = Less_equal_token or else
				operator = Greater_than_token or else operator = Greater_equal_token then
				create {XM_XPATH_ITEM_MAPPING_ITERATOR} l_sequence.make (l_sequence, Current)
				create {XM_XPATH_ITEM_MAPPING_ITERATOR} l_other_sequence.make (l_other_sequence, Current)
			end

			-- Compare all pairs of atomic values in the two atomized sequences

			from
				create l_list.make_default
				l_sequence.start
			until
				last_boolean_value /= Void or l_sequence.after
			loop
				if attached l_sequence.error_value as l_error_value then
					check is_error: l_sequence.is_error end
					create l_last_boolean_value.make (False)
					l_last_boolean_value.set_last_error (l_error_value)
					last_boolean_value := l_last_boolean_value
					set_last_error (l_error_value)
				else
					l_atomic_value := l_sequence.item.as_atomic_value
					if attached l_atomic_value.error_value as l_error_value then
						check is_error: l_atomic_value.is_error end
						create l_last_boolean_value.make (False)
						l_last_boolean_value.set_last_error (l_error_value)
						last_boolean_value := l_last_boolean_value
						set_last_error (l_error_value)
					elseif not l_other_sequence.before and then l_other_sequence.after then
						from
							create l_comparison_checker
							l_cursor := l_list.new_cursor
							l_cursor.start
						until
							l_cursor.after
						loop
							l_comparison_checker.check_correct_general_relation_xpath1 (l_atomic_value, singleton_operator, atomic_comparer, l_cursor.item)
							if l_comparison_checker.is_comparison_type_error then
								create l_last_boolean_value.make (False)
								last_boolean_value := l_last_boolean_value
								check attached l_comparison_checker.last_type_error as l_last_type_error then
									l_last_boolean_value.set_last_error (l_last_type_error)
									set_last_error (l_last_type_error)
								end
								l_cursor.go_after
							elseif l_comparison_checker.last_check_result then
								create last_boolean_value.make (True); l_cursor.go_after
							else
								l_cursor.forth
							end
						variant
							l_list.count + 1 - l_cursor.index
						end
					else
						compare_value_with_sequence (l_atomic_value, l_other_sequence, l_list)
					end
				end
				if last_boolean_value = Void and then not l_sequence.is_error and then not l_sequence.after then l_sequence.forth end
			end
			if last_boolean_value = Void then create last_boolean_value.make (False) end
		ensure
			value_not_void_but_may_be_in_error: last_boolean_value /= Void
		end

	compare_value_with_sequence (a_atomic_value: XM_XPATH_ATOMIC_VALUE; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE])
			-- Compare `a_atomic_value' with all of `a_iterator'.
		require
			last_boolean_value_not_set: last_boolean_value = Void
			atomic_value_not_in_error: a_atomic_value /= Void and then not a_atomic_value.is_error
			sequence_not_after: a_iterator /= Void and then not a_iterator.is_error and then (a_iterator.before or else not a_iterator.after)
			list_not_void: a_list /= Void
		local
			l_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_last_boolean_value: like last_boolean_value
		do
			from
				create l_comparison_checker
				if a_iterator.before then
					a_iterator.start
				else
					a_iterator.forth
				end
			until
				last_boolean_value /= Void or else a_iterator.after
			loop
				l_other_atomic_value := a_iterator.item.as_atomic_value
				l_comparison_checker.check_correct_general_relation_xpath1 (a_atomic_value, singleton_operator, atomic_comparer, l_other_atomic_value)
				if l_comparison_checker.is_comparison_type_error then
					create l_last_boolean_value.make (False)
					last_boolean_value := l_last_boolean_value
					check attached l_comparison_checker.last_type_error as l_last_type_error then
						l_last_boolean_value.set_last_error (l_last_type_error)
						set_last_error (l_last_type_error)
					end
				elseif l_comparison_checker.last_check_result then
					create last_boolean_value.make (True)
				else

					-- cache the atomic value to avoid re-creating the iterator

					if not a_list.extendible (1) then
						a_list.resize (2 * a_list.count)
					end
					a_list.put_last (l_other_atomic_value)
				end
				if not a_iterator.after then a_iterator.forth end
			end
		end

	evaluate_possible_first_boolean_value  (a_cell: DS_CELL [detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate `first_operand' as a boolean value.
		require
			a_cell_not_void: a_cell /= Void
			a_cell_empty: a_cell.item = Void
			a_context_not_void: a_context /= Void
			first_operand_maybe_boolean: maybe_first_operand_boolean
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			l_last_boolean_value: like last_boolean_value
		do
			first_operand.create_iterator (a_context)
			check postcondition_of_create_iterator: attached first_operand.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if not l_iterator.is_error then
					l_iterator.start
				end
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					create l_last_boolean_value.make (False)
					l_last_boolean_value.set_last_error (l_error_value)
					last_boolean_value := l_last_boolean_value
					set_last_error (l_error_value)
				elseif not l_iterator.after then
					if l_iterator.item.is_boolean_value then
						second_operand.calculate_effective_boolean_value (a_context)
						if attached second_operand.error_value as l_error_value then
							check is_error: second_operand.is_error end
							create l_last_boolean_value.make (False)
							l_last_boolean_value.set_last_error (l_error_value)
							last_boolean_value := l_last_boolean_value
							set_last_error (l_error_value)
						else
							check postcondition_of_calculate_effective_boolean_value: attached second_operand.last_boolean_value as l_second_operand_last_boolean_value then
								create l_comparison_checker
								l_comparison_checker.check_correct_general_relation_xpath1 (l_iterator.item.as_boolean_value, singleton_operator, atomic_comparer, l_second_operand_last_boolean_value)
								if l_comparison_checker.is_comparison_type_error then
									create l_last_boolean_value.make (False)
									last_boolean_value := l_last_boolean_value
									check attached l_comparison_checker.last_type_error as l_last_type_error then
										l_last_boolean_value.set_last_error (l_last_type_error)
										set_last_error (l_last_type_error)
									end
								elseif l_comparison_checker.last_check_result then
									create last_boolean_value.make (True)
								else
									create last_boolean_value.make (False)
								end
							end
						end
					end
				elseif not maybe_second_operand_boolean then
					create last_boolean_value.make (False)
				end
				a_cell.put (l_iterator)
			end
		end


	evaluate_possible_second_boolean_value  (a_cell: DS_CELL [detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate `second_operand' as a boolean value.
		require
			a_cell_not_void: a_cell /= Void
			a_cell_empty: a_cell.item = Void
			a_context_not_void: a_context /= Void
			second_operand_maybe_boolean: maybe_second_operand_boolean
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_comparison_checker: XM_XPATH_COMPARISON_CHECKER
			l_last_boolean_value: like last_boolean_value
		do
			second_operand.create_iterator (a_context)
			check postcondition_of_create_iterator: attached second_operand.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if not l_iterator.is_error then
					l_iterator.start
				end
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					create l_last_boolean_value.make (False)
					l_last_boolean_value.set_last_error (l_error_value)
					last_boolean_value := l_last_boolean_value
					set_last_error (l_error_value)
				elseif not l_iterator.after then
					if l_iterator.item.is_boolean_value then
						first_operand.calculate_effective_boolean_value (a_context)
						if attached first_operand.error_value as l_error_value then
							check is_error: first_operand.is_error end
							create l_last_boolean_value.make (False)
							l_last_boolean_value.set_last_error (l_error_value)
							last_boolean_value := l_last_boolean_value
							set_last_error (l_error_value)
						else
							check postcondition_of_calculate_effective_boolean_value: attached first_operand.last_boolean_value as l_first_operand_last_boolean_value then
								create l_comparison_checker
								l_comparison_checker.check_correct_general_relation_xpath1 (l_first_operand_last_boolean_value, singleton_operator, atomic_comparer, l_iterator.item.as_boolean_value)
								if l_comparison_checker.is_comparison_type_error then
									create l_last_boolean_value.make (False)
									last_boolean_value := l_last_boolean_value
									check attached l_comparison_checker.last_type_error as l_last_type_error then
										l_last_boolean_value.set_last_error (l_last_type_error)
										set_last_error (l_last_type_error)
									end
								elseif l_comparison_checker.last_check_result then
									create last_boolean_value.make (True)
								else
									create last_boolean_value.make (False)
								end
							end
						end
					end
				elseif not maybe_first_operand_boolean then
					create last_boolean_value.make (False)
				end
				a_cell.put (l_iterator)
			end
		end

invariant

	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: initialized implies atomic_comparer /= Void
	value_comparison: initialized implies is_value_comparison_operator (singleton_operator)

end

