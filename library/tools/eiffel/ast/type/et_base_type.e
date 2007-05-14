indexing

	description:

		"Eiffel types directly based on a class"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BASE_TYPE

inherit

	ET_NAMED_TYPE
		redefine
			reset,
			is_named_type,
			is_base_type,
			has_anchored_type,
			has_formal_type,
			has_formal_types,
			direct_base_class,
			conforms_from_bit_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			reference_conforms_from_bit_type,
			reference_conforms_from_formal_parameter_type,
			reference_conforms_from_tuple_type,
			resolved_formal_parameters,
			is_valid_context_type
		end

	ET_TYPE_CONTEXT
		rename
			base_class as context_base_class,
			base_type as context_base_type,
			base_type_actual as context_base_type_actual,
			base_type_actual_parameter as context_base_type_actual_parameter,
			base_type_actual_count as context_base_type_actual_count,
			base_type_index_of_label as context_base_type_index_of_label,
			named_type as context_named_type,
			is_type_expanded as context_is_type_expanded,
			is_type_reference as context_is_type_reference,
			same_named_type as context_same_named_type,
			same_base_type as context_same_base_type,
			same_named_bit_type as context_same_named_bit_type,
			same_named_class_type as context_same_named_class_type,
			same_named_formal_parameter_type as context_same_named_formal_parameter_type,
			same_named_tuple_type as context_same_named_tuple_type,
			same_base_bit_type as context_same_base_bit_type,
			same_base_class_type as context_same_base_class_type,
			same_base_formal_parameter_type as context_same_base_formal_parameter_type,
			same_base_tuple_type as context_same_base_tuple_type,
			conforms_to_type as context_conforms_to_type,
			conforms_from_bit_type as context_conforms_from_bit_type,
			conforms_from_class_type as context_conforms_from_class_type,
			conforms_from_formal_parameter_type as context_conforms_from_formal_parameter_type,
			conforms_from_tuple_type as context_conforms_from_tuple_type,
			reference_conforms_to_type as reference_context_conforms_to_type,
			reference_conforms_from_bit_type as reference_context_conforms_from_bit_type,
			reference_conforms_from_class_type as reference_context_conforms_from_class_type,
			reference_conforms_from_formal_parameter_type as reference_context_conforms_from_formal_parameter_type,
			reference_conforms_from_tuple_type as reference_context_conforms_from_tuple_type,
			has_formal_type as context_has_formal_type,
			has_formal_types as context_has_formal_types,
			base_type_has_class as context_base_type_has_class,
			named_type_has_class as context_named_type_has_class
		redefine
			is_root_context
		end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

feature -- Initialization

	reset is
			-- Reset type as it was just after it was last parsed.
		local
			l_parameters: like actual_parameters
		do
			l_parameters := actual_parameters
			if l_parameters /= Void then
				l_parameters.reset
			end
		end

