note

	description:

	"Objects that implement an XQuery let expression: let $x := expr return expr.%
	%Used internally by XPath for optimizing the expression tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_LET_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			promote, create_iterator, create_node_iterator, evaluate_item, compute_special_properties,
			contains_recursive_tail_function_calls, is_let_expression, as_let_expression,
			generate_events, is_tail_call, as_tail_call, mark_tail_function_calls
		end

	XM_XPATH_ROLE

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_TAIL_CALL

create

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; a_action: XM_XPATH_EXPRESSION)
		require
			a_range_variable_not_void: a_range_variable /= Void
			a_sequence_expression_not_void: a_sequence_expression /= Void
			a_action_not_void: a_action /= Void
		do
			operator := Let_token
				-- Make the compiler happy in void-safe mode by setting `action'
				-- before calling `set_sequence'. Call `replace_action' afterwards
				-- anyway.
			action := a_action
			set_declaration (a_range_variable)
			set_sequence (a_sequence_expression)
			replace_action (a_action)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			declaration_set: declaration = a_range_variable
			action_set: action = a_action
			sequence_set: sequence = a_sequence_expression
		end

feature -- Access

	reference_count: INTEGER
			-- Estimate of number of references to `Current', set by `optimize'

	is_let_expression: BOOLEAN
			-- Is `Current' a let expression?
		do
			Result := True
		end

	as_let_expression: XM_XPATH_LET_EXPRESSION
			-- `Current' seen as a let expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable
		do
			create Result.make (sequence.item_type, sequence.cardinality)
		end

