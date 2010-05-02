note

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

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_node
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		do
			Precursor (a_replacement)
			use_context_item_as_default
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void then
				if not a_result.item.is_error then
					if not a_result.item.is_node then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("The context item is not a node", Xpath_errors_uri, "FOTY0011", Dynamic_error))
					else
						a_result.put (a_result.item.as_node.root)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

	compute_special_properties
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

