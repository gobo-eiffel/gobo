indexing

	description:

		"Gedoc commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEDOC_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'gedoc' command.
		do
			precursor (a_project)
			input_filename := ""
			output_filename := ""
			!! parameters.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (input_filename /= Void and then input_filename.count > 0) and
				(output_filename /= Void and then output_filename.count > 0) and
				(stylesheet_filename /= Void and then stylesheet_filename.count > 0)
		ensure then
			input_filename_not_void: Result implies input_filename /= Void
			input_filename_not_empty: Result implies input_filename.count > 0
			output_filename_not_void: Result implies output_filename /= Void
			output_filename_not_empty: Result implies output_filename.count > 0
			stylesheet_filename_not_void: Result implies stylesheet_filename /= Void
			stylesheet_filename_not_empty: Result implies stylesheet_filename.count > 0
		end

feature -- Access

	input_filename: STRING
			-- Input XML filename

	output_filename: STRING
			-- Output filename

	stylesheet_filename: STRING
			-- XSL filename

	parameters: DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]]
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

	set_stylesheet_filename (a_filename: like stylesheet_filename) is
			-- Set `stylesheet_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			stylesheet_filename := a_filename
		ensure
			stylesheet_filename_set: stylesheet_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			i, nb: INTEGER
		do
			cmd := clone ("java org.apache.xalan.xslt.Process")
				-- Add parameters:
			nb := parameters.count
			from i := 1 until i > nb loop
				cmd.append_string (" -PARAM ")
				cmd.append_string (parameters.item (i).first)
				cmd.append_string (" ")
				cmd.append_string (parameters.item (i).second)
				i := i + 1
			end

			cmd.append_string (" -in ")
			cmd.append_string (input_filename)
			cmd.append_string (" -xsl ")
			cmd.append_string (stylesheet_filename)
			cmd.append_string (" -out ")
			cmd.append_string (output_filename)

			project.trace ("  [gedoc] " + cmd + "%N")
			execute_shell (cmd)
		end

invariant

	defines_not_void: defines /= Void
	no_void_define: not defines.has (Void)

end
