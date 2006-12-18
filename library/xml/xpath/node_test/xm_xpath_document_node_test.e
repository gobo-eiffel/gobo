indexing

	description:

		"Objects that implement XPath's document-node(element(x)) node test."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_NODE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			fingerprint, matches_item, node_kind, is_document_node_test, as_document_node_test
		end

	XM_XPATH_AXIS

create

	make

feature {NONE} -- Initialization

	make (a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant.
		require
			element_test_not_void: a_node_test /= Void
		do
			element_test := a_node_test
			original_text := STRING_.concat ("document-node(", element_test.original_text)
			original_text := STRING_.appended_string (original_text, ")")
		ensure
			element_test_set: element_test = a_node_test
		end

feature -- Access

	element_test: XM_XPATH_NODE_TEST
			-- Test for document element
	
	is_document_node_test: BOOLEAN is
			-- Is `Current' a document node test?
		do
			Result := True
		end

	as_document_node_test: XM_XPATH_DOCUMENT_NODE_TEST is
			-- `Current' seen as a document node test
		do
			Result := Current
		end

	node_kind: INTEGER is
			-- Type of nodes matched
		do
			Result := Document_node
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_shift_left (1, node_kind)
		end

	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies
		do
			Result := element_test.fingerprint
		end

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN is
			-- Does `a_item' conform to `Current'?
		local
			l_node: XM_XPATH_NODE
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_found, l_finished: BOOLEAN
			l_node_type: INTEGER
		do

			-- `Result' is `True' if there is exactly one element node child, no text node
			--  children, and the element node matches the element test.

			if a_item.is_node then
				l_node := a_item.as_node
				if l_node.node_type = Document_node then
					from
						l_iterator := l_node.new_axis_iterator (Child_axis); l_iterator.start
					until
						l_finished or else l_iterator.after
					loop
						l_node := l_iterator.item
						l_node_type := l_node.node_type
						if l_node_type = Text_node then
							l_found := False
							l_finished := True
						elseif l_node_type = Element_node then
							if l_found then
								l_found := False
								l_finished := True
							else
								l_found := element_test.matches_item (l_node, False)
								if not l_found then l_finished := True end
							end
						end
						l_iterator.forth
					end
					Result := l_found
				end
			end
		end

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := False
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			if a_node_kind = Document_node then
				Result := element_test.matches_node (Element_node, a_fingerprint, a_node_type)
			end
		end

invariant

	element_test_not_void: element_test /= Void

end
	
