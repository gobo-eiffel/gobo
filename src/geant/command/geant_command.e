indexing

  description:
        "the general command class from which all other commands inherit from"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


deferred class GEANT_COMMAND
	inherit
		GEANT_SHARED_PROPERTIES

	
feature
	execute is
		deferred
		end

	log(a_msg : STRING) is
		do
			print(a_msg)
		end

end
