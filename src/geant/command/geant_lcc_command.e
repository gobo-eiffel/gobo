indexing

  description:
        "lcc C-compiler command"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_LCC_COMMAND
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
			cmd	: STRING
		do
			cmd := "lcc"
			cmd.append(" -Fo"); cmd.append(executable)
			cmd.append(" "); cmd.append(sourcefilename)
			log("  [lcc] " + cmd + "%N")
			system(cmd)
		end

	is_executable : BOOLEAN is
		do
			Result := executable /= Void and then not executable.is_empty
						and then sourcefilename /= Void and then not sourcefilename.is_empty
		ensure then
			executable_not_void : Result implies executable /= Void
			executable_not_empty: Result implies not executable.is_empty

			sourcefilename_not_void : Result implies sourcefilename /= Void
			sourcefilename_not_empty: Result implies not sourcefilename.is_empty
		end

	set_executable(a_executable : STRING) is
		require
			executable_not_void : a_executable /= Void
			executable_not_empty: not a_executable.is_empty
		do
			executable := a_executable
		end

	set_sourcefilename(a_sourcefilename : STRING) is
		require
			sourcefilename_not_void : a_sourcefilename /= Void
			sourcefilename_not_empty: not a_sourcefilename.is_empty
		do
			sourcefilename := a_sourcefilename
		end


--feature {NONE}
executable			: STRING		-- -Fo
sourcefilename		: STRING		--

end
