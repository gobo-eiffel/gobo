indexing

  description:
        "global variable"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_VAR_COMMAND
	inherit
		GEANT_COMMAND

	
creation
	make

	
	
feature
	make is
		do
		end

	execute is
		require
			name_not_void : name /= Void
			name_not_empty: not name.is_empty

		do
			log("  [var] " + name + "=" + value + "%N")
			vars.force(name, value)	-- put the variable in the pool of global variables
		end

	set_name(a_name : STRING) is
		require
			name_not_void : a_name /= Void
			name_not_empty: not a_name.is_empty
		do
			name := a_name
		end

	set_value(a_value : STRING) is
		require
			value_not_void : a_value /= Void
		do
			value := a_value
		end


--feature {NONE}
name			: STRING
value			: STRING

end
