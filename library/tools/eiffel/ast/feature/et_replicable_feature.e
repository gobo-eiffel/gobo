indexing

	description:

		"Eiffel replicable features: features with the same seed"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_REPLICABLE_FEATURE

feature -- Status report

	has_replication: BOOLEAN is
			-- Is current feature replicated?
		do
			-- Result := False
		end

feature -- Access

	replicated_feature: ET_REPLICATED_FEATURE is
			-- Current feature viewed as a replicated feature
		require
			has_replication: has_replication
		do
			check not_replicated: not has_replication end
		ensure
			definition: same_objects (Result, Current)
		end

	first_feature: ET_ADAPTED_FEATURE is
			-- First feature with a given seed
		deferred
		ensure
			first_feature_not_void: Result /= Void
		end

feature -- Measurement

	selected_count: INTEGER is
			-- Number of selected features
		deferred
		end

feature {NONE} -- Implementation

	same_objects (obj1, obj2: ANY): BOOLEAN is
			-- Workaround for VWEQ when running Degree 3 in flat mode.
		do
			Result := (obj1 = obj2)
		ensure
			definition: Result = (obj1 = obj2)
		end

invariant

	selected_count_positive: selected_count >= 0

end
