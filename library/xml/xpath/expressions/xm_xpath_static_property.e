indexing

	description:

		"Constants identifying dependencies that an XPath expression might have on its context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STATIC_PROPERTY

feature -- Status report

	are_intrinsic_dependencies_computed: BOOLEAN
			-- Have `intrinsic dependencies' been computed yet?

	are_dependencies_computed: BOOLEAN
			-- Have `dependencies' been computed yet?
		
	are_cardinalities_computed: BOOLEAN
			-- Have `cardinalities' been computed yet?

	are_special_properties_computed: BOOLEAN
			-- Have `special_properties' been computed yet?
		

feature -- Dependencies

	dependencies: ARRAY [BOOLEAN]
			-- Dependencies of expression

	intrinsic_dependencies: ARRAY [BOOLEAN]
			-- Intrinsic dependencies of expression (ignoring sub-expressions)
	
	Depends_upon_current_item: BOOLEAN is
		-- Expression depends upon current item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (1)
		end
	Depends_upon_context_item: BOOLEAN is
		-- Expression depends upon context item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (2)
		end
	Depends_upon_position: BOOLEAN is
		-- Expression depends upon position
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (3)
		end

	Depends_upon_last: BOOLEAN is
		-- Expression depends upon last()
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (4)
		end

	Depends_upon_context_document: BOOLEAN is
		-- Expression depends upon document containing context item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (5)
		end

	Depends_upon_current_group: BOOLEAN is
		-- Expression depends upon current-group() and/or current-grouping-key() and/or regex-group() 
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (6)
		end
	
	Depends_upon_xslt_context: BOOLEAN is
			-- Expression depends upon the XSLT context
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := Depends_upon_current_item or else Depends_upon_current_group
		end

	Depends_upon_focus: BOOLEAN is
			-- Expression depends upon focus
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := Depends_upon_context_item
				or else Depends_upon_position
				or else Depends_upon_last
				or else Depends_upon_context_document
		end

	Depends_upon_non_document_focus: BOOLEAN is
			-- Expression depends upon focus, but not the current document
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := Depends_upon_context_item
				or else Depends_upon_position
				or else Depends_upon_last
		end


feature -- Cardinality

	cardinalities: ARRAY [BOOLEAN]

			-- The following values represent an index into the `cardinalities' array:
	
	Cardinality_allows_zero, Allow_empty: BOOLEAN is
			-- `True' if an empty sequence is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (1)
		end

	Cardinality_allows_one: BOOLEAN is
			-- `True' if a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (2)
		end

	Cardinality_exactly_one: BOOLEAN is
			-- `True' if a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_one
				and then not Cardinality_allows_zero
				and then not Cardinality_allows_many
		end

	Cardinality_allows_many: BOOLEAN is
			-- `True' if multiple values are allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (3)
		end

	Cardinality_allows_one_or_more: BOOLEAN is
			-- Occurrence indicator for one or more (+)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_one and then Cardinality_allows_many
		end

	Cardinality_allows_zero_or_more: BOOLEAN is
			-- Occurrence indicator for zero or more (*)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_zero
				and then Cardinality_allows_one
				and then Cardinality_allows_many
		end

feature -- Special properties
	
	special_properties: ARRAY [BOOLEAN]



	Context_document_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes in the result are
			-- guaranteed all to be in the same document as the context node. For
			-- expressions that return values other than nodes, the setting is undefined.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (1)
		end

	Ordered_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes
			-- in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (2)
		end

	Reverse_document_order: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers items in the reverse
			-- of correct order, when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (3)
		end

	Peer_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that no node in the
			-- set will be an ancestor of any other. This property is useful in deciding whether the
			-- results of a path expression are pre-sorted. The property is only used in the case where
			-- the `Naturally_sorted' property is true, so there is no point in setting it in other cases.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (4)
		end

	Subtree_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be a descendant or self, or attribute or namespace, of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (5)
		end

	Attribute_ns_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be an attribute or namespace of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (6)
		end

end
