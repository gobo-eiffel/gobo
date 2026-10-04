note

	description:

		"Features which can point to browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_FEATURE

create

	make

feature {NONE} -- Initialization

	make (a_feature: like eiffel_feature)
			-- Create new browsable feature.
		require
			a_feature_not_void: a_feature /= Void
		do
			eiffel_feature := a_feature
			range := {ET_RANGE}.null_range
			feature_name_range := {ET_RANGE}.null_range
		ensure
			eiffel_feature_set: eiffel_feature = a_feature
		end

feature -- Access

	eiffel_feature: ET_FEATURE
			-- Eiffel feature

	feature_clause_name: STRING_8
			-- Name of feature clause
		do
			if attached eiffel_feature.feature_clause as l_feature_clause then
				Result := l_feature_clause.name
			else
				Result := no_feature_clause_name
			end
		ensure
			feature_clause_name_not_void: Result /= Void
		end

	range: ET_RANGE
			-- Range of the feature

	feature_name_range: ET_RANGE
			-- Range of the feature name

feature -- Setting

	set_range (a_range: like range)
			-- Set `range` to `a_range`.
		require
			a_range_not_void: a_range /= Void
		do
			range := a_range
		ensure
			range_set: range = a_range
		end

	set_feature_name_range (a_range: like feature_name_range)
			-- Set `feature_name_range` to `a_range`.
		require
			a_range_not_void: a_range /= Void
		do
			feature_name_range := a_range
		ensure
			feature_name_range_set: feature_name_range = a_range
		end

feature {NONE} -- Implementation

	no_feature_clause_name: STRING_8 = ""
			-- No feature clause name

invariant

	eiffel_feature_not_void: eiffel_feature /= Void
	range_not_void: range /= Void
	feature_name_range_not_void: feature_name_range /= Void

end
