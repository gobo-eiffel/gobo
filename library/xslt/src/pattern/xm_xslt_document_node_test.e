note

	description:

		"XSLT patterns that implement XPath's document-node(element(x)) node test."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_DOCUMENT_NODE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			fingerprint, matches_item, node_kind, is_document_node_test, as_document_node_test, constraining_node_names
		redefine
			default_priority, match
		end

	XM_XPATH_DOCUMENT_NODE_TEST
		rename
			make as make_xpath
		end

	XM_XSLT_PATTERN_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant
		require
			static_context_not_void: a_static_context /= Void
			element_test_not_void: a_node_test /= Void
		do
			initialize_dependencies
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			make_xpath (a_node_test)
			default_priority := xpath_to_xslt_node_test (a_node_test, a_static_context).default_priority
		end

feature -- Access

		frozen default_priority: MA_DECIMAL
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.

feature -- Matching

	frozen match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Determine whether this Pattern matches the given Node;
		do
			internal_last_match_result := matches_item (a_node, False)
		end

end
