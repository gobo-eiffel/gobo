indexing

	description: "Objects that represent an xsl:choose or an xsl:if,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_CHOOSE

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			item_type, creates_new_nodes, sub_expressions, evaluate_item, create_iterator,
			native_implementations, promote_instruction
		end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; some_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; some_actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			conditions: some_conditions /= Void and then some_conditions.count > 0
			actions: some_actions /= Void and then some_actions.count = some_conditions.count
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			executable := an_executable
			conditions := some_conditions
			actions := some_actions
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
			executable_set: executable = an_executable
			conditions_set: conditions = some_conditions
			actions_set: actions = some_actions
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
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
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (conditions.count + actions.count)
			Result.set_equality_tester (expression_tester)
			Result.extend_last (conditions)
			Result.extend_last (actions)
		end
	
feature -- Status report

	creates_new_nodes: BOOLEAN is
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

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_string: STRING
		do
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			variant
				conditions.count + 1 - a_cursor.index
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
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.simplify
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end
			from
				a_cursor := actions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.simplify
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.check_static_type (a_context, a_context_item_type)
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end
			from
				a_cursor := actions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.check_static_type (a_context, a_context_item_type)
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end	
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_EXPRESSION
			a_boolean: BOOLEAN
			an_index: INTEGER
		do
			mark_unreplaced
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.optimize (a_context, a_context_item_type)
				if an_expression.was_expression_replaced then
					an_expression := an_expression.replacement_expression
					a_cursor.replace (an_expression)
				end
				if an_expression.is_value then
					an_expression.calculate_effective_boolean_value (Void)
					if not an_expression.is_error then
						a_boolean := an_expression.last_boolean_value.value
						an_index := a_cursor.index
						if a_boolean then

							-- if condition is always true, remove all the subsequent conditions and actions

							
							if an_index = 1 then
								set_replacement (actions.item (1))
							else
								conditions.keep_first (an_index)
								actions.keep_first (an_index)
							end
							a_cursor.go_after
						else

							-- if condition is false, skip this test

							a_cursor.remove
							actions.remove (an_index)
						end
					else -- a run-time error will result only if this condition is tested
						a_cursor.forth
					end
				else
					a_cursor.forth
				end
			end
			from
				a_cursor := actions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				an_expression.optimize (a_context, a_context_item_type)
				if an_expression.was_expression_replaced then
					a_cursor.replace (an_expression.replacement_expression)
				end
				a_cursor.forth
			end	

		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_EXPRESSION
		do

			-- xsl:when acts as a guard:
			-- Expressions inside the when mustn't be evaluated if the when is false,
			--  and conditions after the first mustn't be evaluated if a previous condition is true.
			-- So we don't pass all promotion offers on

			if an_offer.action = Inline_variable_references	or else an_offer.action = Unordered
				or else an_offer.action = Replace_current then
				from
					a_cursor := conditions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					an_expression := a_cursor.item
					an_expression.promote (an_offer)
					if an_expression.was_expression_replaced then
						a_cursor.replace (an_expression.replacement_expression)
					end
					a_cursor.forth
				end
				from
					a_cursor := actions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					an_expression := a_cursor.item
					an_expression.promote (an_offer)
					if an_expression.was_expression_replaced then
						a_cursor.replace (an_expression.replacement_expression)
					end
					a_cursor.forth
				end
			else

				-- in other cases, only the first xsl:when condition is promoted

				an_expression := conditions.item (1)
				an_expression.promote (an_offer)
				if an_expression.was_expression_replaced then
					conditions.replace (an_expression.replacement_expression, 1)
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_iterator := Void
			a_new_context ?= a_context
			check
				evaluation_context: a_new_context /= Void
				-- This is XSLT
			end
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			variant
				conditions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.calculate_effective_boolean_value (a_context)
				a_boolean_value := a_cursor.item.last_boolean_value
				if a_boolean_value.is_error then
					a_boolean_value.error_value.set_location (system_id, line_number)
					a_new_context.transformer.report_fatal_error (a_boolean_value.error_value)
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (a_boolean_value.error_value)
					a_cursor.go_after
				elseif a_boolean_value.value then
					actions.item (a_cursor.index).create_iterator (a_context)
					last_iterator := actions.item (a_cursor.index).last_iterator
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
			if last_iterator = Void then create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			an_action: XM_XPATH_EXPRESSION
		do
			last_evaluated_item := Void
			a_new_context ?= a_context
			check
				evaluation_context: a_new_context /= Void
				-- This is XSLT
			end
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			variant
				conditions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.calculate_effective_boolean_value (a_context)
				a_boolean_value := a_cursor.item.last_boolean_value
				if a_boolean_value.is_error then
					a_boolean_value.error_value.set_location (system_id, line_number)
					a_new_context.transformer.report_fatal_error (a_boolean_value.error_value)
					last_evaluated_item := a_boolean_value
					a_cursor.go_after
				elseif a_boolean_value.value then
					an_action := actions.item (a_cursor.index)
					an_action.evaluate_item (a_context)
					last_evaluated_item := an_action.last_evaluated_item
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_instruction: XM_XSLT_INSTRUCTION
			an_action: XM_XPATH_EXPRESSION
		do
			last_tail_call := Void
			from
				a_cursor := conditions.new_cursor; a_cursor.start
			variant
				conditions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.calculate_effective_boolean_value (a_context)
				a_boolean_value := a_cursor.item.last_boolean_value
				if a_boolean_value.is_error then
					a_boolean_value.error_value.set_location (system_id, line_number)
					a_context.transformer.report_fatal_error (a_boolean_value.error_value)
					a_cursor.go_after
				elseif a_boolean_value.value then
					an_action := actions.item (a_cursor.index)
					an_instruction ?= an_action
					if an_instruction /= Void then
						an_instruction.process_leaving_tail (a_context)
						last_tail_call := an_instruction.last_tail_call
					else
						an_action.process (a_context)
						last_tail_call := Void
					end
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Implementation
	
	conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Conditions

	actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actions

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_evaluate_item + Supports_iterator
		end

invariant

	conditions: initialized implies conditions /= Void
	actions: initialized implies actions /= Void and then actions.count = conditions.count
	
end
	
