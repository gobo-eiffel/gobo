note

	description:

		"Objects that test for a node with a specific namespace-uri"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NAMESPACE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			node_kind, is_namespace_test, as_namespace_test
		end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_node_type: INTEGER; a_uri, an_original_text: STRING)
		require
			uri_not_void: a_uri /= Void
			original_text_not_void: an_original_text /= Void
		do
			node_kind := a_node_type
			if shared_name_pool.is_code_for_uri_allocated (a_uri) then
				uri_code := shared_name_pool.code_for_uri (a_uri)
			else
				shared_name_pool.allocate_code_for_uri (a_uri)
				uri_code := shared_name_pool.code_for_uri (a_uri)
			end
			original_text := an_original_text
		ensure
			node_kind_set: node_kind = a_node_type
			original_text_set: original_text = an_original_text
		end

feature -- Access

	node_kind: INTEGER
			-- Type of nodes to which this pattern applies

	uri_code: INTEGER
			-- The uri code

	node_kind_mask: INTEGER
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_shift_left (1, node_kind)
		end

	is_namespace_test: BOOLEAN
			-- Is `Current' a namespace test?
		do
			Result := True
		end

	as_namespace_test: XM_XPATH_NAMESPACE_TEST
			-- `Current' seen as a namespace test
		do
			Result := Current
		end

feature -- Status report

	allows_text_nodes: BOOLEAN
			-- Does this node test allow text nodes?
		do
			Result := False
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_name_code: INTEGER; a_node_type: INTEGER): BOOLEAN
			-- Is this node test satisfied by a given node?
		do
			if a_name_code = - 1 then
				Result := False
			elseif a_node_kind /= node_kind then
				Result := False
			else
				Result := uri_code = shared_name_pool.uri_code_from_name_code (a_name_code)
			end
		end

end
