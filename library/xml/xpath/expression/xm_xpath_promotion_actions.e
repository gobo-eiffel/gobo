indexing

	description:

		"Promotion actions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROMOTION_ACTIONS

feature -- Access

	Focus_independent: INTEGER is 10
			-- Requests promotion of all non-trivial subexpressions that don't depend on the focus;
			-- This is typically used to extract subexpressions from a filter predicate.
			-- The offer is optional - each subexpression can decide whether it's worth the trouble of promoting itself.
			-- The offer is normally passed on to subexpressions, except subexpressions that are evaluated with a different focus.

	Range_independent: INTEGER is 11
			-- Requests promotion of all non-trivial subexpressions that don't depend on a specified range variable;
			-- This is typically used to extract subexpressions from the action of
			--  a for expression or the condition of a some/every quantified expression.
			-- The offer is optional - each subexpression can decide whether it's worth the trouble of promoting itself.
			-- The offer is normally passed on to subexpressions, except subexpressions that are evaluated
			--  with a different focus or a different range variable, because these may have other dependencies
			--  that prevent their promotion.

	Inline_variable_references: INTEGER is 12
			-- Causes all references to a variable V to be replaced by the expression E;
			-- The variable is supplied in `binding';
			-- The replacement expression in `containing_expression'.

	Unordered: INTEGER is 13
			-- Indicates that the containing expression does not require the results
			--  to be delivered in any particular order. The boolean `must_eliminate_duplicates'
			--  is set if duplicate items in the result are not allowed.

	Replace_current: INTEGER is 14
			-- Causes calls to the XSLT current() function to be replaced by reference to a variable.

end
