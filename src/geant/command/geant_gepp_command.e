indexing

	description:

		"Gepp commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEPP_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'gepp' command.
		do
			precursor (a_project)
			input_filename := ""
			output_filename := ""
			!! defines.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can commandbe executed?
		do
			Result := (input_filename /= Void and then input_filename.count > 0) and
				(output_filename /= Void and then output_filename.count > 0)
		ensure then
			input_filename_not_void: Result implies input_filename /= Void
			input_filename_not_empty: Result implies input_filename.count > 0
			output_filename_not_void: Result implies output_filename /= Void
			output_filename_not_empty: Result implies output_filename.count > 0
		end

feature -- Access

	input_filename: STRING
			-- Input filename

	output_filename: STRING
			-- Output filename

	defines: DS_ARRAYED_LIST [STRING]
			-- Defined values from the commandline (-D options)

feature -- Setting

	set_input_filename (a_filename: like input_filename) is
			-- Set `input_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			input_filename := a_filename
		ensure
			input_filename_set: input_filename = a_filename
		end

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			i, nb: INTEGER
		do
			cmd := clone ("gepp")
				-- Add defines:
			nb := defines.count
			from i := 1 until i > nb loop
				cmd.append_string (" -D")
				cmd.append_string (defines.item (i))
				i := i + 1
			end

			cmd.append_string (" ")
			cmd.append_string (input_filename)
			cmd.append_string (" ")
			cmd.append_string (output_filename)

			log ("  [gepp] " + cmd + "%N")
			execute_shell (cmd)
		end

invariant

	defines_not_void: defines /= Void
	no_void_define: not defines.has (Void)

end -- class GEANT_GEPP_COMMAND
