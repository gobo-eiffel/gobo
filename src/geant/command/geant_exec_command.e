indexing

  description:
        "exec command"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_EXEC_COMMAND
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
			cmd_not_void : cmd /= Void
			cmd_not_empty : not cmd.is_empty
		local
			sc : UT_SHELL_COMMAND
		do
			log("  [exec] " + cmd + "%N")
			!!sc.make(cmd)
			sc.execute
		end

	set_cmd(a_cmd : STRING) is
		require
			cmd_not_void : a_cmd /= Void
			cmd_not_empty : not a_cmd.is_empty
		do
			cmd := a_cmd
		end


--feature {NONE}
cmd			: STRING

end
