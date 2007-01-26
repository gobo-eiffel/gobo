indexing

	description:

		"Eiffel feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_NAME

inherit

	ET_CALL_NAME

	ET_FEATURE_NAME_ITEM

	ET_QUALIFIED_FEATURE_NAME

	ET_ASSIGNER

feature -- Access

	feature_name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := Current
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		deferred
		end

end
