note

	description: "Objects that represent an xsl:choose or an xsl:if,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_CHOOSE

inherit

	XM_XSLT_INSTRUCTION
		redefine
			item_type, creates_new_nodes, sub_expressions, evaluate_item, create_iterator,
			native_implementations, promote_instruction, contains_recursive_tail_function_calls,
			mark_tail_function_calls
		end

create

	make

feature {NONE} -- Initialization

	make (a_executable: XM_XSLT_EXECUTABLE; a_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; a_actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Establish invariant.
		require
			executable_not_void: a_executable /= Void
			conditions: a_conditions /= Void and then not a_conditions.is_empty
			actions: a_actions /= Void and then a_actions.count = a_conditions.count
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			executable := a_executable
			conditions := a_conditions
			actions := a_actions
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
			from
				a_cursor := actions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				adopt_child_expression (a_cursor.item)
				a_cursor.forth
			end
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = a_executable
			conditions_set: conditions = a_conditions
			actions_set: actions = a_actions
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := actions.item (1).item_type
			from
				a_cursor := actions.new_cursor; a_cursor.start
				if not a_cursor.after then a_cursor.forth end
			until
				a_cursor.after
			loop
				Result := common_super_type (Result, a_cursor.item.item_type)
				a_cursor.forth
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (conditions.count + actions.count)
			Result.set_equality_tester (expression_tester)
			Result.extend_last (conditions)
			Result.extend_last (actions)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			from
				a_cursor := actions.new_cursor; a_cursor.start
			until
				Result or else a_cursor.after
			loop
				Result := not a_cursor.item.non_creating
				a_cursor.forth
			end
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_string: STRING
		do
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				if a_cursor.index = 1 then
					a_string := STRING_.appended_string (indentation (a_level), "if")
				else
					a_string := STRING_.appended_string (indentation (a_level), "elseif")
				end
				std.error.put_string (a_string); std.error.put_new_line
				a_cursor.item.display (a_level + 1)
				std.error.put_string (indentation (a_level)); std.error.put_string ("then"); std.error.put_new_line
				actions.item (a_cursor.index).display (a_level + 1)
				a_cursor.forth
			variant
				conditions.count + 1 - a_cursor.index
			end
		end

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_state: UT_TRISTATE
		do
			from
				create Result.make_false
				l_cursor := actions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_state := l_cursor.item.contains_recursive_tail_function_calls (a_name_code, a_arity)
				if l_state.is_true then
					Result.set_true
					l_cursor.go_after
				elseif Result.is_undefined then
					Result.set_undefined
					l_cursor.forth
				else
					l_cursor.forth
				end
			end
		end

feature -- Status setting

	mark_tail_function_calls
			-- Mark tail-recursive calls on stylesheet functions.
		do
			actions.do_all (agent {XM_XPATH_EXPRESSION}.mark_tail_function_calls)
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			from
				create l_replacement.make (Void)
				l_cursor := conditions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item
				l_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				l_cursor.forth
			end
			from
				l_cursor := actions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item
				l_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				l_cursor.forth
			end
		ensure then
			same_condition_count: conditions.count = old conditions.count
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			from
				create l_replacement.make (Void)
				l_cursor := conditions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item
				l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				l_cursor.forth
			end
			from
				l_cursor := actions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item
				l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				l_cursor.forth
			end
		ensure then
			same_condition_count: conditions.count = old conditions.count
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_boolean: BOOLEAN
			l_index: INTEGER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			from
				create l_replacement.make (Void)
				l_cursor := conditions.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_expression := l_cursor.item
				l_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				if l_expression.is_value and not l_expression.depends_upon_implicit_timezone then
					l_expression.calculate_effective_boolean_value (new_dummy_context)
					check postcondition_of_calculate_effective_boolean_value: attached l_expression.last_boolean_value as l_last_boolean_value then
						if not l_expression.is_error then
							l_boolean := l_last_boolean_value.value
							l_index := l_cursor.index
							if l_boolean then
								-- if condition is always true, remove all the subsequent conditions and actions
								if l_index = 1 then
									set_replacement (a_replacement, actions.item (1))
								else
									conditions.keep_first (l_index)
									actions.keep_first (l_index)
								end
								l_replacement.put (Void)
								l_cursor.go_after
							else
								-- if condition is false, skip this test
								l_replacement.put (Void)
								l_cursor.remove
								actions.remove (l_index)
							end
						else -- a run-time error will result only if this condition is tested
							l_replacement.put (Void)
							l_cursor.forth
						end
					end
				else
					l_replacement.put (Void)
					l_cursor.forth
				end
			end
			if a_replacement.item = Void then
				from
					l_cursor := actions.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_expression := l_cursor.item
					l_expression.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						if l_expression /= l_replacement_item then
							l_cursor.replace (l_replacement_item)
							reset_static_properties
						end
					end
					l_replacement.put (Void)
					l_cursor.forth
				end
			end
			if conditions.is_empty then
				conditions.put_last (create {XM_XPATH_BOOLEAN_VALUE}.make (True))
				actions.put_last (create {XM_XPATH_EMPTY_SEQUENCE}.make)
				set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
				a_context.issue_warning (STRING_.concat ("All conditional branches evaluate to false at ", location_message))
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			-- xsl:when acts as a guard:
			-- Expressions inside the when mustn't be evaluated if the when is false,
			--  and conditions after the first mustn't be evaluated if a previous condition is true.
			-- So we don't pass all promotion offers on.
			create l_replacement.make (Void)
			if a_offer.action = Inline_variable_references	or a_offer.action = Unordered or
			   a_offer.action = Replace_current then
				from
					l_cursor := conditions.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_expression := l_cursor.item
					l_expression.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if l_expression /= l_replacement_item then
							l_cursor.replace (l_replacement_item)
							reset_static_properties
						end
					end
					l_replacement.put (Void)
					l_cursor.forth
				end
				from
					l_cursor := actions.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_expression := l_cursor.item
					l_expression.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if l_expression /= l_replacement_item then
							l_cursor.replace (l_replacement_item)
							reset_static_properties
						end
					end
					l_replacement.put (Void)
					l_cursor.forth
				end
			else

				-- in other cases, only the first xsl:when condition is promoted

				l_expression := conditions.item (1)
				l_expression.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if l_expression /= l_replacement_item then
						check
							-- Bug: `l_cursor' has not been initialized.
							False
						then
							-- l_cursor.replace (l_replacement_item)
						end
						reset_static_properties
					end
				end
			end
		ensure then
			same_condition_count: conditions.count = old conditions.count
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the values of a sequence
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			last_iterator := Void
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as a_new_context
				-- This is XSLT
			then
				from
					l_cursor := conditions.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_cursor.item.calculate_effective_boolean_value (a_context)
					check postcondition_of_calculate_effective_boolean_value: attached l_cursor.item.last_boolean_value as l_last_boolean_value then
						a_boolean_value := l_last_boolean_value
						if attached a_boolean_value.error_value as l_error_value then
							check is_error: a_boolean_value.is_error end
							l_error_value.set_location (system_id, line_number)
							check attached a_new_context.transformer as l_transformer then
								l_transformer.report_fatal_error (l_error_value)
							end
							if is_node_sequence then
								create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error_value)
							else
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
							end
							l_cursor.go_after
						elseif a_boolean_value.value then
							actions.item (l_cursor.index).create_iterator (a_context)
							last_iterator := actions.item (l_cursor.index).last_iterator
							l_cursor.go_after
						else
							l_cursor.forth
						end
					end
				variant
					conditions.count + 1 - l_cursor.index
				end
				if last_iterator = Void then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				end
			end
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_action: XM_XPATH_EXPRESSION
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_new_context
				-- This is XSLT
			then
				from
					l_cursor := conditions.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_cursor.item.calculate_effective_boolean_value (a_context)
					check postcondition_of_calculate_effective_boolean_value: attached l_cursor.item.last_boolean_value as l_last_boolean_value then
						l_boolean_value := l_last_boolean_value
						if attached l_boolean_value.error_value as l_error_value then
							check is_error: l_boolean_value.is_error end
							l_error_value.set_location (system_id, line_number)
							check attached l_new_context.transformer as l_transformer then
								l_transformer.report_fatal_error (l_error_value)
							end
							a_result.put (l_boolean_value)
							l_cursor.go_after
						elseif l_boolean_value.value then
							l_action := actions.item (l_cursor.index)
							l_action.evaluate_item (a_result, a_context)
							l_cursor.go_after
						else
							l_cursor.forth
						end
					end
				variant
					conditions.count + 1 - l_cursor.index
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_action: XM_XPATH_EXPRESSION
			l_tail_call: detachable XM_XPATH_TAIL_CALL
		do
			from
				l_cursor := conditions.new_cursor; l_cursor.start
			until
				l_cursor.after
			loop
				l_cursor.item.calculate_effective_boolean_value (a_context)
				check postcondition_of_calculate_effective_boolean_value: attached l_cursor.item.last_boolean_value as l_last_boolean_value then
					l_boolean_value := l_last_boolean_value
					if attached l_boolean_value.error_value as l_error_value then
						check is_error: l_boolean_value.is_error end
						l_error_value.set_location (system_id, line_number)
						check attached a_context.transformer as l_transformer then
							l_transformer.report_fatal_error (l_error_value)
						end
						l_cursor.go_after
					elseif l_boolean_value.value then
						l_action := actions.item (l_cursor.index)
						if attached {XM_XSLT_INSTRUCTION} l_action as l_instruction then
							l_instruction.generate_tail_call (a_tail, a_context)
							l_tail_call := a_tail.item
						else
							l_action.generate_events (a_context)
							l_tail_call := Void
						end
						l_cursor.go_after
					else
						l_cursor.forth
					end
					a_tail.put (l_tail_call)
				end
			variant
				conditions.count + 1 - l_cursor.index
			end
		end

feature {NONE} -- Implementation

	conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Conditions

	actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actions

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_evaluate + Supports_iterator
		end

invariant

	conditions: initialized implies conditions /= Void
	conditions: initialized implies not conditions.is_empty
	actions: initialized implies actions /= Void and then actions.count = conditions.count

end

