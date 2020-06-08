note

	description:

		"Eiffel types directly based on a class"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BASE_TYPE

inherit

	ET_NAMED_TYPE
		rename
			base_class as base_class_in_context,
			named_base_class as named_base_class_in_context
		undefine
			type_constraint
		redefine
			reset,
			reset_qualified_anchored_types,
			is_named_type,
			is_base_type,
			has_anchored_type,
			has_unqualified_anchored_type,
			has_identifier_anchored_type,
			depends_on_qualified_anchored_type,
			has_formal_types,
			conforms_from_formal_parameter_type_with_type_marks,
			conforms_from_tuple_type_with_type_marks,
			resolved_formal_parameters,
			resolved_formal_parameters_with_type_mark,
			type_with_type_mark,
			is_valid_context_type
		end

	ET_TYPE_CONTEXT
		rename
			base_type as context_base_type,
			base_type_with_type_mark as context_base_type_with_type_mark,
			base_type_actual as context_base_type_actual,
			base_type_actual_parameter as context_base_type_actual_parameter,
			base_type_actual_count as context_base_type_actual_count,
			base_type_index_of_label as context_base_type_index_of_label,
			named_type as context_named_type,
			named_type_with_type_mark as context_named_type_with_type_mark,
			is_type_expanded as context_is_type_expanded,
			is_type_expanded_with_type_mark as context_is_type_expanded_with_type_mark,
			is_type_reference as context_is_type_reference,
			is_type_reference_with_type_mark as context_is_type_reference_with_type_mark,
			is_type_attached as context_is_type_attached,
			is_type_attached_with_type_mark as context_is_type_attached_with_type_mark,
			is_type_detachable as context_is_type_detachable,
			is_type_detachable_with_type_mark as context_is_type_detachable_with_type_mark,
			add_adapted_base_classes_to_list as context_add_adapted_base_classes_to_list,
			adapted_base_class_with_named_feature as context_adapted_base_class_with_named_feature,
			adapted_base_class_with_seeded_feature as context_adapted_base_class_with_seeded_feature,
			same_named_type as context_same_named_type,
			same_named_type_with_type_marks as context_same_named_type_with_type_marks,
			same_base_type as context_same_base_type,
			same_base_type_with_type_marks as context_same_base_type_with_type_marks,
			same_named_class_type_with_type_marks as context_same_named_class_type_with_type_marks,
			same_named_formal_parameter_type_with_type_marks as context_same_named_formal_parameter_type_with_type_marks,
			same_named_tuple_type_with_type_marks as context_same_named_tuple_type_with_type_marks,
			same_base_class_type_with_type_marks as context_same_base_class_type_with_type_marks,
			same_base_formal_parameter_type_with_type_marks as context_same_base_formal_parameter_type_with_type_marks,
			same_base_tuple_type_with_type_marks as context_same_base_tuple_type_with_type_marks,
			conforms_to_type as context_conforms_to_type,
			conforms_to_type_with_type_marks as context_conforms_to_type_with_type_marks,
			conforms_from_class_type_with_type_marks as context_conforms_from_class_type_with_type_marks,
			conforms_from_formal_parameter_type_with_type_marks as context_conforms_from_formal_parameter_type_with_type_marks,
			conforms_from_tuple_type_with_type_marks as context_conforms_from_tuple_type_with_type_marks,
			base_type_has_class as context_base_type_has_class,
			named_type_has_class as context_named_type_has_class,
			named_type_is_formal_type as context_named_type_is_formal_type
		redefine
			base_class,
			is_root_context
		end

	ET_BASE_TYPE_CONSTRAINT
		rename
			count as type_constraint_count,
			type as type_constraint_type,
			base_type_index_of_label as adapted_class_base_type_index_of_label
		undefine
			conforms_to_type_with_type_marks
		redefine
			base_class
		end

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		do
			if attached actual_parameters as l_parameters then
				l_parameters.reset
			end
		end

	reset_qualified_anchored_types
			-- Reset qualified anchored types contained in current type
			-- as they were just after they were last parsed.
		do
			if attached actual_parameters as l_parameters then
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

	actual_parameters: detachable ET_ACTUAL_PARAMETERS
			-- Actual generic parameters
		do
			-- Result := Void
		end

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := type_with_type_mark (a_type_mark)
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_TYPE
		do
			check attached actual_parameters as l_actual_parameters then
				an_actual := l_actual_parameters.type (i)
				if (a_context = Current or (a_context.is_root_context and then a_context.root_context = Current)) and then attached {ET_NAMED_TYPE} an_actual as l_named_type then
						-- The current type is its own context,
						-- therefore it is its own base type (i.e all
						-- its actual generic parameters are named).
					Result := l_named_type
				else
					Result := an_actual.named_type (a_context)
				end
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_ACTUAL_PARAMETER
		do
			check attached actual_parameters as l_actual_parameters then
				an_actual := l_actual_parameters.actual_parameter (i)
				if a_context = Current or (a_context.is_root_context and then a_context.root_context = Current) then
						-- The current type is its own context,
						-- therefore it is its own base type (i.e all
						-- its actual generic parameters are named).
					Result := an_actual
				else
					Result := an_actual.named_parameter (a_context)
				end
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
		do
			if attached actual_parameters as l_parameters then
				Result := l_parameters.index_of_label (a_label)
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= actual_parameter_count
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_BASE_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := Current
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		do
			Result := actual_parameter_count
		end

	actual_parameter_count: INTEGER
			-- Number of generic parameters
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.count
			end
		ensure
			non_negative_count: Result >= 0
			generic: attached actual_parameters as l_actual_parameters implies Result = l_actual_parameters.count
			non_generic: actual_parameters = Void implies Result = 0
		end

