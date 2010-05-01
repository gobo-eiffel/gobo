note

	description:

		"BOOLEAN properties for Geant tasks and commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_BOOLEAN_PROPERTY

inherit

	GEANT_PROPERTY [BOOLEAN]

create

	make

feature -- Access

	value: BOOLEAN is
			-- Boolean value
		do
			Result := boolean_value (string_value)
		end

feature {NONE} -- Implementation

	boolean_value (a_value: STRING): BOOLEAN is
			-- Value of `a_value'
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			if STRING_.same_case_insensitive (True_attribute_value, a_value) then
				Result := True
			elseif STRING_.same_case_insensitive (False_attribute_value, a_value) then
				Result := False
			else
					-- TODO: issue a warning instead of just using False:
				Result := False
			end
		end

feature {NONE} -- Constants

	True_attribute_value: STRING is
			-- "true" attribute value
		once
			Result := "true"
		ensure
			attribute_value_not_void: Result /= Void
		end

	False_attribute_value: STRING is
			-- "false" attribute value
		once
			Result := "false"
		ensure
			attribute_value_not_void: Result /= Void
		end

end
