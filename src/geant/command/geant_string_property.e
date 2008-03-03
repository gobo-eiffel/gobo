indexing

    description:

        "STRING properties for Geant tasks and commands"

    library: "Gobo Eiffel Ant"
    copyright: "Copyright (c) 2008, Sven Ehrke and others"
    license: "MIT License"
    date: "$Date$"
    revision: "$Revision$"

class GEANT_STRING_PROPERTY

inherit

	GEANT_PROPERTY [STRING]

create

	make

feature -- Access

	value: STRING is
		do
			Result := string_value
		end

end
