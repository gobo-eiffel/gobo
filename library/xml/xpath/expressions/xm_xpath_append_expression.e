indexing

	description:

		"A concatenation of two XPath Expressions (comma operator)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_APPEND_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
	
	XM_XPATH_TOKENS
	
creation

	make

feature -- Access

	frozen item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			-- TODO
		end
end
	
