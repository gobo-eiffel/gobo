indexing

	description:

		"Objects that combine two node tests with a set operator"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMBINED_NODE_TEST

inherit

	XM_XPATH_NODE_TEST

	XM_XPATH_TOKENS

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_node_test: XM_XPATH_NODE_TEST; an_operator: INTEGER; another_node_test: XM_XPATH_NODE_TEST) is
		require
			node_test_one_not_void: a_node_test /= Void
			node_test_two_not_void: another_node_test /= Void
			set_operation: an_operator = Union_token or else an_operator = Intersect_token or else an_operator = Except_token
		local
			a_string: STRING
		do
			node_test_one := a_node_test
			node_test_two := another_node_test
			operator := an_operator
			a_string := STRING_.appended_string ("(", node_test_one.original_text)
			a_string := STRING_.appended_string (a_string, " ")
			a_string := STRING_.appended_string (a_string, token_name (operator))
			a_string := STRING_.appended_string (a_string, " ")
			a_string := STRING_.appended_string (a_string, node_test_two.original_text)
			a_string := STRING_.appended_string (a_string, ")")
			set_original_text (a_string)
		ensure
			node_test_one_set: node_test_one = a_node_test
			node_test_two_set: node_test_two = another_node_test
			operator_set: operator = an_operator
		end
	
feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := node_test_one.allows_text_nodes or else node_test_two.allows_text_nodes
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			inspect
				operator
			when Union_token then
				Result := node_test_one.matches_node (a_node_kind, a_fingerprint, a_node_type) or else
				node_test_two.matches_node (a_node_kind, a_fingerprint, a_node_type)
			when Intersect_token then
				Result := node_test_one.matches_node (a_node_kind, a_fingerprint, a_node_type) and then
				node_test_two.matches_node (a_node_kind, a_fingerprint, a_node_type)
			when Except_token then
				Result := node_test_one.matches_node (a_node_kind, a_fingerprint, a_node_type) and then
				not node_test_two.matches_node (a_node_kind, a_fingerprint, a_node_type)
			end
		end

feature {NONE} -- Implementation

	node_test_one, node_test_two: XM_XPATH_NODE_TEST
			-- Constituent node tests

	operator: INTEGER
			-- Set operation

invariant

	node_test_one_not_void: node_test_one /= Void
	node_test_two_not_void: node_test_two /= Void
	set_operation: operator = Union_token or else operator = Intersect_token or else operator = Except_token

end
