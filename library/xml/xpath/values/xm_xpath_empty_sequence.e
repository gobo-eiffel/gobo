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
			item_type, display, evaluate_as_string, effective_boolean_value, is_convertible_to_item
		end

creation

	make

feature {NONE} -- Initialization

	make is
		do
			make_value
			set_cardinality_empty
			set_ordered_nodeset
			set_context_document_nodeset
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := empty_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
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

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		do
			Result := False
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "()"))
			if is_error then
				std.error.put_string (" in error%N")
			else			
				std.error.put_new_line
			end
		end

feature -- Evaluation

	effective_boolean_value (context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value of the expression
		do
			create Result.make (False)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		do
			create last_evaluated_string.make ("")
		end

end
