indexing

	description:

		"XPath values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_VALUE

	-- A value is the result of an expression but it is also an expression in its own right;
	-- Note that every value can be regarded as a sequence - in many cases, a sequence of length one

inherit

	XM_XPATH_EXPRESSION

feature -- Access

	special_properties: INTEGER is
			-- Get the static properties of this expression (other than its type);
			-- The result is bit-signficant. These properties are used for optimizations.
			-- In general, if a property bit is set, it is true, but if it is unset, the value is unknown.
		do
			Result := 0
		end
		
	frozen dependencies: INTEGER is
			-- Determine which aspects of the context the expression depends on;
			-- The result is a bitwise-or'ed value composed from constants
			-- such as XPath context variables.and XPath context current_node.
			-- The default implementation combines the intrinsic
			-- dependencies of this expression with the dependencies of the subexpressions,
			-- computed recursively. This is overridden for expressions such as Filter Expression
			-- where a subexpression's dependencies are not necessarily inherited by the parent expression.
		do
			Result := 0
		end

	frozen sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make_default
		end

feature -- Analysis

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
			-- The default implementation does nothing.
		do
			Result := Current
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
		do
			Result := Current
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
			-- The offer will be accepted if the subexpression is not dependent on
			-- the factors (e.g. the context item) identified in the PromotionOffer.
			-- By default the offer is not accepted - this is appropriate in the case of simple expressions
			-- such as constant values and variable references where promotion would give no performance
			-- advantage. This method is always called at compile time.
		do
			Result := Current
		end

end


