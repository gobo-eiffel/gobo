indexing

	description:

		"Common properties for GEANT"

	author:     "Sven Ehrke (sven.ehrke@sven-ehrke.de)"
	copyright:  "Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_SHARED_PROPERTIES

inherit

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_EXECUTION_ENVIRONMENT

feature -- Access

	Commandline_variables: DS_HASH_TABLE [STRING, STRING] is
		-- Variables specified on the commandline using -D
		-- example: -Dname=value
		once
			!! Result.make (10)
		ensure
			Commandline_variables_not_void: Result /= Void
		end

end -- class GEANT_SHARED_PROPERTIES
