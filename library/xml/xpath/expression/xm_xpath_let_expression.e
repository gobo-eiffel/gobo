indexing

	description:

	"Objects that implement an XQuery let expression: let $x := expr return expr.%
	%Used internally by XPath for optimizing the expression tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LET_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			promote, create_iterator, create_node_iterator, evaluate_item, compute_special_properties,
			mark_tail_function_calls, action, is_let_expression, as_let_expression,
			is_tail_recursive, generate_events, is_tail_call, as_tail_call
		end

	XM_XPATH_ROLE
	
	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_TAIL_CALL

create

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_expression_not_replace: a_sequence_expression /= Void and then not a_sequence_expression.was_expression_replaced 
			action_not_replaced: an_action /= Void and then not an_action.was_expression_replaced
		do
			operator := Let_token
			set_declaration (a_range_variable)
			set_sequence (a_sequence_expression)
			replace_action (an_action)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			declaration_set: declaration = a_range_variable
			action_set: action_expression = an_action
			sequence_set: sequence = a_sequence_expression
		end

feature -- Access

	reference_count: INTEGER
			-- Estimate of number of references to `Current', set by `optimize'
		
	is_let_expression: BOOLEAN is
			-- Is `Current' a let expression?
		do
			Result := True
		end

	as_let_expression: XM_XPATH_LET_EXPRESSION is
			-- `Current' seen as a let expression
		do
			Result := Current
		end

	action: XM_XPATH_EXPRESSION is
			-- Action expression;
			-- Not 100% pure.
		do
			-- See `Note on action' at end of file.

			if not action_expression.is_error then action_expression.mark_unreplaced end
			Result := action_expression 
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := action_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create Result.make (sequence.item_type, sequence.cardinality)
		end

	is_tail_recursive: BOOLEAN is
			-- Is `Current' a tail recursive function call?
		do
			Result := action_expression.is_tail_recursive
		end

