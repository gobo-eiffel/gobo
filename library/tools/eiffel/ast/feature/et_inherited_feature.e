indexing

	description:

		"Eiffel inherited features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INHERITED_FEATURE

inherit

	ET_ADAPTED_FEATURE
		redefine
			name, is_deferred,
			new_name, undefine_name, redefine_name,
			select_name, inherited_feature,
			merged_feature, is_other_seeds_shared,
			adapted_feature
		end

creation

	make

feature {NONE} -- Initialization

	make (a_feature: like precursor_feature; a_parent: like parent) is
			-- Create a new inherited feature.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
			precursor_feature := a_feature
			flattened_feature := a_feature
			inherited_flattened_feature := Current
			id := a_feature.id
			name_item := a_feature.name_item
			version := a_feature.version
			clients := a_feature.clients
			implementation_class := a_feature.implementation_class
			first_seed := a_feature.first_seed
			other_seeds := a_feature.other_seeds
			frozen_keyword := a_feature.frozen_keyword
			cat_keyword := a_feature.cat_keyword
		ensure
			parent_set: parent = a_parent
			precursor_feature_set: precursor_feature = a_feature
			flattened_feature_set: flattened_feature = a_feature
			registered: id = a_feature.id
		end

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			if new_name /= Void then
				Result := new_name.new_name
			else
				Result := name_item.feature_name
			end
		end

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

	precursor_feature: ET_FLATTENED_FEATURE
			-- Feature inherited from `parent'

	inherited_feature: ET_INHERITED_FEATURE is
			-- Current feature viewed as an inherited feature
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	parent_feature: ET_FEATURE is
			-- Feature in `parent'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	merged_feature: ET_FEATURE
			-- Inherited feature being merged or joined
			-- with current inherited feature

	adapted_feature: ET_INHERITED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		do
			Result := Current
			if merged_feature /= Void then
				merged_feature := merged_feature.inherited_feature.adapted_feature
			end
		end

	inherited_flattened_feature: ET_FEATURE
			-- Inherited feature from which `flattened_feature' is resulting

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

	set_flattened_feature (a_feature: like flattened_feature) is
			-- Set `flattened_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			flattened_feature := a_feature
		ensure
			flattened_feature_set: flattened_feature = a_feature
		end

	set_inherited_flattened_feature (a_feature: like inherited_flattened_feature) is
			-- Set `inherited_flattened_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
		do
			inherited_flattened_feature := a_feature
		ensure
			inherited_flattened_feature_set: inherited_flattened_feature = a_feature
		end

feature -- Status report

	is_redeclared: BOOLEAN is False
			-- Is current feature being redeclared?

	is_deferred: BOOLEAN is
			-- Is feature inherited as deferred?
		do
			Result := precursor_feature.is_deferred or has_undefine
		ensure then
			definition: Result = (precursor_feature.is_deferred or has_undefine)
		end

	is_other_seeds_shared: BOOLEAN is
			-- Is `other_seeds' object shared with one of
			-- the precursors? (If shared, then we need to
			-- clone it before modifying it.)
		do
			Result := (other_seeds = precursor_feature.other_seeds)
		end

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			create Result.make (flattened_feature.new_synonym (a_name), parent)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (flattened_feature.renamed_feature (a_name), parent)
		end

feature -- Element change

	put_inherited_feature (a_feature: ET_FEATURE) is
			-- Add `a_feature' to the merged/joined features.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
			a_feature_not_merged: a_feature.merged_feature = Void
			same_name: a_feature.name.same_feature_name (name)
		local
			an_inherited_feature: ET_INHERITED_FEATURE
			a_seeds: like other_seeds
			a_seed: INTEGER
			i, nb: INTEGER
			need_twin: BOOLEAN
		do
			if merged_feature /= Void then
				an_inherited_feature := a_feature.inherited_feature
				an_inherited_feature.set_merged_feature (merged_feature)
				merged_feature := an_inherited_feature
			else
				merged_feature := a_feature
			end
			need_twin := is_other_seeds_shared
			a_seed := a_feature.first_seed
			if not has_seed (a_seed) then
				if other_seeds = Void then
					create other_seeds.make (a_seed)
					need_twin := False
				else
					if need_twin then
						other_seeds := clone (other_seeds)
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
								other_seeds := clone (other_seeds)
								need_twin := False
							end
							other_seeds.put (a_seed)
						end
					end
					i := i + 1
				end
			end
		end

feature {ET_INHERITED_FEATURE} -- Setting

	set_merged_feature (a_feature: like merged_feature) is
			-- Set `merged_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
		do
			merged_feature := a_feature
		ensure
			merged_feature_set: merged_feature = a_feature
		end

invariant

	not_redeclared: not is_redeclared
	inherited_flattened_feature_not_void: inherited_flattened_feature /= Void
	inherited_flattened_feature_inherited: inherited_flattened_feature.is_inherited
	inherited_flattened_feature_not_redeclared: not inherited_flattened_feature.is_redeclared

end
