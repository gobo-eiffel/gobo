indexing

  description:
        "common properties for GEANT"

    author:     "Sven Ehrke (sven.ehrke@sven-ehrke.de)"
    copyright:  "Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_SHARED_PROPERTIES

	
feature

	vars : DS_HASH_TABLE [STRING, STRING] is
		-- global variables (called 'properties' in ant)
		once
			!!Result.make(10)
		end

end
