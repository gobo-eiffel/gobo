note

	description:

		"ECF version conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_VERSION_CONDITION

inherit

	ET_ECF_CONDITION

feature {NONE} -- Initialization

	make (a_min, a_max: detachable UT_VERSION)
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

	min_value: detachable UT_VERSION
			-- Minimum version value

	max_value: detachable UT_VERSION
			-- Maximum version value

feature {NONE} -- Implementation

	is_included (a_version: UT_VERSION): BOOLEAN
			-- Is `a_version' included within the bounds?
		require
			a_version_not_void: a_version /= Void
		do
			if attached min_value as l_min_value and then a_version < l_min_value then
				Result := False
			elseif attached max_value as l_max_value and then l_max_value < a_version then
				Result := False
			else
				Result := True
			end
		end

end