feature -- Status report

	is_tail_call: BOOLEAN
			-- Is `Current' an XPath tail call?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "let $")
			a_string := STRING_.appended_string (a_string, variable_name)
			std.error.put_string (a_string)
			std.error.put_string ("[reference count=" + reference_count.out + "]%N")
			sequence.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "in")
			std.error.put_string (a_string)
			std.error.put_new_line
			action.display (a_level + 1)
		end

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		do
			Result := action.contains_recursive_tail_function_calls (a_name_code, a_arity)
		end

feature -- Status setting

	mark_tail_function_calls
			-- Mark tail-recursive calls on stylesheet functions.
		do
			action.mark_tail_function_calls
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_expression: XM_XPATH_EXPRESSION
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_type: XM_XPATH_ITEM_TYPE
			l_value: detachable XM_XPATH_VALUE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if not attached declaration as l_declaration then
				-- do nothing
			else
				if not simplified then
					simplify (a_replacement)
				end

				if a_replacement.item = Void then
					-- The order of events is critical here. First we ensure that the type of the
					-- sequence expression is established. This is used to establish the type of the variable,
					-- which in turn is required when type-checking the action part.
					create l_replacement.make (Void)
					sequence.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
						l_expression := sequence
						if l_replacement_item.is_error then
							set_replacement (a_replacement, l_replacement_item)
						else
							create l_role.make (Variable_role, l_declaration.variable_name, 1, Xpath_errors_uri, "XPTY0004")
							create l_type_checker
							l_type_checker.static_type_check (a_context, l_expression, l_declaration.required_type, False, l_role)
							if attached l_type_checker.static_type_check_error as l_static_type_check_error then
								check is_error: l_type_checker.is_static_type_check_error end
								set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
							else
								check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
									set_sequence (l_checked_expression)
								end
							end
							if a_replacement.item = Void then
								l_type := sequence.item_type
								if sequence.is_value and not sequence.depends_upon_implicit_timezone then
									l_value := sequence.as_value
								end
								-- Now set the static type of the binding reference, more accurately:
								l_replacement.put (Void)
								l_declaration.refine_type_information (l_type, l_value, sequence)
								action.check_static_type (l_replacement, a_context, a_context_item_type)
								check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item_2 then
									if l_replacement_item_2.is_error then
										set_replacement (a_replacement, l_replacement_item_2)
									elseif action /= l_replacement_item_2 then
										replace_action (l_replacement_item_2)
									end
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

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_try_count: INTEGER
			l_optimized: BOOLEAN
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached declaration as l_declaration then
				reference_count := l_declaration.reference_count (Current)
				if reference_count = 0 then

					-- variable is not used - no need to evaluate it

					set_replacement (a_replacement, action)
					l_optimized := True
					-- TODO elseif reference_count = 1 or sequence is a literal (neither in a loop) then
				end
				set_declaration_void
			end
			if not l_optimized then
				from
					create l_replacement.make (Void)
					l_try_count := 1
					l_optimized := False
				until
					l_replacement.item /= Void or l_optimized or l_try_count > Maximum_optimization_attempts
				loop
					sequence.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						if sequence /= l_replacement_item then
							set_sequence (l_replacement_item)
							reset_static_properties
							l_try_count := l_try_count + 1
						else
							l_optimized := true
						end
						if sequence.is_error then
							set_replacement (a_replacement, sequence)
						end
						l_replacement.put (Void)
					end
				end
				from
					l_try_count := 1
					l_optimized := False
				until
					l_replacement.item /= Void or l_optimized or l_try_count > Maximum_optimization_attempts
				loop
					action.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						if l_replacement_item.is_error then
							set_replacement (a_replacement, l_replacement_item)
						elseif action /= l_replacement_item then
							replace_action (l_replacement_item)
							reset_static_properties
							l_try_count := l_try_count + 1
						else
							l_optimized := true
						end
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: detachable XM_XPATH_EXPRESSION
			l_saved_binding_list, l_new_binding_list: DS_LIST [XM_XPATH_BINDING]
			l_cursor: DS_LIST_CURSOR [XM_XPATH_BINDING]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				-- Pass the offer on to the sequence expression
				create l_replacement.make (Void)
				sequence.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if sequence /= l_replacement_item then
						set_sequence (l_replacement_item)
						reset_static_properties
					end
				end
				if a_offer.action = Inline_variable_references	or a_offer.action = Unordered or
					a_offer.action = Replace_current then
					-- Pass the offer to the action expression only if the action isn't depending on the
               --  variable bound by this let expression
					l_replacement.put (Void)
					action.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if action /= l_replacement_item then
							replace_action (l_replacement_item)
							reset_static_properties
						end
					end
				elseif a_offer.action = Range_independent then
					l_replacement.put (Void)
					-- Pass the offer to the action expression only if the action isn't depending on the
					--  variable bound by this let expression
					check invariant_of_XM_XPATH_PROMOTION_OFFER: attached a_offer.binding_list as l_offer_binding_list then
						l_saved_binding_list := l_offer_binding_list
						create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} l_new_binding_list.make (l_saved_binding_list.count + 1)
						from
							l_cursor := l_offer_binding_list.new_cursor
							l_cursor.start
						until l_cursor.after loop
							l_new_binding_list.put (l_cursor.item, l_cursor.index)
							l_cursor.forth
						end
						l_new_binding_list.put_last (Current)
						a_offer.set_binding_list (l_new_binding_list)
						action.promote (l_replacement, a_offer)
						check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
							if action /= l_replacement_item then
								replace_action (l_replacement_item)
								reset_static_properties
							end
						end
						a_offer.set_binding_list (l_saved_binding_list)
					end
				end

				-- If this results in the expression (let $x := $y return Z), replace all references to
				-- to $x by references to $y in the Z part, and eliminate this LetExpression by
				-- returning the action part.

				if sequence.is_variable_reference then
					l_replacement.put (Void)
					replace_variable (l_replacement, sequence.as_variable_reference)
					check postcondition_of_replace_variable: attached l_replacement.item as l_replacement_item then
						if l_replacement_item.is_computed_expression then
							l_replacement_item.as_computed_expression.reset_static_properties
						end
						set_replacement (a_replacement, action)
					end
				end

				-- Similarly, for (let $x := lazy($y) return Z)

				if sequence.is_lazy_expression and then sequence.as_lazy_expression.base_expression.is_variable_reference then
					l_replacement.put (Void)
					replace_variable (l_replacement, sequence.as_lazy_expression.base_expression.as_variable_reference)
					check postcondition_of_replace_variable: attached l_replacement.item as l_replacement_item then
						if l_replacement_item.is_computed_expression then
							l_replacement_item.as_computed_expression.reset_static_properties
						end
						set_replacement (a_replacement, action)
					end
				end
			end
			if a_replacement.item = Void then
				evaluation_mode := sequence.lazy_evaluation_mode
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do

			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
				create l_result.make (Void)
			until
				is_error or else l_finished
			loop
				l_result.put (Void)
				l_let_expression.evaluate_let_expression (l_result, a_context)
				check postcondition_of_evaluate_let_expression: attached l_result.item as l_result_item then
					l_value := l_result_item
					if attached l_value.error_value as l_error_value then
						check is_error: l_value.is_error end
						set_last_error (l_error_value)
					else
						a_context.set_local_variable (l_value, l_let_expression.slot_number)
						if l_let_expression.action.is_let_expression then
							l_let_expression := l_let_expression.action.as_let_expression
						else
							l_finished := True
						end
					end
				end
			end
			if attached error_value as l_error_value then
				check is_error: is_error end
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
			else
				l_let_expression.action.evaluate_item (a_result, a_context)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do

			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
				create l_result.make (Void)
			until
				is_error or else l_finished
			loop
				l_result.put (Void)
				l_let_expression.evaluate_let_expression (l_result, a_context)
				check postcondition_of_evaluate_let_expression: attached l_result.item as l_result_item then
					l_value := l_result_item
					if attached l_value.error_value as l_error_value then
						check is_error: l_value.is_error end
						set_last_error (l_error_value)
					else
						a_context.set_local_variable (l_value, l_let_expression.slot_number)
						if l_let_expression.action.is_let_expression then
							l_let_expression := l_let_expression.action.as_let_expression
						else
							l_finished := True
						end
					end
				end
			end
			if attached error_value as l_error_value then
				check is_error: is_error end
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
			else
				l_let_expression.action.create_iterator (a_context)
				last_iterator := l_let_expression.action.last_iterator
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a node sequence
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do

			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
				create l_result.make (Void)
			until
				is_error or else l_finished
			loop
				l_result.put (Void)
				l_let_expression.evaluate_let_expression (l_result, a_context)
				check postcondition_of_evaluate_let_expression: attached l_result.item as l_result_item then
					l_value := l_result_item
					if attached l_value.error_value as l_error_value then
						check is_error: l_value.is_error end
						set_last_error (l_error_value)
					else
						a_context.set_local_variable (l_value, l_let_expression.slot_number)
						if l_let_expression.action.is_let_expression then
							l_let_expression := l_let_expression.action.as_let_expression
						else
							l_finished := True
						end
					end
				end
			end
			if attached error_value as l_error_value then
				check is_error: is_error end
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
			else
				l_let_expression.action.create_node_iterator (a_context)
				last_node_iterator := l_let_expression.action.last_node_iterator
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do

			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
				create l_result.make (Void)
			until
				is_error or a_context.is_process_error or l_finished
			loop
				l_result.put (Void)
				l_let_expression.evaluate_let_expression (l_result, a_context)
				check postcondition_of_evaluate_let_expression: attached l_result.item as l_result_item then
					l_value := l_result_item
					if attached l_value.error_value as l_error_value then
						check is_error: l_value.is_error end
						set_last_error (l_error_value)
					else
						a_context.set_local_variable (l_value, l_let_expression.slot_number)
						if l_let_expression.action.is_let_expression then
							l_let_expression := l_let_expression.action.as_let_expression
						else
							l_finished := True
						end
					end
				end
			end
			if a_context.is_process_error then
				-- do nothing
			elseif attached error_value as l_error_value then
				check is_error: is_error end
				a_context.report_fatal_error (l_error_value)
			else
				l_let_expression.action.generate_events (a_context)
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XPATH_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do

			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
				create l_result.make (Void)
			until
				is_error or else l_finished
			loop
				l_result.put (Void)
				l_let_expression.evaluate_let_expression (l_result, a_context)
				check postcondition_of_evaluate_let_expression: attached l_result.item as l_result_item then
					l_value := l_result_item
					if attached l_value.error_value as l_error_value then
						check is_error: l_value.is_error end
						set_last_error (l_error_value)
					else
						a_context.set_local_variable (l_value, l_let_expression.slot_number)
						if l_let_expression.action.is_let_expression then
							l_let_expression := l_let_expression.action.as_let_expression
						else
							l_finished := True
						end
					end
				end
			end
			a_tail.put (Void)
			if attached error_value as l_error_value then
				check is_error: is_error end
				a_context.report_fatal_error (l_error_value)
			else
				if l_let_expression.action.is_tail_call then
					l_let_expression.action.as_tail_call.generate_tail_call (a_tail, a_context)
				else
					l_let_expression.action.generate_events (a_context)
				end
			end
		end

feature -- Conversion

	as_tail_call: XM_XPATH_TAIL_CALL
			-- `Current' seen as an XPath tail call
		do
			Result := Current
		end

