indexing

	description:

		"getest command"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GETEST_COMMAND
	inherit
		GEANT_COMMAND

	
creation
	make

	
	
feature
	make is
		do
		end

	execute is
		local
			sc : UT_SHELL_COMMAND
			cmd	: STRING
		do
			cmd := "getest "
			cmd.append_string(configfile)
			log("  [getest] " + cmd + "%N")
			!!sc.make(cmd)
			sc.execute
		end

	is_executable : BOOLEAN is
		do
			Result := configfile /= Void and then not configfile.is_empty
		ensure then
			configfile_not_void : Result implies configfile /= Void
			configfile_not_empty : Result implies not configfile.is_empty
		end

	set_configfile(a_configfile : STRING) is
		require
			configfile_not_void : a_configfile /= Void
			configfile_not_empty : not a_configfile.is_empty
		do
			configfile := a_configfile
		end


--feature {NONE}
configfile			: STRING

end
