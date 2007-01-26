indexing

	description:

		"Objects that implement the XPath root() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROOT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item, compute_special_properties
		end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "root"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Root_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
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
			Precursor
			add_context_document_argument (0, "root+")
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
		do
			last_evaluated_item := Void
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item /= Void then
				if an_item.is_error then
					last_evaluated_item := an_item
				else
					if not an_item.is_node then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not a node", Xpath_errors_uri, "FOTY0011", Dynamic_error)
					else
						last_evaluated_item := an_item.as_node.root
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			todo ("create_node_iterator", False)
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
			set_single_document_nodeset
			set_non_creating
			if arguments.count = 0 or else arguments.item (1).context_document_nodeset then
				set_context_document_nodeset
			end

		end

end
	