feature -- Access

	direct_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Class on which current type is directly based
			-- (e.g. a Class_type, a Tuple_type or a Bit_type);
			-- Return Void if not directly based on a class
			-- (e.g. Anchored_type). `a_universe' is the
			-- surrounding universe holding all classes.
		deferred
		ensure then
			direct_base_class_not_void: Result /= Void
		end

	actual_parameters: ET_ACTUAL_PARAMETER_LIST is
			-- Actual generic parameters
		do
			-- Result := Void
		end

	shallow_base_type (a_context: ET_BASE_TYPE; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', but where the actual generic parameters
			-- are not replaced by their named version and should still
			-- be considered as viewed from `a_context'
		do
			Result := Current
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		local
			an_actual: ET_TYPE
		do
			an_actual := actual_parameters.type (i)
			if a_context = Current then
					-- The current type is its own context,
					-- therefore it is its own base type (i.e all
					-- its actual generic parameters are named).
				Result ?= an_actual
			end
			if Result = Void then
				Result := an_actual.named_type (a_context, a_universe)
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		local
			an_actual: ET_ACTUAL_PARAMETER
		do
			an_actual := actual_parameters.actual_parameter (i)
			if a_context = Current then
					-- The current type is its own context,
					-- therefore it is its own base type (i.e all
					-- its actual generic parameters are named).
				Result := an_actual
			else
				Result := an_actual.named_parameter (a_context, a_universe)
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): INTEGER is
			-- Index of actual generic parameter with label `a_label'
			-- in the base type of current type when it appears in
			-- `a_context' in `a_universe';
			-- 0 if it does not exist
		do
			Result := index_of_label (a_label)
		end

	index_of_label (a_label: ET_IDENTIFIER): INTEGER is
			-- Index of actual generic parameter with label `a_label';
			-- 0 if it does not exist
		require
			a_label_not_void: a_label /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_parameters := actual_parameters
			if l_parameters /= Void then
				Result := l_parameters.index_of_label (a_label)
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= actual_parameter_count
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		do
			Result := actual_parameter_count
		end

	actual_parameter_count: INTEGER is
			-- Number of generic parameters
		local
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_actual_parameters := actual_parameters
			if l_actual_parameters /= Void then
				Result := l_actual_parameters.count
			end
		ensure
			non_negative_count: Result >= 0
			generic: actual_parameters /= Void implies Result = actual_parameters.count
			non_generic: actual_parameters = Void implies Result = 0
		end

feature -- Status report

	is_generic: BOOLEAN is
			-- Is current class type generic?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			Result := a_parameters /= Void and then not a_parameters.is_empty
		ensure
			definition: Result = (actual_parameters /= Void and then not actual_parameters.is_empty)
		end

	is_named_type: BOOLEAN is
			-- Is current type only made up of named types?
		local
			a_parameters: like actual_parameters
			i, nb: INTEGER
		do
			Result := True
			a_parameters := actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if not a_parameters.type (i).is_named_type then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_base_type: BOOLEAN is
			-- Is current type only made up of base types?
		local
			a_parameters: like actual_parameters
			i, nb: INTEGER
		do
			Result := True
			a_parameters := actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if not a_parameters.type (i).is_base_type then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_expanded: BOOLEAN is
			-- Is current type expanded?
		deferred
		end

	has_anchored_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type contain an anchored type
			-- when viewed from `a_context' in `a_universe'?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_anchored_type (a_context, a_universe)
			end
		end

	has_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain the formal generic parameter
			-- with index `i' when viewed from `a_context' in `a_universe'?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_formal_type (i, a_context, a_universe)
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context' in `a_universe'?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_formal_types (a_context, a_universe)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_base_class: ET_CLASS
			any_type: ET_CLASS_TYPE
		do
			a_base_class := other.direct_base_class (a_universe)
			if a_base_class.is_preparsed then
				Result := conforms_from_class_type (a_base_class, other_context, a_context, a_universe)
			end
			if not Result then
					-- See VNCB-1 (ETL2 p.229).
					-- "BIT N" conforms to "ANY", so "BIT N" conforms to current
					-- class type if "ANY" conforms to it.
				any_type := a_universe.any_class
				Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			an_index: INTEGER
			a_formal: ET_FORMAL_PARAMETER
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_constraint: ET_TYPE
			a_base_type: ET_BASE_TYPE
			any_type: ET_CLASS_TYPE
		do
			an_index := other.index
			a_formals := other_context.base_class (a_universe).formal_parameters
			if a_formals = Void or else an_index > a_formals.count then
					-- Internal error: does `other' type really
					-- appear in `other_context'?
				Result := False
			else
				a_formal := a_formals.formal_parameter (an_index)
				a_constraint := a_formal.constraint
				if a_constraint = Void then
						-- `a_formal' is implicitly constrained by "ANY",
						-- so it conforms to any type that conforms to "ANY".
					any_type := a_universe.any_type
					if a_universe.is_ise and then a_universe.ise_version <= ise_5_6_latest then
							-- Test below needed for compatibility with ISE 5.6.0610:
							-- expanded types don't conform to reference types, the possibly convert to them.
						if other.is_type_reference (other_context, a_universe) and is_type_reference (a_context, a_universe) then
							Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
						end
					else
						Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
					end
				else
					a_base_type := a_formal.constraint_base_type
					if a_base_type /= Void then
							-- The constraint of `a_formal' is not another formal
							-- parameter, or if it is there is no cycle and
							-- the resolved base type of this constraint has
							-- been made available in `base_type'.
						if a_universe.is_ise and then a_universe.ise_version <= ise_5_6_latest then
								-- Test below needed for compatibility with ISE 5.6.0610:
								-- expanded types don't conform to reference types, the possibly convert to them.
							if other.is_type_reference (other_context, a_universe) and is_type_reference (a_context, a_universe) then
								Result := a_base_type.conforms_to_type (Current, a_context, other_context, a_universe)
							end
						else
							Result := a_base_type.conforms_to_type (Current, a_context, other_context, a_universe)
						end
					else
							-- There is a cycle of the form "A [G -> H, H -> G]"
							-- in the constraint of `a_formal'. Therefore `other'
							-- can only conform to itself.
						Result := False
					end
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_base_class: ET_CLASS
		do
			a_base_class := other.direct_base_class (a_universe)
			if a_base_class.is_preparsed then
				Result := conforms_from_class_type (a_base_class, other_context, a_context, a_universe)
			end
			if not Result then
					-- If the base class of a Tuple_type conforms to
					-- current class type, then the Tuple_type itself
					-- conforms to it.
				Result := conforms_from_class_type (a_universe.tuple_class, other_context, a_context, a_universe)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_base_class: ET_CLASS
			any_type: ET_CLASS_TYPE
		do
			a_base_class := other.direct_base_class (a_universe)
			if a_base_class.is_preparsed then
				Result := reference_conforms_from_class_type (a_base_class, other_context, a_context, a_universe)
			end
			if not Result then
					-- See VNCB-1 (ETL2 p.229).
					-- "BIT N" conforms to "ANY", so "BIT N" conforms to current
					-- class type if "ANY" conforms to it.
				any_type := a_universe.any_class
				Result := reference_conforms_from_class_type (any_type, other_context, a_context, a_universe)
			end
		end

	reference_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			an_index: INTEGER
			a_formal: ET_FORMAL_PARAMETER
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_constraint: ET_TYPE
			a_base_type: ET_BASE_TYPE
			any_type: ET_CLASS_TYPE
		do
			an_index := other.index
			a_formals := other_context.base_class (a_universe).formal_parameters
			if a_formals = Void or else an_index > a_formals.count then
					-- Internal error: does `other' type really
					-- appear in `other_context'?
				Result := False
			else
				a_formal := a_formals.formal_parameter (an_index)
				a_constraint := a_formal.constraint
				if a_constraint = Void then
						-- `a_formal' is implicitly constrained by "ANY",
						-- so it conforms to any type that conforms to "ANY".
					any_type := a_universe.any_type
					Result := reference_conforms_from_class_type (any_type, other_context, a_context, a_universe)
				else
					a_base_type := a_formal.constraint_base_type
					if a_base_type /= Void then
							-- The constraint of `a_formal' is not another formal
							-- parameter, or if it is there is no cycle and
							-- the resolved base type of this constraint has
							-- been made available in `base_type'.
						Result := a_base_type.reference_conforms_to_type (Current, a_context, other_context, a_universe)
					else
							-- There is a cycle of the form "A [G -> H, H -> G]"
							-- in the constraint of `a_formal'. Therefore `other'
							-- can only conform to itself.
						Result := False
					end
				end
			end
		end

	reference_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_base_class: ET_CLASS
		do
			a_base_class := other.direct_base_class (a_universe)
			if a_base_class.is_preparsed then
				Result := reference_conforms_from_class_type (a_base_class, other_context, a_context, a_universe)
			end
			if not Result then
					-- If the base class of a Tuple_type conforms to
					-- current class type, then the Tuple_type itself
					-- conforms to it.
				Result := reference_conforms_from_class_type (a_universe.tuple_class, other_context, a_context, a_universe)
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_BASE_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := Current
		end

