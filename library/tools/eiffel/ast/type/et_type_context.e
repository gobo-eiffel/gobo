indexing

	description:

		"Contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONTEXT

feature -- Access

	type: ET_TYPE is
			-- Type of current context
		deferred
		ensure
			type_not_void: Result /= Void
		end

	context: ET_TYPE_CONTEXT is
			-- Context in which `type' is viewed
		deferred
		ensure
			context_not_void: Result /= Void
			same_root_context: Result.root_context = root_context
			valid_context: is_valid_context implies Result.is_valid_context
		end

	base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of `type' when it appears in `context' in `a_universe'
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := type.base_class (context, a_universe)
		ensure
			base_class_not_void: Result /= Void
		end

	base_type (a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of `type' when it appears in `context' in `a_universe'
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := type.base_type (context, a_universe)
		ensure
			base_type_not_void: Result /= Void
			deep_base_type: Result.is_named_type
		end

	base_type_actual (i: INTEGER; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of `base_type'
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_universe)
		do
			Result := type.base_type_actual (i, context, a_universe)
		ensure
			base_type_actual_not_void: Result /= Void
			definition: Result.same_named_type (base_type (a_universe).actual_parameters.type (i), root_context, root_context, a_universe)
			actual_parameter_type: Result.same_named_type (base_type_actual_parameter (i, a_universe).type, root_context, root_context, a_universe)
			named_type_named: Result.is_named_type
		end

	base_type_actual_parameter (i: INTEGER; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of `base_type'
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_universe)
		do
			Result := type.base_type_actual_parameter (i, context, a_universe)
		ensure
			base_type_actual_parameter_not_void: Result /= Void
			--definition: Result.same_actual_parameter (base_type (a_universe).actual_parameters.actual_parameter (i), root_context, root_context, a_universe)
			named_type_named: Result.type.is_named_type
		end

	root_context: ET_BASE_TYPE is
			-- Context of `type', or recursively the context of
			-- its context, such that it is its own context
		do
			Result := context.root_context
		ensure
			root_context_not_void: Result /= Void
			is_root: Result.context = Result
			same_root_context: Result.root_context = Result
			valid_context: is_valid_context implies Result.is_valid_context
		end

feature -- Measurement

	base_type_actual_count (a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of `base_type'
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := type.base_type_actual_count (context, a_universe)
		ensure
			definition: Result = base_type (a_universe).actual_parameter_count
		end

feature -- Status report

	is_valid_context: BOOLEAN is
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves
		local
			a_root_context: like root_context
		do
			a_root_context := root_context
			Result := a_root_context.is_valid_context_type (a_root_context)
		end

	is_root_context: BOOLEAN is
			-- Is current context its own root context?
		do
			-- Result := False
		ensure
			definition: Result = (root_context = Current)
		end

	has_context (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is `a_context' the current context, or
			-- recursively the context of its context?
		require
			a_context_not_void: a_context /= Void
		do
			if a_context = Current then
				Result := True
			else
				Result := context.has_context (a_context)
			end
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

	is_cat_type (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' a monomorphic type in `a_universe'?
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := type.is_cat_type (context, a_universe)
		end

	is_actual_cat_type (i: INTEGER; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is actual generic parameter at index `i' in `base_type'
			-- a monomorphic type in `a_universe'?
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_universe)
		do
			Result := type.is_actual_cat_type (i, context, a_universe)
		ensure
			definition: Result = base_type_actual (i, a_universe).is_cat_type (context, a_universe)
		end

	is_cat_parameter (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' a non-conforming actual
			-- generic parameter in `a_universe'?
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
		do
			Result := type.is_cat_parameter (context, a_universe)
		end

	is_actual_cat_parameter (i: INTEGER; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is actual generic parameter at index `i' in `base_type'
			-- a non-conforming parameter in `a_universe'?
		require
			valid_context: is_valid_context
			a_universe_not_void: a_universe /= Void
			-- no_cycle: no cycle in anchored types involved.
			i_large_enough: i >= 1
			i_small_enough: i <= base_type_actual_count (a_universe)
		do
			Result := type.is_actual_cat_parameter (i, context, a_universe)
		ensure
			definition: Result = base_type_actual_parameter (i, a_universe).is_cat_parameter (context, a_universe)
		end

end
