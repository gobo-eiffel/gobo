note

	description:

		"Contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONTEXT

inherit

	ANY -- Needed for SE 2.1.

	ET_SHARED_TOKEN_CONSTANTS

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	root_context: ET_BASE_TYPE
			-- Root context
		deferred
		ensure
			root_context_not_void: Result /= Void
			same_root_context: Result.root_context = Result
			valid_context: is_valid_context implies Result.is_valid_context
		end

	new_type_context (a_type: ET_TYPE): ET_TYPE_CONTEXT
			-- New type context made up of `a_type' in current context
		require
			a_type_not_void: a_type /= Void
		deferred
		ensure
			new_type_context_not_void: Result /= Void
			valid_context: is_valid_context implies Result.is_valid_context
			same_root_context: Result.same_root_context (Current)
		end

	base_class: ET_CLASS
			-- Base class of current context
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := named_base_class.actual_class
		ensure
			base_class_not_void: Result /= Void
		end

	named_base_class: ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in)
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			named_base_class_not_void: Result /= Void
		end

	base_type: ET_BASE_TYPE
			-- Base type of current context
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_type_with_type_mark (Void)
		ensure
			base_type_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			base_type_with_type_mark_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_actual (i: INTEGER): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of `base_type'
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count
		deferred
		ensure
			base_type_actual_not_void: Result /= Void
			definition: attached base_type.actual_parameters as l_actual_parameters and then Result.same_named_type (l_actual_parameters.type (i), root_context, root_context)
			actual_parameter_type: Result.same_named_type (base_type_actual_parameter (i).type, root_context, root_context)
			named_type_named: Result.is_named_type
		end

	base_type_actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of `base_type'
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count
		deferred
		ensure
			base_type_actual_parameter_not_void: Result /= Void
			--definition: Result.same_actual_parameter (base_type.actual_parameters.actual_parameter (i), root_context, root_context)
			named_type_named: Result.type.is_named_type
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER): INTEGER
			-- Index of actual generic parameter with label `a_label' in `base_type';
			-- 0 if it does not exist
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_label_not_void: a_label /= Void
		deferred
		ensure
			definition: Result = base_type.index_of_label (a_label)
			index_large_enough: Result >= 0
			index_small_enough: Result <= base_type_actual_count
		end

	named_type: ET_NAMED_TYPE
			-- Same as `base_type' except when the type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart. Return this new formal type
			-- in that case instead of the base type of its constraint.
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := named_type_with_type_mark (Void)
		ensure
			named_type_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			named_type_with_type_mark_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

feature -- Measurement

	base_type_actual_count: INTEGER
			-- Number of actual generic parameters of `base_type'
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type.actual_parameter_count
		end

feature -- Status report

	is_valid_context: BOOLEAN
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves
		deferred
		end

	is_root_context: BOOLEAN
			-- Is current context its own root context?
		do
			-- Result := False
		ensure
			definition: Result = ANY_.same_objects (root_context, Current)
		end

	same_root_context (other: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' have the same root context?
		require
			other_not_void: other /= Void
		do
			Result := other.root_context = root_context
		ensure
			definition: Result = (other.root_context = root_context)
		end

	is_type_expanded: BOOLEAN
			-- Is `base_type' expanded?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		require
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_expanded_with_type_mark (Void)
		end

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_reference: BOOLEAN
			-- Is `base_type' a reference type?
		require
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_reference_with_type_mark (Void)
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_attached: BOOLEAN
			-- Is `base_type' an attached type?
		require
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_attached_with_type_mark (Void)
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_detachable: BOOLEAN
			-- Is `base_type' a detachable type?
		require
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := is_type_detachable_with_type_mark (Void)
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	base_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the base type of current context contain `a_class'?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

	named_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the named type of current context contain `a_class'?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

	attachment_type_conformance_mode: BOOLEAN
			-- Should attachment status be taken into account when checking
			-- conformance of types in the universe of the base class of `root_context'?
		do
			Result := root_context.base_class.universe.attachment_type_conformance_mode
		end

feature -- Comparison

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_named_type_with_type_marks (other, Void, other_context, Void)
		ensure
			definition: Result = named_type.same_syntactical_type (other.named_type (other_context), other_context.root_context, root_context)
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = named_type_with_type_mark (a_type_mark).same_syntactical_type (other.named_type_with_type_mark (other_type_mark, other_context), other_context.root_context, root_context)
		end

	same_named_context (other: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' context have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_named_context_with_type_marks (Void, other, Void)
		ensure
			definition: Result = named_type.same_syntactical_type (other.named_type, other.root_context, root_context)
		end

	same_named_context_with_type_marks (other_type_mark: detachable ET_TYPE_MARK; other: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `same_named_context' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_named_type_with_type_marks (tokens.identity_type, other_type_mark, other, a_type_mark)
		ensure
			definition: Result = named_type_with_type_mark (a_type_mark).same_syntactical_type (other.named_type_with_type_mark (other_type_mark), other.root_context, root_context)
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_base_type_with_type_marks (other, Void,  other_context, Void)
		ensure
			definition: Result = base_type.same_syntactical_type (other.base_type (other_context), other_context.root_context, root_context)
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type_with_type_mark (a_type_mark).same_syntactical_type (other.base_type_with_type_mark (other_type_mark, other_context), other_context.root_context, root_context)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_named_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current context conform to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := conforms_to_type_with_type_marks (other, Void, other_context, Void)
		end

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	conforms_to_context (other: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current context conform to `other' context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := conforms_to_context_with_type_marks (Void, other, Void)
		end

	conforms_to_context_with_type_marks (other_type_mark: detachable ET_TYPE_MARK; other: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `conforms_to_context' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := conforms_to_type_with_type_marks (tokens.identity_type, other_type_mark, other, a_type_mark)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature -- Conversion

	as_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return `Current' is already a nested type context.
		do
			Result := to_nested_type_context
		ensure
			new_type_context_not_void: Result /= Void
			valid_context: is_valid_context implies Result.is_valid_context
			same_root_context: Result.same_root_context (Current)
		end

	to_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return a new object at each call.
		deferred
		ensure
			new_type_context_not_void: Result /= Void
			valid_context: is_valid_context implies Result.is_valid_context
			same_root_context: Result.same_root_context (Current)
		end

end
