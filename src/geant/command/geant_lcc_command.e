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
		require
			executable_not_void : executable /= Void
			executable_not_empty: not executable.is_empty

			sourcefilename_not_void : sourcefilename /= Void
			sourcefilename_not_empty: not sourcefilename.is_empty
		local
			cmd	: STRING
		do
			cmd := "lcc"
			cmd.append(" -Fo"); cmd.append(executable)
			cmd.append(" "); cmd.append(sourcefilename)
			log("  [lcc] " + cmd + "%N")
			system(cmd)
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
