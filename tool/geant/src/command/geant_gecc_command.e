note

	description:

		"Gecc commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GECC_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new 'gecc' command.
		do
			precursor (a_project)
			executable_filename := "gecc"
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := attached script_filename as l_script_filename and then l_script_filename.count > 0
		ensure then
			definition: Result implies attached script_filename as l_script_filename and then l_script_filename.count > 0
		end

feature -- Access

	executable_filename: STRING
			-- Filename of "gecc" executable

	script_filename: detachable STRING
			-- Script filename

	use_thread_count: BOOLEAN
			-- Should the number of threads to be used when running gecc
			-- be overridden with `thread_count'?

	thread_count: INTEGER
			-- Number of threads to be used to run gec.
			-- Negative numbers -N mean "number of CPUs - N".

	exit_code_variable_name: detachable STRING
			-- Name of variable holding exit code of gecc compilation process

feature -- Setting

	set_executable_filename (a_filename: like executable_filename)
			-- Set `executable_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			executable_filename := a_filename
		ensure
			executable_filename_set: executable_filename = a_filename
		end

	set_script_filename (a_filename: like script_filename)
			-- Set `script_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			script_filename := a_filename
		ensure
			script_filename_set: script_filename = a_filename
		end

	set_thread_count (a_thread_count: like thread_count)
			-- Set `thread_count' to `a_thread_count'.
		do
			thread_count := a_thread_count
			use_thread_count := True
		ensure
			use_thread_count_set: use_thread_count
			thread_count_set: thread_count = a_thread_count
		end

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name)
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

	execute
			-- Execute command.
		local
			cmd: STRING
		do
			exit_code := 0
			cmd := new_cmdline
			project.trace (<<"  [gecc] ", cmd>>)
			execute_shell (cmd)
			if attached exit_code_variable_name as l_exit_code_variable_name then
					-- Store return_code of compilation process:
				project.set_variable_value (l_exit_code_variable_name, exit_code.out)
					-- Reset `exit_code' since return_code of process is available through
					-- variable 'exit_code_variable_name':
				exit_code := 0
			end
		end

feature -- Command-line

	new_cmdline: STRING
			-- Execution commandline
		require
			is_executable: is_executable
		local
			l_filename: STRING
		do
			create Result.make (50)
			Result.append_string (executable_filename)
			Result.append_character (' ')
			if project.options.use_thread_count then
				Result.append_string ("--thread=")
				INTEGER_.append_decimal_integer (project.options.thread_count, Result)
				Result.append_character (' ')
			elseif use_thread_count then
				Result.append_string ("--thread=")
				INTEGER_.append_decimal_integer (thread_count, Result)
				Result.append_character (' ')
			end
			check is_executable: attached script_filename as l_script_filename then
				l_filename := file_system.pathname_from_file_system (l_script_filename, unix_file_system)
				Result := STRING_.appended_string (Result, l_filename)
			end
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

invariant

	executable_filename_not_void: executable_filename /= Void
	executable_filename_not_empty: not executable_filename.is_empty
	exit_code_variable_name_void_or_not_empty: not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0

end
