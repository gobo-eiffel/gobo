indexing

	description:

		"Constants identifying dependencies that an XPath expression might have on its context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STATIC_PROPERTY

feature -- Access

	frozen Depends_upon_current_item: INTEGER is 1
		-- Expression depends upon current item (bit setting)

	frozen Depends_upon_context_item: INTEGER is 2
		-- Expression depends upon context item (bit setting)
	
	frozen Depends_upon_position: INTEGER is 4
		-- Expression depends upon position (bit setting)

	frozen Depends_upon_last: INTEGER is 8
		-- Expression depends upon last() (bit setting)

	frozen Depends_upon_context_document: INTEGER is 16
		-- Expression depends upon document containing context item (bit setting)

	frozen Depends_upon_current_group: INTEGER is 32
		-- Expression depends upon current-group() and/or current-grouping-key() and/or regex-group()  (bit setting)

	frozen Depends_upon_xslt_context: INTEGER is
			-- Expression depends upon the XSLT context (bit combination)
		do
			Result := Depends_upon_current_item + Depends_upon_current_group
		end

	frozen Depends_upon_focus: INTEGER is
			-- Expression depends upon focus (bit combination)
		do
			Result := Depends_upon_context_item + Depends_upon_position +
				Depends_upon_last + Depends_upon_context_document
		end

	frozen Depends_upon_non_document_focus: INTEGER is
			-- Expression depends upon focus, but not the current document (bit combination)
		do
			Result := Depends_upon_context_item + Depends_upon_position +
				Depends_upon_last
		end

	frozen Dependency_mask: INTEGER is
			-- Mask to select all the dependency bits
		do
			Result := Depends_upon_focus + Depends_upon_current_item + Depends_upon_current_group
		end

	frozen Cardinality_allows_zero, Empty: INTEGER is 256
			-- Bit set if an empty sequence is allowed

	frozen Cardinality_allows_one, Cardinality_exactly_one: INTEGER is 512
			-- Bit set if a single value is allowed

	frozen Cardinality_allows_many: INTEGER is 1024
			-- Bit set if multiple values are allowed

	frozen Cardinality_mask: INTEGER is
			-- Mask to select all the cardinality bits
		do
			Result := Cardinality_allows_zero + Cardinality_allows_one + Cardinality_allows_many
		end

	frozen Cardinality_allows_one_or_more: INTEGER is
			-- Occurrence indicator for one or more (+)
		do
			Result := Cardinality_allows_one + Cardinality_allows_many
		end

	frozen Cardinality_allows_zero_or_more: INTEGER is
			-- Occurrence indicator for zero or more (*)
		do
			Result := Cardinality_allows_zero + Cardinality_allows_one + Cardinality_allows_many
		end

	frozen Context_document_nodeset: INTEGER is 65536
			-- Expression property: this bit is set in the case of
			-- an expression whose item type is node, when the nodes in the result are
			-- guaranteed all to be in the same document as the context node. For
			-- expressions that return values other than nodes, the setting is undefined.
	
	frozen Ordered_nodeset: INTEGER is 131072
			-- Expression property: this bit is set in the case of
			-- an expression whose item type is node, when the nodes
			-- in the result are in document order.

	frozen Reverse_document_order: INTEGER is 262144
			-- Expression property: this bit is set in the case of
			-- an expression that delivers items in the reverse
			-- of correct order, when unordered retrieval is requested.

	frozen Peer_nodeset: INTEGER is 524288
			-- Expression property: this bit is set in the case of
			-- an expression that delivers a set of nodes with the guarantee that no node in the
			-- set will be an ancestor of any other. This property is useful in deciding whether the
			-- results of a path expression are pre-sorted. The property is only used in the case where
			-- the `Naturally_sorted' property is true, so there is no point in setting it in other cases.

	frozen Subtree_nodeset: INTEGER is 1048576
			-- Expression property: this bit is set in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be a descendant or self, or attribute or namespace, of the context node

	frozen Attribute_ns_nodeset: INTEGER is 2097152
			-- Expression property: this bit is set in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be an attribute or namespace of the context node

	frozen Special_propert_mask: INTEGER is
			-- Mask for "special properties": that is, all properties other than cardinality
			-- and dependencies
		do
			Result := Context_document_nodeset + Ordered_nodeset + Reverse_document_order +
				Peer_nodeset + Subtree_nodeset + Attribute_ns_nodeset
		end
end
