note

	description:

		"Properties of XPath expressions which affect optimization"

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

	-- TODO: some of these setters are not used - remove them to reduce compilation time

feature -- Status report

	are_intrinsic_dependencies_computed: BOOLEAN
			-- Have intrinsic dependencies been computed yet?

	are_dependencies_computed: BOOLEAN
			-- Have dependencies been computed yet?

	are_cardinalities_computed: BOOLEAN
			-- Have `cardinalities' been computed yet?

	are_special_properties_computed: BOOLEAN
			-- Have `special_properties' been computed yet?

	are_static_properties_computed: BOOLEAN
			-- Have all static properties been computed?
		do
			Result := are_dependencies_computed and then are_cardinalities_computed and then are_special_properties_computed
		end

feature -- Status setting

	reinitialize_all_static_properties
			-- Re-initialize all static properties to `False'
		do
			are_dependencies_computed := False
			are_intrinsic_dependencies_computed := False
			are_cardinalities_computed := False
			are_special_properties_computed := False
			depends_upon_current_item := False
			depends_upon_context_item := False
			depends_upon_position := False
			depends_upon_last := False
			depends_upon_context_document := False
			depends_upon_current_group	:= False
			depends_upon_regexp_group := False
			depends_upon_local_variables := False
			depends_upon_user_functions := False
			depends_upon_implicit_timezone := False
			depends_upon_xslt_context :=False
			intrinsically_depends_upon_current_item := False
			intrinsically_depends_upon_context_item := False
			intrinsically_depends_upon_position := False
			intrinsically_depends_upon_last := False
			intrinsically_depends_upon_context_document := False
			intrinsically_depends_upon_current_group := False
			intrinsically_depends_upon_regexp_group := False
			intrinsically_depends_upon_local_variables := False
			intrinsically_depends_upon_user_functions := False
			intrinsically_depends_upon_implicit_timezone := False
			intrinsically_depends_upon_xslt_context := False
			cardinality_allows_zero := False
			cardinality_allows_one := False
			cardinality_allows_many := False
			are_special_properties_computed := False
			context_document_nodeset := False
			ordered_nodeset := False
			reverse_document_order := False
			peer_nodeset := False
			subtree_nodeset := False
			attribute_ns_nodeset := False
			non_creating := False
			single_document_nodeset := False
		end

feature -- Dependencies

		-- These attributes are only meaningfull if `are_dependencies_computed' = `True'

	depends_upon_current_item: BOOLEAN
		-- Expression depends upon value of fn:current()

	depends_upon_context_item: BOOLEAN
		-- Expression depends upon context item

	depends_upon_position: BOOLEAN
		-- Expression depends upon context position

	depends_upon_last: BOOLEAN
		-- Expression depends upon value of fn:last()

	depends_upon_context_document: BOOLEAN
		-- Expression depends upon document containing context item

	depends_upon_current_group: BOOLEAN
		-- Expression depends upon value of fn:current-group() and/or fn:current-grouping-key()

	depends_upon_regexp_group: BOOLEAN
		-- Expression depends upon value of fn:regexp-group()

	depends_upon_local_variables: BOOLEAN
		-- Expression depends upon values of local variables

	depends_upon_user_functions: BOOLEAN
		-- Expression depends upon results from user functions

	depends_upon_implicit_timezone: BOOLEAN
		-- Expression depends upon value of implicit time zone

	depends_upon_xslt_context: BOOLEAN
			-- Expression depends upon XSLT-specific parts of dynamic context

	intrinsically_depends_upon_current_item: BOOLEAN
		-- Expression intrinsically depends upon value of fn:current()

	intrinsically_depends_upon_context_item: BOOLEAN
		-- Expression intrinsically depends upon context item

	intrinsically_depends_upon_position: BOOLEAN
		-- Expression intrinsically depends upon context position

	intrinsically_depends_upon_last: BOOLEAN
		-- Expression intrinsically depends upon value of fn:last()

	intrinsically_depends_upon_context_document: BOOLEAN
		-- Expression intrinsically depends upon document containing context item

	intrinsically_depends_upon_current_group: BOOLEAN
		-- Expression intrinsically depends upon value of fn:current-group() and/or fn:current-grouping-key()

	intrinsically_depends_upon_regexp_group: BOOLEAN
		-- Expression intrinsically depends upon value of fn:regexp-group()

	intrinsically_depends_upon_local_variables: BOOLEAN
		-- Expression intrinsically depends upon values of local variables

	intrinsically_depends_upon_user_functions: BOOLEAN
		-- Expression intrinsically depends upon results from user functions

	intrinsically_depends_upon_implicit_timezone: BOOLEAN
		-- Expression intrinsically depends upon value of implicit time zone

	intrinsically_depends_upon_xslt_context: BOOLEAN
			-- Expression intrinsically depends upon XSLT-specific parts of dynamic context

	depends_upon_focus: BOOLEAN
			-- Expression depends upon focus
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := depends_upon_context_item
				or depends_upon_position
				or depends_upon_last
				or depends_upon_context_document
		end

	depends_upon_non_document_focus: BOOLEAN
			-- Expression depends upon focus, but not the current document
		require
			dependencies_computed: are_dependencies_computed
		do
			Result := depends_upon_context_item
				or depends_upon_position
				or depends_upon_last
		end

