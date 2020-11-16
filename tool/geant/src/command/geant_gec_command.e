note

	description:

		"Gec commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2005-2020, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEC_COMMAND

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
			-- Create a new 'gec' command.
		do
			precursor (a_project)
			c_compile := "gecc"
			executable_filename := "gec"
			split_mode := True
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := is_ecf_configuration or is_cleanable
			Result := Result and then (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		ensure then
			definition: Result implies (is_ecf_configuration or is_cleanable)
			exit_code_variable_name_void_or_not_empty: Result implies (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		end

	is_ecf_configuration: BOOLEAN
			-- Does ace file configuration apply?
		do
			Result := (attached ecf_filename as l_ecf_filename and then l_ecf_filename.count > 0)
		ensure
			ecf_filename_not_void_and_not_empty: Result implies attached ecf_filename as l_ecf_filename and then l_ecf_filename.count > 0
		end

	is_cleanable: BOOLEAN
			-- Can system be cleaned?
		do
			Result := attached clean as l_clean and then l_clean.count > 0
		ensure
			clean_not_void: Result implies attached clean as l_clean and then l_clean.count > 0
		end

feature -- Access

	executable_filename: STRING
			-- Filename of "gec" executable

	ecf_filename: detachable STRING
			-- ECF filename

	target_name: detachable STRING
			-- Name of target to be used in ECF file.
			-- Use last target in ECF file if not specified.

	c_compile: detachable STRING
			-- Should the back-end C compiler be invoked on the generated C code, and if yes with what method?
			-- (default: gecc)

	finalize: BOOLEAN
			-- Should system be compiled in finalized mode?

	gelint: BOOLEAN
			-- Should gelint be run on the full content of each class being compiled?

	catcall_mode: detachable STRING
			-- Should CAT-calls be considered as fatal errors, as warnings or just ignored?

	split_mode: BOOLEAN
			-- Should C code be generated into several files?

	split_size: INTEGER
			-- Size (in bytes) of generated C files in bytes when in split mode

	garbage_collector: detachable STRING
			-- Name of GC being used

	thread_count: INTEGER
			-- Number of threads to be used to run gec.
			-- Negative numbers -N mean "number of CPUs - N".
			-- (default: number of CPUs)

	new_instance_types_filename: detachable STRING
			-- Filename containing the list of types which can have instances
			-- created by 'TYPE.new_instance' or 'TYPE.new_special_any_instance'.

	silent_mode: BOOLEAN
			-- Should gec be run in silent mode?

	verbose_mode: BOOLEAN
			-- Should gec be run in verbose mode?

	no_benchmark_mode: BOOLEAN
			-- Should no benchmark information be displayed?
			-- (default: display non-nested benchmark information)

	nested_benchmark_mode: BOOLEAN
			-- Should nested benchmark information be displayed?

	metrics_mode: BOOLEAN
			-- Should metrics information be displayed?

	clean: detachable STRING
			-- Name of system to be cleaned

	exit_code_variable_name: detachable STRING
			-- Name of variable holding exit code of gec compilation process

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

	set_ecf_filename (a_filename: like ecf_filename)
			-- Set `ecf_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			ecf_filename := a_filename
		ensure
			ecf_filename_set: ecf_filename = a_filename
		end

	set_target_name (a_target_name: like target_name)
			-- Set `target_name' to `a_target_name'.
		do
			target_name := a_target_name
		ensure
			target_name_set: target_name = a_target_name
		end

	set_c_compile (a_c_compile: like c_compile)
			-- Set `c_compile' to `a_c_compile'.
		do
			c_compile := a_c_compile
		ensure
			c_compile_set: c_compile = a_c_compile
		end

	set_finalize (b: BOOLEAN)
			-- Set `finalize' to `b'.
		do
			finalize := b
		ensure
			finalize_set: finalize = b
		end

	set_gelint (b: BOOLEAN)
			-- Set `gelint' to `b'.
		do
			gelint := b
		ensure
			gelint_set: gelint = b
		end

	set_catcall_mode (a_mode: STRING)
			-- Set `catcall_mode' to `a_mode'.
		do
			catcall_mode := a_mode
		ensure
			catcall_mode_set: catcall_mode = a_mode
		end

	set_split_mode (b: BOOLEAN)
			-- Set `split_mode' to `b'.
		do
			split_mode := b
		ensure
			split_mode_set: split_mode = b
		end

	set_split_size (s: INTEGER)
			-- Set `split_size' to `s'.
		require
			s_positive: s > 0
		do
			split_size := s
		ensure
			split_size_set: split_size = s
		end

	set_garbage_collector (s: STRING)
			-- Set `garbage_collector' to `s'.
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		do
			garbage_collector := s
		ensure
			garbage_collector_set: garbage_collector = s
		end

	set_thread_count (a_thread_count: like thread_count)
			-- Set `thread_count' to `a_thread_count'.
		do
			thread_count := a_thread_count
		ensure
			thread_count_set: thread_count = a_thread_count
		end

	set_new_instance_types_filename (a_filename: like new_instance_types_filename)
			-- Set `new_instance_types_filename' to `a_filename'.
		do
			new_instance_types_filename := a_filename
		ensure
			new_instance_types_filename_set: new_instance_types_filename = a_filename
		end

	set_silent_mode (b: BOOLEAN)
			-- Set `silent_mode' to `b'.
		do
			silent_mode := b
		ensure
			silent_mode_set: silent_mode = b
		end

	set_verbose_mode (b: BOOLEAN)
			-- Set `verbose_mode' to `b'.
		do
			verbose_mode := b
		ensure
			verbose_mode_set: verbose_mode = b
		end

	set_no_benchmark_mode (b: BOOLEAN)
			-- Set `no_benchmark_mode' to `b'.
		do
			no_benchmark_mode := b
		ensure
			no_benchmark_mode_set: no_benchmark_mode = b
		end

	set_nested_benchmark_mode (b: BOOLEAN)
			-- Set `nested_benchmark_mode' to `b'.
		do
			nested_benchmark_mode := b
		ensure
			nested_benchmark_mode_set: nested_benchmark_mode = b
		end

	set_metrics_mode (b: BOOLEAN)
			-- Set `metrics_mode' to `b'.
		do
			metrics_mode := b
		ensure
			metrics_mode_set: metrics_mode = b
		end

	set_clean (a_clean: like clean)
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
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
			a_name: STRING
			i: INTEGER
			stop: BOOLEAN
		do
			exit_code := 0
			if is_cleanable and then attached clean as l_clean then
				a_name := l_clean + ".c"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".cpp"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				from i := 1 until stop loop
					stop := True
					a_name := l_clean + i.out + ".c"
					if file_system.file_exists (a_name) then
						project.trace (<<"  [gec] delete ", a_name>>)
						if not project.options.no_exec then
							file_system.delete_file (a_name)
						end
						stop := False
					end
					a_name := l_clean + i.out + ".cpp"
					if file_system.file_exists (a_name) then
						project.trace (<<"  [gec] delete ", a_name>>)
						if not project.options.no_exec then
							file_system.delete_file (a_name)
						end
						stop := False
					end
					i := i + 1
				end
				a_name := l_clean + ".h"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".obj"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				stop := False
				from i := 1 until stop loop
					a_name := l_clean + i.out + ".obj"
					if file_system.file_exists (a_name) then
						project.trace (<<"  [gec] delete ", a_name>>)
						if not project.options.no_exec then
							file_system.delete_file (a_name)
						end
					else
						stop := True
					end
					i := i + 1
				end
				a_name := l_clean + ".o"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				stop := False
				from i := 1 until stop loop
					a_name := l_clean + i.out + ".o"
					if file_system.file_exists (a_name) then
						project.trace (<<"  [gec] delete ", a_name>>)
						if not project.options.no_exec then
							file_system.delete_file (a_name)
						end
					else
						stop := True
					end
					i := i + 1
				end
				a_name := l_clean + ".tds"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".res"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".bat"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".sh"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".make"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [gec] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
			elseif is_ecf_configuration then
				cmd := new_ecf_cmdline
				project.trace (<<"  [gec] ", cmd>>)
				execute_shell (cmd)
				if attached exit_code_variable_name as l_exit_code_variable_name then
						-- Store return_code of compilation process:
					project.set_variable_value (l_exit_code_variable_name, exit_code.out)
						-- Reset `exit_code' since return_code of process is available through
						-- variable 'exit_code_variable_name':
					exit_code := 0
				end
				if exit_code = 2 then
						-- When the exit code is 2, it means that gec reported warnings.
					exit_code := 0
				end
			end
		end

feature -- Command-line

	new_ecf_cmdline: STRING
			-- Execution commandline for ECF configuration
		require
			is_ecf_configuration: is_ecf_configuration
		local
			a_filename: STRING
		do
			create Result.make (50)
			Result.append_string (executable_filename)
			Result.append_character (' ')
			if attached target_name as l_target_name and then not l_target_name.is_empty then
				Result.append_string ("--target=")
				Result.append_string (l_target_name)
				Result.append_character (' ')
			end
			if finalize then
				Result.append_string ("--finalize ")
			end
			if gelint then
				Result.append_string ("--gelint ")
			end
			if attached c_compile as l_c_compile and then not l_c_compile.is_empty then
				Result.append_string ("--cc=")
				Result.append_string (l_c_compile)
				Result.append_character (' ')
			end
			if attached catcall_mode as l_catcall_mode and then not l_catcall_mode.is_empty then
				Result.append_string ("--catcall=")
				Result.append_string (l_catcall_mode)
				Result.append_character (' ')
			end
			if not split_mode then
				Result.append_string ("--split=no ")
			end
			if split_size > 0 then
				Result.append_string ("--split-size=")
				INTEGER_.append_decimal_integer (split_size, Result)
				Result.append_character (' ')
			end
			if attached garbage_collector as l_garbage_collector and then not l_garbage_collector.is_empty then
				Result.append_string ("--gc=")
				Result.append_string (garbage_collector)
				Result.append_character (' ')
			end
			if attached new_instance_types_filename as l_new_instance_types_filename and then not l_new_instance_types_filename.is_empty then
				Result.append_string ("--new-instance-types=")
				Result.append_string (l_new_instance_types_filename)
				Result.append_character (' ')
			end
			if thread_count /= 0 then
				Result.append_string ("--thread=")
				INTEGER_.append_decimal_integer (thread_count, Result)
				Result.append_character (' ')
			end
			if silent_mode then
				Result.append_string ("--silent ")
			end
			if verbose_mode then
				Result.append_string ("--verbose ")
			end
			if no_benchmark_mode then
				Result.append_string ("--no-benchmark ")
			end
			if nested_benchmark_mode then
				Result.append_string ("--nested-benchmark ")
			end
			if metrics_mode then
				Result.append_string ("--metrics ")
			end
			check is_ecf_configuration: attached ecf_filename as l_ecf_filename then
				a_filename := file_system.pathname_from_file_system (l_ecf_filename, unix_file_system)
				Result := STRING_.appended_string (Result, a_filename)
			end
		ensure
			command_line_not_void: Result /= Void
			command_line_not_empty: Result.count > 0
		end

invariant

	executable_filename_not_void: executable_filename /= Void
	executable_filename_not_empty: not executable_filename.is_empty

end
