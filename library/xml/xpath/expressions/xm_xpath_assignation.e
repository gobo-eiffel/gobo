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
			simplify, sub_expressions, allocate_slots, promote
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

	action: XM_XPATH_EXPRESSION
			-- Action expression

	declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (sequence, 1)
			Result.put (action, 2)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			if declaration /= Void then
				sequence.simplify
				if sequence.is_error then
					set_last_error (sequence.error_value)
				else
					if sequence.was_expression_replaced then
						set_sequence (sequence.replacement_expression)
					end
					action.simplify
					if action.is_error then
						set_last_error (action.error_value)
					elseif action.was_expression_replaced then
						set_action (action.replacement_expression)
					else
						set_action (action) -- this fixes up references on the declaration
					end
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				sequence.promote (an_offer)
				if sequence.was_expression_replaced then set_sequence (sequence.replacement_expression) end
				if an_offer.action = Inline_variable_references or else an_offer.action = Unordered then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					-- them to say we are interested in subexpressions that don't depend on either the
					-- outer context or the inner context.
					
					action.promote (an_offer)
					if action.was_expression_replaced then replace_action (action.replacement_expression) end
				end
			end
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate variable
		do
				check
					valid_slot_number: a_context.is_valid_local_variable (slot_number)
				end
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
		end

feature -- Element change

	allocate_slots (next_free_slot: INTEGER) is
			-- Allocate slot numbers for all range variable in `Current' and it's sub-expresions.
		do
			set_slot_number (next_free_slot)
			Precursor (next_free_slot + 1)
		end

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence.
		require
			sequence_not_void: a_sequence /= Void
		do
			sequence := a_sequence
			if sequence.was_expression_replaced then sequence.mark_unreplaced end
		ensure
			sequence_set: sequence = a_sequence
			sequence_not_marked_for_replacement: not sequence.was_expression_replaced
		end

	replace_action (an_action: XM_XPATH_EXPRESSION) is
			-- Set `action'.
		require
			action_not_void: an_action /= Void
		do
			action := an_action
			if action.was_expression_replaced then action.mark_unreplaced end
		ensure
			action_set: action = an_action
			action_not_marked_for_replacement: not action.was_expression_replaced
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
			action_set: action = an_action
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

	slot_number: INTEGER
			-- Slot number for range variable

invariant

	valid_operator: operator = For_token or operator = Some_token or operator = Every_token or operator = Let_token
	sequence_not_void: sequence /= Void
	action_not_void: action /= Void
	
end
