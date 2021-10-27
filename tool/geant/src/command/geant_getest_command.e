note

	description:

		"Getest commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2021, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GETEST_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new 'getest' command.
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			precursor (a_project)
			create defines.make_map (10)
			create a_tester
			defines.set_key_equality_tester (a_tester)
				-- Default values.
			generation := True
			compilation := True
			execution := True
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := attached config_filename as l_config_filename and then l_config_filename.count > 0
			Result := Result and then (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		ensure then
			config_filename_not_void_and_not_empty: Result implies attached config_filename as l_config_filename and then l_config_filename.count > 0
			exit_code_variable_name_void_or_not_empty: Result implies (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		end

feature -- Access

	verbose: BOOLEAN
			-- Getest '--verbose' command-line options

	config_filename: detachable STRING
			-- Config filename

	compile: detachable STRING
			-- Compilation command-line

	class_regexp: detachable STRING
			-- Class regular expression

	feature_regexp: detachable STRING
			-- Feature regular expression

	default_test_included: BOOLEAN
			-- Should 'default_test' be included in generated testcases?

	generation: BOOLEAN
			-- Should the Eiffel classes for the testcases be generated?

	compilation: BOOLEAN
			-- Should the testcases be compiled?

	execution: BOOLEAN
			-- Should the testcases be executed?

	abort: BOOLEAN
			-- Should the test application crash when an error occur?

	defines: DS_HASH_TABLE [STRING, STRING]
			-- Defined values from the command-line (--define option)

	exit_code_variable_name: detachable STRING
			-- Name of variable holding exit code of gec compilation process

feature -- Setting

	set_verbose (b: BOOLEAN)
			-- Set `verbose' to `an_options'.
		do
			verbose := b
		ensure
			verbose_set: verbose = b
		end

	set_config_filename (a_filename: STRING)
			-- Set `config_filename' to `a_filename'
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			config_filename := a_filename
		ensure
			config_filename_set: config_filename = a_filename
		end

	set_compile (a_compile: like compile)
			-- Set `compile' to `a_compile'.
		require
			a_compile_not_void: a_compile /= Void
		do
			compile := a_compile
		ensure
			compile_set: compile = a_compile
		end

	set_class_regexp (a_regexp: like class_regexp)
			-- Set `class_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			class_regexp := a_regexp
		ensure
			class_regexp_set: class_regexp = a_regexp
		end

	set_feature_regexp (a_regexp: like feature_regexp)
			-- Set `feature_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			feature_regexp := a_regexp
		ensure
			feature_regexp_set: feature_regexp = a_regexp
		end

	set_default_test_included (b: BOOLEAN)
			-- Set `default_test_included' to `b'.
		do
			default_test_included := b
		ensure
			default_test_included_set: default_test_included = b
		end

	set_generation (b: BOOLEAN)
			-- Set `generation' to `b'.
		do
			generation := b
		ensure
			generation_set: generation = b
		end

	set_compilation (b: BOOLEAN)
			-- Set `compilation' to `b'.
		do
			compilation := b
		ensure
			compilation_set: compilation = b
		end

	set_execution (b: BOOLEAN)
			-- Set `execution' to `b'.
		do
			execution := b
		ensure
			execution_set: execution = b
		end

	set_abort (b: BOOLEAN)
			-- Set `abort' to `b'.
		do
			abort := b
		ensure
			abort_set: abort = b
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
			a_filename: STRING
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			if not generation and not compilation and not execution then
					-- Nothing to be done.
				project.trace (<<"  [getest] ", "no generation, no compilation, no execution">>)
			else
				create cmd.make (128)
				cmd.append_string ("getest ")
				if verbose then
					cmd.append_string ("--verbose ")
				end
				if not generation then
					if not compilation then
						cmd.append_string ("-e ")
					elseif not execution then
						cmd.append_string ("-c ")
					else
						cmd.append_string ("-c -e ")
					end
				elseif not compilation then
					if not execution then
						cmd.append_string ("-g ")
					else
						cmd.append_string ("-g -e ")
					end
				elseif not execution then
					cmd.append_string ("-g -c ")
				end
				if abort then
					cmd.append_string ("-a ")
				end
				if defines.count > 0 then
					a_cursor := defines.new_cursor
					from a_cursor.start until a_cursor.after loop
						cmd.append_string ("--define=%"")
						cmd := STRING_.appended_string (cmd, a_cursor.key)
						cmd.append_character ('=')
						cmd := STRING_.appended_string (cmd, a_cursor.item)
						cmd.append_string ("%" ")
						a_cursor.forth
					end
				end
				if attached compile as l_compile then
					cmd.append_string ("--compile=%"")
					cmd := STRING_.appended_string (cmd, l_compile)
					cmd.append_string ("%" ")
				end
				if attached class_regexp as l_class_regexp then
					cmd.append_string ("--class=%"")
					cmd := STRING_.appended_string (cmd, l_class_regexp)
					cmd.append_string ("%" ")
				end
				if attached feature_regexp as l_feature_regexp then
					cmd.append_string ("--feature=%"")
					cmd := STRING_.appended_string (cmd, l_feature_regexp)
					cmd.append_string ("%" ")
				end
				if default_test_included then
					cmd.append_string ("--default_test ")
				end
				check is_executable: attached config_filename as l_config_filename then
					a_filename := file_system.pathname_from_file_system (l_config_filename, unix_file_system)
					a_filename := file_system.pathname_from_file_system (l_config_filename, unix_file_system)
					cmd := STRING_.appended_string (cmd, a_filename)
					project.trace (<<"  [getest] ", cmd>>)
					execute_shell (cmd)
					if attached exit_code_variable_name as l_exit_code_variable_name then
							-- Store return_code of compilation process:
						project.set_variable_value (l_exit_code_variable_name, exit_code.out)
							-- Reset `exit_code' since return_code of process is available through
							-- variable 'exit_code_variable_name':
						exit_code := 0
					end
				end
			end
		end

invariant

	defines_not_void: defines /= Void
	no_void_define_name: not defines.has_void
	no_void_define_value: not defines.has_void_item

end
