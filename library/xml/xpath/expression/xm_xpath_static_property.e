indexing

	description:

		"Dependencies that an XPath expression might have on its context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STATIC_PROPERTY

inherit

	XM_XPATH_CARDINALITY

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

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

	Dependency_flag_count: INTEGER is 10
			-- Number of dependency flags

	dependencies: ARRAY [BOOLEAN]
			-- Dependencies of expression

	intrinsic_dependencies: ARRAY [BOOLEAN]
			-- Intrinsic dependencies of expression (ignoring sub-expressions)
	
	depends_upon_current_item: BOOLEAN is
		-- Expression depends upon current() item
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
		-- Expression depends upon current-group() and/or current-grouping-key()
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (6)
		end
	
	depends_upon_regexp_group: BOOLEAN is
		-- Expression depends upon regexp-group() 
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (7)
		end

	depends_upon_local_variables: BOOLEAN is
		-- Expression depends upon local variables
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (8)
		end
	
	depends_upon_user_functions: BOOLEAN is
		-- Expression depends upon user functions
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (9)
		end	
	
	depends_upon_implicit_timezone: BOOLEAN is
		-- Expression depends upon implicit time zone
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := dependencies.item (10)
		end

	depends_upon_xslt_context: BOOLEAN is
			-- Expression depends upon the XSLT context
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := depends_upon_current_item or else depends_upon_current_group or else depends_upon_regexp_group
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

	initialize_dependencies is
			-- Inititialize `dependencied' to no dependencies.
		require
			dependencies_not_computed: not are_dependencies_computed
		do
			are_dependencies_computed := True
			create dependencies.make (1, Dependency_flag_count)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	initialize_intrinsic_dependencies is
			-- Inititialize `intrinsic_dependencied' to no dependencies.
		require
			intrinsic_dependencies_not_computed: not are_intrinsic_dependencies_computed
		do
			are_intrinsic_dependencies_computed := True
			create intrinsic_dependencies.make (1, Dependency_flag_count)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_dependencies (a_dep: ARRAY [BOOLEAN]) is
			-- Set all dependencies from `a_dep'.
		require
			dependencies_not_void: a_dep /= Void and then a_dep.count = Dependency_flag_count
		do
			dependencies := a_dep
			are_dependencies_computed := True
		ensure
			set: dependencies = a_dep
			dependencies_computed: are_dependencies_computed
		end

	merge_dependencies (a_dep: ARRAY [BOOLEAN]) is
		-- Merge all dependencies from `a_dep' into current.
		require
			dependencies_not_void: a_dep /= Void and then a_dep.count = Dependency_flag_count
			dependencies_computed: are_dependencies_computed
		local
			an_index: INTEGER
		do
			from
				an_index := 1
			variant
				Dependency_flag_count + 1 - an_index
			until
				an_index > Dependency_flag_count
			loop
				if a_dep.item (an_index) then
					dependencies.put (True, an_index)
				end
				an_index := an_index + 1
			end
		end
			
	set_depends_upon_current_item is
			-- Set expression to depend upon current item.
		do
			if not are_dependencies_computed then
				are_dependencies_computed := True
				create dependencies.make (1, Dependency_flag_count)
			end
			dependencies.put (True, 1)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_current_item is
			-- Set expression to depend upon current item.
		do
			if not are_intrinsic_dependencies_computed then
				are_intrinsic_dependencies_computed := True
				create intrinsic_dependencies.make (1, Dependency_flag_count)
			end
			intrinsic_dependencies.put (True, 1)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_context_item is
		-- Set expression to depend upon context item.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 2)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_context_item_independent is
			-- Set expression to be independent of context item.
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 2)
		ensure
			context_item_independent: not depends_upon_context_item
		end

	set_intrinsically_depends_upon_context_item is
			-- Set expression to depend upon context item.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 2)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_position is
		-- Set expression to depend upon context position.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 3)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_position_independent is
			-- Set expression to be independent of context position.
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 3)
		ensure
			context_item_independent: not depends_upon_position
		end
	
	set_intrinsically_depends_upon_position is
			-- Set expression to depend upon context position.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 3)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_last is
		-- Set expression to depend upon last.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 4)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_last is
			-- Set expression to depend upon last.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 4)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_last_independent is
			-- Set expression to be independent of last.
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 4)
		ensure
			context_item_independent: not depends_upon_last
		end

	set_depends_upon_context_document is
		-- Set expression to depend upon context document.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 5)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_context_document is
			-- Set expression to depend upon context document.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 5)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_context_document_independent is
			-- Set expression to be independent of context document.
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 5)
		ensure
			context_item_independent: not depends_upon_context_document
		end
			
	set_depends_upon_current_group is
			-- Set expression to depend upon current-group() and/or current-grouping-key() and/or regex-group().
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 6)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_current_group is
			-- Set expression to depend upon current-group() and/or current-grouping-key() and/or regex-group().
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 6)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_current_group_independent is
			-- Set expression to be independent of current_group.
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 6)
		ensure
			context_item_independent: not depends_upon_current_group
		end

	set_depends_upon_regexp_group is
			-- Set expression to depend upon regexp-group().
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 7)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_regexp_group_independent is
			-- Set expression to be independent of regexp-group().
		require
			dependencies_computed: are_dependencies_computed
		do
			dependencies.put (False, 7)
		ensure
			regexp_group_independent: not depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_regexp_group is
			-- Set expression to depend upon regexp-group().
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 7)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_intrinsically_depends_upon_expression_group is
			-- Set expression to depend upon regexp-group().
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 7)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_local_variables is
			-- Set expression to depend upon local variables.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 8)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_local_variables is
			-- Set expression to depend upon local variables.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 8)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_user_functions is
			-- Set expression to depend upon user functions.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 9)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_user_functions is
			-- Set expression to depend upon user functions.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 9)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_implicit_timezone is
			-- Set expression to depend upon implicit time zone.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			dependencies.put (True, 10)
		ensure
			dependencies_computed: are_dependencies_computed
		end

	set_intrinsically_depends_upon_implicit_timezone is
			-- Set expression to depend upon implicit time zone.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsic_dependencies.put (True, 10)
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		end

	set_depends_upon_xslt_context is
			-- Set expression to depend upon XSLT context.
		do
				set_depends_upon_current_item
				set_depends_upon_current_group
				set_depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_xslt_context is
			-- Set expression to intrinsically depend upon XSLT context.
		do
				set_intrinsically_depends_upon_current_item
				set_intrinsically_depends_upon_current_group
				set_intrinsically_depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_focus is
			-- Set expression to intrinsically depend upon focus.
		do
			set_intrinsically_depends_upon_context_item
			set_intrinsically_depends_upon_position
			set_intrinsically_depends_upon_last
			set_intrinsically_depends_upon_context_document
		end

	set_focus_independent is
			-- mark expression as having no dependence on the focus.
		require
			dependencies_computed: are_dependencies_computed
		do
			set_context_document_independent
			set_last_independent
			set_position_independent
			set_context_item_independent
		ensure
			focus_independent: not depends_upon_focus
		end

