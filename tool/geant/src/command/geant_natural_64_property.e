note

	description:

		"NATURAL_64 properties for Geant tasks and commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class GEANT_NATURAL_64_PROPERTY

inherit

	GEANT_PROPERTY [NATURAL_64]

create

	make

feature -- Access

	value: NATURAL_64
			-- NATURAL_64 value
		do
			Result := natural_64_value (string_value)
		end

feature {NONE} -- Implementation

	natural_64_value (a_value: STRING): NATURAL_64
			-- Value of `a_value'
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			if a_value.is_natural_64 then
				Result := a_value.to_natural_64
			else
					-- TODO: issue a warning instead of just using 0:
				Result := 0
			end
		end

end
