indexing

	description:

		"ECF version conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_VERSION_CONDITION

inherit

	ET_ECF_CONDITION

feature {NONE} -- Initialization

	make (a_min, a_max: UT_VERSION) is
			-- Create a new version condition where version
			-- has to be included within `a_min' and `a_max'.
		do
			min_value := a_min
			max_value := a_max
		ensure
			min_value_set: min_value = a_min
			max_value_set: max_value = a_max
		end

feature -- Access

	min_value: UT_VERSION
			-- Minimum version value

	max_value: UT_VERSION
			-- Maximum version value

feature {NONE} -- Implementation

	is_included (a_version: UT_VERSION): BOOLEAN is
			-- Is `a_version' included within the bounds?
		require
			a_version_not_void: a_version /= Void
		do
			if min_value /= Void and then a_version < min_value then
				Result := False
			elseif max_value /= Void and then max_value < a_version then
				Result := False
			else
				Result := True
			end
		end

end
