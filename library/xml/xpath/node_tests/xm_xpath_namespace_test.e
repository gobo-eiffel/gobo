indexing

	description:

		"Objects that test for a node with a specific namespace-uri"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMESPACE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			item_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; a_node_type: INTEGER; a_uri: STRING) is
		require
			valid_node_type: is_node_type (a_node_type)
			name_pool_not_void: a_name_pool /= Void
			uri_not_void: a_uri /= Void
		do
			name_pool := a_name_pool
			item_type := a_node_type
			if name_pool.is_code_for_uri_allocated (a_uri) then
				uri_code := name_pool.code_for_uri (a_uri)
			else
				name_pool.allocate_code_for_uri (a_uri)
				uri_code := name_pool.code_for_uri (a_uri)
			end
		ensure
			item_type_set: item_type = a_node_type
			name_pool_set: name_pool = a_name_pool
		end

feature -- Access

	item_type: INTEGER
			-- Type of nodes to which this pattern applies

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := False
		end
	
feature -- Matching

	matches_node (a_node_kind: INTEGER; a_name_code: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do

			if a_name_code = - 1 then
				Result := False
			elseif a_node_kind /= item_type then
				Result := False
			else
				Result := uri_code = name_pool.uri_code_from_name_code (a_name_code)
			end
		end

feature {NONE} -- Implementation

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool

	uri_code: INTEGER
			-- The uri code
	
invariant

	name_pool_not_void: name_pool /= Void

end
