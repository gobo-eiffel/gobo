indexing

	description:

		"Test features of class GEANT_DIRECTORYSET."

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TEST_DIRECTORYSET

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make_default

feature -- Test

	test_initialization is
			-- Test feature `glob_prefix'.
		do
			assert ("not_executable_1", not ds.is_executable)
			ds.set_directory_name (Execution_environment.interpreted_string ("${GOBO}"))
			assert ("executable_1", ds.is_executable)
			ds.execute
			assert ("empty_1", ds.is_empty)
		end

	test_execute1 is
			-- Test feature `execute' with `set_include_wc_string' applied.
		local
			a_entries: DS_ARRAYED_LIST [STRING]
		do
			ds.set_directory_name (Execution_environment.interpreted_string ("${GOBO}"))
			ds.set_include_wc_string ("**/library/**/*")
			ds.execute
			assert ("not_empty_1", not ds.is_empty)

			create a_entries.make_equal (250)
			from ds.start until ds.after loop
				a_entries.force_last (ds.item_directory_name)
				ds.forth
			end
			assert ("has_library_kernel", a_entries.has ("library/kernel"))
			assert ("has_library_kernel_basic", a_entries.has ("library/kernel/basic"))
			assert ("has_library_tools_xace_generator", a_entries.has ("library/tools/xace/generator"))
			assert ("not_has_test_kernel", not a_entries.has ("test/kernel"))
			assert ("not_has_library", not a_entries.has ("library"))
		end

	test_execute2 is
			-- Test feature `execute' with `set_include_wc_string' and `set_exclude_wc_string' applied.
		local
			a_entries: DS_ARRAYED_LIST [STRING]
		do
			ds.set_directory_name (Execution_environment.interpreted_string ("${GOBO}"))
			ds.set_include_wc_string ("**/library/**/*")
			ds.set_exclude_wc_string ("@(**/spec/**/*|**/kernel/**/*|**/.svn)")
--			project.options.set_debug_mode (True)
			ds.execute
			assert ("not_empty_1", not ds.is_empty)

			create a_entries.make_equal (250)
			from ds.start until ds.after loop
				a_entries.force_last (ds.item_directory_name)
				ds.forth
			end
			assert ("has_library_kernel", a_entries.has ("library/kernel"))
			assert ("not_has_library_kernel_basic", not a_entries.has ("library/kernel/basic"))
			assert ("not_has_library_kernel_elks", not a_entries.has ("library/kernel/elks"))
			assert ("not_has_library_kernel_io", not a_entries.has ("library/kernel/io"))
			assert ("not_has_library_kernel_misc", not a_entries.has ("library/kernel/misc"))
			assert ("has_library_xml_tree", a_entries.has ("library/xml/tree"))
			assert ("has_library_tools_xace_generator", a_entries.has ("library/tools/xace/generator"))
			assert ("not_has_test_time", not a_entries.has ("test/time"))
			assert ("not_has_library", not a_entries.has ("library"))
		end

feature -- Execution

	set_up is
			-- Setup for a test.
		local
			a_variables: GEANT_PROJECT_VARIABLES
			an_options: GEANT_PROJECT_OPTIONS
		do
			create a_variables.make
			create an_options.make
--			an_options.set_debug_mode (True)
			create project.make (a_variables, an_options, "test_project")
			project.set_output_file (null_output_stream)
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
