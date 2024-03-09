note

	description:

		"Base class for functional geant tests"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008-2024, Sven Ehrke and others"
	license: "MIT License"

deferred class GEANT_FUNCTIONAL_TEST_CASE

inherit

	TS_TEST_CASE
		redefine
			make_default,
			tear_down, set_up
		end

	KL_SHARED_STREAMS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

feature {NONE} -- Initialization

	make_default
			-- <Precursor>
		do
			precursor
			test_dir := ""
		end

feature -- Execution

	set_up
			-- Setup for a test.
		local
			new_cwd: STRING
		do
			test_dir := Execution_environment.interpreted_string (file_system.nested_pathname ("${GOBO}", <<"tool", "geant", "test", "unit", "Tgeant_unit">>))

			old_cwd := file_system.current_working_directory
			new_cwd := test_dir

			if not file_system.directory_exists (new_cwd) then
				file_system.recursive_create_directory (new_cwd)
				if not file_system.directory_exists (new_cwd) then
					assert ("cannot create directory '" + new_cwd + "%'", False)
				end
			end

				-- Set current working directory to test directory:
			file_system.set_current_working_directory (new_cwd)
			if not STRING_.same_string (file_system.cwd, new_cwd) then
				assert ("cannot change to directory '" + new_cwd + "%'", False)
			end
				-- Delete standard files generated during test run:
			file_system.delete_file ("expected.txt")
			file_system.delete_file ("stdout.txt")
			file_system.delete_file ("stderr.txt")
			file_system.delete_file ("out.txt")
			file_system.delete_file ("out2.txt")
			file_system.delete_file ("build.eant")

			verbose := False
			tasks := ""
			expected_stdout_txt := Void
			expected_stderr_txt := Void
			expected_out_txt := Void
			expected_exit_code := 0
		end

	tear_down
			-- Tear down after a test.
		do
			if attached old_cwd as l_old_cwd then
				file_system.set_current_working_directory (l_old_cwd)
			end
		end

