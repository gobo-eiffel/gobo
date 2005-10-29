indexing

	description:

		"Eiffel features being processed through the Feature_adaptation clause"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_FEATURE

inherit

	ET_FLATTENED_FEATURE
		redefine
			is_immediate,
			is_adapted,
			adapted_feature
		end

	ET_REPLICABLE_FEATURE

create

	-- This is a deferred class but it has no deferred
	-- features (allowed in ETL3 but not supported yet
	-- by VE 1.1).

feature -- Status report

	is_adapted: BOOLEAN is True
			-- Is current feature being either inherited or redeclared?

	is_immediate: BOOLEAN is False
			-- Is current feature immediate?

	is_selected: BOOLEAN
			-- Has an inherited feature been selected
			-- to solve a replication conflict?

	is_replicated: BOOLEAN is
			-- Has current feature been replicated?
		do
			Result := replicated_seeds /= Void
		ensure
			definition: Result = (replicated_seeds /= Void)
		end

	has_selected_feature: BOOLEAN is
			-- Does current inherited feature or one of its merged
			-- or joined features appear in a Select clause?
		do
			Result := selected_feature /= Void
		ensure
			definition: Result = (selected_feature /= Void)
		end

	is_other_seeds_shared: BOOLEAN is
			-- Is `other_seeds' object shared with one of
			-- the precursors? (If shared, then we need to
			-- clone it before modifying it.)
		do
			Result := (other_seeds = parent_feature.other_seeds)
		end

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := parent_feature.name
		ensure then
			definition: Result = parent_feature.name
		end

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
			Result := parent_feature.alias_name
		ensure
			definition: Result = parent_feature.alias_name
		end

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
			Result := flattened_feature.type
		ensure then
			definition: Result = flattened_feature.type
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
			Result := flattened_feature.arguments
		ensure then
			definition: Result = flattened_feature.arguments
		end

	flattened_feature: ET_FEATURE
			-- Feature resulting after feature adaptation

	parent_feature: ET_PARENT_FEATURE
			-- Feature in `parent'

	seeded_feature (a_seed: INTEGER): ET_PARENT_FEATURE is
			-- Either current parent feature or one of its merged or joined
			-- features whose precursor feature has `a_seed' as seed
		require
			has_seed: has_seed (a_seed)
		local
			a_feature: ET_PARENT_FEATURE
		do
			from
				a_feature := parent_feature
			until
				Result /= Void
			loop
				if a_feature.has_seed (a_seed) then
					Result := a_feature
				else
					a_feature := a_feature.merged_feature
				end
			end
		ensure
			seeded_feature_not_void: Result /= Void
			has_seed: Result.has_seed (a_seed)
		end

	selected_feature: ET_PARENT_FEATURE is
			-- Either current parent feature or one of its merged or
			-- joined features that appears in a Select clause?
		local
			a_feature: ET_PARENT_FEATURE
		do
			from
				a_feature := parent_feature
			until
				a_feature = Void
			loop
				if a_feature.has_select then
					Result := a_feature
					a_feature := Void -- Jump out of the loop.
				else
					a_feature := a_feature.merged_feature
				end
			end
		ensure
			has_select: Result /= Void implies Result.has_select
		end

	adapted_feature: ET_ADAPTED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		do
			Result := Current
		end

	first_feature: ET_ADAPTED_FEATURE is
			-- First feature with a given seed
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	selected_count: INTEGER is
			-- Number of selected features
		do
			if has_selected_feature then
				Result := 1
			end
		end

	replicated_seeds: ET_FEATURE_IDS
			-- Seeds involved when current feature has been replicated

	replicated_features: DS_LINKED_LIST [ET_PARENT_FEATURE]
			-- Features which had the same seed as current feature
			-- in their parents but which have been replicated in
			-- current class
--		require
--			is_selected: is_selected

feature -- Setting

	set_first_seed (a_seed: INTEGER) is
			-- Set `first_seed' to `a_seed'.
		require
			a_seed_positive: a_seed > 0
		do
			first_seed := a_seed
		ensure
			first_seed_set: first_seed = a_seed
		end

	set_other_seeds (a_seeds: like other_seeds) is
			-- Set `other_seeds' to `a_seeds'.
		do
			other_seeds := a_seeds
		ensure
			other_seeds_set: other_seeds = a_seeds
		end

feature -- Status setting

	set_replicated (a_seed: INTEGER) is
			-- Set `is_replicated' to True.
			-- `a_seed' is the seed which needs replication.
		require
			has_seed: has_seed (a_seed)
		do
			if replicated_seeds = Void then
				create replicated_seeds.make (a_seed)
			elseif not replicated_seeds.has (a_seed) then
				replicated_seeds.put (a_seed)
			end
		ensure
			is_replicated: is_replicated
		end

	set_selected is
			-- Set `is_selected' to True.
		do
			is_selected := True
		ensure
			is_selected: is_selected
		end

feature -- Element change

	put_parent_feature (a_feature: ET_PARENT_FEATURE) is
			-- Add `a_feature' to the merged/joined features.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_not_merged: a_feature.merged_feature = Void
			same_name: a_feature.name.same_feature_name (name)
		local
			a_seeds: like other_seeds
			a_seed: INTEGER
			i, nb: INTEGER
			need_twin: BOOLEAN
		do
			a_feature.set_merged_feature (parent_feature.merged_feature)
			parent_feature.set_merged_feature (a_feature)
			need_twin := is_other_seeds_shared
			a_seed := a_feature.first_seed
			if not has_seed (a_seed) then
				if other_seeds = Void then
					create other_seeds.make (a_seed)
					need_twin := False
				else
					if need_twin then
						other_seeds := other_seeds.cloned_object
						need_twin := False
					end
					other_seeds.put (a_seed)
				end
			end
			a_seeds := a_feature.other_seeds
			if a_seeds /= Void then
				nb := a_seeds.count
				from i := 1 until i > nb loop
					a_seed := a_seeds.item (i)
					if not has_seed (a_seed) then
						if other_seeds = Void then
							create other_seeds.make (a_seed)
							need_twin := False
						else
							if need_twin then
								other_seeds := other_seeds.cloned_object
								need_twin := False
							end
							other_seeds.put (a_seed)
						end
					end
					i := i + 1
				end
			end
		end

	add_replicated_feature (a_feature: ET_PARENT_FEATURE) is
			-- Add `a_feature' to `replicated_features'.
		require
			is_selected: is_selected
			a_feature_not_void: a_feature /= Void
		do
			if replicated_features = Void then
				create replicated_features.make
			end
			replicated_features.force_last (a_feature)
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

	parent_feature_not_void: parent_feature /= Void
	is_adapted: is_adapted
	-- valid_replicated_seeds: replicated_seeds /= Void implies forall a_seed in replicated_seeds, has_seed (a_seed)
	no_void_replicated_features: replicated_features /= Void implies not replicated_features.has (Void)

end
