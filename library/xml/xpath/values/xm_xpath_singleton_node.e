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

creation

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
			are_cardinalities_computed := True
			set_ordered_nodeset
			are_special_properties_computed := True
		ensure
			set: node = a_node
			cardinalities_computed: are_cardinalities_computed = True
			special_properties_computed: are_special_properties_computed = True
		end

feature -- Access

	item_type: INTEGER is
			--Determine the data type, if possible;
		do
			Result := Any_node
		end

	
	node: XM_XPATH_NODE
			-- Optional node

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (node)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_singleton_node: XM_XPATH_SINGLETON_NODE
		do
			a_singleton_node ?= other
			if	a_singleton_node = Void then
				Result := False
			else
				Result := node.is_same_node (a_singleton_node.node)
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
				std.error.put_string (indent (a_level))
			if node = Void then
				std.error.put_string ("Empty node-set")
			else
				std.error.put_string ("Node ")
				-- TODO add navigator stuff
			end
			std.error.put_new_line
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value;
		do
			create Result.make (node /= Void)
		end

	evaluated_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate as a single item
		do
			Result := node
		end

	evaluated_string (a_context: XM_XPATH_CONTEXT): XM_XPATH_STRING_VALUE is
			-- Evaluate as a String
		do
			if node = Void then
				create Result.make ("")
			else
				create Result.make (node.string_value)
			end
		end

feature {NONE} -- Implementation
	
end
