indexing

	description:

		"the general command class from which all other commands inherit from"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


deferred class GEANT_COMMAND
	inherit
		GEANT_SHARED_PROPERTIES

	
feature
	execute is
		require
			is_executable : is_executable
		deferred
		end

	is_executable : BOOLEAN is
		-- is object prepared to execute
		deferred
		end

	log(a_msg : STRING) is
		do
			print(a_msg)
		end

end
