indexing

	description:

		"Eiffel parent features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_FEATURE

create

	make

feature {NONE} -- Initialization

	make (a_feature: like precursor_feature; a_parent: like parent) is
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

	reset (a_feature: like precursor_feature; a_parent: like parent) is
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
		ensure
			parent_set: parent = a_parent
			precursor_feature_set: precursor_feature = a_feature
		end

feature -- Status report

	is_deferred: BOOLEAN is
			-- Is feature inherited as deferred?
		do
			Result := precursor_feature.is_deferred or has_undefine
		ensure
			definition: Result = (precursor_feature.is_deferred or has_undefine)
		end

	has_seed (a_seed: INTEGER): BOOLEAN is
			-- Does current parent feature have `a_seed'?
		do
			Result := precursor_feature.has_seed (a_seed)
		ensure
			definition: Result = precursor_feature.has_seed (a_seed)
		end

	has_rename: BOOLEAN is
			-- Does current feature appear in a Rename clause?
		do
			Result := new_name /= Void
		ensure
			definition: Result = (new_name /= Void)
		end

	has_redefine: BOOLEAN is
			-- Does current feature appear in a Redefine clause?
		do
			Result := redefine_name /= Void
		ensure
			definition: Result = (redefine_name /= Void)
		end

	has_undefine: BOOLEAN is
			-- Does current feature appear in an Undefine clause?
		do
			Result := undefine_name /= Void
		ensure
			definition: Result = (undefine_name /= Void)
		end

	has_select: BOOLEAN is
			-- Does current feature appear in a Select clause?
		do
			Result := select_name /= Void
		ensure
			definition: Result = (select_name /= Void)
		end

feature -- Access

	extended_name: ET_EXTENDED_FEATURE_NAME is
			-- Extended feature name
		do
			if new_name /= Void then
				Result := new_name.new_name
			else
				Result := precursor_feature.extended_name
			end
		ensure
			extended_name_not_void: Result /= Void
		end

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			if new_name /= Void then
				Result := new_name.new_name.feature_name
			else
				Result := precursor_feature.name
			end
		ensure
			name_not_void: Result /= Void
		end

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
			if new_name /= Void then
				Result := new_name.new_name.alias_name
			else
				Result := precursor_feature.alias_name
			end
		end

	precursor_feature: ET_FEATURE
			-- Feature inherited from `parent'

	parent: ET_PARENT
			-- Parent from which current feature is being inherited

	new_name: ET_RENAME
			-- New name when feature is renamed

	undefine_name: ET_FEATURE_NAME
			-- Name listed in undefine clause
			-- when feature is undefined

	redefine_name: ET_FEATURE_NAME
			-- Name listed in redefine clause
			-- when feature is redefined

	select_name: ET_FEATURE_NAME
			-- Name listed in select clause
			-- when feature is selected

	merged_feature: ET_PARENT_FEATURE
			-- Other parent feature being merged or joined
			-- with current Parent feature

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
			Result := precursor_feature.type
		ensure
			definition: Result = precursor_feature.type
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
			Result := precursor_feature.arguments
		ensure
			definition: Result = precursor_feature.arguments
		end

	first_seed: INTEGER is
			-- First seed
		do
			Result := precursor_feature.first_seed
		ensure
			definition: Result = precursor_feature.first_seed
		end

	other_seeds: ET_FEATURE_IDS is
			-- Other seeds (feature IDs of first declarations
			-- of current feature); May be Void if there
			-- is only one seed (which is then accessible
			-- through `first_seed')
		do
			Result := precursor_feature.other_seeds
		ensure
			definition: Result = precursor_feature.other_seeds
		end

	clients: ET_CLASS_NAME_LIST is
			-- Clients to which feature is exported
		do
			Result := precursor_feature.clients
		ensure
			definition: Result = precursor_feature.clients
		end

feature -- Comparison

	same_version (other: ET_PARENT_FEATURE): BOOLEAN is
			-- Do current feature and `other' have the same version?
		require
			other_not_void: other /= Void
		do
			Result := precursor_feature.version = other.precursor_feature.version
		ensure
			definition: Result = (precursor_feature.version = other.precursor_feature.version)
		end

feature -- Setting

	set_new_name (a_name: like new_name) is
			-- Set `new_name' to `a_name'.
		do
			new_name := a_name
		ensure
			new_name_set: new_name = a_name
		end

	set_undefine_name (a_name: like undefine_name) is
			-- Set `undefine_name' to `a_name'.
		do
			undefine_name := a_name
		ensure
			undefine_name_set: undefine_name = a_name
		end

	set_redefine_name (a_name: like redefine_name) is
			-- Set `redefine_name' to `a_name'.
		do
			redefine_name := a_name
		ensure
			redefine_name_set: redefine_name = a_name
		end

	set_select_name (a_name: like select_name) is
			-- Set `select_name' to `a_name'.
		do
			select_name := a_name
		ensure
			select_name_set: select_name = a_name
		end

	set_merged_feature (a_feature: like merged_feature) is
			-- Set `merged_feature' to `a_feature'.
		do
			merged_feature := a_feature
		ensure
			merged_feature_set: merged_feature = a_feature
		end

feature -- Link

	next: like Current
			-- Next linked feature if list of features

	set_next (a_next: like Current) is
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