feature -- Type context

	root_context: ET_BASE_TYPE is
			-- Root context
		do
			Result := Current
		ensure then
			is_root: Result = Current
		end

	new_type_context (a_type: ET_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New type context made up of `a_type' in current context
		do
			create Result.make_with_capacity (Current, 1)
			Result.put_last (a_type)
		end

	context_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current context in `a_universe'
		do
			Result := direct_base_class (a_universe)
		ensure then
			definition: Result = direct_base_class (a_universe)
		end

	context_base_type (a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current context in `a_universe'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	context_base_type_actual (i: INTEGER; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of `base_type'
		do
			Result := base_type_actual (i, Current, a_universe)
		end

	context_base_type_actual_parameter (i: INTEGER; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of `base_type'
		do
			Result := base_type_actual_parameter (i, Current, a_universe)
		end

	context_base_type_actual_count (a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of `base_type'
		do
			Result := base_type_actual_count (Current, a_universe)
		end

	context_base_type_index_of_label (a_label: ET_IDENTIFIER; a_universe: ET_UNIVERSE): INTEGER is
			-- Index of actual generic parameter with label `a_label' in `base_type';
			-- 0 if it does not exist
		do
			Result := index_of_label (a_label)
		end

	context_named_type (a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when the type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_universe'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	is_root_context: BOOLEAN is
			-- Is current context its own root context?
		do
			Result := True
		end

	is_valid_context: BOOLEAN is
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves
		do
			Result := is_valid_context_type (Current)
		end

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN is
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_root_context'?
		local
			a_parameters: like actual_parameters
			i, nb: INTEGER
		do
			Result := True
			a_parameters := actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if not a_parameters.type (i).is_valid_context_type (a_root_context) then
						Result := False
						i := nb + 1 -- Jump out of the look.
					else
						i := i + 1
					end
				end
			end
		end

	context_is_type_expanded (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' expanded in `a_universe'?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		do
			Result := is_type_expanded (Current, a_universe)
		end

	context_is_type_reference (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' reference in `a_universe'?
		do
			Result := is_type_reference (Current, a_universe)
		end

	context_has_formal_type (i: INTEGER; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context in `a_universe'
			-- contain the formal generic parameter with index `i'?
		do
			Result := has_formal_type (i, Current, a_universe)
		end

	context_has_formal_types (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context in `a_universe'
			-- contain a formal generic parameter?
		do
			Result := has_formal_types (Current, a_universe)
		end

	context_base_type_has_class (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the base type of current context contain `a_class'
			-- in `a_universe'?
		do
			Result := base_type_has_class (a_class, Current, a_universe)
		end

	context_named_type_has_class (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context contain `a_class'
			-- in `a_universe'?
		do
			Result := named_type_has_class (a_class, Current, a_universe)
		end

	context_same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in `other_context'
			-- have the same named type?
		do
			Result := same_named_type (other, other_context, Current, a_universe)
		end

	context_same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in `other_context'
			-- have the same base type?
		do
			Result := same_base_type (other, other_context, Current, a_universe)
		end

	context_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current context conform to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_to_type (other, other_context, Current, a_universe)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Type context

	context_same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_bit_type (other, other_context, Current, a_universe)
		end

	context_same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_class_type (other, other_context, Current, a_universe)
		end

	context_same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_formal_parameter_type (other, other_context, Current, a_universe)
		end

	context_same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_tuple_type (other, other_context, Current, a_universe)
		end

	context_same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_bit_type (other, other_context, Current, a_universe)
		end

	context_same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_class_type (other, other_context, Current, a_universe)
		end

	context_same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_formal_parameter_type (other, other_context, Current, a_universe)
		end

	context_same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_tuple_type (other, other_context, Current, a_universe)
		end

	context_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_bit_type (other, other_context, Current, a_universe)
		end

	context_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_class_type (other, other_context, Current, a_universe)
		end

	context_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_formal_parameter_type (other, other_context, Current, a_universe)
		end

	context_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_tuple_type (other, other_context, Current, a_universe)
		end

feature -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_context_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of current context conform to
			-- the reference version of `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := reference_conforms_to_type (other, other_context, Current, a_universe)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_context_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := reference_conforms_from_bit_type (other, other_context, Current, a_universe)
		end

	reference_context_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := reference_conforms_from_class_type (other, other_context, Current, a_universe)
		end

	reference_context_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := reference_conforms_from_formal_parameter_type (other, other_context, Current, a_universe)
		end

	reference_context_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := reference_conforms_from_tuple_type (other, other_context, Current, a_universe)
		end

invariant

	is_root_context: is_root_context

end
