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
		do
			features.put_last (a_feature)
			if a_feature.is_selected then
				selected_count := selected_count + 1
			end
		end

feature -- Compilation

	register_seeded_features (seeds: DS_HASH_TABLE [ET_FLATTENED_FEATURE, INTEGER]) is
			-- Add features to `seeds'.
		require
			seeds_not_void: seeds /= Void
		local
			a_feature: ET_FLATTENED_FEATURE
		do
			if is_replicated then
				inspect selected_count
				when 0 then
						-- Error.
print ("GOBO 1 -- ")
print (features.count)
print ("%N")
from features.start until features.after loop
	a_feature := features.item_for_iteration
	print ("%T")
	print (a_feature.current_class.name.name)
	print (".")
	print (a_feature.name.name)
	print ("%N")
	features.forth
end
				when 1 then
					-- OK.
				else
						-- Error.
print ("GOBO 2%N")
				end
				from features.start until features.after loop
					a_feature := features.item_for_iteration
					if not a_feature.is_selected then
						a_feature.set_replicated (seed)
						seeds.force (a_feature, a_feature.feature_id)
					else
						seeds.force (a_feature, seed)
					end
					features.forth
				end
			else
				if selected_count /= 0 then
					-- Error.
--print ("GOBO 3%N")
				end
				a_feature := features.first
				seeds.force (a_feature, seed)
			end
		end

invariant

	selected_count_positive: selected_count >= 0
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	features_not_empty: not features.is_empty
	-- seeded_features: forall `f' in `features', f.seeds.has (seed)

end -- class ET_REPLICABLE_FEATURE
