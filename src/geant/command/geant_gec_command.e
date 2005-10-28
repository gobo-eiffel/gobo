indexing

	description:

		"Gec commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2005, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEC_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_ace_configuration or is_cleanable
			Result := Result and then (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		ensure then
			definition: Result implies (is_ace_configuration or is_cleanable)
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

	is_cleanable: BOOLEAN is
			-- Can system be cleaned?
		do
			Result := clean /= Void and then clean.count > 0
		ensure
			clean_not_void: Result implies clean /= Void
			clean_not_empty: Result implies clean.count > 0
		end

feature -- Access

	ace_filename: STRING
			-- Ace filename

	c_compile: BOOLEAN
			-- Should C compilation be launched?

	clean: STRING
			-- Name of system to be cleaned

	exit_code_variable_name: STRING
			-- Name of variable holding exit code of gec compilation process

feature -- Setting

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

	set_c_compile (b: BOOLEAN) is
			-- Set `c_compile' to `b'.
		do
			c_compile := b
		ensure
			c_compile_set: c_compile = b
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
				a_name := clean + ".c"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := clean + ".h"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := clean + ".obj"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := clean + ".o"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
			elseif is_ace_configuration then
				cmd := new_ace_cmdline
				project.trace (<<"  [gec] ", cmd>>)
				execute_shell (cmd)
				if exit_code_variable_name /= Void then
						-- Store return_code of compilation process:
					project.variables.set_variable_value (exit_code_variable_name, exit_code.out)
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
			create Result.make (50)
			Result.append_string ("gec ")
			if c_compile then
				Result.append_string ("--c_compile ")
			end
			a_filename := file_system.pathname_from_file_system (ace_filename, unix_file_system)
			Result := STRING_.appended_string (Result, a_filename)
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

end