feature -- Setting dependencies

	initialize_dependencies
			-- Inititialize to no dependencies.
		require
			dependencies_not_computed: not are_dependencies_computed
		do
			are_dependencies_computed := True
			-- we rely on default initialization of BOOLEANs to `False'
		ensure
			dependencies_computed: are_dependencies_computed
			independent_of_current_item: not depends_upon_current_item
			independent_of_context_item: not depends_upon_context_item
			independent_of_position: not depends_upon_position
			independent_of_last: not depends_upon_last
			independent_of_context_document: not depends_upon_context_document
			independent_of_current_group: not depends_upon_current_group
			independent_of_regexp_group:	not depends_upon_regexp_group
			independent_of_local_variables: not depends_upon_local_variables
			independent_of_user_functions: not depends_upon_user_functions
			independent_of_implicit_timezone: not depends_upon_implicit_timezone
			independent_of_xslt_context: not depends_upon_xslt_context
		end

	initialize_intrinsic_dependencies
			-- Inititialize to no intrinsic dependencies.
		require
			intrinsic_dependencies_not_computed: not are_intrinsic_dependencies_computed
		do
			are_intrinsic_dependencies_computed := True
			-- we rely on default initialization of BOOLEANs to `False'
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			independent_of_current_item: not intrinsically_depends_upon_current_item
			independent_of_context_item: not intrinsically_depends_upon_context_item
			independent_of_position: not intrinsically_depends_upon_position
			independent_of_last: not intrinsically_depends_upon_last
			independent_of_context_document: not intrinsically_depends_upon_context_document
			independent_of_current_group: not intrinsically_depends_upon_current_group
			independent_of_regexp_group:	not intrinsically_depends_upon_regexp_group
			independent_of_local_variables: not intrinsically_depends_upon_local_variables
			independent_of_user_functions: not intrinsically_depends_upon_user_functions
			independent_of_implicit_timezone: not intrinsically_depends_upon_implicit_timezone
			independent_of_xslt_context: not intrinsically_depends_upon_xslt_context
		end

	initialize_dependencies_from_intrinsic_dependencies
			-- Set all dependencies to values of intrinsic dependencies
		require
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
		do
			are_dependencies_computed := True
			depends_upon_current_item := intrinsically_depends_upon_current_item
			depends_upon_context_item := intrinsically_depends_upon_context_item
			depends_upon_position := intrinsically_depends_upon_position
			depends_upon_last := intrinsically_depends_upon_last
			depends_upon_context_document := intrinsically_depends_upon_context_document
			depends_upon_current_group	:= intrinsically_depends_upon_current_group
			depends_upon_regexp_group := intrinsically_depends_upon_regexp_group
			depends_upon_local_variables := intrinsically_depends_upon_local_variables
			depends_upon_user_functions := intrinsically_depends_upon_user_functions
			depends_upon_implicit_timezone := intrinsically_depends_upon_implicit_timezone
			depends_upon_xslt_context := intrinsically_depends_upon_xslt_context
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_current_item_set: depends_upon_current_item = intrinsically_depends_upon_current_item
			depends_upon_context_item_set: depends_upon_context_item = intrinsically_depends_upon_context_item
			depends_upon_position_set: depends_upon_position = intrinsically_depends_upon_position
			depends_upon_last_set: depends_upon_last = intrinsically_depends_upon_last
			depends_upon_context_document_set: depends_upon_context_document = intrinsically_depends_upon_context_document
			depends_upon_current_group_set: depends_upon_current_group	= intrinsically_depends_upon_current_group
			depends_upon_regexp_group_set: depends_upon_regexp_group = intrinsically_depends_upon_regexp_group
			depends_upon_local_variables_set: depends_upon_local_variables = intrinsically_depends_upon_local_variables
			depends_upon_user_functions_set: depends_upon_user_functions = intrinsically_depends_upon_user_functions
			depends_upon_implicit_timezone_set: depends_upon_implicit_timezone = intrinsically_depends_upon_implicit_timezone
			depends_upon_xslt_context_set: depends_upon_xslt_context = intrinsically_depends_upon_xslt_context
		end

	set_dependencies (a_other: XM_XPATH_STATIC_PROPERTY)
			-- Set all dependencies from `a_other'.
		require
			a_other_not_void: a_other /= Void
		do
			are_dependencies_computed := True
			depends_upon_current_item := a_other.depends_upon_current_item
			depends_upon_context_item := a_other.depends_upon_context_item
			depends_upon_position := a_other.depends_upon_position
			depends_upon_last := a_other.depends_upon_last
			depends_upon_context_document := a_other.depends_upon_context_document
			depends_upon_current_group := a_other.depends_upon_current_group
			depends_upon_regexp_group := a_other.depends_upon_regexp_group
			depends_upon_local_variables := a_other.depends_upon_local_variables
			depends_upon_user_functions := a_other.depends_upon_user_functions
			depends_upon_implicit_timezone := a_other.depends_upon_implicit_timezone
			depends_upon_xslt_context := a_other.depends_upon_xslt_context
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_current_item_set: depends_upon_current_item = a_other.depends_upon_current_item
			depends_upon_context_item_set: depends_upon_context_item = a_other.depends_upon_context_item
			depends_upon_position_set: depends_upon_position = a_other.depends_upon_position
			depends_upon_last_set: depends_upon_last = a_other.depends_upon_last
			depends_upon_context_document_set: depends_upon_context_document = a_other.depends_upon_context_document
			depends_upon_current_group_set: depends_upon_current_group = a_other.depends_upon_current_group
			depends_upon_regexp_group_set: depends_upon_regexp_group = a_other.depends_upon_regexp_group
			depends_upon_local_variables_set: depends_upon_local_variables = a_other.depends_upon_local_variables
			depends_upon_user_functions_set: depends_upon_user_functions = a_other.depends_upon_user_functions
			depends_upon_implicit_timezone_set: depends_upon_implicit_timezone = a_other.depends_upon_implicit_timezone
			depends_upon_xslt_context_set: depends_upon_xslt_context = a_other.depends_upon_xslt_context
		end

	merge_dependencies (a_other: XM_XPATH_STATIC_PROPERTY)
		-- Merge all dependencies from `a_other' into current.
		require
			dependencies_not_void: a_other /= Void
			dependencies_computed: are_dependencies_computed
		do
			if a_other.depends_upon_current_item then
				set_depends_upon_current_item
			end
			if a_other.depends_upon_context_item then
				set_depends_upon_context_item
			end
			if a_other.depends_upon_position then
				set_depends_upon_position
			end
			if a_other.depends_upon_last then
				set_depends_upon_last
			end
			if a_other.depends_upon_context_document then
				set_depends_upon_context_document
			end
			if a_other.depends_upon_current_group then
				set_depends_upon_current_group
			end
			if a_other.depends_upon_regexp_group then
				set_depends_upon_regexp_group
			end
			if a_other.depends_upon_local_variables then
				set_depends_upon_local_variables
			end
			if a_other.depends_upon_user_functions then
				set_depends_upon_user_functions
			end
			if a_other.depends_upon_implicit_timezone then
				set_depends_upon_implicit_timezone
			end
			if a_other.depends_upon_xslt_context then
				set_depends_upon_xslt_context
			end
		ensure
			depends_upon_current_item_set: (a_other.depends_upon_current_item or old depends_upon_current_item) implies depends_upon_current_item
			depends_upon_context_item_set: (a_other.depends_upon_context_item or old depends_upon_context_item) implies depends_upon_context_item
			depends_upon_position_set: (a_other.depends_upon_position or old depends_upon_position) implies depends_upon_position
			depends_upon_last_set: (a_other.depends_upon_last or old depends_upon_last) implies depends_upon_last
			depends_upon_context_document_set: (a_other.depends_upon_context_document or old depends_upon_context_document) implies depends_upon_context_document
			depends_upon_current_group_set: (a_other.depends_upon_current_group or old depends_upon_current_group) implies depends_upon_current_group
			depends_upon_regexp_group_set: (a_other.depends_upon_regexp_group or old depends_upon_regexp_group) implies depends_upon_regexp_group
			depends_upon_local_variables_set: (a_other.depends_upon_local_variables or old depends_upon_local_variables) implies depends_upon_local_variables
			depends_upon_user_functions_set: (a_other.depends_upon_user_functions or old depends_upon_user_functions) implies depends_upon_user_functions
			depends_upon_implicit_timezone_set: (a_other.depends_upon_implicit_timezone or old depends_upon_implicit_timezone) implies depends_upon_implicit_timezone
			depends_upon_xslt_context_set: (a_other.depends_upon_xslt_context or old depends_upon_xslt_context) implies depends_upon_xslt_context
		end

	set_depends_upon_current_item
			-- Set expression to depend upon current item.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_current_item := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_current_item: depends_upon_current_item
		end

	set_intrinsically_depends_upon_current_item
			-- Set expression to depend upon current item.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_current_item := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_current_item: intrinsically_depends_upon_current_item
		end

	set_depends_upon_context_item
		-- Set expression to depend upon context item.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_context_item := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_context_item: depends_upon_context_item
		end

	set_context_item_independent
			-- Set expression to be independent of context item.
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_context_item := False
		ensure
			context_item_independent: not depends_upon_context_item
		end

	set_intrinsically_depends_upon_context_item
			-- Set expression to depend upon context item.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_context_item := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_context_item: intrinsically_depends_upon_context_item
		end

	set_depends_upon_position
		-- Set expression to depend upon context position.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_position := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_position: depends_upon_position
		end

	set_position_independent
			-- Set expression to be independent of context position.
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_position := False
		ensure
			position_independent: not depends_upon_position
		end

	set_intrinsically_depends_upon_position
			-- Set expression to depend upon context position.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_position := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_position: intrinsically_depends_upon_position
		end

	set_depends_upon_last
		-- Set expression to depend upon last.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_last := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_last: depends_upon_last
		end

	set_intrinsically_depends_upon_last
			-- Set expression to depend upon last.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_last := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_last: intrinsically_depends_upon_last
		end

	set_last_independent
			-- Set expression to be independent of last.
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_last := False
		ensure
			context_item_independent: not depends_upon_last
		end

	set_depends_upon_context_document
		-- Set expression to depend upon context document.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_context_document := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_context_document: depends_upon_context_document
		end

	set_intrinsically_depends_upon_context_document
			-- Set expression to depend upon context document.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_context_document := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_context_document: intrinsically_depends_upon_context_document
		end

	set_context_document_independent
			-- Set expression to be independent of context document.
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_context_document := False
		ensure
			context_item_independent: not depends_upon_context_document
		end

	set_depends_upon_current_group
			-- Set expression to depend upon current-group() and/or current-grouping-key() and/or regex-group().
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_current_group := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_current_group: depends_upon_current_group
		end

	set_intrinsically_depends_upon_current_group
			-- Set expression to depend upon current-group() and/or current-grouping-key() and/or regex-group().
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_current_group := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_current_group: intrinsically_depends_upon_current_group
		end

	set_current_group_independent
			-- Set expression to be independent of current_group.
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_current_group := False
		ensure
			context_item_independent: not depends_upon_current_group
		end

	set_depends_upon_regexp_group
			-- Set expression to depend upon regexp-group().
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_regexp_group := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_regexp_group: depends_upon_regexp_group
		end

	set_regexp_group_independent
			-- Set expression to be independent of regexp-group().
		require
			dependencies_computed: are_dependencies_computed
		do
			depends_upon_regexp_group := False
		ensure
			regexp_group_independent: not depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_regexp_group
			-- Set expression to depend upon regexp-group().
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_regexp_group := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_regexp_group: intrinsically_depends_upon_regexp_group
		end

	set_depends_upon_local_variables
			-- Set expression to depend upon local variables.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_local_variables := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_local_variables: depends_upon_local_variables
		end

	set_intrinsically_depends_upon_local_variables
			-- Set expression to depend upon local variables.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_local_variables := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_local_variables: intrinsically_depends_upon_local_variables
		end

	set_depends_upon_user_functions
			-- Set expression to depend upon user functions.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_user_functions := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_user_functions: depends_upon_user_functions
		end

	set_intrinsically_depends_upon_user_functions
			-- Set expression to depend upon user functions.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_user_functions := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_user_functions: intrinsically_depends_upon_user_functions
		end

	set_depends_upon_implicit_timezone
			-- Set expression to depend upon implicit time zone.
		do
			if not are_dependencies_computed then
				initialize_dependencies
			end
			depends_upon_implicit_timezone := True
		ensure
			dependencies_computed: are_dependencies_computed
			depends_upon_implicit_timezone: depends_upon_implicit_timezone
		end

	set_intrinsically_depends_upon_implicit_timezone
			-- Set expression to depend upon implicit time zone.
		do
			if not are_intrinsic_dependencies_computed then
				initialize_intrinsic_dependencies
			end
			intrinsically_depends_upon_implicit_timezone := True
		ensure
			intrinsic_dependencies_computed: are_intrinsic_dependencies_computed
			intrinsically_depends_upon_implicit_timezone: intrinsically_depends_upon_implicit_timezone
		end

	set_depends_upon_xslt_context
			-- Set expression to depend upon XSLT context.
		do
				set_depends_upon_current_item
				set_depends_upon_current_group
				set_depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_xslt_context
			-- Set expression to intrinsically depend upon XSLT context.
		do
				set_intrinsically_depends_upon_current_item
				set_intrinsically_depends_upon_current_group
				set_intrinsically_depends_upon_regexp_group
		end

	set_intrinsically_depends_upon_focus
			-- Set expression to intrinsically depend upon focus.
		do
			set_intrinsically_depends_upon_context_item
			set_intrinsically_depends_upon_position
			set_intrinsically_depends_upon_last
			set_intrinsically_depends_upon_context_document
		end

	set_focus_independent
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

	cardinality: INTEGER
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
			elseif cardinality_allows_many then
				Result := Required_cardinality_many
			else
					check
						empty: cardinality_allows_zero and not cardinality_allows_many and not cardinality_allows_one
						-- only remaining possibility
					end
				Result := Required_cardinality_empty
			end
		ensure
			valid_cardinality: is_valid_required_cardinality (Result)
		end

	-- These attributes are only meaningfull if `are_cardinalities_computed' = `True'

	cardinality_allows_zero: BOOLEAN
			-- `True' if an empty sequence is allowed

	cardinality_allows_one: BOOLEAN
		-- `True' if a single value is allowed

	cardinality_allows_many: BOOLEAN
			-- `True' if multiple values are allowed

	cardinality_is_empty: BOOLEAN
			-- `True' if only an empty sequence is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := (cardinality_allows_zero and
				not cardinality_allows_one and
				not cardinality_allows_many)
		ensure
			definition: Result = (cardinality_allows_zero and not cardinality_allows_one and not cardinality_allows_many)
		end

	cardinality_allows_zero_or_one: BOOLEAN
		do
			Result := (cardinality_allows_one or cardinality_allows_zero)
				and not cardinality_allows_many
		ensure
			definition: Result = (cardinality_allows_zero or cardinality_allows_one) and not cardinality_allows_many
		end

	cardinality_exactly_one: BOOLEAN
			-- `True' iff a single value is allowed
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := (cardinality_allows_one and (not cardinality_allows_zero) and
				(not cardinality_allows_many))
		ensure
			definition: Result = (cardinality_allows_one and (not cardinality_allows_zero) and (not cardinality_allows_many))
		end


	cardinality_allows_one_or_more: BOOLEAN
			-- Occurrence indicator for one or more (+)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := (not cardinality_allows_zero and
				cardinality_allows_one and
				cardinality_allows_many)
		end

	cardinality_allows_zero_or_more: BOOLEAN
			-- Occurrence indicator for zero or more (*)
		require
			cardinalities_computed: are_cardinalities_computed
		do
			Result := (cardinality_allows_zero and
				cardinality_allows_one and
				cardinality_allows_many)
		ensure
			definition: Result = (cardinality_allows_zero and cardinality_allows_one and cardinality_allows_many)
		end

	cardinality_subsumes (requested_cardinality: INTEGER): BOOLEAN
			-- Are all options of `requested_cardinality' permitted by `Current'?
		do
			inspect
				requested_cardinality
			when Required_cardinality_empty then
				Result := cardinality_allows_zero
			when Required_cardinality_optional then
				Result := cardinality_allows_zero and cardinality_allows_one
			when Required_cardinality_exactly_one then
				Result := cardinality_allows_one
			when Required_cardinality_one_or_more then
				Result := cardinality_allows_one and cardinality_allows_many
			when Required_cardinality_zero_or_more then
				Result := cardinality_allows_zero_or_more
			when Required_cardinality_many then
				Result := cardinality_allows_many
			end
		end

	cardinality_subsumed_by (requested_cardinality: INTEGER): BOOLEAN
			-- Are all cardinality options of `Current' permitted by `requested_cardinality'?
		do
			Result := INTEGER_.bit_or (requested_cardinality, cardinality) = requested_cardinality
		end

	occurrence_indicator: STRING
			-- Text of the occurrence-indicator
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

	merged_cardinalities (a_other: XM_XPATH_STATIC_PROPERTY): INTEGER
			-- Merger of `cardinalities' with more_cardinalities'
		require
			a_other_not_void: a_other /= Void
		local
			l_zero, l_one, l_many: BOOLEAN
		do
			l_zero := cardinality_allows_zero and a_other.cardinality_allows_zero
			l_one := cardinality_allows_one and a_other.cardinality_allows_one
			l_many := cardinality_allows_many and a_other.cardinality_allows_many
			Result := cardinalities_to_integer (l_zero, l_one, l_many)
		ensure
			valid_cardinality: is_valid_required_cardinality (Result)
		end

	set_cardinalities (a_other: XM_XPATH_STATIC_PROPERTY)
		require
			cardinalities_not_void: a_other /= Void
		do
			are_cardinalities_computed := True
			cardinality_allows_zero := a_other.cardinality_allows_zero
			cardinality_allows_one := a_other.cardinality_allows_one
			cardinality_allows_many := a_other.cardinality_allows_many
		ensure
			computed: are_cardinalities_computed
			cardinality_allows_zero_set: cardinality_allows_zero = a_other.cardinality_allows_zero
			cardinality_allows_one_set: cardinality_allows_one = a_other.cardinality_allows_one
			cardinality_allows_many_set: cardinality_allows_many = a_other.cardinality_allows_many
		end

	set_cardinality (a_cardinality: INTEGER)
			-- Set cardinality to `a_cardinality'.
		require
			valid_cardinality: is_valid_required_cardinality (a_cardinality)
		do
			inspect
				a_cardinality
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
			when Required_cardinality_many then
				set_cardinality_many
			end
		ensure
			cardinalities_computed: are_cardinalities_computed
			cardinality_set: cardinality = a_cardinality
		end

	set_cardinality_empty
			-- Allow no items
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := True
			cardinality_allows_one := False
			cardinality_allows_many := False
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_allowed: cardinality_allows_zero = True
			one_disallowed: cardinality_allows_one = False
			many_disallowed: cardinality_allows_many = False
		end

	set_cardinality_optional
			-- Allow zero or one items
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := True
			cardinality_allows_one := True
			cardinality_allows_many := False
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_allowed: cardinality_allows_zero = True
			one_allowed: cardinality_allows_one = True
			many_disallowed: cardinality_allows_many = False
		end

	set_cardinality_zero_or_more
			-- Allow any number of items
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := True
			cardinality_allows_one := True
			cardinality_allows_many := True
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_allowed: cardinality_allows_zero = True
			one_allowed: cardinality_allows_one = True
			many_allowed: cardinality_allows_many = True
		end

	set_cardinality_one_or_more
			-- Allow any number of items other than zero
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := False
			cardinality_allows_one := True
			cardinality_allows_many := True
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_disallowed: cardinality_allows_zero = False
			one_allowed: cardinality_allows_one = True
			many_allowed: cardinality_allows_many = True
		end

	set_cardinality_many
			-- Allow more than one item.
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := True
			cardinality_allows_one := True
			cardinality_allows_many := True
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_disallowed: cardinality_allows_zero = True
			one_allowed: cardinality_allows_one = True
			many_allowed: cardinality_allows_many = True
		end

	set_cardinality_exactly_one
			-- Allow exactly one item
		do
			if not are_cardinalities_computed then
				are_cardinalities_computed := True
			end
			cardinality_allows_zero := False
			cardinality_allows_one := True
			cardinality_allows_many := False
		ensure
			cardinalities_computed: are_cardinalities_computed
			zero_disallowed: cardinality_allows_zero = False
			one_allowed: cardinality_allows_one = True
			many_disallowed: cardinality_allows_many = False
		end

	set_cardinality_disallows_many
			-- Forbid multiple items
		require
			cardinalities_computed: are_cardinalities_computed
		do
			cardinality_allows_many := False
		ensure
			many_disallowed: cardinality_allows_many = False
		end

	set_cardinality_allows_zero
			-- Allow zero items
		require
			cardinalities_computed: are_cardinalities_computed
		do
			cardinality_allows_zero := True
		ensure
			zero_allowed: cardinality_allows_zero = True
		end

