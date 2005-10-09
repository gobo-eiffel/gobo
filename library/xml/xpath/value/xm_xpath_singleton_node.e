indexing

	description:

		"Sequences of zero or one nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_NODE

inherit
	
	XM_XPATH_VALUE
		redefine
			process, is_singleton_node, as_singleton_node, count,
			item_at, calculate_effective_boolean_value 
		end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_node: XM_XPATH_NODE) is
			-- Create `Current'.
		do
			make_value
			node := a_node
			if node = Void then
				set_cardinality_empty
			else
				set_cardinality_exactly_one
			end
			set_ordered_nodeset
		ensure
			set: node = a_node
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_singleton_node: BOOLEAN is
			-- Is `Current' a singleton node?
		do
			Result := True
		end

	as_singleton_node: XM_XPATH_SINGLETON_NODE is
			-- `Current' seen as a singleton node
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end
	
	node: XM_XPATH_NODE
			-- Optional node

	
	count: INTEGER is
			-- Number of items in `Current'
		do
			if node = Void then
				Result := 0
			else
				Result := 1
			end
		end

	item_at (an_index: INTEGER) :XM_XPATH_ITEM is
			-- Item at `an_index'
		do
			Result := node
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if	not other.is_singleton_node then
				Result := False
			else
				Result := node.is_same_node (other.as_singleton_node.node)
			end
		end

feature -- Status report

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
				std.error.put_string (indentation (a_level))
			if node = Void then
				std.error.put_string ("Empty node-set")
			else
				std.error.put_string ("Node ")
				std.error.put_string (node.path)
			end
			std.error.put_new_line
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value;
		do
			create last_boolean_value.make (node /= Void)
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			last_evaluated_item := node
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String
		do
			if node = Void then
				create last_evaluated_string.make ("")
			else
				create last_evaluated_string.make (node.string_value)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (node)
		end

	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			if node /= Void then
				a_context.current_receiver.append_item (node)
			end
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		do
			Result := node
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate_item
		end
	
end
