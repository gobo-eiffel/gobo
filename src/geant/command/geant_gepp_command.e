indexing

	description:

		"gepp command"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEPP_COMMAND
	inherit
		GEANT_COMMAND
		end
		KL_IMPORTED_STRING_ROUTINES
		end

	
creation
	make


feature
	make is
		do
			inputfile := ""
			outputfile := ""
			!!defines.make(10)
		end

	execute is
		local
			cmd	: STRING
			i	: INTEGER
		do
			cmd := "gepp"

			-- add defines
			from i := 1 until i > defines.count loop
				cmd.append_string(" -D")
				cmd.append_string(defines.item(i))

				i := i + 1
			end

			cmd.append_string(" ")
			cmd.append_string(inputfile)
			cmd.append_string(" ")
			cmd.append_string(outputfile)

			log("  [gepp] " + cmd + "%N")
			execute_command(cmd)
		end

	is_executable : BOOLEAN is
		do
			Result := inputfile /= Void and then not inputfile.is_empty
					and then outputfile /= Void and then not outputfile.is_empty
		ensure then
			inputfile_not_void : Result implies inputfile /= Void
			inputfile_not_empty: Result implies not inputfile.is_empty

			outputfile_not_void : Result implies outputfile /= Void
			outputfile_not_empty: Result implies not outputfile.is_empty
		end

	feature -- gepp commandline options setters

	set_inputfile(a_inputfile : STRING) is
		-- required
		require
			inputfile_not_void : a_inputfile /= Void
			inputfile_not_empty: not a_inputfile.is_empty
		do
			inputfile := a_inputfile
		end

	set_outputfile(a_outputfile : STRING) is
		-- required
		require
			outputfile_not_void : a_outputfile /= Void
			outputfile_not_empty: not a_outputfile.is_empty
		do
			outputfile := a_outputfile
		end

	feature -- gepp commandline options

	inputfile : STRING
		-- required

	outputfile : STRING
		-- required

	defines		: DS_ARRAYED_LIST [STRING]
		-- contains all the defines from the commandline (-D options)

end
