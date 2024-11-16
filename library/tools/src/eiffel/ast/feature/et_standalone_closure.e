note

	description:

		"Eiffel standalone closures, e.g. features or invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_STANDALONE_CLOSURE

inherit

	ET_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		redefine
			implementation_feature
		end

	HASHABLE

	DEBUG_OUTPUT

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	is_feature: BOOLEAN
			-- Is `Current' a feature?
		do
			-- Result := False
		end

	is_invariants: BOOLEAN
			-- Is `Current' class invariants?
		do
			-- Result := False
		end

	is_function: BOOLEAN
			-- Is `Current' a function?
		do
			-- Result := False
		ensure
			query: Result implies is_query
			routine: Result implies is_routine
		end

	is_query: BOOLEAN
			-- Is `Current' a query?
		do
			Result := (type /= Void)
		ensure
			definition: Result = (type /= Void)
		end

	is_procedure: BOOLEAN
			-- Is `Current' a procedure?
		do
			Result := (type = Void)
		ensure
			definition: Result = (type = Void)
			routine: Result implies is_routine
		end

	is_routine: BOOLEAN
			-- Is `Current' a routine?
		do
			-- Result := False
		end

	is_attribute: BOOLEAN
			-- Is `Current' an attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
			not_routine: Result implies not is_routine
		end

	is_constant_attribute: BOOLEAN
			-- Is `Current' a constant attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
			not_routine: Result implies not is_routine
		end

	is_unique_attribute: BOOLEAN
			-- Is `Current' a unique attribute?
		do
			-- Result := False
		ensure
			query: Result implies is_query
			not_routine: Result implies not is_routine
		end

	is_used: BOOLEAN
			-- Is `Current' used in the system?
			-- For example, is it reachable from the root creation
			-- procedure through the transitive closure.

	has_seed (a_seed: INTEGER): BOOLEAN
			-- Does current feature have `a_seed'?
		do
			if first_seed = a_seed then
				Result := True
			elseif attached other_seeds as l_other_seeds then
				Result := l_other_seeds.has (a_seed)
			end
		ensure
			definition: Result = (first_seed = a_seed or (attached other_seeds as l_other_seeds and then l_other_seeds.has (a_seed)))
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Name of closure
		deferred
		ensure
			name_not_void: Result /= Void
		end

	lower_name: STRING
			-- Lower-name of closure
		deferred
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			lower_case: across Result as l_result all l_result.item.is_lower end
		end

	first_precursor: detachable ET_STANDALONE_CLOSURE
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.
		deferred
		end

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided;
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		ensure
			implementation_class_not_void: Result /= Void
		end

	implementation_feature: ET_STANDALONE_CLOSURE
			-- Current feature in `implementation_class',
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		end

	first_seed: INTEGER
			-- First seed
		do
		end

	other_seeds: detachable ET_FEATURE_IDS
			-- Other seeds (feature IDs of first declarations
			-- of current feature); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')
		do
		end


feature -- Status setting

	set_used (b: BOOLEAN)
			-- Set `is_used' to `b'.
		do
			is_used := b
		ensure
			used_set: is_used = b
		end

feature -- Export status

	clients: ET_CLIENT_LIST
			-- Clients to which feature is exported
		deferred
		ensure
			clients_not_void: Result /= Void
		end

feature -- Validity checking status

	validity_checked: BOOLEAN
			-- Has the validity of current closure been checked?
			-- (Check everything except preconditions and postconditions.)

	has_validity_error: BOOLEAN
			-- Has a fatal error occurred during validity checking?
			-- (Check everything except preconditions and postconditions.)

	set_validity_checked
			-- Set `validity_checked' to True.
		do
			validity_checked := True
		ensure
			validity_checked: validity_checked
		end

	set_validity_error
			-- Set `has_validity_error' to True.
		do
			has_validity_error := True
		ensure
			has_validity_error: has_validity_error
		end

	reset_validity_checked
			-- Set `validity_checked' to False.
		do
			has_validity_error := False
			validity_checked := False
		ensure
			validity_not_checked: not validity_checked
			no_validity_error: not has_validity_error
		end

feature -- Conversion

	as_feature: ET_FEATURE
			-- `Current' viewed as a feature
		require
			is_feature: is_feature
		do
			check is_feature: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_invariants: ET_INVARIANTS
			-- `Current' viewed as class invariants
		require
			is_invariants: is_invariants
		do
			check is_invariants: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := name.name
		end

end
