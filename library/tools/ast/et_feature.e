indexing

	description:

		"Eiffel features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FEATURE

inherit

	HASHABLE

	KL_IMPORTED_FIXED_ARRAY_TYPE [ET_FEATURE]
		rename
			FIXED_ARRAY_TYPE as FIXED_FEATURE_ARRAY_TYPE
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	clients: ET_CLIENTS
			-- Clients to which feature is exported

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := name.hash_code
		end

	version: ET_FEATURE
			-- Version (last declaration of current feature)

	seeds: like FIXED_FEATURE_ARRAY_TYPE
			-- Seeds (first declarations of current feature)

	base_class: ET_CLASS
			-- Class where current feature object has been created

	version_class: ET_CLASS is
			-- Class where `version' has been introduced
			-- (Useful when feature has been replicated.)
		do
			Result := version.base_class
		ensure
			definition: Result = version.base_class
		end

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided (Useful for interpreting
			-- feature calls and type anchors (that might
			-- be renamed in descendant classes) when feature
			-- is inherited as-is.)

feature -- Status report

	is_frozen: BOOLEAN
			-- Has feature been declared as frozen?

	is_deferred: BOOLEAN is
			-- Is feature deferred?
		do
			Result := False
		end

	is_attribute: BOOLEAN is
			-- Is feature an attribute?
		do
			Result := False
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			Result := False
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			Result := False
		end

	has_seed (a_seed: ET_FEATURE): BOOLEAN is
			-- Is `a_seed' a seed of current feature?
		require
			a_seed_not_void: a_seed /= Void
		local
			i: INTEGER
		do
			from i := seeds.count - 1 until i < 0 loop
				if seeds.item (i) = a_seed then
					Result := True
					i := -1  -- Jump out of loop.
				else
					i := i - 1
				end
			end
		end

	valid_seeds (a_seeds: like seeds): BOOLEAN is
			-- Are `a_seeds' valid seeds?
		require
			a_seeds_not_void: a_seeds /= Void
		do
			Result := a_seeds.count >= 1 and
				not FIXED_FEATURE_ARRAY_.has (a_seeds, Void)
		ensure
			definition: Result = (a_seeds.count >= 1 and
				not FIXED_FEATURE_ARRAY_.has (a_seeds, Void))
		end

feature -- Comparison

	same_version (other: ET_FEATURE): BOOLEAN is
			-- Do current feature and `other' have
			-- the same version?
		require
			other_not_void: other /= Void
		do
			Result := version = other.version
		ensure
			definition: Result = (version = other.version)
		end

	same_signature (other: ET_FEATURE): BOOLEAN is
			-- Does current feature have the same 
			-- signature as `other'?
		require
			other_not_void: other /= Void
		do
			Result := True
		end

	signature_conforms_to (other: ET_FEATURE): BOOLEAN is
			-- Does signature of current feature
			-- conform to signature of `other'?
		require
			other_not_void: other /= Void
		do
			Result := True
		end

feature -- Setting

	set_version (a_feature: like version) is
			-- Set `version' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			version := a_feature
		ensure
			version_set: version = a_feature
		end

	set_implementation_class (a_class: like implementation_class) is
			-- Set `implementation_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
		ensure
			implementation_class_set: implementation_class = a_class
		end

	set_seeds (a_seeds: like seeds) is
			-- Set `seeds' to `a_seeds'.
		require
			a_seeds_not_void: a_seeds /= Void
			a_seeds_valid: valid_seeds (a_seeds)
		do
			seeds := a_seeds
		ensure
			seeds_set: seeds = a_seeds
		end

feature -- Status setting

	set_frozen is
			-- Set `is_frozen' to true.
		do
			is_frozen := True
		ensure
			is_frozen: is_frozen
		end

feature -- Element change

	replace_seed (old_seed, new_seed: ET_FEATURE) is
			-- Replace `old_seed' by `new_seed'.
		require
			old_seed_not_void: old_seed /= Void
			has_old_seed: has_seed (old_seed)
			new_seed_not_void: new_seed /= Void
			not_has_new_seed: not has_seed (new_seed)
		local
			i: INTEGER
			found: BOOLEAN
		do
			seeds := clone (seeds)
			from until found loop
				if seeds.item (i) = old_seed then
					seeds.put (new_seed, i)
					found := True
				else
					i := i + 1
				end
			end
		ensure
			same_count: seeds.count = old (seeds.count)
			not_has_old_seed: not has_seed (old_seed)
			has_new_seed: has_seed (new_seed)
		end

	remove_seed (a_seed: ET_FEATURE) is
			-- Remove `a_seed' from `seeds'.
		require
			a_seed_not_void: a_seed /= Void
			has_seed: has_seed (a_seed)
		local
			old_seeds: like seeds
			i, j, nb: INTEGER
			old_seed: ET_FEATURE
		do
			old_seeds := seeds
			nb := old_seeds.count
			seeds := FIXED_FEATURE_ARRAY_.make (nb - 1)
			from until i = nb loop
				old_seed := old_seeds.item (i)
				if old_seed /= a_seed then
					seeds.put (old_seed, j)
					j := j + 1
				end
				i := i + 1
			end
		ensure
			one_less: seeds.count = old (seeds.count) - 1
			not_has_seed: not has_seed (a_seed)
		end

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			synonym_not_void: Result /= Void
			name_set: Result.name = a_name
		end

feature -- Conversion

	renamed_feature (a_name: like name; a_class: like base_class): like Current is
			-- Renamed version of current feature
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		deferred
		ensure
			renamed_feature_not_void: Result /= Void
			name_set: Result.name = a_name
			base_class_set: Result.base_class = a_class
		end

	undefined_feature (a_name: like name; a_class: like base_class): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		deferred
		ensure
			undefined_feature_not_void: Result /= Void
			name_set: Result.name = a_name
			version_set: Result.version = Result
			base_class_set: Result.base_class = a_class
		end

feature {NONE} -- Implementation

	new_seeds: like seeds is
			-- New seeds made up of only current feature.
		do
			Result := FIXED_FEATURE_ARRAY_.make (1)
			Result.put (Current, 0)
		ensure
			new_seeds_not_void: Result /= Void
			new_seeds_valid: valid_seeds (Result)
		end

	FIXED_FEATURE_ARRAY_: KL_FIXED_ARRAY_ROUTINES [ET_FEATURE] is
			-- Routines that ought to be in FIXED_ARRAY
		once
			!! Result
		ensure
			fixed_feature_array_not_void: Result /= Void
		end

invariant

	name_not_void: name /= Void
	clients_not_void: clients /= Void
	version_not_void: version /= Void
	seeds_not_void: seeds /= Void
	valid_seeds: valid_seeds (seeds)
	base_class_not_void: base_class /= Void
	implementation_class_not_void: implementation_class /= Void

end -- class ET_FEATURE
