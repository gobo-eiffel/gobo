indexing

	description:

		"Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE

inherit

	ET_TYPE_ITEM

	ET_ACTUAL_PARAMETER
		redefine
			resolved_formal_parameters,
			resolved_syntactical_constraint
		end

	ET_CONSTRAINT_TYPE
		undefine
			actual_parameter
		end

	ET_DECLARED_TYPE

	ET_TARGET_TYPE

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	direct_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Class on which current type is directly based
			-- (e.g. a Class_type, a Tuple_type or a Bit_type);
			-- Return Void if not directly based on a class
			-- (e.g. Anchored_type). `a_universe' is the
			-- surrounding universe holding all classes.
		require
			a_universe_not_void: a_universe /= Void
		deferred
		end

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			base_class_not_void: Result /= Void
		end

	base_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, or unmatched formal generic parameter if this parameter
			-- is current type.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			base_type_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context, a_universe)
		deferred
		ensure
			base_type_actualnot_void: Result /= Void
			definition: Result.same_named_type (base_type (a_context, a_universe).actual_parameters.type (i), a_context.root_context, a_context.root_context, a_universe)
			actual_parameter_type: Result.same_named_type (base_type_actual_parameter (i, a_context, a_universe).type, a_context.root_context, a_context.root_context, a_universe)
			named_type_named: Result.is_named_type
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context, a_universe)
		deferred
		ensure
			base_type_actual_parameter_not_void: Result /= Void
			--definition: Result.same_actual_parameter (base_type (a_context, a_universe).actual_parameters.actual_parameter (i), a_context.root_context, a_context.root_context, a_universe)
			named_type_named: Result.type.is_named_type
		end

	named_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := base_type (a_context, a_universe)
		ensure
			named_type_not_void: Result /= Void
			named_type_named: Result.is_named_type
		end

	named_parameter (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- Same as current actual parameter but its type
			-- replaced by its named type
		do
			Result := named_type (a_context, a_universe)
		end

	type: ET_TYPE is
			-- Type
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type (a_context, a_universe).actual_parameter_count
		end

feature -- Status report

	is_named_type: BOOLEAN is
			-- Is current type only made up of named types?
		do
			-- Result := False
		end

	is_base_type: BOOLEAN is
			-- Is current type only made up of base types?
		do
			-- Result := False
		end

	is_type_expanded (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type expanded when viewed from
			-- `a_context' in `a_universe'?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_cat_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type monomorphic when viewed from
			-- `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	is_actual_cat_type (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is actual generic parameter at index `i' in the base type of current
			-- type a monomorphic type when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context, a_universe)
		deferred
		ensure
			definition: Result = base_type_actual (i, a_context, a_universe).is_cat_type (a_context, a_universe)
		end

	is_actual_cat_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is actual generic parameter at index `i' in the base type of current
			-- type a non-conforming parameter when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_context, a_universe)
		deferred
		ensure
			definition: Result = base_type_actual (i, a_context, a_universe).is_cat_parameter (a_context, a_universe)
		end

	has_anchored_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type contain an anchored type
			-- when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	has_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain the formal generic parameter
			-- with index `i' when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
		do
			-- Result := False
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context' in `a_universe'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	is_formal_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a formal parameter when viewed from
			-- `a_context', or if it is a qualified type is its
			-- target type (recursively) a formal parameter?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	has_qualified_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is the named type of current type a qualified anchored type (other
			-- than of the form 'like Current.b') when viewed from `a_context',
			-- or do its actual generic parameters (recursively)
			-- contain qualified types?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			symmetric: Result = other.same_syntactical_type (Current, a_context, other_context, a_universe)
		end

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = named_type (a_context, a_universe).same_syntactical_type (other.named_type (other_context, a_universe), other_context, a_context, a_universe)
			symmetric: Result = other.same_named_type (Current, a_context, other_context, a_universe)
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			definition: Result = base_type (a_context, a_universe).same_syntactical_type (other.base_type (other_context, a_universe), other_context, a_context, a_universe)
			symmetric: Result = other.same_base_type (Current, a_context, other_context, a_universe)
		end

feature {ET_TYPE} -- Comparison

	same_syntactical_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_like_current (other: ET_LIKE_CURRENT;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_like_feature (other: ET_LIKE_FEATURE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_qualified_type (other: ET_QUALIFIED_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_syntactical_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
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
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature {ET_TYPE} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

feature -- Convertibility

	convertible_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type appearing in `a_context' convertible
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature {ET_TYPE} -- Convertibility

	convertible_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	convertible_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	convertible_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			other_context_is_root: other_context.is_root_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

	convertible_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			same_root_context: other_context.same_root_context (a_context)
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := False
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := Current
		end

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE is
			-- Version of current type, appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		do
			Result := Current
		end

feature -- Type context

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN is
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_root_context'?
		require
			a_root_context_not_void: a_root_context /= Void
		do
			-- Result := False
		end

feature -- Output

	to_text: STRING is
			-- Textual representation of current type
			-- (Create a new string at each call.)
		do
			Result := STRING_.make (15)
			append_to_string (Result)
		ensure
			to_text_not_void: Result /= Void
		end

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

end
