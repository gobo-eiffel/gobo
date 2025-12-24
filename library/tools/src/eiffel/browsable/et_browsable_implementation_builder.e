note

	description:

		"Builders for lists of implementations of a given browsable name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_IMPLEMENTATION_BUILDER

feature -- Basic operations

	add_feature (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add feature `a_feature` to the list of implementations of `a_browsable_name'.
		require
			a_feature_not_void: a_feature /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

end
