indexing

	description:

		"Test features of class GEANT_DIRECTORYSET"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class GEANT_TEST_DIRECTORYSET

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

feature -- Test

	test_initialization is
			-- Test feature `glob_prefix'.
		do
			assert ("not_executable_1", not ds.is_executable)
			ds.set_directory_name(Execution_environment.interpreted_string ("${GOBO}"))
			assert ("executable_1", ds.is_executable)
			ds.execute
			assert ("empty_1", ds.is_empty)
		end

	test_execute1 is
			-- Test feature `execute' with `set_include_wx_string' applied.
		local
			a_entries: DS_ARRAYED_LIST [STRING]
			s: STRING
		do
			ds.set_directory_name(Execution_environment.interpreted_string ("${GOBO}"))
			ds.set_include_wc_string ("**/library/**/*")
			ds.execute
			assert ("not_empty_1", not ds.is_empty)

			create a_entries.make (250)
			from ds.start until ds.after loop
				a_entries.force_last (ds.item_directory_name)
				ds.forth
			end
			assert_equal ("test_execute1_0", 199, a_entries.count)
			assert_equal ("test_execute1_1", "library/CVS", a_entries.item (1))
			assert_equal ("test_execute1_2", "library/kernel", a_entries.item (2))
			assert_equal ("test_execute1_3", "library/kernel/basic", a_entries.item (3))
			assert_equal ("test_execute1_4", "library/kernel/basic/CVS", a_entries.item (4))
			assert_equal ("test_execute1_5", "library/kernel/CVS", a_entries.item (5))
			assert_equal ("test_execute1_188", "library/tools/xace/generator", a_entries.item (155))
		end

	test_execute2 is
			-- Test feature `execute' with `set_include_wx_string'and  `set_exclude_wx_string' applied
		local
			a_entries: DS_ARRAYED_LIST [STRING]
			s: STRING
		do
			ds.set_directory_name(Execution_environment.interpreted_string ("${GOBO}"))
			ds.set_include_wc_string ("**/library/**/*")
			ds.set_exclude_wc_string ("@(**/spec/**/*|**/CVS)")
--			project.options.set_debug_mode (True)
			ds.execute
			assert ("not_empty_1", not ds.is_empty)

			create a_entries.make (250)
			from ds.start until ds.after loop
				a_entries.force_last (ds.item_directory_name)
				ds.forth
			end
			assert_equal ("test_execute2_0", 96, a_entries.count)
			assert_equal ("test_execute2_1", "library/kernel", a_entries.item (1))
			assert_equal ("test_execute2_2", "library/kernel/basic", a_entries.item (2))
			assert_equal ("test_execute2_3", "library/kernel/elks", a_entries.item (3))
			assert_equal ("test_execute2_4", "library/kernel/io", a_entries.item (4))
			assert_equal ("test_execute2_5", "library/kernel/misc", a_entries.item (5))
			assert_equal ("test_execute2_96", "library/xml/tree", a_entries.item (96))
		end

feature -- Execution

	set_up is
			-- Setup for a test.
		local
			a_variables: GEANT_VARIABLES
			an_options: GEANT_PROJECT_OPTIONS
		do
			create a_variables.make
			create an_options.make
--			an_options.set_debug_mode (True)
			create project.make (a_variables, an_options)
			create ds.make (project)
		end

	tear_down is
			-- Tear down after a test.
		do
			ds := Void
		end

feature {NONE} -- Implementation

	project: GEANT_PROJECT
		-- Dummy project for test

	ds: GEANT_DIRECTORYSET
			-- Object under test

end
