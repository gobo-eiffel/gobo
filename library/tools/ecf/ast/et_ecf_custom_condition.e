indexing

	description:

		"ECF custom conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CUSTOM_CONDITION

inherit

	ET_ECF_CONDITION

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_excluded

feature {NONE} -- Initialization

	make (a_name, a_value: STRING) is
			-- Create a new custom condition where variable `a_name' should be equal to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			name := a_name
			value := a_value
			is_excluded := False
		ensure
			name_set: name = a_name
			value_set: value = a_value
			not_excluded: not is_excluded
		end

	make_excluded (a_name, a_value: STRING) is
			-- Create a new custom condition where variable `a_name' should not be equal to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			name := a_name
			value := a_value
			is_excluded := True
		ensure
			name_set: name = a_name
			value_set: value = a_value
			excluded: is_excluded
		end

feature -- Access

	name: STRING
			-- Variable name

	value: STRING
			-- Variable value

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN is
			-- Does `a_state' fulfill current condition?
		local
			l_variable: STRING
		do
			l_variable := a_state.target.variables.value (name)
			if l_variable /= Void then
				Result := STRING_.same_case_insensitive (value, l_variable)
			end
			Result := (is_excluded /= Result)
		end

	is_excluded: BOOLEAN
			-- Should variable not be equal to `value'?

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	value_not_void: value /= Void
	value_not_empty: not value.is_empty

end
