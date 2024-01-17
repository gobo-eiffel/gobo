note

	description:

		"Eiffel parent features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
	license: "MIT License"

class ET_PARENT_FEATURE

create

	make

feature {NONE} -- Initialization

	make (a_feature: like precursor_feature; a_parent: like parent)
			-- Create a new parent feature.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
			precursor_feature := a_feature
		ensure
			parent_set: parent = a_parent
			precursor_feature_set: precursor_feature = a_feature
		end

feature -- Initialization

	reset (a_feature: like precursor_feature; a_parent: like parent)
			-- Reset parent feature.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
			precursor_feature := a_feature
			merged_feature := Void
			new_name := Void
			redefine_name := Void
			undefine_name := Void
			select_name := Void
			has_other_deferred := False
			has_other_effective := False
		ensure
			parent_set: parent = a_parent
			precursor_feature_set: precursor_feature = a_feature
		end

feature -- Status report

	is_deferred: BOOLEAN
			-- Is feature inherited as deferred?
		do
			Result := has_undefine or precursor_feature.is_deferred
		ensure
			definition: Result = (has_undefine or precursor_feature.is_deferred)
		end

	has_other_deferred: BOOLEAN
			-- Is there another feature inherited as deferred from the
			-- same parent under the same name (after possible renaming)?

	has_other_effective: BOOLEAN
			-- Is there another feature inherited as effective from the
			-- same parent under the same name (after possible renaming)?

	has_seed (a_seed: INTEGER): BOOLEAN
			-- Does current parent feature have `a_seed'?
		do
			Result := precursor_feature.has_seed (a_seed)
		ensure
			definition: Result = precursor_feature.has_seed (a_seed)
		end

	has_rename: BOOLEAN
			-- Does current feature appear in a Rename clause?
		do
			Result := new_name /= Void
		ensure
			definition: Result = (new_name /= Void)
		end

	has_redefine: BOOLEAN
			-- Does current feature appear in a Redefine clause?
		do
			Result := redefine_name /= Void
		ensure
			definition: Result = (redefine_name /= Void)
		end

	has_undefine: BOOLEAN
			-- Does current feature appear in an Undefine clause?
		do
			Result := undefine_name /= Void
		ensure
			definition: Result = (undefine_name /= Void)
		end

	has_select: BOOLEAN
			-- Does current feature appear in a Select clause?
		do
			Result := select_name /= Void
		ensure
			definition: Result = (select_name /= Void)
		end

feature -- Access

	extended_name: ET_EXTENDED_FEATURE_NAME
			-- Extended feature name
		do
			if attached new_name as l_new_name then
				Result := l_new_name.new_name
			else
				Result := precursor_feature.extended_name
			end
		ensure
			extended_name_not_void: Result /= Void
		end

	name: ET_FEATURE_NAME
			-- Feature name
		do
			if attached new_name as l_new_name then
				Result := l_new_name.new_name.feature_name
			else
				Result := precursor_feature.name
			end
		ensure
			name_not_void: Result /= Void
		end

	alias_names: detachable ET_ALIAS_NAME_LIST
			-- Alias names, if any
		do
			if attached new_name as l_new_name then
				Result := l_new_name.new_name.alias_names
			else
				Result := precursor_feature.alias_names
			end
		end

	precursor_feature: ET_FEATURE
			-- Feature inherited from `parent'

	parent: ET_PARENT
			-- Parent from which current feature is being inherited

	new_name: detachable ET_RENAME
			-- New name when feature is renamed

	undefine_name: detachable ET_FEATURE_NAME
			-- Name listed in undefine clause
			-- when feature is undefined

	redefine_name: detachable ET_FEATURE_NAME
			-- Name listed in redefine clause
			-- when feature is redefined

	select_name: detachable ET_FEATURE_NAME
			-- Name listed in select clause
			-- when feature is selected

	merged_feature: detachable ET_PARENT_FEATURE
			-- Other parent feature being merged or joined
			-- with current Parent feature

	type: detachable ET_TYPE
			-- Return type;
			-- Void for procedures
		do
			Result := precursor_feature.type
		ensure
			definition: Result = precursor_feature.type
		end

	arguments: detachable ET_FORMAL_ARGUMENT_LIST
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
			Result := precursor_feature.arguments
		ensure
			definition: Result = precursor_feature.arguments
		end

	first_seed: INTEGER
			-- First seed
		do
			Result := precursor_feature.first_seed
		ensure
			definition: Result = precursor_feature.first_seed
		end

	other_seeds: detachable ET_FEATURE_IDS
			-- Other seeds (feature IDs of first declarations
			-- of current feature); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')
		do
			Result := precursor_feature.other_seeds
		ensure
			definition: Result = precursor_feature.other_seeds
		end

	clients: ET_CLIENT_LIST
			-- Clients to which feature is exported
		do
			Result := precursor_feature.clients
		ensure
			definition: Result = precursor_feature.clients
		end

feature -- Comparison

	same_version (other: ET_PARENT_FEATURE): BOOLEAN
			-- Do current feature and `other' have the same version?
		require
			other_not_void: other /= Void
		local
			l_other_precursor: ET_FEATURE
		do
			l_other_precursor := other.precursor_feature
			Result := (precursor_feature = l_other_precursor) or else (precursor_feature.version = l_other_precursor.version)
		ensure
			definition: Result = (precursor_feature.version = other.precursor_feature.version)
		end

feature -- Status setting

	set_has_other_deferred (b: BOOLEAN)
			-- Set `has_other_deferred' to `b'.
		do
			has_other_deferred := b
		ensure
			has_other_deferred_set: has_other_deferred = b
		end

	set_has_other_effective (b: BOOLEAN)
			-- Set `has_other_effective' to `b'.
		do
			has_other_effective := b
		ensure
			has_other_effective_set: has_other_effective = b
		end

feature -- Setting

	set_new_name (a_name: like new_name)
			-- Set `new_name' to `a_name'.
		do
			new_name := a_name
		ensure
			new_name_set: new_name = a_name
		end

	set_undefine_name (a_name: like undefine_name)
			-- Set `undefine_name' to `a_name'.
		do
			undefine_name := a_name
		ensure
			undefine_name_set: undefine_name = a_name
		end

	set_redefine_name (a_name: like redefine_name)
			-- Set `redefine_name' to `a_name'.
		do
			redefine_name := a_name
		ensure
			redefine_name_set: redefine_name = a_name
		end

	set_select_name (a_name: like select_name)
			-- Set `select_name' to `a_name'.
		do
			select_name := a_name
		ensure
			select_name_set: select_name = a_name
		end

	set_merged_feature (a_feature: like merged_feature)
			-- Set `merged_feature' to `a_feature'.
		do
			merged_feature := a_feature
		ensure
			merged_feature_set: merged_feature = a_feature
		end

feature -- Link

	next: detachable like Current
			-- Next linked feature if list of features

	set_next (a_next: like next)
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

invariant

	precursor_feature_not_void: precursor_feature /= Void
	parent_not_void: parent /= Void

end
