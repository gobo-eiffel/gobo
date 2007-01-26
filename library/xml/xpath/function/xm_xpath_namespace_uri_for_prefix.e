indexing

	description:

		"Objects that implement the XPath namespace-uri-for-prefix() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMESPACE_URI_FOR_PREFIX

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "namespace-uri-for-prefix"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Namespace_uri_for_prefix_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		local
			an_element_test: XM_XPATH_NODE_KIND_TEST
		do
			if argument_number = 1 then
				create Result.make_single_string
			else -- 2
				create an_element_test.make_element_test
				create Result.make (an_element_test, Required_cardinality_exactly_one)
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			an_xml_prefix: STRING
			a_uri_code: INTEGER
		do
			last_evaluated_item := Void
			arguments.item (2).evaluate_item (a_context)
			an_item := arguments.item (2).last_evaluated_item 
			if not an_item.is_error then
				if an_item.is_element then
					arguments.item (1).evaluate_item (a_context)
					if arguments.item (1).last_evaluated_item.is_error then
						last_evaluated_item := arguments.item (1).last_evaluated_item
					else
						an_xml_prefix := arguments.item (1).last_evaluated_item.string_value
						a_uri_code := an_item.as_element.uri_code_for_prefix (an_xml_prefix)
						if shared_name_pool.is_valid_uri_code (a_uri_code) then
							create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (shared_name_pool.uri_from_uri_code (a_uri_code))
						end
					end
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Second argument is not an element", Xpath_errors_uri, "FORG0006", Dynamic_error)
				end
			else
				last_evaluated_item := an_item
			end
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
			set_cardinality_exactly_one
		end

end
	
