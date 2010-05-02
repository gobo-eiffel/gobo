note

	description:

		"Eiffel types directly based on a class"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BASE_TYPE

inherit

	ET_NAMED_TYPE
		rename
			base_class as base_class_in_context,
			named_base_class as named_base_class_in_context
		redefine
			reset,
			reset_qualified_anchored_types,
			is_named_type,
			is_base_type,
			has_anchored_type,
			has_identifier_anchored_type,
			has_formal_types,
			conforms_from_bit_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			resolved_formal_parameters,
			is_valid_context_type
		end

	ET_TYPE_CONTEXT
		rename
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
			base_type_has_class as context_base_type_has_class,
			named_type_has_class as context_named_type_has_class
		redefine
			base_class,
			is_root_context
		end

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		local
			l_parameters: like actual_parameters
		do
			l_parameters := actual_parameters
			if l_parameters /= Void then
				l_parameters.reset
			end
		end

	reset_qualified_anchored_types
			-- Reset qualified anchored types contained in current type
			-- as they were just after they were last parsed.
		local
			l_parameters: like actual_parameters
		do
			l_parameters := actual_parameters
			if l_parameters /= Void then
				l_parameters.reset_qualified_anchored_types
			end
		end

feature -- Access

	base_class: ET_CLASS
			-- Base class of current type
		require else
			base_class_available: True
		do
			Result := named_base_class.actual_class
		end

	named_base_class: ET_NAMED_CLASS
			-- Class visible from the surrounding universe under the name `name'
			--
			-- Note that this class may have been written in another library
			-- with another name.

	named_base_class_in_context (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		do
			Result := named_base_class
		end

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters
		do
			-- Result := Void
		end

	shallow_base_type (a_context: ET_BASE_TYPE): ET_BASE_TYPE
			-- Base type of current type, when it appears in `a_context',
			-- but where the actual generic parameters are not replaced
			-- by their named version and should still be considered as
			-- viewed from `a_context'
		do
			Result := Current
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
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
				Result := an_actual.named_type (a_context)
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
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
				Result := an_actual.named_parameter (a_context)
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		do
			Result := index_of_label (a_label)
		end

	index_of_label (a_label: ET_IDENTIFIER): INTEGER
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

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		do
			Result := actual_parameter_count
		end

	actual_parameter_count: INTEGER
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

	is_generic: BOOLEAN
			-- Is current class type generic?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			Result := a_parameters /= Void and then not a_parameters.is_empty
		ensure
			definition: Result = (actual_parameters /= Void and then not actual_parameters.is_empty)
		end

	is_named_type: BOOLEAN
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

	is_base_type: BOOLEAN
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
		ensure then
			valid_context: Result implies is_valid_context
		end

	is_expanded: BOOLEAN
			-- Is current type expanded?
		deferred
		end

	has_anchored_type: BOOLEAN
			-- Does current type contain an anchored type?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_anchored_type
			end
		end

	has_identifier_anchored_type: BOOLEAN
			-- Does current type contain an identifier anchored type?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_identifier_anchored_type
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context'?
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.has_formal_types (a_context)
			end
		end

feature -- Comparison

	same_as_base_class: BOOLEAN
			-- Is current type a non-generic class type with the same
			-- expandedness and separateness status as its base class,
			-- or is it its own base class?
		do
			-- Result := False
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_other_base_class: ET_CLASS
			any_type: ET_CLASS_TYPE
		do
			l_other_base_class := other.base_class
			if l_other_base_class.is_preparsed then
				Result := conforms_from_class_type (l_other_base_class, other_context, a_context)
			end
			if not Result then
					-- See VNCB-1 (ETL2 p.229).
					-- "BIT N" conforms to "ANY", so "BIT N" conforms to
					-- current class if "ANY" conforms to it.
				if not base_class.is_preparsed then
						-- Internal error: the base class is not even preparsed (i.e. we
						-- know nothing, not even its filename). Therefore it is impossible
						-- to determine whether "ANY" conforms to it.
					Result := False
				else
					any_type := base_class.current_system.any_type
					Result := conforms_from_class_type (any_type, other_context, a_context)
				end
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			an_index: INTEGER
			a_formal: ET_FORMAL_PARAMETER
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_constraint: ET_TYPE
			a_base_type: ET_BASE_TYPE
			any_type: ET_CLASS_TYPE
			a_base_class: ET_CLASS
		do
			an_index := other.index
			a_base_class := other_context.base_class
			a_formals := a_base_class.formal_parameters
			if a_formals = Void or else an_index > a_formals.count then
					-- Internal error: does `other' type really appear in `other_context'?
				Result := False
			else
				a_formal := a_formals.formal_parameter (an_index)
				a_constraint := a_formal.constraint
				if a_constraint = Void then
						-- `a_formal' is implicitly constrained by "ANY",
						-- so it conforms to any type to which "ANY" conforms.
					if not a_base_class.is_preparsed then
							-- Internal error: we have a formal parameter of a class that
							-- is not even preparsed (i.e. for which we know nothing,
							-- not even its filename). Therefore it is impossible to
							-- determine whether "ANY" conforms to it.
						Result := False
					else
						any_type := a_base_class.current_system.any_type
						Result := conforms_from_class_type (any_type, other_context, a_context)
					end
				else
					a_base_type := a_formal.constraint_base_type
					if a_base_type /= Void then
							-- The constraint of `a_formal' is not another formal
							-- parameter, or if it is there is no cycle and
							-- the resolved base type of this constraint has
							-- been made available in `base_type'.
						Result := a_base_type.conforms_to_type (Current, a_context, other_context)
					else
							-- There is a cycle of the form "A [G -> H, H -> G]"
							-- in the constraint of `a_formal'. Therefore `other'
							-- can only conform to itself.
						Result := False
					end
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_other_base_class: ET_CLASS
			any_type: ET_CLASS_TYPE
		do
			l_other_base_class := other.base_class
			if l_other_base_class.is_preparsed then
					-- If the base class of a Tuple_type conforms to
					-- current class type, then the Tuple_type itself
					-- conforms to it.
				Result := conforms_from_class_type (l_other_base_class, other_context, a_context)
			end
			if not Result then
					-- "TUPLE [...]" conforms to "ANY", so "TUPLE [...]"
					-- conforms to current type if "ANY" conforms to it.
				if not base_class.is_preparsed then
						-- Internal error: the base class is not even preparsed (i.e. we
						-- know nothing, not even its filename). Therefore it is impossible
						-- to determine whether "ANY" conforms to it.
					Result := False
				else
					any_type := base_class.current_system.any_type
					Result := conforms_from_class_type (any_type, other_context, a_context)
				end
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_BASE_TYPE
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := Current
		end

