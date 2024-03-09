﻿note

	description:

		"Test task 'exec'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008-2024, Sven Ehrke and others"
	license: "MIT License"

class GEANT_FUNCTIONAL_EXEC_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE

create

	make_default

feature -- Test

	test_exec
			-- Test task 'exec' in it's simplest form.
		local
			l_geant_pathname: STRING
			l_tasks: STRING
		do
				-- Write a build file named 'exec.eant' which does nothing
				-- (but can be invoked to test the exit code):
			tasks := ""
			write_build_file ("test_exec", "exec.eant")

			l_geant_pathname := {UT_GOBO_VARIABLES}.executable_pathname ("geant")
			l_tasks := "{
				<exec executable="${geant} -b exec.eant" exit_code_variable="return_code"/>
				<echo message="return_code: ${return_code}" to_file="out.txt"/>
				}"
			l_tasks.replace_substring_all ("${geant}", l_geant_pathname)
			tasks := l_tasks
			expected_out_txt := "{
				|return_code: 0
			}"
			basic_test ("test_exec1")

			l_tasks := "{
				<exec executable="${geant} -b nonexisting.eant" exit_code_variable="return_code"/>
				<echo message="return_code: ${return_code}" to_file="out.txt"/>
				}"
			l_tasks.replace_substring_all ("${geant}", l_geant_pathname)
			tasks := l_tasks
			expected_out_txt := "{
				|return_code: 1
			}"
			basic_test ("test_exec2")
		end

	test_exec_validation_1
			-- Test task 'exec''s validation
		do
			expected_exit_code := 1
			tasks := "{
				<exec executable="somecommand" exit_code_variable=""/>
				}"
 			expected_task_output := "{
				|ERROR AT: build.eant (4:59)
				|    [echo] error: 'exit_code_variable' may not be empty
			}"

			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_exec_validation_1")
		end

	test_exec_validation_2
			-- Test task 'exec''s validation
		do
			expected_exit_code := 1
			tasks := "{
				<exec executable="somecommand" exit_code_variable="">
					<fileset include="@(**/*.ge)" dir="$GOBO"/>
				</exec>
				}"
 			expected_task_output := "{
				|ERROR AT: build.eant (4:59)
				|    [echo] error: 'exit_code_variable' may not be defined together with 'fileset'
			}"

			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_exec_validation_2")
		end

	test_exec_fs1
			-- Test task 'exec' with filesets
		do
				-- Write a build file named 'exec.eant' which does nothing
				-- (but can be invoked to test the exit code):
			tasks := "{
				<exec executable="echo ${fs.filename}">
					<fileset include="@(Rel*.md)" dir="${GOBO}"/>
				</exec>
				}"
 			expected_task_output := "{
				|Release_notes.md
				|
			}"

			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_exec_fs1")
		end


end
