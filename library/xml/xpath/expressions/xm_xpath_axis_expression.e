indexing

	description:

		"XPath Axis Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplified_expression, iterator, compute_intrinsic_dependencies, same_expression, compute_special_properties
		end

	XM_XPATH_AXIS

creation

	make

feature {NONE} -- Initialization

	make (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST) is
		require
			valid_axis_type: is_axis_valid (an_axis_type)
		do
			axis := an_axis_type
			node_test := a_node_test
			compute_static_properties
			initialize
		ensure
			axis_set: axis = an_axis_type
			node_test_set: node_test = a_node_test
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	axis: INTEGER
			-- Type of axis

	node_test: XM_XPATH_NODE_TEST
			-- Node test

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		local
			principal_axis: INTEGER
		do
			principal_axis := axis_principal_node_type (axis)
			if principal_axis = Attribute_node then
				Result := principal_axis
			elseif node_test = Void then
				Result := Any_node
			else
				Result := node_test.item_type
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			an_axis_expression: XM_XPATH_AXIS_EXPRESSION
		do
			an_axis_expression ?= other
			if an_axis_expression = Void then
				Result := False
			elseif axis /= an_axis_expression.axis then
				Result := False
			elseif node_test = Void and then an_axis_expression.node_test = Void then
				Result := True
			else
				Result := STRING_.same_string (node_test.original_text, an_axis_expression.node_test.original_text)
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string, test_string: STRING
		do
			if node_test = Void then
				test_string := "node()"
				debug ("XPath Axis Expression")
					std.error.put_string ("Axis expression: - no node-test present")
					std.error.put_new_line
				end
			else
				test_string := node_test.original_text
				debug ("XPath Axis Expression")
					std.error.put_string ("Axis expression: - test string is")
					std.error.put_string (test_string)
					std.error.put_new_line
				end
			end

			a_string := STRING_.appended_string (indentation (a_level), axis_name (axis))
			a_string := STRING_.appended_string (a_string, "::")
			a_string := STRING_.appended_string (a_string, test_string)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			create intrinsic_dependencies.make (1, 6)
			-- Now all are `False'
			intrinsic_dependencies.put (True, 2) -- Depends_upon_context_item
			are_intrinsic_dependencies_computed := True
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_name_test: XM_XPATH_NAME_TEST
			any_node_test: XM_XPATH_ANY_NODE_TEST
		do
			a_name_test ?= node_test
			any_node_test ?= node_test
			if axis = Attribute_axis and then a_name_test /= void then
				create {XM_XPATH_ATTRIBUTE_REFERENCE_EXPRESSION} Result.make (a_name_test.fingerprint)
			elseif axis = Parent_axis and then (node_test = Void or else any_node_test /= void) then
				create {XM_XPATH_PARENT_NODE_EXPRESSION} Result.make
			else
				Result := Current
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do

			-- Nothing to do

			set_analyzed
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			a_node: XM_XPATH_NODE
			an_item: XM_XPATH_ITEM
		do
			an_item := a_context.context_item
			if an_item = Void then
				create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("The context item for an axis step is not set.", 2, Dynamic_error)
			else
				a_node ?= an_item
				if a_node = Void then
					create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("The context item for an axis is not a node.", 20, Type_error)
				elseif node_test = Void then
					Result := a_node.new_axis_iterator (axis)
				else
					Result := a_node.new_axis_iterator_with_node_test (axis, node_test)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

	compute_special_properties is
			-- Compute special properties.
		do
			create special_properties.make (1, 6)
			-- All `False' by default
			are_special_properties_computed := True
			set_context_document_nodeset
			if is_forward_axis (axis) then
				set_ordered_nodeset
			else
				set_reverse_document_order
			end
			if is_peer_axis (axis) then
				set_peer_nodeset
			end
			if is_subtree_axis (axis) then
				set_subtree_nodeset
			end
			if axis = Attribute_axis then
				set_attribute_ns_nodeset
			end
		end	
end
