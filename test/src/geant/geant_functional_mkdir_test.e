indexing

	description:

		"Test task 'mkdir'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FUNCTIONAL_MKDIR_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE

create

	make_default

feature -- Test

	test_mkdir is
			-- Test task 'mkdir'
		local
			s: STRING
			a_tmp_geant_subdir: STRING
		do

				-- Test mkdir with one directory level:
			a_tmp_geant_subdir := "__tmp_geant_subdir"
			file_system.recursive_delete_directory (a_tmp_geant_subdir)
			assert_true ("test_mkdir1prepare", not file_system.directory_exists (a_tmp_geant_subdir))

			tasks := "<mkdir directory='" + a_tmp_geant_subdir + "'/>"
			basic_test ("test_mkdir1execute")
			assert_true ("test_mkdir1", file_system.directory_exists (a_tmp_geant_subdir))

				-- Test mkdir with two directory levels:
			a_tmp_geant_subdir := "__tmp_geant_subdir"
			file_system.recursive_delete_directory (a_tmp_geant_subdir)
			assert_true ("test_mkdir2prepare", not file_system.directory_exists (a_tmp_geant_subdir))

			s := file_system.pathname (a_tmp_geant_subdir, "ttt2")

			tasks := "<mkdir directory='" + s + "'/>"
			basic_test ("test_mkdir2execute")
			assert_true ("test_mkdir2", file_system.directory_exists (s))

		end

end
