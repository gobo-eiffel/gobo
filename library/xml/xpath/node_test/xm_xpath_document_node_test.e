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

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		local
			a_node: XM_XPATH_NODE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			found, finished: BOOLEAN
			a_node_type: INTEGER
		do

			-- `Result' is `True' if there is exactly one element node child, no text node
			--  children, and the element node matches the element test.

			if an_item.is_node then
				a_node := an_item.as_node
				if a_node.node_type = Document_node then
					from
						an_iterator := a_node.new_axis_iterator (Child_axis); an_iterator.start
					until
						finished or else an_iterator.after
					loop
						a_node := an_iterator.item
						a_node_type := a_node.node_type
						if a_node_type = Text_node then
							found := False
							finished := True
						elseif a_node_type = Element_node then
							if found then
								found := False
								finished := True
							else
								found := element_test.matches_item (a_node)
								if not found then finished := True end
							end
						end
						an_iterator.forth
					end
					Result := found
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
	
