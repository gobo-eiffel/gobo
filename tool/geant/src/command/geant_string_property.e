note

	description:

		"STRING properties for Geant tasks and commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"

class GEANT_STRING_PROPERTY

inherit

	GEANT_PROPERTY [STRING]

create

	make

feature -- Access

	value: STRING
			-- String value
		do
			Result := string_value
		end

end
