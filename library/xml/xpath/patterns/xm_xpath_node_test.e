indexing

	description:

		"XPath pattern that matches a particular name and node kind"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_TEST

inherit

	XM_XPATH_PATTERN

feature -- Access

	node_test: XM_XPATH_NODE_TEST is
			-- Retrieve an `XM_XPATH_NODE_TEST' that all nodes matching this pattern must satisfy
		do
			Result := Current
		end

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		deferred
		end

feature -- Matching

	frozen matches (a_node: XM_XPATH_ABSTRACT_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- This is the main external interface for matching patterns:
			--  it sets current() to the node being tested
			-- The controller is only relevant if the pattern
			--  uses variables, or contains calls on functions such as document() or key().
		do
			Result := matches_node (a_node.item_type, a_node.fingerprint, a_node.type_annotation) 
		end
	
	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		deferred
		end
end
	
