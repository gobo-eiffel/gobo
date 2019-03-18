note

	description:

		"Test features of class GEANT_DIRECTORYSET."

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2019, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TEST_DIRECTORYSET

inherit

	TS_TEST_CASE

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make_default

feature -- Test

	test_initialization
			-- Test feature `glob_prefix'.
		local
			ds: GEANT_DIRECTORYSET
		do
			create ds.make (new_project)
			assert ("not_executable_1", not ds.is_executable)
			ds.set_directory_name (Execution_environment.interpreted_string ("${GOBO}"))
			assert ("executable_1", ds.is_executable)
			ds.execute
			assert ("empty_1", ds.is_empty)
		end

	test_execute1
			-- Test feature `execute' with `set_include_wc_string' applied.
		local
			ds: GEANT_DIRECTORYSET
			a_entries: DS_ARRAYED_LIST [STRING]
		do
			create ds.make (new_project)
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
			assert ("has_library_kernel_basic", a_entries.has ("library/kernel/src/basic"))
			assert ("has_library_tools_eiffel_parser", a_entries.has ("library/tools/src/eiffel/parser"))
			assert ("not_has_tool_gelint", not a_entries.has ("tool/gelint"))
			assert ("not_has_library", not a_entries.has ("library"))
		end

	test_execute2
			-- Test feature `execute' with `set_include_wc_string' and `set_exclude_wc_string' applied.
		local
			ds: GEANT_DIRECTORYSET
			a_entries: DS_ARRAYED_LIST [STRING]
		do
			create ds.make (new_project)
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
			assert ("not_has_library_kernel_basic", not a_entries.has ("library/kernel/src/basic"))
			assert ("not_has_library_kernel_elks", not a_entries.has ("library/kernel/src/elks"))
			assert ("not_has_library_kernel_io", not a_entries.has ("library/kernel/src/io"))
			assert ("not_has_library_kernel_misc", not a_entries.has ("library/kernel/src/misc"))
			assert ("has_library_xml_tree", a_entries.has ("library/xml/src/tree"))
			assert ("has_library_tools_eiffel_parser", a_entries.has ("library/tools/src/eiffel/parser"))
			assert ("not_has_tool_gelint", not a_entries.has ("tool/gelint"))
			assert ("not_has_library", not a_entries.has ("library"))
		end

feature {NONE} -- Implementation

	new_project: GEANT_PROJECT
			-- Dummy project for test
		local
			a_variables: GEANT_PROJECT_VARIABLES
			an_options: GEANT_PROJECT_OPTIONS
		do
			create a_variables.make
			create an_options.make
--			an_options.set_debug_mode (True)
			create Result.make (a_variables, an_options, "test_project")
			Result.set_output_file (null_output_stream)
		ensure
			new_project_not_void: Result /= Void
		end

end
