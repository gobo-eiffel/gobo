indexing

	description:

		"Eiffel replicable features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_REPLICABLE_FEATURE

creation

	make

feature {NONE} -- Initialization

	make (a_seed: like seed; a_feature: ET_INHERITED_FEATURE) is
			-- Create a new replicable feature.
		require
			a_seed_not_void: a_seed /= Void
			a_feature_not_void: a_feature /= Void
			seeded_feature: a_feature.has_seed (a_seed)
		do
			seed := a_seed
			!! inherited_features.make
			put_feature (a_feature)
		ensure
			seed_set: seed = a_seed
		end

feature -- Access

	seed: ET_FEATURE
			-- Feature seed

	inherited_features: DS_LINKED_LIST [ET_INHERITED_FEATURE]
			-- Inherited features with the same seed

feature -- Measurement

	selected_count: INTEGER
			-- Number of selected features

feature -- Status report

	is_replicated: BOOLEAN is
			-- Is current feature replicated?
		do
			Result := inherited_features.count > 1
		end

feature -- Element change

	put_feature (a_feature: ET_INHERITED_FEATURE) is
			-- Add `a_feature' to `inherited_features'.
		require
			a_feature_not_void: a_feature /= Void
			seeded_feature: a_feature.has_seed (seed)
		do
			inherited_features.put_last (a_feature)
			if a_feature.is_selected then
				selected_count := selected_count + 1
			end
		end

feature -- Compilation

	set_seeds (a_class: ET_CLASS) is
			-- Set new seeds to features that are
			-- replicated in class `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			inherited_feature: ET_INHERITED_FEATURE
			a_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
		do
			if is_replicated then
				inspect selected_count
				when 0 then
						-- Error.
print ("GOBO 1 -- ")
print (inherited_features.count)
print ("%N")
				when 1 then
					-- OK.
				else
						-- Error.
print ("GOBO 2%N")
				end
				from inherited_features.start until inherited_features.after loop
					inherited_feature := inherited_features.item_for_iteration
					if not inherited_feature.is_selected then
						a_feature := inherited_feature.precursor_feature
						a_name := a_feature.name
						if a_feature.base_class /= a_class then
							a_feature := a_feature.renamed_feature (a_name, a_class)
							inherited_feature.set_precursor_feature (a_feature)
							a_class.features.replace (a_feature, a_name)
						end
						if a_feature.has_seed (a_feature) then
							a_feature.remove_seed (seed)
						else
							a_feature.replace_seed (seed, a_feature)
						end
						a_feature.set_version (a_feature)
					end
					inherited_features.forth
				end
			elseif selected_count /= 0 then
					-- Error.
			end
		end

	register_seeded_features (a_feature_table: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE]) is
			-- Add `inherited_features' to `a_feature_table'.
		require
			a_feature_table_not_void: a_feature_table /= Void
			table_large_enough: a_feature_table.count + inherited_features.count <= a_feature_table.capacity
		local
			inherited_feature: ET_INHERITED_FEATURE
			a_feature: ET_FEATURE
		do
			from inherited_features.start until inherited_features.after loop
				inherited_feature := inherited_features.item_for_iteration
				a_feature := inherited_feature.precursor_feature
				if inherited_feature.is_selected then
					a_feature_table.put (a_feature, seed)
				else
					a_feature_table.put (a_feature, a_feature)
				end
				inherited_features.forth
			end
		end

invariant

	seed_not_void: seed /= Void
	selected_count_positive: selected_count >= 0
	inherited_features_not_void: inherited_features /= Void
	no_void_feature: not inherited_features.has (Void)
	inherited_features_not_empty: not inherited_features.is_empty
	-- seeded_features: forall `f' in `inherited_features', f.has_seed (seed)

end -- class ET_REPLICABLE_FEATURE
