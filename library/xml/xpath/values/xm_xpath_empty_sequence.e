indexing

	description:

		"XPath empty sequences"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY_SEQUENCE

inherit

	XM_XPATH_SEQUENCE_VALUE
		redefine
			item_type
		end

creation

	make

feature {NONE} -- Initialization

	make is
		do
			do_nothing
		end

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Empty_item
		end

	iterator (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		do
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
		end

	effective_boolean_value (context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value of the expression
		do
			Result := False
		end

feature -- Evaluation

	evaluate_as_string (context: XM_XPATH_CONTEXT): STRING is
			-- Evaluate an expression as a String
			-- This function must only be called in contexts where it is known
			-- that the expression will return a single string (or where an empty sequence
			-- is to be treated as a zero-length string). Implementations should not attempt to convert
			-- the result to a string, other than converting () to "". This routine is used mainly to
			-- evaluate expressions produced by compiling an attribute value template.
		do
			Result := ""
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other2: XM_XPATH_EMPTY_SEQUENCE
		do
			other2 ?= other
			Result := other2 /= Void
		end

end
