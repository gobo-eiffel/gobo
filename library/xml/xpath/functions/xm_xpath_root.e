indexing

	description:

		"Objects that implement the XPath root() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROOT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item, compute_special_properties
		end

	XM_XPATH_SHARED_ANY_NODE_TEST

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "root"
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_node
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			if arguments.count = 0 or else arguments.item (1).context_document_nodeset then
				set_context_document_nodeset
			end
			Precursor
			add_context_document_argument (0, "root+")
			simplify_arguments
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
		do
			last_evaluated_item := Void
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item /= Void then
				if an_item.is_error then
					last_evaluated_item := an_item
				else
					a_node ?= an_item
					if a_node = Void then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not a node", Xpath_errors_uri, "FOTY0011", Dynamic_error)
					else
						last_evaluated_item := a_node.root
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_ordered_nodeset
		end

end
	
