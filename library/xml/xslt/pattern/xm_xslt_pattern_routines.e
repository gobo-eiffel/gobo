indexing

	description:

		"Routines for XSLT pattern support"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PATTERN_ROUTINES

inherit

	ANY

	XM_XSLT_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XSLT_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature {NONE} -- Implementation

	xpath_to_xslt_node_test (a_xpath_node_test: XM_XPATH_NODE_TEST; a_context: XM_XPATH_STATIC_CONTEXT): XM_XSLT_NODE_TEST is
			-- XSLT node-test-pattern from XPath node-test
		require
			node_test_not_void: a_xpath_node_test /= Void
		do
			if a_xpath_node_test = any_node_test then
				Result := any_xslt_node_test
			elseif a_xpath_node_test = empty_item then
				Result := xslt_empty_item
			elseif a_xpath_node_test.is_combined_node_test then
				create {XM_XSLT_COMBINED_NODE_TEST} Result.make (a_context, a_xpath_node_test.as_combined_node_test.node_test_one,
					a_xpath_node_test.as_combined_node_test.operator, a_xpath_node_test.as_combined_node_test.node_test_two)
			elseif a_xpath_node_test.is_content_test then
				create {XM_XSLT_CONTENT_TYPE_TEST} Result.make (a_context, a_xpath_node_test.as_content_test.node_kind, a_xpath_node_test.as_content_test.content_type)
			elseif a_xpath_node_test.is_local_name_test then
				create {XM_XSLT_LOCAL_NAME_TEST} Result.make (a_context, a_xpath_node_test.as_local_name_test.node_kind,
					a_xpath_node_test.as_local_name_test.local_name, a_xpath_node_test.as_local_name_test.original_text)
			elseif a_xpath_node_test.is_namespace_test then
				create  {XM_XSLT_NAMESPACE_TEST} Result.make (a_context, a_xpath_node_test.as_namespace_test.node_kind, shared_name_pool.uri_from_uri_code(a_xpath_node_test.as_namespace_test.uri_code), a_xpath_node_test.as_namespace_test.original_text)
			elseif a_xpath_node_test.is_name_test then
				create {XM_XSLT_NAME_TEST} Result.make (a_context, a_xpath_node_test.as_name_test.node_kind, a_xpath_node_test.as_name_test.fingerprint, a_xpath_node_test.as_name_test.original_text)
			elseif a_xpath_node_test.is_node_kind_test then
				create {XM_XSLT_NODE_KIND_TEST} Result.make (a_context, a_xpath_node_test.as_node_kind_test.node_kind)
			else
				check
					document_node_test: a_xpath_node_test.is_document_node_test
					-- only remaining type
				end
				create {XM_XSLT_DOCUMENT_NODE_TEST} Result.make (a_context, a_xpath_node_test.as_document_node_test.element_test)
			end
		ensure
			xslt_node_test_not_void: Result /= Void
		end

end

