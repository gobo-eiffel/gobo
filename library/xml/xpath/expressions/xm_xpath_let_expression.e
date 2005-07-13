indexing

	description:

	"Objects that implement an XQuery let expression: let $x := expr return expr.%
	%Used internally by XPath for optimizing the expression tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LET_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			promote, create_iterator, evaluate_item, compute_special_properties,
			mark_tail_function_calls, action, is_let_expression, as_let_expression,
			is_tail_recursive
		end

	XM_XPATH_ROLE
	
	XM_XPATH_PROMOTION_ACTIONS

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

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "let $")
			a_string := STRING_.appended_string (a_string, variable_name)
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "return")
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

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions;
		local
			an_expression: XM_XPATH_EXPRESSION
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_type: XM_XPATH_ITEM_TYPE
			a_value: XM_XPATH_VALUE
			a_reference_count: INTEGER
		do
			mark_unreplaced
			if	declaration = Void then
				-- do nothing
			else

				if not simplified then simplify end

				-- The order of events is critical here. First we ensure that the type of the
				-- sequence expression is established. This is used to establish the type of the variable,
				-- which in turn is required when type-checking the action part.
				
				sequence.analyze (a_context)
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
				end
			
				if not is_error then
					a_type := sequence.item_type
					if sequence.is_value then a_value := sequence.as_value end
					
					-- Now set the static type of the binding reference, more accurately:
					
					declaration.refine_type_information (a_type, sequence.cardinalities, a_value, sequence.dependencies, sequence.special_properties)
					
					action_expression.analyze (a_context)
					if action_expression.was_expression_replaced then
						replace_action (action_expression.replacement_expression)
					end
					if action_expression.is_error then
						set_last_error (action_expression.error_value)
					end
					a_reference_count := declaration.reference_count (Current)
					if a_reference_count = 0 then
						
						-- variable is not used - no need to evaluate it
						
						set_replacement (action_expression)
					elseif a_reference_count = 1 then
						keep_value := False
					else
						keep_value := True
					end
					set_declaration_void 
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
			another_offer: XM_XPATH_PROMOTION_OFFER
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else

				-- Pass the offer on to the sequence expression

				sequence.mark_unreplaced
				sequence.promote (an_offer)
				if sequence.was_expression_replaced then set_sequence (sequence.replacement_expression) end
				
				if an_offer.action = Inline_variable_references	or else an_offer.action = Unordered then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					action_expression.mark_unreplaced
					action_expression.promote (an_offer)
					if action_expression.was_expression_replaced then replace_action (action_expression.replacement_expression) end
				end

				-- If this results in the expression (let $x := $y return Z), replace all references to
				-- to $x by references to $y in the Z part, and eliminate this LetExpression by
				-- returning the action part.

				if sequence.is_variable_reference then
					create another_offer.make (Inline_variable_references, Current, sequence.as_variable_reference, False, False)
					action_expression.promote (another_offer)
					if action_expression.was_expression_replaced then
						set_replacement (action_expression.replacement_expression)
					else
						set_replacement (action_expression)
					end
				end
			end
		end


feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			sequence.lazily_evaluate (a_context, keep_value)
			if slot_number = 0 then
				set_slot_number (a_context.next_available_slot)
			end
			a_context.set_local_variable (sequence.last_evaluation, slot_number)
			action.evaluate_item (a_context)
			last_evaluated_item := action.last_evaluated_item
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			sequence.lazily_evaluate (a_context, keep_value)
			if slot_number = 0 then
				set_slot_number (a_context.next_available_slot)
			end
			a_context.set_local_variable (sequence.last_evaluation, slot_number)
			action.create_iterator (a_context)
			last_iterator := action.last_iterator
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (action_expression)
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (action_expression.cardinality)
		end

	keep_value: BOOLEAN
			-- Set by `analyze' if the expression will be read more than once

invariant

	operator_is_let: operator = Let_token

end


-- Note on action:
--
-- The indirect reference to `action_expression' via `action' is there to get round
--  a problem with the expression replacement mechanism.
-- In order to keep to CQS, the `XM_XPATH_EXPRESSION' routines `simplify', `analyze'
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
