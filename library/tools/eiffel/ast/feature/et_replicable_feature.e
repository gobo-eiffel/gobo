indexing

	description:

		"Eiffel replicable features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_REPLICABLE_FEATURE

creation

	make

feature {NONE} -- Initialization

	make (a_seed: INTEGER; a_feature: ET_FLATTENED_FEATURE) is
			-- Create a new replicable feature.
		require
			a_feature_not_void: a_feature /= Void
			seeded_feature: a_feature.seeds.has (a_seed)
			is_inherited: a_feature.is_inherited_seed (a_seed)
		do
			seed := a_seed
			!! features.make
			put_feature (a_feature)
		ensure
			seed_set: seed = a_seed
		end

feature -- Access

	seed: INTEGER
			-- Feature seed

	features: DS_LINKED_LIST [ET_FLATTENED_FEATURE]
			-- Inherited features with the same seed

feature -- Measurement

	selected_count: INTEGER
			-- Number of selected features

feature -- Status report

	is_replicated: BOOLEAN is
			-- Is current feature replicated?
		do
			Result := features.count > 1
		end

feature -- Element change

	put_feature (a_feature: ET_FLATTENED_FEATURE) is
			-- Add `a_feature' to `features'.
		require
			a_feature_not_void: a_feature /= Void
			seeded_feature: a_feature.seeds.has (seed)
			is_inherited: a_feature.is_inherited_seed (seed)
		do
			features.put_last (a_feature)
			if a_feature.has_selected then
				selected_count := selected_count + 1
			end
		end

feature -- Compilation

	register_seeded_features (a_flattener: ET_FEATURE_FLATTENER) is
			-- Add seeded features to `a_flattener'.
		require
			a_flattener_not_void: a_flattener /= Void
		local
			a_feature: ET_FLATTENED_FEATURE
			inherited_feature: ET_INHERITED_FEATURE
			replicated_features: DS_ARRAYED_LIST [ET_INHERITED_FEATURE]
			seeded_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, INTEGER]
			a_class: ET_CLASS
		do
			if is_replicated then
				inspect selected_count
				when 0 then
					!! replicated_features.make (features.count)
					from features.start until features.after loop
						a_feature := features.item_for_iteration
						inherited_feature := a_feature.inherited_feature_with_seed (seed)
						replicated_features.put_last (inherited_feature)
						features.forth
					end
					a_class := a_flattener.current_class
					a_class.error_handler.report_vmrc2a_error (a_class, replicated_features)
					a_flattener.set_flatten_error
				when 1 then
						-- OK.
					seeded_features := a_flattener.seeded_features
					from features.start until features.after loop
						a_feature := features.item_for_iteration
						if not a_feature.has_selected then
							a_feature.set_replicated (seed)
							seeded_features.force (a_feature, a_feature.feature_id)
						else
							a_feature.set_selected
							seeded_features.force (a_feature, seed)
						end
						features.forth
					end
				else
					!! replicated_features.make (features.count)
					from features.start until features.after loop
						a_feature := features.item_for_iteration
						if a_feature.has_selected then
							a_feature.set_selected
							inherited_feature := a_feature.inherited_feature_with_seed (seed)
							replicated_features.put_last (inherited_feature)
						end
						features.forth
					end
					a_class := a_flattener.current_class
					a_class.error_handler.report_vmrc2b_error (a_class, replicated_features)
					a_flattener.set_flatten_error
				end
			else
				a_feature := features.first
				seeded_features := a_flattener.seeded_features
				seeded_features.force (a_feature, seed)
				if selected_count /= 0 then
					-- There is still a chance that this feature was
					-- listed in the Select subclause to resolve a
					-- replication conflict with another seed. Wait
					-- until all possible replications have been
					-- processed. The actual check is done in
					-- ET_FLATTENED_FEATURE.process_flattened_feature.
				end
			end
		end

invariant

	selected_count_positive: selected_count >= 0
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	features_not_empty: not features.is_empty
	-- seeded_features: forall `f' in `features', f.seeds.has (seed)

end -- class ET_REPLICABLE_FEATURE