feature -- Type context

	root_context: ET_BASE_TYPE
			-- Root context
		do
			Result := Current
		ensure then
			is_root: Result = Current
		end

	new_type_context (a_type: ET_TYPE): ET_NESTED_TYPE_CONTEXT
			-- New type context made up of `a_type' in current context
		do
			create Result.make_with_capacity (Current, 1)
			Result.put_last (a_type)
		end

	context_base_type: ET_BASE_TYPE
			-- Base type of current context
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	context_base_type_actual (i: INTEGER): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of `base_type'
		do
			Result := base_type_actual (i, Current)
		end

	context_base_type_actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of `base_type'
		do
			Result := base_type_actual_parameter (i, Current)
		end

	context_base_type_actual_count: INTEGER
			-- Number of actual generic parameters of `base_type'
		do
			Result := base_type_actual_count (Current)
		end

	context_base_type_index_of_label (a_label: ET_IDENTIFIER): INTEGER
			-- Index of actual generic parameter with label `a_label' in `base_type';
			-- 0 if it does not exist
		do
			Result := index_of_label (a_label)
		end

	context_named_type: ET_NAMED_TYPE
			-- Same as `base_type' except when the type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart. Return this new formal type
			-- in that case instead of the base type of its constraint.
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	is_root_context: BOOLEAN
			-- Is current context its own root context?
		do
			Result := True
		end

	is_valid_context: BOOLEAN
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves
		do
			Result := is_valid_context_type (Current)
		end

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN
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

	context_is_type_expanded: BOOLEAN
			-- Is `base_type' expanded?
		do
			Result := is_type_expanded (Current)
		end

	context_is_type_reference: BOOLEAN
			-- Is `base_type' a reference type?
		do
			Result := is_type_reference (Current)
		end

	context_base_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the base type of current context contain `a_class'?
		do
			Result := base_type_has_class (a_class, Current)
		end

	context_named_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the named type of current context contain `a_class'?
		do
			Result := named_type_has_class (a_class, Current)
		end

	context_same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in `other_context'
			-- have the same named type?
		do
			Result := same_named_type (other, other_context, Current)
		end

	context_same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in `other_context'
			-- have the same base type?
		do
			Result := same_base_type (other, other_context, Current)
		end

	context_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current context conform to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_to_type (other, other_context, Current)
		end

	to_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return a new object at each call.
		do
			create Result.make_with_capacity (Current, 1)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Type context

	context_same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_bit_type (other, other_context, Current)
		end

	context_same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_class_type (other, other_context, Current)
		end

	context_same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_formal_parameter_type (other, other_context, Current)
		end

	context_same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		do
			Result := same_named_tuple_type (other, other_context, Current)
		end

	context_same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_bit_type (other, other_context, Current)
		end

	context_same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_class_type (other, other_context, Current)
		end

	context_same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_formal_parameter_type (other, other_context, Current)
		end

	context_same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		do
			Result := same_base_tuple_type (other, other_context, Current)
		end

	context_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_bit_type (other, other_context, Current)
		end

	context_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_class_type (other, other_context, Current)
		end

	context_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_formal_parameter_type (other, other_context, Current)
		end

	context_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_tuple_type (other, other_context, Current)
		end

invariant

	is_root_context: is_root_context
	named_base_class_not_void: named_base_class /= Void

end
