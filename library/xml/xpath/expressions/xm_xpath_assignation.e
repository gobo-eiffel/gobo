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
			may_analyze, simplify, promote, sub_expressions
		end
	
	XM_XPATH_BINDING

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_TOKENS

	XM_XPATH_CARDINALITY

feature -- Access

	operator: INTEGER
			-- "for", "some" or "every" operator

	analyzed: BOOLEAN
			-- Has `analyze' been called?
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (sequence, 1)
			Result.put (action, 2)
		end

feature -- Status report
	
	may_analyze: BOOLEAN is
			-- OK to call `analyze'?
		do
			Result := declaration /= Void
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression
		local
			a_simplified_assignation: XM_XPATH_ASSIGNATION
		do
			a_simplified_assignation := clone (Current)
			a_simplified_assignation.set_sequence (sequence.simplify)
			a_simplified_assignation.set_action (action.simplify)
			Result := a_simplified_assignation
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			a_promotion := an_offer.accept (Current)
			if a_promotion /= Void then
				Result := a_promotion
			else
				sequence := sequence.promote (an_offer)
				if an_offer.action = Inline_variable_references or else an_offer.action = Unordered then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					-- them to say we are interested in subexpressions that don't depend on either the
					-- outer context or the inner context.
					
					action := action.promote (an_offer)
				end
				Result := Current
			end
		end

feature -- Evaluation

	evaluate (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Evaluate variable
		do
			Result := a_context.evaluate_local_variable (slot_number)
		end

feature -- Element change

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence.
		require
			sequence_not_void: a_sequence /= Void
		do
			sequence := a_sequence
		ensure
			sequence_set: sequence = a_sequence
		end

	set_action (an_action: XM_XPATH_EXPRESSION) is
			-- Set `action'.
		require
			action_not_void: an_action /= Void
		do
			action := an_action
		ensure
			action_set: action = an_action
		end

feature {XM_XPATH_ASSIGNATION} -- Local

	sequence: XM_XPATH_EXPRESSION
			-- Sequence expression

	action: XM_XPATH_EXPRESSION
			-- Action expression

	declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

	slot_number: INTEGER
			-- Slot number for range variable

invariant

	valid_operator: operator = For_token or Operator = Some_token or operator = Every_token
	sequence_not_void: sequence /= Void
	action_not_void: action /= Void
	declaration_not_void_until_analysis: not analyzed implies declaration /= Void
	declaration_void_after_analysis: analyzed implies declaration = Void

end
