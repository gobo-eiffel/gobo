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

	are_static_properties_computed: BOOLEAN is
			-- Have all static properties been computed?
		do
			Result := are_dependencies_computed and then are_cardinalities_computed and then are_special_properties_computed
		end

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
			Result := depends_upon_current_item or else depends_upon_current_group
		end

	depends_upon_focus: BOOLEAN is
			-- Expression depends upon focus
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := depends_upon_context_item
				or else depends_upon_position
				or else depends_upon_last
				or else depends_upon_context_document
		end

	depends_upon_non_document_focus: BOOLEAN is
			-- Expression depends upon focus, but not the current document
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := depends_upon_context_item
				or else depends_upon_position
				or else depends_upon_last
		end

feature -- Setting dependencies

	set_dependencies (a_dep: ARRAY [BOOLEAN]) is
		require
			dependencies_not_void: a_dep /= Void and then a_dep.count = 6
		do
			dependencies := a_dep
			are_dependencies_computed := True
		ensure
			set: dependencies = a_dep
			dependencies_computed: are_dependencies_computed
		end

	set_depends_upon_current_item is
			-- Set expression to depend upon current item.
		do
			if not are_dependencies_computed then
				are_dependencies_computed := True
				create dependencies.make (1,6)
			end
			dependencies.put (True, 1)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_depends_upon_current_group is
			-- Set expression to depend upon current-group() and/or current-grouping-key() and/or regex-group().
		do
			if not are_dependencies_computed then
				are_dependencies_computed := True
				create dependencies.make (1,6)
			end
			dependencies.put (True, 6)
		ensure
			dependencies_computed: are_dependencies_computed
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

	cardinality_allows_zero_or_one: BOOLEAN is
		do
			Result := cardinality_allows_one
				and then cardinality_allows_zero
				and then not cardinality_allows_many
		end

	cardinality_exactly_one: BOOLEAN is
			-- `True' if a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinality_allows_one
				and then not cardinality_allows_zero
				and then not cardinality_allows_many
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
			Result := not cardinality_allows_zero and then cardinality_allows_one and then cardinality_allows_many
		end

	cardinality_allows_zero_or_more: BOOLEAN is
			-- Occurrence indicator for zero or more (*)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinality_allows_zero
				and then cardinality_allows_one
				and then cardinality_allows_many
		end

	cardinality_subsumes (requested_cardinality: INTEGER): BOOLEAN is
			-- Are all options of `requested_cardinality' permitted by `Current'?
		do
			inspect
				requested_cardinality
			when Required_cardinality_empty then
				Result := cardinality_allows_zero
			when Required_cardinality_optional then
				Result := cardinality_allows_zero and then cardinality_allows_one
			when Required_cardinality_exactly_one then
				Result := cardinality_allows_one
			when Required_cardinality_one_or_more then
				Result := cardinality_allows_one and then cardinality_allows_many
			when Required_cardinality_zero_or_more then
				Result := cardinality_allows_zero_or_more
			end
		end

	occurence_indicator: STRING is
			-- Text of the occurence-indicator
		do
			if cardinality_allows_zero_or_one then
				Result := "?"
			elseif cardinality_exactly_one then
				Result := ""
			elseif cardinality_allows_zero_or_more then
				Result := "*"
			else
					check
						one_or_more: cardinality_allows_one_or_more
					end
				Result := "+"
			end
		end

feature -- Setting cardinality

	merged_cardinality (more_cardinalities: ARRAY [BOOLEAN]):  ARRAY [BOOLEAN] is
			-- Merger of `cardinalities' with more_cardinalities'
		require
			more_cardinalities_not_void: more_cardinalities /= Void
		local
			a_counter: INTEGER
		do
			create Result.make (1, 3)
			from
				a_counter := 1
			variant
				4 - a_counter
			until
				a_counter > 3
			loop
				Result.put (cardinalities.item (a_counter) and more_cardinalities.item (a_counter), a_counter)
				a_counter := a_counter + 1
			end
		end

	clone_cardinality (other: XM_XPATH_STATIC_PROPERTY) is
			-- Set `cardinalities' from `other'.
		require
			other_cardinalities: other /= Void and then other.are_cardinalities_computed
		do
			cardinalities := clone (other.cardinalities)
			are_cardinalities_computed := True
		ensure
			-- TODO - check equality set: cardinalities = other.cardinalities
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinalities (a_card: ARRAY [BOOLEAN]) is
		require
			cardinalities_not_void: a_card /= Void and then a_card.count = 3
		do
			cardinalities := a_card
			are_cardinalities_computed := True
		ensure
			computed: are_cardinalities_computed
			set: cardinalities = a_card
		end

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

feature -- Setting special properties

	clone_special_properties (other: XM_XPATH_STATIC_PROPERTY) is
			-- Set `special_properties' from `other'.
		require
			other_special_properties: other /= Void and then other.are_special_properties_computed
		do
			special_properties := clone (other.special_properties)
			are_special_properties_computed := True
		ensure
			-- TODO - equality check set: special_properties = other.special_properties
			special_properties_computed: are_special_properties_computed
		end

	set_special_properties (properties: ARRAY [BOOLEAN]) is
		require
			properties_not_void: properties /= Void and then properties.count = 6
		do
			special_properties := properties
			are_special_properties_computed := True
		ensure
			computed: are_special_properties_computed and then special_properties = properties
		end

	set_context_document_nodeset is
			-- Guarentee nodes in the result are all to be in the same document as the context node.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 1)
		ensure
			context_document_nodeset: context_document_nodeset
		end

	set_ordered_nodeset is
			-- Guarentee nodes in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 2)
		ensure
			ordered_nodeset: ordered_nodeset
		end

	set_reverse_document_order is
			-- Guarentee delivers items in reverse of correct order,
			--  when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 3)
		ensure
			reverse_document_order: reverse_document_order
		end

	set_peer_nodeset is
			-- Guarentee that no node in the
			-- set will be an ancestor of any other.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 4)
		ensure
			peer_nodeset: peer_nodeset
		end

	set_subtree_nodeset is
			-- Guarentee every node in the result will be a descendant or self,
			--  or attribute or namespace, of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 5)
		ensure
			subtree_nodeset: subtree_nodeset
		end	

	set_attribute_ns_nodeset is
			-- Guarentee every node in the result will be
			--  an attribute or namespace of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 6)
		ensure
			attribute_ns_nodeset: attribute_ns_nodeset
		end

end