feature {XM_XPATH_LET_EXPRESSION} -- Local

	evaluate_let_expression (a_result: DS_CELL [detachable XM_XPATH_VALUE]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate `Current'.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
		do
			if evaluation_mode = Evaluation_method_undecided then
				evaluation_mode := sequence.lazy_evaluation_mode
			end
			sequence.evaluate (a_result, evaluation_mode, reference_count, a_context)
		ensure
			evaluation_not_void: a_result.item /= Void
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties
			-- Compute special properties.
		do
			clone_special_properties (action)
			if not sequence.non_creating then
				set_creating
			end
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality (action.cardinality)
		end

	evaluation_mode: INTEGER
			-- Method used for evaluating `Current'

	Maximum_optimization_attempts: INTEGER = 5

	replace_variable (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_var_ref: XM_XPATH_VARIABLE_REFERENCE)
			-- Replace `a_var_ref' with it's value.
		require
			reference_not_void: a_var_ref /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_binding_list: DS_LIST [XM_XPATH_BINDING]
			l_offer: XM_XPATH_PROMOTION_OFFER
		do
			create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} l_binding_list.make (1)
			l_binding_list.put (Current, 1)
			create l_offer.make (Inline_variable_references, l_binding_list, a_var_ref, False, False)
			action.promote (a_replacement, l_offer)
			if l_offer.accepted_expression /= Void then
				a_replacement.put (Void)
				replace_variable (a_replacement, a_var_ref)
			end
		end


invariant

	operator_is_let: operator = Let_token
	evaluation_mode_large_enough: evaluation_mode >= Evaluation_method_undecided
	evaluation_mode_small_enough: evaluation_mode <= Create_memo_closure

end