feature -- Cardinality

	Cardinality_flag_count: INTEGER is 3
			-- Number of cardinality flags

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

	cardinality_is_empty: BOOLEAN is
			-- `True' if only an empty sequence is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := cardinality_allows_zero and then
			not cardinality_allows_one and then
			not cardinality_allows_many
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
			Result := (cardinality_allows_one or else cardinality_allows_zero)
				and then not cardinality_allows_many
		end

	cardinality_exactly_one: BOOLEAN is
			-- `True' iff a single value is allowed
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

	cardinality_subsumed_by (requested_cardinality: INTEGER): BOOLEAN is
			-- Are all cardinality options of `Current' permitted by `requested_cardinality'?
		do
			Result := INTEGER_.bit_or (requested_cardinality, cardinality) = requested_cardinality
		end

	occurence_indicator: STRING is
			-- Text of the occurence-indicator
		do
			if cardinality_allows_zero_or_more then
				Result := "*"
			elseif cardinality_allows_zero and then cardinality_allows_one then
				Result := "?"
			elseif cardinality_exactly_one or else cardinality_allows_zero then
				Result := ""
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
			create Result.make (1, Cardinality_flag_count)
			from
				a_counter := 1
			variant
				Cardinality_flag_count + 1 - a_counter
			until
				a_counter > Cardinality_flag_count
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
			cardinalities := BOOLEAN_ARRAY_.cloned_array (other.cardinalities)
			are_cardinalities_computed := True
		ensure
			-- TODO - check equality set: cardinalities = other.cardinalities
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinalities (a_card: ARRAY [BOOLEAN]) is
		require
			cardinalities_not_void: a_card /= Void and then a_card.count = Cardinality_flag_count
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
				create cardinalities.make (1, Cardinality_flag_count)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 1)
			cardinalities.put (False, 2)
			cardinalities.put (False, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_optional is
			-- Allow zero or one items
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1, Cardinality_flag_count)
				are_cardinalities_computed := True
			end
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			cardinalities.put (False, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_zero_or_more is
			-- Allow any number of items
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1, Cardinality_flag_count)
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
				create cardinalities.make (1, Cardinality_flag_count)
				are_cardinalities_computed := True
			end
			cardinalities.put (False, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_many is
			-- Allow only more than one item.
			-- (Actually treated as one or more for now - only XM_XPATH_INTEGER_RANGE uses it)
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1, Cardinality_flag_count)
				are_cardinalities_computed := True
			end
			cardinalities.put (False, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_exactly_one is
			-- Allow exactly one item
		do
			if not are_cardinalities_computed then
				create cardinalities.make (1, Cardinality_flag_count)
				are_cardinalities_computed := True
			end
			cardinalities.put (False, 1)
			cardinalities.put (True, 2)
			cardinalities.put (False, 3)
		ensure
			cardinalities_computed: are_cardinalities_computed
		end

	set_cardinality_disallows_many is
			-- Forbid multiple items
		require
			cardinalities_computed: are_cardinalities_computed
		do
			cardinalities.put (False, 3)
		end

feature -- Special properties

	Special_properties_flag_count: INTEGER is 8
			-- Number of special property flags

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

	non_creating: BOOLEAN is
			-- Expression property: this is `True' in the case of an expression that
			--  will never return newly created nodes, nor a value that depends on the identity
			--  of newly created nodes (for example generate-id(new-node())). Expressions
			--  that do create new nodes cannot be moved out of loops as this could cause
			--  too few nodes to be created: for example if f() creates a new node, then
			--  count(for $i in 1 to 5 return f()) must be 5.
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (7)
		end

	single_document_nodeset: BOOLEAN is
			-- Expression property: this is `True' in the case of an expression that delivers
			--  a set of nodes that are all in the same document (not necessarily the same
			--  document as the context node).
		require
			special_properties_computed: are_special_properties_computed
		do
			Result := special_properties.item (8)
		end


feature -- Setting special properties

	initialize_special_properties is
			-- initialize `special_properties' to nothing special.
		require
			special_properties_not_computed: not are_special_properties_computed
		do
			create special_properties.make (1, Special_properties_flag_count)
			are_special_properties_computed := True
		ensure
			special_properties_computed: are_special_properties_computed
		end

	clone_special_properties (other: XM_XPATH_STATIC_PROPERTY) is
			-- Set `special_properties' from `other'.
		require
			other_special_properties: other /= Void and then other.are_special_properties_computed
		do
			special_properties := BOOLEAN_ARRAY_.cloned_array (other.special_properties)
			are_special_properties_computed := True
		ensure
			-- TODO - equality check set: special_properties = other.special_properties
			special_properties_computed: are_special_properties_computed
		end

	mask_special_properties (other: XM_XPATH_STATIC_PROPERTY) is
			-- `And' `special_properties' from `other'.
		require
			special_properties_computed: are_special_properties_computed
			other_special_properties: other /= Void and then other.are_special_properties_computed
		local
			an_index: INTEGER
		do
			from
				an_index := 1
			variant
				special_properties.count + 1 - an_index
			until
				an_index > special_properties.count
			loop
				special_properties.put (other.special_properties.item (an_index) and special_properties.item (an_index), an_index)
				an_index := an_index + 1
			end
		end

	set_special_properties (properties: ARRAY [BOOLEAN]) is
		require
			properties_not_void: properties /= Void and then properties.count = Special_properties_flag_count
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

	reset_context_document_nodeset is
			-- Don't guarentee nodes in the result are all to be in the same document as the context node.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (False, 1)
		ensure
			not_context_document_nodeset: not context_document_nodeset
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

	reset_ordered_nodeset is
			-- Don't guarentee nodes in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (False, 2)
		ensure
			not_ordered_nodeset: not ordered_nodeset
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

	reset_reverse_document_order is
			-- Don't guarentee delivers items in reverse of correct order,
			--  when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (False, 3)
		ensure
			not_reverse_document_order: not reverse_document_order
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

	set_non_creating is
			-- Mark `Current' as never creating new nodes.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 7)
		ensure
			non_creating: non_creating
		end

	set_creating is
			-- Re-mark `Current' as possibly creating new nodes.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (False, 7)
		ensure
			creating: not non_creating
		end

	set_single_document_nodeset is
			-- Mark `Current' as a nodeset all contained by a single document.
		require
			special_properties_computed: are_special_properties_computed
		do
			special_properties.put (True, 8)
		ensure
			single_document_nodeset: single_document_nodeset
		end

invariant

	special_properties: are_special_properties_computed implies special_properties /= Void and then special_properties.count = Special_properties_flag_count
	intrinsic_dependencies: are_intrinsic_dependencies_computed implies intrinsic_dependencies /= Void and then intrinsic_dependencies.count = Dependency_flag_count
	dependencies: are_dependencies_computed implies dependencies /= Void and then dependencies.count = Dependency_flag_count
	cardinalities: are_cardinalities_computed implies cardinalities /= Void and then cardinalities.count = Cardinality_flag_count
	
end
