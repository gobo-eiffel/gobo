note

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
		redefine
			is_feature_name,
			feature_name
		end

	ET_FEATURE_NAME_ITEM

	ET_QUALIFIED_FEATURE_NAME

	ET_ASSIGNER

feature -- Status report

	is_feature_name: BOOLEAN = True
			-- Is current call name a feature name?

feature -- Access

	feature_name: ET_FEATURE_NAME
			-- Feature name
		do
			Result := Current
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		deferred
		end

end
