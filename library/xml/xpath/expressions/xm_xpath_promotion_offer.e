indexing

	description:

		"Promotion offer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROMOTION_OFFER

	-- `XM_XPATH_PROMOTION_OFFER' is an object used transiently during compilation of an expression. It contains
	-- information passed by a containing expression to its subexpressions, when looking for subexpressions
	-- that can be promoted to a higher level because they are not dependent on the context established
	-- by the containing expression. The object is also used to pass back return information when the
	-- promotion actually takes place.

inherit

	XM_XPATH_PROMOTION_ACTIONS
	
feature -- Access

	action: INTEGER
			-- Promotion action

	accept (child: XM_XPATH_EXPRESSION): XM_XPATH_EXPRESSION is
			-- Test whether a subexpression qualifies for promotion, and if so, accept the promotion
		require
			sub_expression_not_void: child /= Void
		do
			-- TODO
			Result := child -- TODO - change this
		end
end
	
