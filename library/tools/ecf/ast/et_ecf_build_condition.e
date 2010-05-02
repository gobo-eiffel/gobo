note

	description:

		"ECF build conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_BUILD_CONDITION

inherit

	ET_ECF_CONDITION

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_excluded

feature {NONE} -- Initialization

	make (a_value: STRING)
			-- Create a new condition where build should be equal to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			value := a_value
			is_excluded := False
		ensure
			value_set: value = a_value
			not_excluded: not is_excluded
		end

	make_excluded (a_value: STRING)
			-- Create a new condition where build should not be equal to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			value := a_value
			is_excluded := True
		ensure
			value_set: value = a_value
			excluded: is_excluded
		end

feature -- Access

	value: STRING
			-- Build value

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		do
			Result := (is_excluded /= STRING_.same_case_insensitive (value, "finalize"))
		end

	is_excluded: BOOLEAN
			-- Should build not be equal to `value'?

invariant

	value_not_void: value /= Void
	value_not_empty: not value.is_empty

end
