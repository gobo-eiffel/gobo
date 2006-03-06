indexing

	description:

		"Objects that implement the XPath doc() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOC

inherit

	XM_XPATH_DOC_ROUTINES

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_arguments, pre_evaluate, compute_special_properties
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "doc"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Doc_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := document_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_uri_item: XM_XPATH_ITEM
			an_iri_reference: STRING
			a_uri: UT_URI
		do
			arguments.item (1).evaluate_item (a_context)
			a_uri_item := arguments.item (1).last_evaluated_item
			if a_uri_item = Void or else a_uri_item.is_error then
				last_evaluated_item := a_uri_item
			else
				an_iri_reference := escaped_uri (a_uri_item.string_value)
				create a_uri.make_resolve (base_uri, an_iri_reference)
				parse_document (a_uri_item.string_value, base_uri, a_context)
				last_evaluated_item := last_evaluated_document
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- do_nothing
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
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
			set_peer_nodeset
			set_ordered_nodeset
			set_non_creating
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			base_uri := a_context.base_uri
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI from static context

end
	
