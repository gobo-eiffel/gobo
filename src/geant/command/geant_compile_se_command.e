indexing

	description:

		"Compilation commands for SmallEiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_COMPILE_SE_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_ace_configuration or is_traditional_configuration
		ensure then
			definition: Result = (is_ace_configuration or is_traditional_configuration)
		end

	is_ace_configuration: BOOLEAN is
			-- Does ace file configuration apply?
		do
			Result := (ace_filename /= Void and then ace_filename.count > 0)
		ensure
			definition: Result = (ace_filename /= Void and then ace_filename.count > 0)
		end

	is_traditional_configuration: BOOLEAN is
			-- Does traditional configuration apply?
		do
			Result :=
				(root_class /= Void and then root_class.count > 0) and
				(executable /= Void and then executable.count > 0)
		ensure
			definition: Result =
				(root_class /= Void and then root_class.count > 0) and
				(executable /= Void and then executable.count > 0)
		end

feature -- Access

	case_insensitive: BOOLEAN
	no_style_warning: BOOLEAN
	executable: STRING
	root_class: STRING
	creation_procedure: STRING
			-- Command-line options

	ace_filename: STRING
			-- Ace filename

feature -- Setting

	set_case_insensitive (b: BOOLEAN) is
			-- Set `case_sensitive' to `b'.
		do
			case_insensitive := b
		ensure
			case_insensitive_set: case_insensitive = b
		end

	set_no_style_warning (b: BOOLEAN) is
			-- Set `no_style_warning' to `b'.
		do
			no_style_warning := b
		ensure
			no_style_warning_set: no_style_warning = b
		end

	set_executable (an_executable: like executable) is
			-- Set `executable' to `an_executable'
		require
			an_executable_not_void: an_executable /= Void
			an_executable_not_empty: an_executable.count > 0
		do
			executable := an_executable
		ensure
			executable_set: executable = an_executable
		end

	set_root_class (a_root_class: like root_class) is
			-- Set `root_class' to `a_root_class'.
		require
			a_root_class_not_void: a_root_class /= Void
			a_root_class_not_empty: a_root_class.count > 0
		do
			root_class := a_root_class
		ensure
			root_class_set: root_class = a_root_class
		end

	set_creation_procedure (a_creation_procedure: like creation_procedure) is
			-- Set `creation_procedure' to `a_creation_procedure'.
		require
			a_creation_procedure_not_void: a_creation_procedure /= Void
			a_creation_procedure_not_empty: a_creation_procedure.count > 0
		do
			creation_procedure := a_creation_procedure
		ensure
			creation_procedure_set: creation_procedure = a_creation_procedure
		end

	set_ace_filename (a_filename: like ace_filename) is
			-- Set `ace_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			ace_filename := a_filename
		ensure
			ace_filename_set: ace_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
		do
			if is_ace_configuration then
				cmd := new_ace_cmdline
			else
				cmd := new_traditional_cmdline
			end

			log ("  [compile_se] " + cmd + "%N")
			execute_shell (cmd)
		end

feature -- Command-line

	new_ace_cmdline: STRING is
			-- Execution commandline for Ace configuration
		require
			is_ace_configuration: is_ace_configuration
		do
			Result := clone ("compile ")
			Result.append_string (ace_filename)
		end

	new_traditional_cmdline: STRING is
			-- Execution commandline for traditional configuration
		require
			is_traditional_configuration: is_traditional_configuration
		do
			Result := clone ("compile")

			Result.append_string (" -o ")
			Result.append_string (executable)

			if case_insensitive then
				Result.append_string (" -case_insensitive")
			end

			if no_style_warning then
				Result.append_string (" -no_style_warning")
			end

			Result.append_string (" ")
			Result.append_string (root_class)
			Result.append_string (" ")
			if creation_procedure /= Void and then creation_procedure.count > 0 then
				Result.append_string (creation_procedure)
			else
				Result.append_string ("make")
			end
		end

end -- class GEANT_COMPILE_SE_COMMAND
