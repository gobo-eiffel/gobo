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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_xml_prefix: STRING
			l_uri_code: INTEGER
			l_element: XM_XPATH_ELEMENT
		do
			arguments.item (2).evaluate_item (a_result, a_context)
			if not a_result.item.is_error then
				if a_result.item.is_element then
					l_element := a_result.item.as_element
					a_result.put (Void)
					arguments.item (1).evaluate_item (a_result, a_context)
					if not a_result.item.is_error then
						l_xml_prefix := a_result.item.string_value
						a_result.put (Void)
						l_uri_code := l_element.uri_code_for_prefix (l_xml_prefix)
						if shared_name_pool.is_valid_uri_code (l_uri_code) then
							a_result.put (create {XM_XPATH_STRING_VALUE}.make (shared_name_pool.uri_from_uri_code (l_uri_code)))
						end
					end
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument is not an element", Xpath_errors_uri, "FORG0006", Dynamic_error))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
