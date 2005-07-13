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
		redefine
			constraining_node_names, is_at_most_one_name_constraint, content_type,
			is_combined_node_test, as_combined_node_test
		end

	XM_XPATH_TOKENS

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

create

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
			original_text := a_string
		ensure
			node_test_one_set: node_test_one = a_node_test
			node_test_two_set: node_test_two = another_node_test
			operator_set: operator = an_operator
		end

feature -- Access

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_and (node_test_one.node_kind_mask, node_test_two.node_kind_mask)
		end

	constraining_node_names: DS_SET [INTEGER] is
			-- Set of fingerprints of node names allowed
		do
			if node_test_one.constraining_node_names = Void then
				Result := node_test_two.constraining_node_names
			elseif node_test_two.constraining_node_names = Void then
				Result := node_test_one.constraining_node_names
			end
		end

	content_type: XM_XPATH_SCHEMA_TYPE is
			-- Content type
		local
			a_type, another_type: XM_XPATH_SCHEMA_TYPE
		do
			Result := any_item
			a_type := node_test_one.content_type
			another_type := node_test_two.content_type
			if a_type.is_same_type (another_type) then
				Result := a_type
			elseif operator = Intersect_token then
				if another_type = any_item then
					Result := a_type
				elseif a_type = any_item then
					Result := another_type
				end
			end
		end

	is_combined_node_test: BOOLEAN is
			-- Is `Current' a combined node test?
		do
			Result := True
		end

	as_combined_node_test: XM_XPATH_COMBINED_NODE_TEST is
			-- `Current' seen as a combined node test
		do
			Result := Current
		end

feature -- Status report

	is_at_most_one_name_constraint: BOOLEAN is
			-- Is there at most one name constraint?
		do
			Result := node_test_one.constraining_node_names = Void or else node_test_two.constraining_node_names = Void
		end

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
