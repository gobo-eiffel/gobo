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

feature -- Access

	operator: INTEGER
			-- "for", "some" or "every" operator

	analyzed: BOOLEAN
			-- Has `analyze' been called?
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			-- Default implementation returns an empty list;
			-- Suitable for an expression without sub-expressions.
			
			create Result.make_equal (2)
			Result.put (sequence, 1)
			Result.put (action, 2)
		end

feature -- Status report

	
	may_analyze: BOOLEAN is
			-- OK to call analyze?
		do
			Result := declaration /= Void
		end
	
feature -- Analysis

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
		local
			simplified: XM_XPATH_ASSIGNATION
		do
			simplified := clone (Current)
			simplified.set_sequence (sequence.simplify)
			simplified.set_action (action.simplify)
			Result := simplified
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
			-- The offer will be accepted if the subexpression is not dependent on
			-- the factors (e.g. the context item) identified in the PromotionOffer.
			-- By default the offer is not accepted - this is appropriate in the case of simple expressions
			-- such as constant values and variable references where promotion would give no performance
			-- advantage. This method is always called at compile time.
		local
			promotion: XM_XPATH_EXPRESSION
		do
			promotion := offer.accept (Current)
			if promotion /= Void then
				Result := promotion
			else
				sequence := sequence.promote (offer)
				if offer.action = Inline_variable_references or else offer.action = Unordered then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					-- them to say we are interested in subexpressions that don't depend on either the
					-- outer context or the inner context.
					
					action := action.promote (offer)
				end
				Result := Current
			end
		end

feature -- Element change

	set_sequence (seq: XM_XPATH_EXPRESSION) is
			-- Set `sequence' to `seq'.
		require
			sequence_not_void: seq /= Void
		do
			sequence := seq
		ensure
			sequence_set: sequence = seq
		end

	set_action (act: XM_XPATH_EXPRESSION) is
			-- Set `action' to `act'.
		require
			action_not_void: act /= Void
		do
			action := act
		ensure
			action_set: action = act
		end

feature {XM_XPATH_ASSIGNATION} -- Implementation

	sequence: XM_XPATH_EXPRESSION
			-- Sequence expression

	action: XM_XPATH_EXPRESSION
			-- Action expression

	declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

invariant

	valid_operator: operator = For_token or Operator = Some_token or operator = Every_token
	sequence_not_void: sequence /= Void
	action_not_void: action /= Void
	declaration_not_void_until_analysis: not analyzed implies declaration /= Void
	declaration_void_after_analysis: analyzed implies declaration = Void

end
