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
			item_type, display, evaluate_as_string, effective_boolean_value
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

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		do
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
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

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indent (a_level), "()"))
			std.error.put_new_line
		end

feature -- Evaluation

	effective_boolean_value (context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value of the expression
		do
			create Result.make (False)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT): XM_XPATH_STRING_VALUE is
			-- Evaluate `Current' as a String
		do
			create Result.make ("")
		end

end