feature {NONE} -- Implementation

	write_build_file (a_tag, a_filename: STRING)
			-- Write concrete build file for test named `a_tag' into file named `a_filename';
			-- use `project' as a template for the buildfile content, if existing replace
			-- token 'TEST_TAG' with `a_tag' and token 'TASKS' with `tasks'.
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		local
			a_file: KL_TEXT_OUTPUT_FILE
			s: STRING
		do
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				s := STRING_.replaced_first_substring (project, "TEST_TAG", a_tag)
				if attached tasks as l_task then
					s := STRING_.replaced_first_substring (s, "TASKS", l_task)
				end
				a_file.put_line (s)
			else
				assert ("cannot write to file " + "build.eant", False)
			end
			a_file.close
		end

	old_cwd: detachable STRING
			-- Old current working directory

	test_dir: STRING
			-- Test directory used as current working directory during test run

	basic_test (a_tag: STRING)
			-- Run test with tag `a_tag.
			-- Note: since all geant functional tests work very similar this routine
			-- issues the individual steps of such a test. The behavior can be
			-- customized by setting one or more of the following attributes
			-- in the real tests implemented in subclasses which in turn invoke
			-- this routine:
			--
			--   `expected_stdout_txt'
			--   `expected_out_txt'
			--   `expected_task_output'
			--   `verbose'
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
		local
			a_build_filename: STRING
			a_cmd: STRING
			a_stdout: STRING
			a_stderr: STRING
			s: STRING
			a_expected: STRING
			l_geant_pathname: STRING
		do
			a_build_filename := "build.eant"
			write_build_file (a_tag, a_build_filename)
			a_stdout := "stdout.txt"
			a_stderr := "stderr.txt"
			a_cmd  := "-b " + a_build_filename + " > " + a_stdout + " 2> " + a_stderr
			l_geant_pathname := {UT_GOBO_VARIABLES}.executable_pathname ("geant")
			if verbose then
				a_cmd  := l_geant_pathname + " -v " + a_cmd
			else
				a_cmd  := l_geant_pathname + " " + a_cmd
			end
			assert_exit_code_execute (a_cmd, expected_exit_code)

				-- Check stdout:
			if attached expected_stdout_txt as l_expected_stdout_txt then
				a_expected := l_expected_stdout_txt + "" -- clone `expected_stdout_txt'
				if attached expected_task_output as l_expected_task_output then
					s := removed_indentation (l_expected_task_output)
					a_expected := STRING_.replaced_first_substring (a_expected, "TASK_OUTPUT", s)
				end
				assert_filecontent_equal_to_string (a_tag, a_stdout, a_expected)
			end

				-- Check stderr:
			if attached expected_stderr_txt as l_expected_stderr_txt then
				a_expected := removed_indentation (l_expected_stderr_txt)
				assert_filecontent_equal_to_string (a_tag, a_stderr, a_expected)
			end

			if attached expected_out_txt as l_expected_out_txt then
				s := removed_indentation (l_expected_out_txt)
				assert_filecontent_equal_to_string (a_tag, test_dir + "/out.txt", s)
			end
		end

	verbose: BOOLEAN
			-- Should 'geant' be called with the verbose flag?

	tasks: detachable STRING
			-- Tasks text to replace placeholder 'TASKS' in `project'

	expected_stdout_txt: detachable STRING
			-- Text which geant is expected to write to stdout, unless Void

	expected_stderr_txt: detachable STRING
			-- Text which geant is expected to write to stderr, unless Void

	expected_out_txt: detachable STRING
			-- Text which geant is expected to write to file 'out.txt', unless Void

	expected_task_output: detachable STRING
			-- Text to replace placeholder 'TASK_OUTPUT' in `expected_stdout_txt'
			--  (which is usually set to `default_expected_stdout_txt')
			-- so that only the changing output has to be defined in tests and not
			-- the complete output text
			-- Note: occurrences of '%T%T%T%T|' will be replaced by empty strings
			-- which makes it possible to set `expected_task_output' in tests in a more
			-- readable way.
			-- TODO: use a regular expression like '^\t*\|' instead.

	expected_exit_code: INTEGER
			-- exit code the call to 'geant' is expected to return

	project: STRING =
			-- Buildfile content for test
			-- NOTE: "[ means left aligned, "{ means as is
		"[
			<!-- test: TEST_TAG -->
			<project name="build1" default="t1">
				<target name="t1">
					TASKS
				</target>
			</project>
		]"

	default_expected_stdout_txt: STRING
			-- Template text for default output of build run,
			-- which contains placeholder 'TASK_OUTPUT' which will
			-- be replaced during test run
			-- Note that the Result is dependent on `verbose'
		do
			if verbose then
				Result := default_expected_verbose_stdout_txt
			else
				Result := default_expected_non_verbose_stdout_txt
			end
		ensure
			result_is_verbose_template: verbose implies Result = default_expected_verbose_stdout_txt
		end

	default_expected_verbose_stdout_txt: STRING =
		-- Default text written to stdout by geant when `verbose' = True
"{
Loading Project's configuration from build.eant
Building Project

build1.t1:

TASK_OUTPUT
}"

	default_expected_non_verbose_stdout_txt: STRING =
		-- Default text written to stdout by geant when `verbose' = False
"{
TASK_OUTPUT
}"

feature {NONE} -- Assertion routines

	assert_filecontent_equal_to_string (a_tag, a_filename, a_expected_content: STRING)
			-- Assert there is no difference between the content of
			-- the file named `a_filename' and a_expected_content'
			-- (Expand environment variables in `a_filename'.)
		require
			a_tag_not_void: a_tag /= Void
			a_filename_not_void: a_filename /= Void
			a_expected_content_not_void: a_expected_content /= Void
		local
			a_filename_expected: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
				-- Write `a_content' into file named '_expected.txt'
				-- (to be able to call `assert_files_equal':
			a_filename_expected := "expected.txt"
			create a_file.make (a_filename_expected)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string (a_expected_content)
			else
				assert ("error: cannot write to file " + a_filename_expected, False)
			end
			a_file.close

				-- Compare filecontents:
			assert_files_equal (a_tag, a_filename, a_filename_expected)
		end

	assert_file_time_stamps_equal (a_tag, a_unixpath1, a_unixpath2: STRING)
			-- Assert that timestamp of file referred to by `a_unixpath1' and timestamp
			-- of file referred to by `a_unixpath2' are equal
		require
			a_tag_not_void: a_tag /= Void
			a_unixpath1_not_void: a_unixpath1 /= Void
			a_unixpath1_not_empty: not a_unixpath1.is_empty
			a_unixpath2_not_void: a_unixpath2 /= Void
			a_unixpath2_not_empty: not a_unixpath2.is_empty
		local
			a_timestamp1, a_timestamp2: INTEGER
			a_path1, a_path2: STRING
		do
			a_path1 := path (a_unixpath1)
			assert (a_tag, file_system.file_exists (a_path1))
			a_timestamp1 := file_system.file_time_stamp (a_path1)

			a_path2 := path (a_unixpath2)
			assert (a_tag, file_system.file_exists (a_path2))
			a_timestamp2 := file_system.file_time_stamp (a_path2)

			assert_integers_equal (a_tag, a_timestamp1, a_timestamp2)
		end

	path (a_unix_path_string: STRING): STRING
			-- `a_unix_path_string', path string in unix format converted to the current filesystem format
		require
			a_unix_path_string_not_void: a_unix_path_string /= Void
			a_unix_path_string_not_empty: not a_unix_path_string.is_empty
		do
			Result := file_system.pathname_from_file_system (a_unix_path_string, unix_file_system)
		ensure
			Result_not_void: Result /= Void
		end

invariant

	test_dir_not_void: test_dir /= Void

end
