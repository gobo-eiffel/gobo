indexing

	description:

		"XPath if expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IF_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, evaluate_item, promote, iterator, sub_expressions
		end

creation

	make

feature {NONE} -- Initialization

	make (con_exp: XM_XPATH_EXPRESSION; then_exp: XM_XPATH_EXPRESSION; else_exp: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
				condition_not_void: con_exp /= Void
				else_not_void: else_exp /= Void
				then_not_void: then_exp /= Void
		do
			set_condition (con_exp)
			set_else_expression (else_exp)
			set_then_expression (then_exp)
		ensure
				condition_set: condition = con_exp
				else_set: else_expression = else_exp
				then_set: then_expression = then_exp
		end

feature -- Access

	condition: XM_XPATH_EXPRESSION
			-- Conditional clause

	else_expression: XM_XPATH_EXPRESSION
			-- Else clause
	
	then_expression: XM_XPATH_EXPRESSION
			-- Then clause
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			Result := common_super_type (then_expression.item_type, else_expression.item_type)
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (3)
			Result.set_equality_tester (expression_tester)
			Result.put (condition, 1)
			Result.put (then_expression, 2)
			Result.put (else_expression, 3)
		end

	iterator (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		do
			if condition.effective_boolean_value (context) then
				Result := then_expression.iterator (context)
			else
				Result := else_expression.iterator (context)
			end
		end

feature -- Analysis

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
			-- The default implementation does nothing.
		local
			a_value: XM_XPATH_VALUE
			an_expression: XM_XPATH_IF_EXPRESSION
		do
			an_expression := clone (Current)
			an_expression.set_condition (condition.simplify)
			a_value ?= condition
			if a_value /= Void then
				if condition.effective_boolean_value (Void) then
					an_expression.set_then_expression (then_expression.simplify)
				else
					an_expression.set_else_expression (else_expression.simplify)
				end
			else
				an_expression.set_then_expression (then_expression.simplify)
				an_expression.set_else_expression (else_expression.simplify)
			end
			Result := an_expression
		end

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		local
			an_expression: XM_XPATH_IF_EXPRESSION
		do
			an_expression := clone (Current)
			an_expression.set_condition (condition.analyze (env))
			an_expression.set_then_expression (then_expression.analyze (env))
			an_expression.set_else_expression (else_expression.analyze (env))
			Result := an_expression.simplify
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
			-- The offer will be accepted if the subexpression is not dependent on
			-- the factors (e.g. the context item) identified in the PromotionOffer.
			-- By default the offer is not accepted - this is appropriate in the case of simple expressions
			-- such as constant values and variable references where promotion would give no performance
			-- advantage. This method is always called at compile time.
		local
			an_expression: XM_XPATH_IF_EXPRESSION
		do
			an_expression ?= offer.accept (Current)
				check
					an_expression_not_void: an_expression /= Void
				end
			if an_expression = Current then -- not accepted
				an_expression := clone (Current)
				an_expression.set_condition (condition.promote (offer))
				if offer.action = Unordered or else offer.action = Inline_variable_references then
					an_expression.set_then_expression (then_expression.promote (offer))
					an_expression.set_else_expression (else_expression.promote (offer))
				end
			end
			Result := an_expression
		end

feature -- Evaluation

	evaluate_item (context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item;
			-- This always returns either a single Item or Void
			-- (denoting the empty sequence). No conversion is done. This method should not be
			-- used unless the static type of the expression is a subtype of "item" or "item?": that is,
			-- it should not be called if the expression may return a sequence. There is no guarantee that
			-- this condition will be detected.
		do
			if condition.effective_boolean_value (context) then
				Result := then_expression.evaluate_item (context)
			else
				Result := else_expression.evaluate_item (context)
			end
		end

feature -- Element change

	set_condition (cond: XM_XPATH_EXPRESSION) is
			-- Set `condition'.
		require
			condition_not_void: cond /= Void
		do
			condition := cond
		ensure
			condition_set: condition = cond
		end

	set_then_expression (then_exp: XM_XPATH_EXPRESSION) is
			-- Set `then_expression'.
		require
			then_not_void: then_exp /= Void
		do
			then_expression := then_exp
		ensure
			then_set: then_expression = then_exp
		end

	set_else_expression (else_exp: XM_XPATH_EXPRESSION) is
			-- Set `else_expression'.
		require
			else_not_void: else_exp /= Void
		do
			else_expression := else_exp
		ensure
			else_set: else_expression = else_exp
		end	

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end
	
invariant

	condition_not_void: condition /= Void
	else_not_void: else_expression /= Void
	then_not_void: then_expression /= Void

end

	
