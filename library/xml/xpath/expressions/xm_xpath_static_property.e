indexing

	description:

		"Dependencies that an XPath expression might have on its context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STATIC_PROPERTY

inherit

	XM_XPATH_CARDINALITY

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
	
	depends_upon_current_item: BOOLEAN is
		-- Expression depends upon current item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (1)
		end
	depends_upon_context_item: BOOLEAN is
		-- Expression depends upon context item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (2)
		end
	depends_upon_position: BOOLEAN is
		-- Expression depends upon position
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (3)
		end

	depends_upon_last: BOOLEAN is
		-- Expression depends upon last()
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (4)
		end

	depends_upon_context_document: BOOLEAN is
		-- Expression depends upon document containing context item
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (5)
		end

	depends_upon_current_group: BOOLEAN is
		-- Expression depends upon current-group() and/or current-grouping-key() and/or regex-group() 
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (6)
		end
	
	depends_upon_xslt_context: BOOLEAN is
			-- Expression depends upon the XSLT context
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := Depends_upon_current_item or else Depends_upon_current_group
		end

	depends_upon_focus: BOOLEAN is
			-- Expression depends upon focus
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := Depends_upon_context_item
				or else Depends_upon_position
				or else Depends_upon_last
				or else Depends_upon_context_document
		end

	depends_upon_non_document_focus: BOOLEAN is
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

	cardinality: INTEGER is
			-- cardinality
		require
			cardinalities_computed: are_cardinalities_computed
		do
			if cardinality_exactly_one then
				Result := Required_cardinality_exactly_one
			elseif cardinality_allows_zero_or_more then
				Result := Required_cardinality_zero_or_more
			elseif cardinality_allows_one_or_more then
				Result := Required_cardinality_one_or_more
			elseif cardinality_allows_one then
				Result := Required_cardinality_optional
			else
					check
						empty: cardinality_allows_zero and not cardinality_allows_many
					end
				Result := Required_cardinality_empty
			end
		ensure
			valid_cardinality: is_valid_required_cardinality (Result)
		end

	cardinality_allows_zero: BOOLEAN is
			-- `True' if an empty sequence is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (1)
		end

	cardinality_allows_one: BOOLEAN is
			-- `True' if a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (2)
		end

	cardinality_exactly_one: BOOLEAN is
			-- `True' if a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_one
				and then not Cardinality_allows_zero
				and then not Cardinality_allows_many
		end

	cardinality_allows_many: BOOLEAN is
			-- `True' if multiple values are allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinalities.item (3)
		end

	cardinality_allows_one_or_more: BOOLEAN is
			-- Occurrence indicator for one or more (+)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_one and then Cardinality_allows_many
		end

	cardinality_allows_zero_or_more: BOOLEAN is
			-- Occurrence indicator for zero or more (*)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := Cardinality_allows_zero
				and then Cardinality_allows_one
				and then Cardinality_allows_many
		end
	
feature -- Setting cardinality

	set_cardinality (requested_cardinality: INTEGER) is
			-- Set cardinality to `requested_cardinality'.
		require
			valid_cardinality: is_valid_required_cardinality (requested_cardinality)
		do
			inspect
				requested_cardinality
			when Required_cardinality_empty then
				set_cardinality_empty
			when Required_cardinality_optional then
				set_cardinality_optional
			when Required_cardinality_exactly_one then
				set_cardinality_exactly_one
			when Required_cardinality_one_or_more then
				set_cardinality_one_or_more
			when Required_cardinality_zero_or_more then
				set_cardinality_zero_or_more
			end
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_empty is
			-- Allow no items
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1,3)
				are_cardinalities_computed := True
			end
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_optional is
			-- Allow zero or one items
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1,3)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_zero_or_more is
			-- Allow any number of items
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1,3)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_one_or_more is
			-- Allow any number of items other than zero
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1,3)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_exactly_one is
			-- Allow exactly one item
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1,3)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 2)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

feature -- Special properties
	
	special_properties: ARRAY [BOOLEAN]



	context_document_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes in the result are
			-- guaranteed all to be in the same document as the context node. For
			-- expressions that return values other than nodes, the setting is undefined.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (1)
		end

	ordered_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes
			-- in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (2)
		end

	reverse_document_order: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers items in the reverse
			-- of correct order, when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (3)
		end

	peer_nodeset: BOOLEAN is
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

	subtree_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be a descendant or self, or attribute or namespace, of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (5)
		end

	attribute_ns_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be an attribute or namespace of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (6)
		end

end