feature -- Status report

	is_generic: BOOLEAN
			-- Is current class type generic?
		do
			Result := attached actual_parameters as l_actual_parameters and then not l_actual_parameters.is_empty
		ensure
			definition: Result = (attached actual_parameters as l_actual_parameters and then not l_actual_parameters.is_empty)
		end

	is_named_type: BOOLEAN
			-- Is current type only made up of named types?
		local
			i, nb: INTEGER
		do
			Result := True
			if attached actual_parameters as l_actual_parameters then
				nb := l_actual_parameters.count
				from i := 1 until i > nb loop
					if not l_actual_parameters.type (i).is_named_type then
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
			i, nb: INTEGER
		do
			Result := True
			if attached actual_parameters as l_actual_parameters then
				nb := l_actual_parameters.count
				from i := 1 until i > nb loop
					if not l_actual_parameters.type (i).is_base_type then
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

	is_attached: BOOLEAN
			-- Is current type attached?
		deferred
		end

	is_self_initializing: BOOLEAN
			-- Is current type self-initializing?
			--
			-- It is currently limited to detachable types and expanded types
			-- in order to match ISE's implementation (as of ISE 20.03.10.3992).
			-- The ECMA standard says that attached type with 'default_create'
			-- as creation procedure are also self-initializing (see DEST,
			-- section 8.19.13, page 106 of ECMA-367 3-36).
		do
			Result := is_expanded or not is_attached
		end

	has_anchored_type: BOOLEAN
			-- Does current type contain an anchored type?
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.has_anchored_type
			end
		end

	has_unqualified_anchored_type: BOOLEAN
			-- Does current type contain an unqualified anchored type
			-- (i.e. 'like Current' or 'like feature_name')?
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.has_unqualified_anchored_type
			end
		end

	has_identifier_anchored_type: BOOLEAN
			-- Does current type contain an identifier anchored type?
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.has_identifier_anchored_type
			end
		end

	depends_on_qualified_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type depend on a qualified anchored type when
			-- viewed from `a_context' when trying to determine its base type?
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.depends_on_qualified_anchored_type (a_context)
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context'?
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.has_formal_types (a_context)
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

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			an_index: INTEGER
			a_formal: ET_FORMAL_PARAMETER
			a_base_class: ET_CLASS
		do
			an_index := other.index
			a_base_class := other_context.base_class
			if attached a_base_class.formal_parameters as a_formals and then an_index <= a_formals.count then
				a_formal := a_formals.formal_parameter (an_index)
				Result := a_formal.constraint_base_types.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, other.overridden_type_mark (other_type_mark), other_context, a_system_processor)
			else
					-- Internal error: does `other' type really appear in `other_context'?
				Result := False
			end
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_other_base_class: ET_CLASS
			l_any_type: ET_CLASS_TYPE
		do
			l_other_base_class := other.base_class
			if l_other_base_class.is_preparsed then
					-- If the base class of a Tuple_type conforms to current class type,
					-- then the Tuple_type itself conforms to it.
					-- Keep the attachment mark of `other' (possibly overridden by `other_type_mark').
				Result := conforms_from_class_type_with_type_marks (l_other_base_class, other.overridden_type_mark (other_type_mark), other_context, a_type_mark, a_context, a_system_processor)
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
						-- Keep the attachment mark of `other' (possibly overridden by `other_type_mark').
					l_any_type := base_class.current_system.any_type
					Result := conforms_from_class_type_with_type_marks (l_any_type, other.overridden_type_mark (other_type_mark), other_context, a_type_mark, a_context, a_system_processor)
				end
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETERS): ET_BASE_TYPE
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := resolved_formal_parameters_with_type_mark (Void, a_parameters)
		end

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETERS): ET_BASE_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := type_with_type_mark (a_type_mark)
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

	context_adapted_base_class_with_named_feature (a_name: ET_CALL_NAME): ET_ADAPTED_CLASS
			-- Base class of current context, or in case of a formal parameter one
			-- of its constraint adapted base classes containing a feature named
			-- `a_name' (or any of the constraints if none contains such feature)
		do
			Result := adapted_base_class_with_named_feature (a_name, Current)
		end

	context_adapted_base_class_with_seeded_feature (a_seed: INTEGER): ET_ADAPTED_CLASS
			-- Base class of current context, or in case of a formal parameter
			-- one of its constraint adapted base classes containing a feature
			-- with seed `a_seed' (or any of the constraints if none contains
			-- such feature)
		do
			Result := adapted_base_class_with_seeded_feature (a_seed, Current)
		end

	context_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := type_with_type_mark (a_type_mark)
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

	context_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := type_with_type_mark (a_type_mark)
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
			i, nb: INTEGER
		do
			Result := True
			if attached actual_parameters as a_parameters then
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

	context_is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := is_type_expanded_with_type_mark (a_type_mark, Current)
		end

	context_is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := is_type_reference_with_type_mark (a_type_mark, Current)
		end

	context_is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := is_type_attached_with_type_mark (a_type_mark, Current)
		end

	context_is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := is_type_detachable_with_type_mark (a_type_mark, Current)
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

	context_named_type_is_formal_type: BOOLEAN
			-- Is named type of current context a formal parameter?
		do
			Result := named_type_is_formal_type (Current)
		end

	context_add_adapted_base_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS])
			-- Add to `a_list' the base class of current context' or the adapted
			-- base classes of the constraints (in the same order they appear in
			-- 'constraint_base_types') in case of a formal parameter.
		do
			add_adapted_base_classes_to_list (a_list, Current)
		end

	context_same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_named_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `context_same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_base_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `context_conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current, a_system_processor)
		end

	to_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return a new object at each call.
		do
			create Result.make_with_capacity (Current, 1)
		end

	copy_to_type_context (other: ET_NESTED_TYPE_CONTEXT)
			-- Copy current context to `other'.
		do
			other.reset (Current)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Type context

	context_same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_named_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_base_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
		end

	context_conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current, a_system_processor)
		end

	context_conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current, a_system_processor)
		end

	context_conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current, a_system_processor)
		end

invariant

	is_root_context: is_root_context
	named_base_class_not_void: named_base_class /= Void

end
