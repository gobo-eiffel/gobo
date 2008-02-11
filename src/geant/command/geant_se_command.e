indexing

	description:

		"Compilation commands for SmartEiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SE_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_ace_configuration or is_traditional_configuration or is_cleanable
			Result := Result and then (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		ensure then
			definition: Result implies (is_ace_configuration or is_traditional_configuration or is_cleanable)
			exit_code_variable_name_void_or_not_empty: Result implies (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		end

	is_ace_configuration: BOOLEAN is
			-- Does ace file configuration apply?
		do
			Result := (ace_filename /= Void and then ace_filename.count > 0)
		ensure
			ace_filename_not_void: Result implies ace_filename /= Void
			ace_filename_not_empty: Result implies ace_filename.count > 0
		end

	is_traditional_configuration: BOOLEAN is
			-- Does traditional configuration apply?
		do
			Result :=
				(root_class /= Void and then root_class.count > 0) and
				(executable /= Void and then executable.count > 0)
		ensure
			root_class_not_void: Result implies root_class /= Void
			root_class_not_empty: Result implies root_class.count > 0
			executable_not_void: Result implies executable /= Void
			executable_not_empty: Result implies executable.count > 0
		end

	is_cleanable: BOOLEAN is
			-- Can system be cleaned?
		do
			Result := clean /= Void and then clean.count > 0
		ensure
			clean_not_void: Result implies clean /= Void
			clean_not_empty: Result implies clean.count > 0
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

	clean: STRING
			-- Name of system to be cleaned

	exit_code_variable_name: STRING
			-- Name of variable holding exit code of se compilation process

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

	set_clean (a_clean: like clean) is
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
		end

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name) is
			-- Set `exit_code_variable_name' to `a_exit_code_variable_name'.
		require
			a_exit_code_variable_name_not_void: a_exit_code_variable_name /= Void
			a_exit_code_variable_name_not_empty: a_exit_code_variable_name.count > 0
		do
			exit_code_variable_name := a_exit_code_variable_name
		ensure
			exit_code_variable_name_set: exit_code_variable_name = a_exit_code_variable_name
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_name: STRING
		do
			exit_code := 0
			if is_cleanable then
				cmd := new_clean_cmdline
				a_name := clean + ".id"
				if file_system.file_exists (a_name) then
						-- Execute the command only if the SmartEiffel
						-- compiler has been used to compile this system.
					project.trace (<<"  [se] ", cmd>>)
					execute_shell (cmd)
					exit_code := 0
				end
			else
				if is_ace_configuration then
					cmd := new_ace_cmdline
				else
					cmd := new_traditional_cmdline
				end
				project.trace (<<"  [se] ", cmd>>)
				execute_shell (cmd)
				if exit_code_variable_name /= Void then
						-- Store return_code of compilation process:
					project.set_variable_value (exit_code_variable_name, exit_code.out)
						-- Reset `exit_code' since return_code of process is available through
						-- variable 'exit_code_variable_name':
					exit_code := 0
				end
			end
		end

feature -- Command-line

	new_ace_cmdline: STRING is
			-- Execution commandline for Ace configuration
		require
			is_ace_configuration: is_ace_configuration
		local
			a_filename: STRING
		do
			Result := STRING_.cloned_string ("compile ")
			if project.options.verbose then
				Result.append_string (" -verbose ")
			end
			a_filename := file_system.pathname_from_file_system (ace_filename, unix_file_system)
			Result := STRING_.appended_string (Result, a_filename)
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

	new_traditional_cmdline: STRING is
			-- Execution commandline for traditional configuration
		require
			is_traditional_configuration: is_traditional_configuration
		local
			a_filename: STRING
		do
			Result := STRING_.cloned_string ("compile")
			Result.append_string (" -o ")
			a_filename := file_system.pathname_from_file_system (executable, unix_file_system)
			Result := STRING_.appended_string (Result, a_filename)
			if case_insensitive then
				Result.append_string (" -case_insensitive")
			end
			if no_style_warning then
				Result.append_string (" -no_style_warning")
			end
			Result.append_string (" ")
			Result := STRING_.appended_string (Result, root_class)
			Result.append_string (" ")
			if creation_procedure /= Void and then creation_procedure.count > 0 then
				Result := STRING_.appended_string (Result, creation_procedure)
			else
				Result.append_string ("make")
			end
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

	new_clean_cmdline: STRING is
			-- Execution commandline for cleaning system
		require
			is_cleanable: is_cleanable
		do
			Result := STRING_.cloned_string ("clean ")
			Result := STRING_.appended_string (Result, clean)
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

end
