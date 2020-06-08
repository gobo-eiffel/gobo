note

	description:

		"Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE

inherit

	ET_TYPE_ITEM

	ET_ACTUAL_PARAMETER
		undefine
			resolved_syntactical_constraint_with_type
		end

	ET_TYPE_CONSTRAINT
		rename
			count as type_constraint_count,
			type as type_constraint_type
		undefine
			conforms_to_type_with_type_marks
		end

	ET_CONSTRAINT_TYPE
		undefine
			actual_parameter
		redefine
			type
		end

	ET_DECLARED_TYPE

	ET_TARGET_TYPE

	DEBUG_OUTPUT

	KL_IMPORTED_STRING_ROUTINES

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		do
		end

	reset_qualified_anchored_types
			-- Reset qualified anchored types contained in current type
			-- as they were just after it were last parsed.
		do
		end

feature -- Access

	type_mark: detachable ET_TYPE_MARK
			-- 'attached', 'detachable', 'expanded', 'reference' or 'separate' keyword,
			-- or '!' or '?' symbol
		do
			-- Result := Void
		end

	overridden_type_mark (a_override_type_mark: detachable ET_TYPE_MARK): detachable ET_TYPE_MARK
			-- Version of `type_mark' overridden by `a_override_type_mark'
		do
			if attached type_mark as l_type_mark then
				Result := l_type_mark.overridden_type_mark (a_override_type_mark)
			else
				Result := a_override_type_mark
			end
		end

	base_class (a_context: ET_TYPE_CONTEXT): ET_CLASS
			-- Base class of current type when it appears in `a_context'
			-- (Definition of base class in ETL2 page 198).
			--
			-- Note that in case of a formal parameter with multiple
			-- constraints, then return the base class of the first
			-- constraint. In order to get the other base classes,
			-- use `add_adapted_base_classes_to_list'.
			--
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := named_base_class (a_context).actual_class
		ensure
			base_class_not_void: Result /= Void
		end

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			named_base_class_not_void: Result /= Void
		end

	adapted_base_class_with_named_feature (a_name: ET_CALL_NAME; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature named `a_name' (or any of the constraints if none contains such
			-- feature)
		require
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_class (a_context)
		end

	adapted_base_class_with_seeded_feature (a_seed: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature with seed `a_seed' (or any of the constraints if none contains
			-- such feature)
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_class (a_context)
		end

	base_type (a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Base type of current type, when it appears in `a_context',
			-- only made up of class names and generic formal parameters
			-- when the root type of `a_context' is a generic type not
			-- fully derived (Definition of base type in ETL2 p.198).
			--
			-- Note that in case of a formal parameter with multiple
			-- constraints, then return the base type of the first
			-- constraint. In order to get the other base types,
			-- use `add_adapted_base_classes_to_list'.
			--
			-- Replace by "*UNKNOWN*" any unresolved identifier type, or
			-- unmatched formal generic parameter if this parameter
			-- is current type.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_type_with_type_mark (Void, a_context)
		ensure
			base_type_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			base_type_with_type_mark_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	shallow_base_type (a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Base type of current type, when it appears in `a_context',
			-- but where the actual generic parameters are not replaced
			-- by their named version and should still be considered as
			-- viewed from `a_context'
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_root_context: a_context.is_root_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := shallow_base_type_with_type_mark (Void, a_context)
		ensure
			shallow_base_type_not_void: Result /= Void
		end

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_root_context: a_context.is_root_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			shallow_base_type_with_type_mark_not_void: Result /= Void
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context)
		deferred
		ensure
			base_type_actual_not_void: Result /= Void
			definition: attached base_type (a_context).actual_parameters as l_actual_parameters and then Result.same_named_type (l_actual_parameters.type (i), a_context.root_context, a_context.root_context)
			actual_parameter_type: Result.same_named_type (base_type_actual_parameter (i, a_context).type, a_context.root_context, a_context.root_context)
			named_type_named: Result.is_named_type
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context)
		deferred
		ensure
			base_type_actual_parameter_not_void: Result /= Void
			--definition: Result.same_actual_parameter (base_type (a_context).actual_parameters.actual_parameter (i), a_context.root_context, a_context.root_context)
			named_type_named: Result.type.is_named_type
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_label_not_void: a_label /= Void
		deferred
		ensure
			definition: Result = base_type (a_context).index_of_label (a_label)
			index_large_enough: Result >= 0
			index_small_enough: Result <= base_type_actual_count (a_context)
		end

	named_type (a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := named_type_with_type_mark (Void, a_context)
		ensure
			named_type_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_type_with_type_mark (a_type_mark, a_context)
		ensure
			named_type_with_type_mark_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

	shallow_named_type (a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_root_context: a_context.is_root_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := shallow_named_type_with_type_mark (Void, a_context)
		ensure
			shallow_named_type_not_void: Result /= Void
		end

	shallow_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_root_context: a_context.is_root_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := shallow_base_type_with_type_mark (a_type_mark, a_context)
		ensure
			shallow_named_type_with_type_mark_not_void: Result /= Void
		end

	named_parameter (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- Same as current actual parameter but its type
			-- replaced by its named type
		do
			Result := named_type (a_context)
		end

	type: ET_TYPE
			-- Type
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	type_constraint_type: like Current
			-- Type
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := Current
		ensure
			type_with_type_mark_not_void: Result /= Void
		end

	label: detachable ET_IDENTIFIER
			-- Label of `actual_parameter';
			-- Useful when part of a labeled tuple, Void if no label
		do
			-- No label.
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type (a_context).actual_parameter_count
		end

feature -- Status report

	is_like_current: BOOLEAN
			-- Is current type of the form 'like Current'?
		do
			-- Result := False
		end

	is_named_type: BOOLEAN
			-- Is current type only made up of named types?
		do
			-- Result := False
		end

	is_base_type: BOOLEAN
			-- Is current type only made up of base types?
		do
			-- Result := False
		ensure
			named_type: Result implies is_named_type
		end

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type expanded when viewed from `a_context'?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_expanded_with_type_mark (Void, a_context)
		end

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_reference (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type reference when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_reference_with_type_mark (Void, a_context)
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := not is_type_expanded_with_type_mark (a_type_mark, a_context)
		end

	is_type_attached (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type attached when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_attached_with_type_mark (Void, a_context)
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_detachable (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type detachable when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_detachable_with_type_mark (Void, a_context)
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := not is_type_attached_with_type_mark (a_type_mark, a_context)
		end

	is_type_self_initializing (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type self-initializing when viewed from `a_context'?
			--
			-- It is currently limited to detachable types and expanded types
			-- in order to match ISE's implementation (as of ISE 20.03.10.3992).
			-- The ECMA standard says that attached type with 'default_create'
			-- as creation procedure are also self-initializing (see DEST,
			-- section 8.19.13, page 106 of ECMA-367 3-36).
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_self_initializing_with_type_mark (Void, a_context)
		end

	is_type_self_initializing_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_self_initializing' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_expanded_with_type_mark (a_type_mark, a_context) or is_type_detachable_with_type_mark (a_type_mark, a_context)
		end

	has_anchored_type: BOOLEAN
			-- Does current type contain an anchored type?
		do
			-- Result := False
		end

	has_unqualified_anchored_type: BOOLEAN
			-- Does current type contain an unqualified anchored type
			-- (i.e. 'like Current' or 'like feature_name')?
		do
			-- Result := False
		end

	has_identifier_anchored_type: BOOLEAN
			-- Does current type contain an identifier anchored type
			-- (i.e. an anchored type other than 'like Current')?
		do
			-- Result := False
		end

	depends_on_qualified_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type depend on a qualified anchored type when
			-- viewed from `a_context' when trying to determine its base type?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in non-qualified anchored types involved.
		do
			-- Result := False
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type contain a formal generic parameter
			-- when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	named_type_is_formal_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is named type of current type a formal parameter when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		do
			Result := base_type_has_class (a_class, a_context)
		end

	named_parameter_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named parameter of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			Result := named_type_has_class (a_class, a_context)
		end

feature -- Basic operations

	add_adapted_base_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' the base class of current type when it appears in `a_context' or
			-- the adapted base classes of the constraints (in the same order they appear in
			-- 'constraint_base_types') in case of a formal parameter.
		require
			a_list_not_void: a_list /= Void
			no_void_adapted_base_class: not a_list.has_void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			a_list.force_last (base_class (a_context))
		ensure
			at_least_one_more: a_list.count > old a_list.count
			no_void_adapted_base_class: not a_list.has_void
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_syntactical_type_with_type_marks (other, Void, other_context, Void, a_context)
		ensure
			symmetric: Result = other.same_syntactical_type (Current, a_context, other_context)
		end

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			symmetric: Result = other.same_syntactical_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
		end

	same_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_named_type_with_type_marks (other, Void, other_context, Void, a_context)
		ensure
			definition: Result = named_type (a_context).same_syntactical_type (other.named_type (other_context), other_context.root_context, a_context.root_context)
			symmetric: Result = other.same_named_type (Current, a_context, other_context)
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = named_type_with_type_mark (a_type_mark, a_context).same_syntactical_type (other.named_type_with_type_mark (other_type_mark, other_context), other_context.root_context, a_context.root_context)
			symmetric: Result = other.same_named_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
		end

	same_base_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_base_type_with_type_marks (other, Void, other_context, Void, a_context)
		ensure
			definition: Result = base_type (a_context).same_syntactical_type (other.base_type (other_context), other_context.root_context, a_context.root_context)
			symmetric: Result = other.same_base_type (Current, a_context, other_context)
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type_with_type_mark (a_type_mark, a_context).same_syntactical_type (other.base_type_with_type_mark (other_type_mark, other_context), other_context.root_context, a_context.root_context)
			symmetric: Result = other.same_base_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_like_current_with_type_marks (other: ET_LIKE_CURRENT; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_like_feature_with_type_marks (other: ET_LIKE_FEATURE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_qualified_like_identifier_with_type_marks (other: ET_QUALIFIED_LIKE_IDENTIFIER; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

feature -- Conformance

	conforms_to_constraint (a_constraint: ET_CONSTRAINT; a_constraint_context, a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does current type appearing in `a_context' conform to all
			-- types in `a_constraint' type appearing in `a_constraint_context'?
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			a_constraint_not_void: a_constraint /= Void
			a_constraint_context_not_void: a_constraint_context /= Void
			a_constraint_context_valid: a_constraint_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		do
			Result := conforms_to_constraint_with_type_marks (a_constraint, Void, a_constraint_context, Void, a_context, a_system_processor)
		end

	conforms_to_constraint_with_type_marks (a_constraint: ET_CONSTRAINT; a_constraint_type_mark: detachable ET_TYPE_MARK; a_constraint_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_constraint' except that the type mark status of `Current'
			-- and the types in `a_constraint' is overridden by `a_type_mark' and
			-- `a_constraint_type_mark', if not Void
		require
			a_constraint_not_void: a_constraint /= Void
			a_constraint_context_not_void: a_constraint_context /= Void
			a_constraint_context_valid: a_constraint_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			Result := True
			nb := a_constraint.count
			from i := 1 until i > nb loop
				if not conforms_to_type_with_type_marks (a_constraint.type_constraint (i).type, a_constraint_type_mark, a_constraint_context, a_type_mark, a_context, a_system_processor) then
					Result := False
					i := nb -- Jump out of the loop.
				end
				i := i + 1
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		do
			-- Result := False
		end

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		do
			-- Result := False
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		do
			-- Result := False
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETERS): ET_TYPE
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		do
			Result := resolved_formal_parameters_with_type_mark (Void, a_parameters)
		ensure
			resolved_type_not_void: Result /= Void
		end

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETERS): ET_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			a_parameters_not_void: a_parameters /= Void
		do
			Result := type_with_type_mark (a_type_mark)
		ensure
			resolved_type_not_void: Result /= Void
		end

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_TYPE
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		do
			Result := a_type
		end

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_class: ET_CLASS; a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE
			-- Version of current type, appearing in the constraint of one
			-- of the formal generic parameters in `a_formals' of `a_class',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		do
			Result := Current
		end

feature -- Type context

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_root_context'?
		require
			a_root_context_not_void: a_root_context /= Void
		do
			-- Result := False
		end

feature {NONE} -- Type marks

	same_attachment_marks (a_type_mark, other_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do `a_type_mark' and `other_type_mark' represent the same attachment mark?
		do
			if a_type_mark = Void or else not a_type_mark.is_detachable_mark then
				Result := other_type_mark = Void or else not other_type_mark.is_detachable_mark
			elseif other_type_mark = Void or else not other_type_mark.is_detachable_mark then
				Result := not a_type_mark.is_detachable_mark
			else
				Result := True
			end
		end

	same_attachment_marks_with_default (a_type_mark, other_type_mark, a_default_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do `a_type_mark' and `other_type_mark' represent the same attachment mark?
			-- Use `a_default_type_mark' instead of `a_type_mark' or `other_type_mark' if
			-- they are not attachment type marks.
		local
			l_type_mark: detachable ET_TYPE_MARK
			l_other_type_mark: detachable ET_TYPE_MARK
		do
			if a_type_mark = Void or else not a_type_mark.is_attachment_mark then
				l_type_mark := a_default_type_mark
			else
				l_type_mark := a_type_mark
			end
			if other_type_mark = Void or else not other_type_mark.is_attachment_mark then
				l_other_type_mark := a_default_type_mark
			else
				l_other_type_mark := other_type_mark
			end
			if l_type_mark = Void or else not l_type_mark.is_attachment_mark then
				Result := l_other_type_mark = Void or else not l_other_type_mark.is_attachment_mark
			elseif l_other_type_mark = Void or else not l_other_type_mark.is_attachment_mark then
				Result := False
			elseif l_type_mark.is_attached_mark then
				Result := l_other_type_mark.is_attached_mark
			elseif l_type_mark.is_detachable_mark then
				Result := l_other_type_mark.is_detachable_mark
			end
		end

feature -- Output

	to_text: STRING
			-- Textual representation of current type
			-- (Create a new string at each call.)
		do
			create Result.make (15)
			append_to_string (Result)
		ensure
			to_text_not_void: Result /= Void
		end

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current type to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	unaliased_to_text: STRING
			-- Textual representation of unaliased version of current type
			-- (Create a new string at each call.)
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		do
			create Result.make (15)
			append_unaliased_to_string (Result)
		ensure
			unaliased_to_text_not_void: Result /= Void
		end

	append_unaliased_to_string (a_string: STRING)
			-- Append textual representation of unaliased
			-- version of current type to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		require
			a_string_not_void: a_string /= Void
		do
			append_to_string (a_string)
		end

	runtime_name_to_text: STRING
			-- Textual representation of unaliased version of current type
			-- as returned by 'TYPE.runtime_name'.
			-- (Create a new string at each call.)
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		do
			create Result.make (15)
			append_runtime_name_to_string (Result)
		ensure
			runtime_name_to_text_not_void: Result /= Void
		end

	append_runtime_name_to_string (a_string: STRING)
			-- Append to `a_string' textual representation of unaliased
			-- version of current type as returned by 'TYPE.runtime_name'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		require
			a_string_not_void: a_string /= Void
		do
			append_unaliased_to_string (a_string)
		end

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := unaliased_to_text
		end

end
