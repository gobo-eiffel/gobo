indexing

	description:

		"Pure XPath implementation of the Node-test pattern"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_TEST

inherit

	XM_XPATH_TYPE

feature -- Access

	-- Not sure if these next two features are needed

	item_type: INTEGER is
			-- Determine the types of nodes to which this test applies
		do
			Result := Any_node
		ensure
			valid_node: is_node_type (Result)
		end
	
	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies
		do
			Result := -1 -- Means can match multiple fingerprints
		end

feature -- Status report

	-- Not sure if this next feature is needed

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		deferred
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		deferred
		end

end
