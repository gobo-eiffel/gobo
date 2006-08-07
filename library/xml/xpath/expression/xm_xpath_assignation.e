indexing

	description:

		"Range variable assignations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ASSIGNATION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, sub_expressions, allocate_slots, promote,
			is_assignation, as_assignation
		end
	
	XM_XPATH_BINDING

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_TOKENS

	XM_XPATH_CARDINALITY

feature -- Access

	operator: INTEGER
			-- "let", "for", "some" or "every" operator

	sequence: XM_XPATH_EXPRESSION
			-- Sequence expression

	action: XM_XPATH_EXPRESSION is
			-- Action expression
		do
			Result := action_expression -- See XM_XPATH_LET_EXPRESSION for an explanation
		end

	declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

	slot_number: INTEGER
			-- Slot number for range variable

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (sequence, 1)
			Result.put (action, 2)
		end

	is_assignation: BOOLEAN is
			-- Is `Current' a assignation?
		do
			Result := True
		end

	as_assignation: XM_XPATH_ASSIGNATION is
			-- `Current' seen as a assignation
		do
			Result := Current
		end

feature -- Status report

		is_global: BOOLEAN is
			-- Is binding global or local?
		do
			Result := False
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			if declaration /= Void then
				simplified := True
				sequence.simplify
				if sequence.is_error then
					set_last_error (sequence.error_value)
				else
					if sequence.was_expression_replaced then
						set_sequence (sequence.replacement_expression)
					end
					action_expression.simplify
					if action_expression.is_error then
						set_last_error (action_expression.error_value)
					elseif action_expression.was_expression_replaced then
						set_action (action_expression.replacement_expression)
					else
						set_action (action_expression) -- this fixes up references on the declaration
					end
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
			a_cursor: DS_LIST_CURSOR [XM_XPATH_BINDING]
			a_saved_binding_list, a_new_binding_list: DS_LIST [XM_XPATH_BINDING]
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				sequence.promote (an_offer)
				if sequence.was_expression_replaced then
					set_sequence (sequence.replacement_expression)
					reset_static_properties
				end
				if an_offer.action = Inline_variable_references or else an_offer.action = Unordered
					or else an_offer.action = Replace_current then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					-- them to say we are interested in subexpressions that don't depend on either the
					-- outer context or the inner context.
					
					action_expression.promote (an_offer)
					if action_expression.was_expression_replaced then
						replace_action (action_expression.replacement_expression)
						reset_static_properties
					end
				elseif an_offer.action = Range_independent then

					-- Pass the offer to the action expression only if the action isn't dependent on the
					--  variable bound by this assignation

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
			end
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate variable
		do
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
			if last_evaluated_binding.is_memo_closure
				and then last_evaluated_binding.as_memo_closure.is_all_read then
				a_context.set_local_variable (last_evaluated_binding.as_memo_closure.materialized, slot_number)
			end
		end

feature -- Element change

	allocate_slots (next_free_slot: INTEGER; a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Allocate slot numbers for all range variable in `Current' and it's sub-expresions.
		do
			set_slot_number (next_free_slot)
			if a_slot_manager /= Void then
				a_slot_manager.allocate_slot_number (variable_name)
			end
			Precursor (next_free_slot + 1, a_slot_manager)
		end

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence.
		require
			sequence_not_void: a_sequence /= Void
		do
			sequence := a_sequence
			if sequence.was_expression_replaced then sequence.mark_unreplaced end
			adopt_child_expression (sequence)
		ensure
			sequence_set: sequence = a_sequence
			sequence_not_marked_for_replacement: not sequence.was_expression_replaced
		end

	replace_action (an_action: XM_XPATH_EXPRESSION) is
			-- Set `action'.
		require
			action_not_void: an_action /= Void
		do
			action_expression := an_action
			adopt_child_expression (action_expression)
		ensure
			action_set: action_expression = an_action
			action_not_marked_for_replacement: not action_expression.was_expression_replaced
		end

	set_action (an_action: XM_XPATH_EXPRESSION) is
			-- Set `action'.
		require
			action_not_void: an_action /= Void
			declaration_not_void: declaration /= Void
		do
			replace_action (an_action)
			declaration.fix_up_references (Current)
		ensure
			action_set: action_expression = an_action
		end

	set_declaration (a_declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION) is
			-- Set `declaration'.
		require
			dclaration_is_void: declaration = Void
			new_declaration_not_void: a_declaration /= Void
		do
			declaration := a_declaration
			variable_name := declaration.variable_name
		ensure
			declaration_set: declaration = a_declaration
			name_not_void: variable_name /= Void
		end

	set_declaration_void is
			-- Set `declaration' to `Void'.
		require
			declaration_not_void: declaration /= Void
		do
			declaration := Void
		ensure
			declaration_void: declaration = Void
		end

	set_slot_number (a_slot_number: INTEGER) is
			-- Set `slot_number.
		require
			strictly_positive_slot_number: a_slot_number > 0
		do
			slot_number := a_slot_number
		ensure
			slot_number_set: slot_number = a_slot_number
		end

feature {XM_XPATH_ASSIGNATION} -- Local

	simplified: BOOLEAN
			-- Has simplify been run?

	action_expression: XM_XPATH_EXPRESSION
			-- Underlying action

invariant

	valid_operator: operator = For_token or operator = Some_token or operator = Every_token or operator = Let_token
	sequence_not_void: initialized implies sequence /= Void
	action_not_void: initialized implies action /= Void
	
end
