indexing

	description:

		"XPath pattern that matches a particular name and node type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAME_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			fingerprint, item_type, default_priority
		end

creation

	make, make_same_type

feature {NONE} -- Initialization

	make (a_node_type: INTEGER; a_name_code: INTEGER) is
		local
			top_bits: INTEGER
		do
			item_type := a_node_type
			
			--	fingerprint := a_name_code & 0x0fffff
			top_bits := (a_name_code // bits_20) * bits_20
			fingerprint  := a_name_code - top_bits			
		ensure
			item_type_set: item_type = a_node_type
		end

	make_same_type (a_node: XM_XPATH_ABSTRACT_NODE) is
		do
			item_type := a_node.item_type
			fingerprint := a_node.fingerprint
		ensure
			same_type: item_type = a_node.item_type
			same_fingerprint: fingerprint = a_node.fingerprint
		end

feature -- Access

		frozen default_priority: DOUBLE is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			Result := 0.0
		end

	fingerprint: INTEGER
			-- Determine the name fingerprint of nodes to which this pattern applies;
			-- Used for optimisation.

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
		local
			a_fingerprint: INTEGER
			top_bits: INTEGER
		do
			top_bits := (a_name_code // bits_20) * bits_20
			a_fingerprint := a_name_code - top_bits

			-- The next line is in this order for speed - the first test usually fails
			Result := a_fingerprint = fingerprint or else a_node_type = item_type 
		end

feature {NONE} -- Implementation

	bits_20: INTEGER is 1048576
			-- Bit mask for 20-bit number

end
	
