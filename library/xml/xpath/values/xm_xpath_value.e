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
	
end


