indexing

	description:

		"Pure XPath implementation of the local-name-test pattern"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LOCAL_NAME_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			item_type
		end

	XM_UNICODE_CHARACTERS_1_1

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; a_node_type: INTEGER; a_local_name: STRING) is
		require
			name_pool_not_void: a_name_pool /= Void
			valid_node_type: is_node_type (a_node_type)
			valid_local_name: a_local_name /= Void and then is_ncname (a_local_name)
		do
			item_type := a_node_type
			local_name := a_local_name
			name_pool := a_name_pool
		ensure
			item_type_set: item_type = a_node_type
			local_name_set: local_name = a_local_name
			name_pool_set: name_pool = a_name_pool
		end


feature -- Access

	item_type: INTEGER
			-- Determine the types of nodes to which this pattern applies;
			-- Used for optimisation;
			-- For patterns that match nodes of several types, return Any_node

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
			if a_name_code = -1 then
				Result := False
			elseif not is_node_type (a_node_kind) then
				Result := False
			else
				Result := STRING_.same_string (local_name, name_pool.local_name_from_name_code (a_name_code))
			end
				
		end

feature {NONE} -- Implementation

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

	local_name: STRING
			-- Local name (NCName)

invariant

	name_pool_not_void: name_pool /= Void
	valid_local_name: local_name /= Void and then is_ncname (local_name)

end
