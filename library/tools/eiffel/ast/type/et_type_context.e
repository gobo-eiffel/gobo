indexing

	description:

		"Contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONTEXT

inherit

	ANY -- Needed for SE 2.1.

	ET_SHARED_TOKEN_CONSTANTS

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	root_context: ET_BASE_TYPE is
			-- Root context
		deferred
		ensure
			root_context_not_void: Result /= Void
			same_root_context: Result.root_context = Result
			valid_context: is_valid_context implies Result.is_valid_context
		end

	new_type_context (a_type: ET_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New type context made up of `a_type' in current context
		require
			a_type_not_void: a_type /= Void
		deferred
		ensure
			new_type_context_not_void: Result /= Void
			valid_context: is_valid_context implies Result.is_valid_context
			same_root_context: Result.same_root_context (Current)
		end

	base_class: ET_CLASS is
			-- Base class of current context
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := named_base_class.actual_class
		ensure
			base_class_not_void: Result /= Void
		end

	named_base_class: ET_NAMED_CLASS is
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

	base_type: ET_BASE_TYPE is
			-- Base type of current context
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			base_type_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_actual (i: INTEGER): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of `base_type'
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count
		deferred
		ensure
			base_type_actual_not_void: Result /= Void
			definition: Result.same_named_type (base_type.actual_parameters.type (i), root_context, root_context)
			actual_parameter_type: Result.same_named_type (base_type_actual_parameter (i).type, root_context, root_context)
			named_type_named: Result.is_named_type
		end

	base_type_actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER is
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

	base_type_index_of_label (a_label: ET_IDENTIFIER): INTEGER is
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

	named_type: ET_NAMED_TYPE is
			-- Same as `base_type' except when the type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart. Return this new formal type
			-- in that case instead of the base type of its constraint.
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			named_type_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

feature -- Measurement

	base_type_actual_count: INTEGER is
			-- Number of actual generic parameters of `base_type'
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type.actual_parameter_count
		end

feature -- Status report

	is_valid_context: BOOLEAN is
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves
		deferred
		end

	is_root_context: BOOLEAN is
			-- Is current context its own root context?
		do
			-- Result := False
		ensure
			definition: Result = ANY_.same_objects (root_context, Current)
		end

	same_root_context (other: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' have the same root context?
		require
			other_not_void: other /= Void
		do
			Result := other.root_context = root_context
		ensure
			definition: Result = (other.root_context = root_context)
		end

	is_type_expanded: BOOLEAN is
			-- Is `base_type' expanded?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_type_reference: BOOLEAN is
			-- Is `base_type' a reference type?
		require
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	named_type_has_formal_type (i: INTEGER): BOOLEAN is
			-- Does the named type of current context contain the
			-- formal generic parameter with index `i'?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
		deferred
		end

	named_type_has_formal_types: BOOLEAN is
			-- Does the named type of current context
			-- contain a formal generic parameter?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	base_type_has_class (a_class: ET_CLASS): BOOLEAN is
			-- Does the base type of current context contain `a_class'?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

	named_type_has_class (a_class: ET_CLASS): BOOLEAN is
			-- Does the named type of current context contain `a_class'?
		require
			valid_context: is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

feature -- Comparison

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = named_type.same_syntactical_type (other.named_type (other_context), other_context.root_context, root_context)
		end

	same_named_context (other: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' context have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := same_named_type (tokens.like_current, other)
		ensure
			definition: Result = named_type.same_syntactical_type (other.named_type, other.root_context, root_context)
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type.same_syntactical_type (other.base_type (other_context), other_context.root_context, root_context)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current context conform to `other' type appearing in `other_context'?
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

	conforms_to_context (other: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current context conform to `other' context?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			valid_context: is_valid_context
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := conforms_to_type (tokens.like_current, other)
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
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

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
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

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
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

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
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

end