feature -- Special properties

		-- These attributes are only meaningfull if `are_special_properties_computed' = `True'

	context_document_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes in the result are
			-- guaranteed all to be in the same document as the context node. For
			-- expressions that return values other than nodes, the setting is undefined.

	ordered_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression whose item type is node, when the nodes
			-- in the result are in document order.

	reverse_document_order: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression that delivers items in the reverse
			-- of correct order, when unordered retrieval is requested.

	peer_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that no node in the
			-- set will be an ancestor of any other. This property is useful in deciding whether the
			-- results of a path expression are pre-sorted. The property is only used in the case where
			-- the `Naturally_sorted' property is true, so there is no point in setting it in other cases.

	subtree_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be a descendant or self, or attribute or namespace, of the context node

	attribute_ns_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of
			-- an expression that delivers a set of nodes with the guarantee that every node in the
			-- result will be an attribute or namespace of the context node

	non_creating: BOOLEAN
			-- Expression property: this is `True' in the case of an expression that
			--  will never return newly created nodes, nor a value that depends on the identity
			--  of newly created nodes (for example generate-id(new-node())). Expressions
			--  that do create new nodes cannot be moved out of loops as this could cause
			--  too few nodes to be created: for example if f() creates a new node, then
			--  count(for $i in 1 to 5 return f()) must be 5.

	single_document_nodeset: BOOLEAN
			-- Expression property: this is `True' in the case of an expression that delivers
			--  a set of nodes that are all in the same document (not necessarily the same
			--  document as the context node).

feature -- Setting special properties

	initialize_special_properties
			-- initialize `special_properties' to nothing special.
		require
			special_properties_not_computed: not are_special_properties_computed
		do
			are_special_properties_computed := True
		ensure
			special_properties_computed: are_special_properties_computed
		end

	clone_special_properties (a_other: XM_XPATH_STATIC_PROPERTY)
			-- Set special properties from `a_other'.
		require
			a_other_not_void: a_other /= Void
			a_other_has_special_properties: a_other.are_special_properties_computed
		do
			are_special_properties_computed := True
			context_document_nodeset := a_other.context_document_nodeset
			ordered_nodeset := a_other.ordered_nodeset
			reverse_document_order := a_other.reverse_document_order
			peer_nodeset := a_other.peer_nodeset
			subtree_nodeset := a_other.subtree_nodeset
			attribute_ns_nodeset := a_other.attribute_ns_nodeset
			non_creating := a_other.non_creating
			single_document_nodeset := a_other.single_document_nodeset
		ensure
			special_properties_computed: are_special_properties_computed
			context_document_nodeset_set: context_document_nodeset = a_other.context_document_nodeset
			ordered_nodeset_set: ordered_nodeset = a_other.ordered_nodeset
			reverse_document_order_set: reverse_document_order = a_other.reverse_document_order
			peer_nodeset_set: peer_nodeset = a_other.peer_nodeset
			subtree_nodeset_set: subtree_nodeset = a_other.subtree_nodeset
			attribute_ns_nodeset_set: attribute_ns_nodeset = a_other.attribute_ns_nodeset
			non_creating_set: non_creating = a_other.non_creating
			single_document_nodeset_set: single_document_nodeset = a_other.single_document_nodeset
		end

	mask_special_properties (a_other: XM_XPATH_STATIC_PROPERTY)
			-- `And' special properties from `a_other'.
		require
			special_properties_computed: are_special_properties_computed
			a_other_not_void: a_other /= Void
			a_other_has_special_properties: a_other.are_special_properties_computed
		do
			context_document_nodeset := a_other.context_document_nodeset and context_document_nodeset
			ordered_nodeset := a_other.ordered_nodeset and ordered_nodeset
			reverse_document_order := a_other.reverse_document_order and reverse_document_order
			peer_nodeset := a_other.peer_nodeset and peer_nodeset
			subtree_nodeset := a_other.subtree_nodeset and subtree_nodeset
			attribute_ns_nodeset := a_other.attribute_ns_nodeset and attribute_ns_nodeset
			non_creating := a_other.non_creating and non_creating
			single_document_nodeset := a_other.single_document_nodeset and single_document_nodeset
		ensure
			context_document_nodeset_masked: context_document_nodeset = (a_other.context_document_nodeset and old context_document_nodeset)
			ordered_nodeset_masked: ordered_nodeset = (a_other.ordered_nodeset and old ordered_nodeset)
			reverse_document_order_masked: reverse_document_order = (a_other.reverse_document_order and old reverse_document_order)
			peer_nodeset_masked: peer_nodeset = (a_other.peer_nodeset and old peer_nodeset)
			subtree_nodeset_masked: subtree_nodeset = (a_other.subtree_nodeset and old subtree_nodeset)
			attribute_ns_nodeset_masked: attribute_ns_nodeset = (a_other.attribute_ns_nodeset and old attribute_ns_nodeset)
			non_creating_masked: non_creating = (a_other.non_creating and old non_creating)
			single_document_nodeset_masked: single_document_nodeset = (a_other.single_document_nodeset and old single_document_nodeset)
		end

	set_context_document_nodeset
			-- Guarentee nodes in the result are all to be in the same document as the context node.
		require
			special_properties_computed: are_special_properties_computed
		do
			context_document_nodeset := True
		ensure
			context_document_nodeset: context_document_nodeset
		end

	reset_context_document_nodeset
			-- Don't guarentee nodes in the result are all to be in the same document as the context node.
		require
			special_properties_computed: are_special_properties_computed
		do
			context_document_nodeset := False
		ensure
			not_context_document_nodeset: not context_document_nodeset
		end

	set_ordered_nodeset
			-- Guarentee nodes in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			ordered_nodeset := True
		ensure
			ordered_nodeset: ordered_nodeset
		end

	reset_ordered_nodeset
			-- Don't guarentee nodes in the result are in document order.
		require
			special_properties_computed: are_special_properties_computed
		do
			ordered_nodeset := False
		ensure
			not_ordered_nodeset: not ordered_nodeset
		end

	set_reverse_document_order
			-- Guarentee delivers items in reverse of correct order,
			--  when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			reverse_document_order := True
		ensure
			reverse_document_order: reverse_document_order
		end

	reset_reverse_document_order
			-- Don't guarentee delivers items in reverse of correct order,
			--  when unordered retrieval is requested.
		require
			special_properties_computed: are_special_properties_computed
		do
			reverse_document_order := False
		ensure
			not_reverse_document_order: not reverse_document_order
		end

	set_peer_nodeset
			-- Guarentee that no node in the
			-- set will be an ancestor of any other.
		require
			special_properties_computed: are_special_properties_computed
		do
			peer_nodeset := True
		ensure
			peer_nodeset: peer_nodeset
		end

	set_subtree_nodeset
			-- Guarentee every node in the result will be a descendant or self,
			--  or attribute or namespace, of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			subtree_nodeset := True
		ensure
			subtree_nodeset: subtree_nodeset
		end

	set_attribute_ns_nodeset
			-- Guarentee every node in the result will be
			--  an attribute or namespace of the context node
		require
			special_properties_computed: are_special_properties_computed
		do
			attribute_ns_nodeset := True
		ensure
			attribute_ns_nodeset: attribute_ns_nodeset
		end

	set_non_creating
			-- Mark `Current' as never creating new nodes.
		require
			special_properties_computed: are_special_properties_computed
		do
			non_creating := True
		ensure
			non_creating: non_creating
		end

	set_creating
			-- Re-mark `Current' as possibly creating new nodes.
		require
			special_properties_computed: are_special_properties_computed
		do
			non_creating := False
		ensure
			creating: not non_creating
		end

	set_single_document_nodeset
			-- Mark `Current' as a nodeset all contained by a single document.
		require
			special_properties_computed: are_special_properties_computed
		do
			single_document_nodeset := True
		ensure
			single_document_nodeset: single_document_nodeset
		end

end
