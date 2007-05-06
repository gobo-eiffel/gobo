indexing

	description:

		"XPath empty sequences"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY_SEQUENCE

inherit

	XM_XPATH_SEQUENCE_VALUE
		redefine
			item_type, display, evaluate_as_string, calculate_effective_boolean_value,
			is_convertible_to_item, is_empty_sequence, as_empty_sequence, count
		end

create

	make

feature {NONE} -- Initialization

	make is
		do
			make_value
			set_cardinality_empty
			set_ordered_nodeset
			set_context_document_nodeset
			set_single_document_nodeset
		end

feature -- Access

	is_empty_sequence: BOOLEAN is
			-- Is `Current' an empty sequence?
		do
			Result := True
		end

	as_empty_sequence: XM_XPATH_EMPTY_SEQUENCE is
			-- `Current' seen as an empty_sequence
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := empty_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end
	
	count: INTEGER is
			-- Number of items in `Current'
		do
			Result := 0
		end


feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_empty_sequence
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
			std.error.put_new_line
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value of the expression
		do
			create last_boolean_value.make (False)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		do
			create last_evaluated_string.make ("")
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Yields an iterator to iterate over the values of a sequence
		do
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate
		end

end
