indexing

	description:

	"Objects that handle many-to-many A less-than B comparisons%
	%by evaluating min(A) < max (B) and similarly for greater-than, etc.%
	%This expression is only used where it is known that the comparisons%
	%will all be numeric: that is, where at least one of the operands has%
	%a static type that is a numeric sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MINIMAX_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
	
creation

	make

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Boolean_type
		end

end
	
