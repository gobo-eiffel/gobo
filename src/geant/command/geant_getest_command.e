indexing

	description:

		"Getest commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make (a_project: GEANT_PROJECT) is
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

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := config_filename /= Void and then config_filename.count > 0
		ensure then
			config_filename_not_void: Result implies config_filename /= Void
			config_filename_not_empty: Result implies config_filename.count > 0
		end

feature -- Access

	verbose: BOOLEAN
			-- Getest '--verbose' command-line options

	config_filename: STRING
			-- Config filename

	compile: STRING
			-- Compilation command-line

	class_regexp: STRING
			-- Class regular expression

	feature_regexp: STRING
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

feature -- Setting

	set_verbose (b: BOOLEAN) is
			-- Set `verbose' to `an_options'.
		do
			verbose := b
		ensure
			verbose_set: verbose = b
		end

	set_config_filename (a_filename: STRING) is
			-- Set `config_filename' to `a_filename'
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			config_filename := a_filename
		ensure
			config_filename_set: config_filename = a_filename
		end

	set_compile (a_compile: like compile) is
			-- Set `compile' to `a_compile'.
		require
			a_compile_not_void: a_compile /= Void
		do
			compile := a_compile
		ensure
			compile_set: compile = a_compile
		end

	set_class_regexp (a_regexp: like class_regexp) is
			-- Set `class_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			class_regexp := a_regexp
		ensure
			class_regexp_set: class_regexp = a_regexp
		end

	set_feature_regexp (a_regexp: like feature_regexp) is
			-- Set `feature_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			feature_regexp := a_regexp
		ensure
			feature_regexp_set: feature_regexp = a_regexp
		end

	set_default_test_included (b: BOOLEAN) is
			-- Set `default_test_included' to `b'.
		do
			default_test_included := b
		ensure
			default_test_included_set: default_test_included = b
		end

	set_generation (b: BOOLEAN) is
			-- Set `generation' to `b'.
		do
			generation := b
		ensure
			generation_set: generation = b
		end

	set_compilation (b: BOOLEAN) is
			-- Set `compilation' to `b'.
		do
			compilation := b
		ensure
			compilation_set: compilation = b
		end

	set_execution (b: BOOLEAN) is
			-- Set `execution' to `b'.
		do
			execution := b
		ensure
			execution_set: execution = b
		end

	set_abort (b: BOOLEAN) is
			-- Set `abort' to `b'.
		do
			abort := b
		ensure
			abort_set: abort = b
		end

feature -- Execution

	execute is
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
				if compile /= Void then
					cmd.append_string ("--compile=%"")
					cmd := STRING_.appended_string (cmd, compile)
					cmd.append_string ("%" ")
				end
				if class_regexp /= Void then
					cmd.append_string ("--class=%"")
					cmd := STRING_.appended_string (cmd, class_regexp)
					cmd.append_string ("%" ")
				end
				if feature_regexp /= Void then
					cmd.append_string ("--feature=%"")
					cmd := STRING_.appended_string (cmd, feature_regexp)
					cmd.append_string ("%" ")
				end
				if default_test_included then
					cmd.append_string ("--default_test ")
				end
				a_filename := file_system.pathname_from_file_system (config_filename, unix_file_system)
				a_filename := file_system.pathname_from_file_system (config_filename, unix_file_system)
				cmd := STRING_.appended_string (cmd, a_filename)
				project.trace (<<"  [getest] ", cmd>>)
				execute_shell (cmd)
			end
		end

invariant

	defines_not_void: defines /= Void
	no_void_define_name: not defines.has (Void)
	no_void_define_value: not defines.has_item (Void)

end