feature -- Status report

	is_tail_call: BOOLEAN is
			-- Is `Current' an XPath tail call?
		do
			Result := True
		end

	display (a_level: INTEGER) is
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
			action_expression.display (a_level + 1)
		end

feature -- Status setting

	mark_tail_function_calls is
			-- Mark tail-recursive calls on stylesheet functions.
		do
			action_expression.mark_tail_function_calls
		end

	  
feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			an_expression: XM_XPATH_EXPRESSION
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_type: XM_XPATH_ITEM_TYPE
			a_value: XM_XPATH_VALUE
		do
			mark_unreplaced
			if	declaration = Void then
				-- do nothing
			else
				if not simplified then simplify end

				-- The order of events is critical here. First we ensure that the type of the
				-- sequence expression is established. This is used to establish the type of the variable,
				-- which in turn is required when type-checking the action part.
				
				sequence.check_static_type (a_context, a_context_item_type)
				if sequence.is_error then
					set_last_error (sequence.error_value)
				else
					if sequence.was_expression_replaced then
						an_expression := sequence.replacement_expression
					else
						an_expression := sequence
					end
					create a_role.make (Variable_role, declaration.variable_name, 1, Xpath_errors_uri, "XPTY0004")
					create a_type_checker
					a_type_checker.static_type_check (a_context, an_expression, declaration.required_type, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error (a_type_checker.static_type_check_error)
					else
						set_sequence (a_type_checker.checked_expression)
					end
					if not is_error then
						a_type := sequence.item_type
						if sequence.is_value and then not sequence.depends_upon_implicit_timezone then a_value := sequence.as_value end
						
						-- Now set the static type of the binding reference, more accurately:
						
						declaration.refine_type_information (a_type, sequence.cardinalities, a_value, sequence.dependencies, sequence.special_properties)
						action_expression.check_static_type (a_context, a_context_item_type)
						if action_expression.was_expression_replaced then
							replace_action (action_expression.replacement_expression)
						end
						if action_expression.is_error then
							set_last_error (action_expression.error_value)
						end						
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			a_try_count: INTEGER
			optimized: BOOLEAN
		do
			mark_unreplaced
			if declaration /= Void then
				reference_count := declaration.reference_count (Current)
				if reference_count = 0 then
					
					-- variable is not used - no need to evaluate it
					
					set_replacement (action_expression)
					optimized := True
				end
				set_declaration_void
			end
			if not optimized then
				from
					a_try_count := 1; optimized := False
				until
					is_error or else optimized or else a_try_count > Maximum_optimization_attempts
				loop
					sequence.optimize (a_context, a_context_item_type)
					if sequence.was_expression_replaced then
						set_sequence (sequence.replacement_expression)
						reset_static_properties
						a_try_count := a_try_count + 1
					else
						optimized := true
					end
					if sequence.is_error then
						set_last_error (sequence.error_value)
					end
				end
				from
					a_try_count := 1; optimized := False
				until
					is_error or else optimized or else a_try_count > Maximum_optimization_attempts
				loop
					action_expression.optimize (a_context, a_context_item_type)
					if action_expression.was_expression_replaced then
						replace_action (action_expression.replacement_expression)
						reset_static_properties
						a_try_count := a_try_count + 1
					else
						optimized := true
					end
					if action_expression.is_error then
						set_last_error (action_expression.error_value)
					end
				end
			end			
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
			a_saved_binding_list, a_new_binding_list: DS_LIST [XM_XPATH_BINDING]
			a_cursor: DS_LIST_CURSOR [XM_XPATH_BINDING]
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else

				-- Pass the offer on to the sequence expression

				sequence.mark_unreplaced
				sequence.promote (an_offer)
				if sequence.was_expression_replaced then
					set_sequence (sequence.replacement_expression)
					reset_static_properties
				end
				
				if an_offer.action = Inline_variable_references	or else an_offer.action = Unordered
					or else an_offer.action = Replace_current then

					-- Pass the offer to the action expression only if the action isn't depending on the
               --  variable bound by this let expression
					
					action_expression.mark_unreplaced
					action_expression.promote (an_offer)
					if action_expression.was_expression_replaced then
						replace_action (action_expression.replacement_expression)
						reset_static_properties
					end
				elseif an_offer.action = Range_independent then

					-- Pass the offer to the action expression only if the action isn't depending on the
					--  variable bound by this let expression

					a_saved_binding_list := an_offer.binding_list
					create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} a_new_binding_list.make (a_saved_binding_list.count + 1)
					from a_cursor := an_offer.binding_list.new_cursor; a_cursor.start until a_cursor.after loop
						a_new_binding_list.put (a_cursor.item, a_cursor.index); a_cursor.forth
					end
					a_new_binding_list.put_last (Current)
					an_offer.set_binding_list (a_new_binding_list)
					action.promote (an_offer)
					if action.was_expression_replaced then
						replace_action (action.replacement_expression)
						reset_static_properties
					end
					an_offer.set_binding_list (a_saved_binding_list)
				end

				-- If this results in the expression (let $x := $y return Z), replace all references to
				-- to $x by references to $y in the Z part, and eliminate this LetExpression by
				-- returning the action part.

				if sequence.is_variable_reference then
					replace_variable (sequence.as_variable_reference)
					if action_expression.was_expression_replaced then
						set_replacement (action_expression.replacement_expression)
					else
						set_replacement (action_expression)
					end
					if replacement_expression.is_computed_expression then replacement_expression.as_computed_expression.reset_static_properties end
				end

				-- Similarly, for (let $x := lazy($y) return Z)

				if sequence.is_lazy_expression and then sequence.as_lazy_expression.base_expression.is_variable_reference then
					replace_variable (sequence.as_lazy_expression.base_expression.as_variable_reference)
					if action_expression.was_expression_replaced then
						set_replacement (action_expression.replacement_expression)
					else
						set_replacement (action_expression)
					end
					if replacement_expression.is_computed_expression then replacement_expression.as_computed_expression.reset_static_properties end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_value: XM_XPATH_VALUE
			l_finished: BOOLEAN
		do
						
			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				l_let_expression := Current
			until
				is_error or else l_finished
			loop
				l_let_expression.sequence.lazily_evaluate (a_context, l_let_expression.reference_count)
				l_value := l_let_expression.sequence.last_evaluation
				if l_value.is_error then
					set_last_error (l_value.error_value)
				else
					a_context.set_local_variable (l_value, l_let_expression.slot_number)
					if l_let_expression.action.is_let_expression then
						l_let_expression := l_let_expression.action.as_let_expression
					else
						l_finished := True
					end
				end
			end
			if is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (error_value))
			else
				l_let_expression.action.evaluate_item (a_result, a_context)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_value: XM_XPATH_VALUE
			finished: BOOLEAN
		do
						
			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				a_let_expression := current
			until
				is_error or else finished
			loop
				a_let_expression.sequence.lazily_evaluate (a_context, a_let_expression.reference_count)
				a_value := a_let_expression.sequence.last_evaluation
				if a_value.is_error then
					set_last_error (a_value.error_value)
				else
					a_context.set_local_variable (a_value, a_let_expression.slot_number)
					if a_let_expression.action.is_let_expression then
						a_let_expression := a_let_expression.action.as_let_expression
					else
						finished := True
					end
				end
			end
			if is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (error_value)
			else
				a_let_expression.action.create_iterator (a_context)
				last_iterator := a_let_expression.action.last_iterator
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a node sequence
		local
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_value: XM_XPATH_VALUE
			finished: BOOLEAN
		do
						
			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				a_let_expression := current
			until
				is_error or else finished
			loop
				a_let_expression.sequence.lazily_evaluate (a_context, a_let_expression.reference_count)
				a_value := a_let_expression.sequence.last_evaluation
				if a_value.is_error then
					set_last_error (a_value.error_value)
				else
					a_context.set_local_variable (a_value, a_let_expression.slot_number)
					if a_let_expression.action.is_let_expression then
						a_let_expression := a_let_expression.action.as_let_expression
					else
						finished := True
					end
				end
			end
			if is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (error_value)
			else
				a_let_expression.action.create_node_iterator (a_context)
				last_node_iterator := a_let_expression.action.last_node_iterator
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_value: XM_XPATH_VALUE
			finished: BOOLEAN
		do
						
			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				a_let_expression := current
			until
				is_error or a_context.is_process_error or finished
			loop
				a_let_expression.sequence.lazily_evaluate (a_context, a_let_expression.reference_count)
				a_value := a_let_expression.sequence.last_evaluation
				if a_value.is_error then
					set_last_error (a_value.error_value)
				else
					a_context.set_local_variable (a_value, a_let_expression.slot_number)
					if a_let_expression.action.is_let_expression then
						a_let_expression := a_let_expression.action.as_let_expression
					else
						finished := True
					end
				end
			end
			if a_context.is_process_error then
				-- do nothing
			elseif is_error then
				a_context.report_fatal_error (error_value)
			else
				a_let_expression.action.generate_events (a_context)
			end
		end

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_value: XM_XPATH_VALUE
			finished: BOOLEAN
		do
			
			--  Minimize stack consumption by evaluating nested LET expressions iteratively

			from
				a_let_expression := current
			until
				is_error or else finished
			loop
				a_let_expression.lazily_evaluate (a_context, a_let_expression.reference_count)
				a_value := a_let_expression.last_evaluation
				if a_value.is_error then
					set_last_error (a_value.error_value)
				else
					a_context.set_local_variable (a_value, a_let_expression.slot_number)
					if a_let_expression.action.is_let_expression then
						a_let_expression := a_let_expression.action.as_let_expression
					else
						finished := True
					end
				end
			end
			a_tail.put (Void)
			if is_error then
				a_context.report_fatal_error (error_value)
			else
				if a_let_expression.action.is_tail_call then
					a_let_expression.action.as_tail_call.generate_tail_call (a_tail, a_context)
				else
					a_let_expression.action.generate_events (a_context)
				end
			end
		end

feature -- Conversion

	as_tail_call: XM_XPATH_TAIL_CALL is
			-- `Current' seen as an XPath tail call
		do
			Result := Current
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (action_expression)
			if not sequence.non_creating then
				set_creating
			end
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (action_expression.cardinality)
		end

	Maximum_optimization_attempts: INTEGER is 5

	replace_variable (a_var_ref: XM_XPATH_VARIABLE_REFERENCE) is
			-- Replace `a_var_ref' with it's value.
		require
			reference_not_void: a_var_ref /= Void
		local
			l_binding_list: DS_LIST [XM_XPATH_BINDING]
			l_offer: XM_XPATH_PROMOTION_OFFER
		do
			create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} l_binding_list.make (1)
			l_binding_list.put (Current, 1)
			create l_offer.make (Inline_variable_references, l_binding_list, a_var_ref, False, False)
			action_expression.promote (l_offer)
			if l_offer.accepted_expression /= Void then
				replace_variable (a_var_ref)
			end
		end

invariant

	operator_is_let: operator = Let_token

end


-- Note on action:
--
-- The indirect reference to `action_expression' via `action' is there to get round
--  a problem with the expression replacement mechanism.
-- In order to keep to CQS, the `XM_XPATH_EXPRESSION' routines `simplify', `check_static_type', `optimize'
--  and `promote' set a `replacement_expression' via `set_replacement'. The callers
--  of these routines are supposed to test `was_expression_replaced', and take appropriate
--  action.
-- In order to check that replacements don't get lost (by callers forgetting to check for
--  `was_expression_replaced'), most of the routines within `XM_XPATH_EXPRESSION' specifically
--  require that `was_expression_replaced' is `False'.
-- In addition, the class `XM_XPATH_PROMOTION_ACTION' uses this mechanism to promote
--  expressions by replacing them with an `XM_XPATH_LET_EXPRESSION'. As part of the promotion,
--  the class to be replaced becomes the `action_expression' of the `XM_XPATH_LET_EXPRESSION'.
-- Now if this were to directly become an `action' attribute, then the `action' routine would
--  always be marked as replaced, and so the pre-condition in the routines of `XM_XPATH_EXPRESSION'
--  would fail. So instead, `action_expression' is wrapped in `action', which turns off the
--  replacement marker.
-- So when the `action' of a `XM_XPATH_LET_EXPRESSION' is referred to, the replacement status
--  is always off. But it remains on until this happens, so that calling routines have a chance
--  to see it.
