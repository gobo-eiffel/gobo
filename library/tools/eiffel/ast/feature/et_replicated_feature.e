indexing

	description:

		"Eiffel replicated features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REPLICATED_FEATURE

inherit

	ET_REPLICABLE_FEATURE
		redefine
			has_replication,
			replicated_feature
		end

create

	make

feature {NONE} -- Initialization

	make (f1, f2: ET_ADAPTED_FEATURE) is
			-- Create a new replicated feature, where
			-- `f1' and `f2' have a common seed.
		require
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			create features.make
			put_feature (f1)
			put_feature (f2)
		end

feature -- Access

	replicated_feature: ET_REPLICATED_FEATURE is
			-- Replicated feature
		do
			Result := Current
		end

	features: DS_LINKED_LIST [ET_ADAPTED_FEATURE]
			-- Inherited features with the same seed

	first_feature: ET_ADAPTED_FEATURE is
			-- First inherited feature with the same seed
		do
			Result := features.first
		end

feature -- Measurement

	selected_count: INTEGER
			-- Number of selected features

feature -- Status report

	has_replication: BOOLEAN is True
			-- Is current feature replicated?

feature -- Element change

	put_feature (a_feature: ET_ADAPTED_FEATURE) is
			-- Add `a_feature' to `features'.
		require
			a_feature_not_void: a_feature /= Void
		do
			features.force_last (a_feature)
			if a_feature.has_selected_feature then
				selected_count := selected_count + 1
			end
		end

invariant

	has_replication: has_replication
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	two_or_more_features: features.count >= 2
	-- inherted_features: forall f in features, f.is_inherited

end
