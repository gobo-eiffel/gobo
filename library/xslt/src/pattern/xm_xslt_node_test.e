note

	description:

		"XSLT patterns that matches a particular name and node kind"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_NODE_TEST

inherit

	XM_XSLT_PATTERN
		undefine
			fingerprint, node_kind,	is_node_test
		end

	XM_XPATH_NODE_TEST

feature -- Access

	node_test: XM_XSLT_NODE_TEST
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			Result := Current
		end

feature -- Matching

	match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Attempt to match `Current' againast `a_node'.
		do
			internal_last_match_result := matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation)
		end

end

