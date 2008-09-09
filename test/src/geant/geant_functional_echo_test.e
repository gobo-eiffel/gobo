indexing

	description:

		"Test task 'echo'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FUNCTIONAL_ECHO_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE

create

	make_default

feature -- Test

	test_echo is
			-- Test task 'echo' in it's simplest form.
		do
			tasks := "<echo message='hello world'/>"
 			expected_task_output := "hello world"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_echo")
		end

	test_echo_2 is
			-- Test task 'echo' with message in content.
		do
			tasks := "<echo>hello world</echo>"
 			expected_task_output := "hello world"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_echo_2")
		end

	test_echo_verbose is
			-- Test task 'echo' in it's simples form with verbose output.
		do
  			verbose := True
			tasks := "<echo message='hello world'/>"
 			expected_task_output := "{
				|  [echo]
				|hello world
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_echo_verbose")
		end

	test_echo_to_file is
			-- Test task 'echo' with attribute 'to_file'.
		do
			tasks := "<echo message='hello world' to_file='out.txt'/>"
			expected_out_txt := "{
				|hello world
			}"
  			expected_stdout_txt := ""
			basic_test ("test_echo_to_file")
		end

	test_echo_env_var is
			-- Test if task 'echo' resolves envrionment variables correctly.
		do
			if operating_system.is_windows then
				check_execute ("echo %%GOBO%% > out2.txt")
			else
				check_execute ("echo $GOBO > out2.txt")
			end
				-- Test environment variable $GOBO:
			tasks := "<echo message='${GOBO}' to_file='out.txt'/>"
			basic_test ("test_echo_env_var")
			assert_files_equal ("test_echo_env_var2", "out.txt", "out2.txt")

		end

	test_built_in_var is
			-- Test if task 'echo' resolves built-in variables correctly.
		do
				-- Test environment variable $GOBO:
			if operating_system.is_unix then
				check_execute ("pwd > out2.txt")
				tasks := "<echo message='${cwd}' to_file='out.txt'/>"
				basic_test ("test_built_in_var")
				assert_files_equal ("test_built_in_var2", "out.txt", "out2.txt")
			else
				-- TODO: first check on windows that this works:
-- 				check_execute ("cd > out2.txt")
			end

		end

	test_echo_validation_0 is
			-- Test task 'echo''s validation
		do
			expected_exit_code := 1
			tasks := "<echo/>"
			expected_task_output := ""
			expected_stderr_txt := "{
				|  [echo] ERROR (build.eant, 4:8):
				|  You have to specify either attribute 'message' or text content within the element 'echo'.
				|
				|BUILD FAILED!
			}"

			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_echo_validation_0")
		end

	test_echo_validation_1 is
			-- Test task 'echo''s validation
		do
			expected_exit_code := 1
			tasks := "<echo message='hello world' to_file=''/>"
 			expected_task_output := "{
				|ERROR AT: build.eant (4:41)
				|    [echo] error: 'to_file' may not be empty
			}"

			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_echo_validation_1")
		end

end
