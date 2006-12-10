indexing

	description:

		"Objects that enumerate the preceding:: Axis"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_PRECEDING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]
		redefine
			start, as_node_iterator
		end
	
	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

		-- This class also implements an extra Axis, preceding-or-ancestor,
		-- which is used internally by xsl:number level="any"
	
create

	make
	
feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_starting_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST; ancestors: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			document := a_document
			starting_node := a_starting_node
			node_test := a_node_test
			include_ancestors := ancestors

			next_ancestor_depth := a_document.depth_of (starting_node.node_number) - 1
		ensure
			document_set: document = a_document
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
			include_ancestors: include_ancestors = ancestors
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		local
			a_tiny_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TINY_NODE]
		do
			a_tiny_node_iterator ?= ANY_.to_any (Current)
			Result := a_tiny_node_iterator
		end

feature -- Cursor movement

	start is
			-- Move to next position
		do
			current_item := starting_node
			forth
		end

	forth is
			-- Move to next position
		local
			l_next: INTEGER
			l_found, l_valid: BOOLEAN
		do
			index := index + 1
			from
				l_next := current_item.node_number
			until
				l_found
			loop
				l_next := l_next - 1
				l_valid := document.is_node_number_valid (l_next)
				if not include_ancestors then
					from
					until
						next_ancestor_depth < 1 or else (l_valid and then document.depth_of (l_next) /= next_ancestor_depth)
					loop
						if next_ancestor_depth <= 1 then
							l_found := True
							current_item := Void
						end
						next_ancestor_depth := next_ancestor_depth - 1
						l_next := l_next - 1
						l_valid := document.is_node_number_valid (l_next)
					end
				elseif not l_valid then
					l_found := True
					current_item := Void
				elseif document.depth_of (l_next) = 1 then
					l_found := True
					current_item := Void
				end
				if not l_found then
					if not l_valid then
						l_found := True
						current_item := Void
					elseif node_test.matches_node (document.retrieve_node_kind (l_next), fingerprint_from_name_code (document.retrieve_name_code (l_next)), document.element_annotation (l_next)) then
						l_found := True
						current_item := document.retrieve_node (l_next)
						if not current_item.root.is_same_node (starting_node.root) then
							-- Different document fragments
							current_item := Void
						end
					end
					if l_valid and document.depth_of (l_next) = 1 then
						l_found := True
						current_item := Void
					end
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (document, starting_node, node_test, include_ancestors)
		end
	
feature {NONE} -- Implementation

	document: XM_XPATH_TINY_FOREST
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	include_ancestors: BOOLEAN
			-- Do we include ancestors in the enumeration

	next_ancestor_depth: INTEGER
	
	advance is
			-- Move to the next matching node
		do
			-- not used
		end
	
invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void
	
end
	
