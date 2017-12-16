note

	description:

		"Test task 'set'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FUNCTIONAL_SET_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE

create

	make_default

feature -- Test

	test_set_simple
			-- Test task 'set' in it's simplest form.
		do
 			verbose := True
			tasks := "{
				<set name="who" value="world"/>
				}"
 			expected_task_output := "{
				|  [set global] who=world
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_set_simple")
		end

	test_set_var
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="n" value="world"/>
				<set name="who" value="${n}"/>
				}"
 			expected_task_output := "{
				|  [set global] n=world
				|  [set global] who=world
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_set_var")
		end

	test_reset_var
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="who" value="world"/>
				<set name="who" value="you"/>
				}"

			expected_task_output := "{
				|  [set global] who=world
				|  [set global] who=you
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_reset_var")
		end

	test_unset_var
			-- Test task 'unset'
		do
 			verbose := True
			tasks := "{
				<set name="who" value="world"/>
				<unset name="who"/>
				<echo message="who=${who}"/>
				}"

			expected_task_output := "{
				|  [set global] who=world
				|  [unset global] name=who
				|  [echo]
				|who=${who}
			}"
			expected_stdout_txt := default_expected_stdout_txt

			basic_test ("test_unset_var")
		end

	test_two_levels
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="programming_language" value="Eiffel"/>
				<set name="message1" value="programming language is ${programming_language}"/>
				<set name="message2" value="My favorite ${message1}"/>
				<echo message="${message2}"/>
				<set name="programming_language" value="Java"/>
					<!-- Note that instead of 'Java' 'Eiffel' is echo'ed since 'message2' was completely resolved earlier: -->
				<echo message="${message2}"/>
				}"

			expected_task_output := "{
				|  [set global] programming_language=Eiffel
				|  [set global] message1=programming language is Eiffel
				|  [set global] message2=My favorite programming language is Eiffel
				|  [echo]
				|My favorite programming language is Eiffel
				|  [set global] programming_language=Java
				|  [echo]
				|My favorite programming language is Eiffel
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_two_levels")
		end

	test_template0
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="message" value="This is case ${case}"/>
				<set name="case" value="A"/>
				}"

			expected_task_output := "{
				|  [set global] message=This is case ${case}
				|  [set global] case=A
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_template0")
		end

	test_template1
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="message" value="This is case ${case}"/>
				<set name="case" value="A"/>
				<echo message="${message}"/>
				<set name="case" value="B"/>
				<echo message="${message}"/>
				<set name="case" value="C"/>
				<echo message="${message}"/>
				}"

			expected_task_output := "{
				|  [set global] message=This is case ${case}
				|  [set global] case=A
				|  [echo]
				|This is case A
				|  [set global] case=B
				|  [echo]
				|This is case B
				|  [set global] case=C
				|  [echo]
				|This is case C
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_template1")
		end

	test_template2
			-- Test task 'set'
		do
 			verbose := True
			tasks := "{
				<set name="message2" value="My favorite ${message1}"/>
				<set name="message1" value="programming language is ${programming_language}"/>
				<set name="programming_language" value="Eiffel"/>
				<echo message="${message2}"/>
				<set name="programming_language" value="Java"/>
					<!-- Note that 'Java' is echo'ed due to the template approach: -->
				<echo message="${message2}"/>
				<set name="programming_language" value="C"/>
					<!-- Note that 'C' is echo'ed due to the template approach: -->
				<echo message="${message2}"/>
				}"

			expected_task_output := "{
				|  [set global] message2=My favorite ${message1}
				|  [set global] message1=programming language is ${programming_language}
				|  [set global] programming_language=Eiffel
				|  [echo]
				|My favorite programming language is Eiffel
				|  [set global] programming_language=Java
				|  [echo]
				|My favorite programming language is Java
				|  [set global] programming_language=C
				|  [echo]
				|My favorite programming language is C
			}"
			expected_stdout_txt := default_expected_stdout_txt
			basic_test ("test_template2")
		end

end
