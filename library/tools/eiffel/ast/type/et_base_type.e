indexing

	description:

		"Eiffel types directly based on a class"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BASE_TYPE

inherit

	ET_NAMED_TYPE
		undefine
			type
		redefine
			direct_base_class, is_base_type,
			conforms_from_bit_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			resolved_formal_parameters,
			is_valid_context_type
		end

	ET_TYPE_CONTEXT
		rename
			base_class as context_base_class,
			base_type as context_base_type
		redefine
			has_context, root_context, is_root_context,
			context_base_class, context_base_type
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

feature -- Status report

	is_base_type: BOOLEAN is
			-- Is current type only made up of base types?
		do
			Result := True
		end

feature {ET_TYPE} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			any_type: ET_CLASS_TYPE
		do
				-- See VNCB-1 (ETL2 p.229).
				-- "BIT N" conforms to "ANY", so "BIT N" conforms to current
				-- class type if "ANY" conforms to it.
			any_type := a_universe.any_type
			Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
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
					Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
				else
					a_base_type := a_formal.constraint_base_type
					if a_base_type /= Void then
							-- The constraint of `a_formal' is not another formal
							-- parameter, or if it is there is no cycle and
							-- the resolved base type of this constraint has
							-- been made available in `base_type'.
						Result := a_base_type.conforms_to_type (Current, a_context, other_context, a_universe)
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
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			any_type: ET_CLASS_TYPE
		do
				-- Tuple_type conforms to "ANY", so Tuple_type conforms
				-- to current class type if "ANY" conforms to it.
			any_type := a_universe.any_type
			Result := conforms_from_class_type (any_type, other_context, a_context, a_universe)
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

	type: ET_BASE_TYPE is
			-- Type of current context
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	context: ET_TYPE_CONTEXT is
			-- Context in which `type' is viewed
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	context_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of `type' when it appears in `context' in `a_universe'
		do
			Result := direct_base_class (a_universe)
		ensure then
			definition: Result = direct_base_class (a_universe)
		end

	context_base_type (a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of `type' when it appears in `context' in `a_universe'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	root_context: ET_BASE_TYPE is
			-- Context of `type', or recursively the context of
			-- its context, such that it is its own context
		do
			Result := Current
		ensure then
			is_root: Result = Current
		end

	is_root_context: BOOLEAN is
			-- Is current context its own root context?
		do
			Result := True
		end

	has_context (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is `a_context' current context, or
			-- recursively the context of its context?
		do
			Result := a_context = Current
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

invariant

	is_root_context: is_root_context

end
