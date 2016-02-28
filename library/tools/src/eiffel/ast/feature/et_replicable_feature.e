note

	description:

		"Eiffel replicable features: features with the same seed"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_REPLICABLE_FEATURE

inherit

	ANY -- Needed for SE 2.1.

	KL_IMPORTED_ANY_ROUTINES

feature -- Status report

	has_replication: BOOLEAN
			-- Is current feature replicated?
		do
			-- Result := False
		end

feature -- Access

	replicated_feature: ET_REPLICATED_FEATURE
			-- Current feature viewed as a replicated feature
		require
			has_replication: has_replication
		do
			check not_replicated: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	first_feature: ET_ADAPTED_FEATURE
			-- First feature with a given seed
		deferred
		ensure
			first_feature_not_void: Result /= Void
		end

feature -- Measurement

	selected_count: INTEGER
			-- Number of selected features
		deferred
		end

invariant

	selected_count_positive: selected_count >= 0

end
