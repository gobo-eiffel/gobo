indexing

	description:

		"Test features of class GEANT_MAP"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TEST_MAP

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make_default

feature -- Test

	test_set_type is
			-- Test feature `set_type'.
		do
			create map.make (project)
			map.set_type (map.Type_attribute_value_identity)
			assert_equal ("set_type1", "identity", map.type)

			map.set_type (map.Type_attribute_value_glob)
			assert_equal ("set_type2", "glob", map.type) 
		end

	test_set_source_pattern is
			-- Test feature `set_source_pattern'.
		do
			create map.make (project)
			map.set_source_pattern ("*.ge")
			assert_equal ("set_source_pattern1", "*.ge", map.source_pattern)

			map.set_source_pattern ("alkj*.ge")
			assert_equal ("set_source_pattern2", "alkj*.ge", map.source_pattern) 
		end

	test_set_target_pattern is
			-- Test feature `set_target_pattern'.
		do
			create map.make (project)
			map.set_target_pattern ("*.e")
			assert_equal ("set_target_pattern1", "*.e", map.target_pattern)

			map.set_target_pattern ("alkj*.e")
			assert_equal ("set_target_pattern2", "alkj*.e", map.target_pattern) 
		end

	test_is_executable_identity is
			-- Test feature `is_executable' in mode 'identity'.
		do
			create map.make (project)
			assert ("is_executable_identity_1", map.is_executable)	-- default type is identity

			map.set_source_pattern ("*.e")
			assert ("is_executable_identity_1a", not map.is_executable)

			map.set_target_pattern ("*.e")
			assert ("is_executable_identity_1b", not map.is_executable)

		end

	test_is_executable_glob is
			-- Test feature `is_executable' in mode 'glob'.
		do
			create map.make (project)
			map.set_type (map.Type_attribute_value_glob)

			assert ("is_executable_glob1", not map.is_executable)
			map.set_source_pattern ("*.ge")
			assert ("is_executable_glob2", not map.is_executable)

			map.set_target_pattern ("*.e")
			assert ("is_executable_glob3", map.is_executable)

			create map.make (project)
			map.set_type (map.Type_attribute_value_glob)
			map.set_source_pattern ("")
			map.set_target_pattern ("*.e")
			assert ("is_executable_glob4", not map.is_executable)

			map.set_source_pattern ("a")
			assert ("is_executable_glob5", not map.is_executable)

			map.set_source_pattern ("*.a")
			assert ("is_executable_glob6", map.is_executable)

-- TODO: precondition of `set_type' violated:
--			map.set_type ("globber")
--			assert ("is_executable_glob7", not map.is_executable)
		end

	test_mapped_filename is
			-- Test feature `mapped_filename'.
		local
			a_string: STRING
		do
			create map.make (project)
--			map.project.set_debug_mode (True)
			map.set_type ("glob")
			map.set_source_pattern ("*.ge")
			map.set_target_pattern ("*.e")
			a_string := STRING_.cloned_string ("foobar")
			assert_equal ("mapped_filename1", "foobar", map.mapped_filename ("foobar")) 

			assert_equal ("mapped_filename2", "foobar.e", map.mapped_filename ("foobar.ge")) 
			assert_not_equal ("mapped_filename3", "foobar.e", map.mapped_filename ("foobar.get")) 
			assert_not_equal ("mapped_filename4", "foobar.e", map.mapped_filename ("foobar.t.ge")) 
			assert_equal ("mapped_filename4", "foobar.t.e", map.mapped_filename ("foobar.t.ge")) 

			assert_equal ("mapped_filename5", "ttt/foobar.e", map.mapped_filename ("ttt/foobar.ge")) 
			assert_equal ("mapped_filename6", "aaa/ttt/foobar.e", map.mapped_filename ("aaa/ttt/foobar.ge")) 
			assert_equal ("mapped_filename7", "aaa\ttt\foobar.e", map.mapped_filename ("aaa\ttt\foobar.ge")) 

			map.set_source_pattern ("bla/*.ge")
			map.set_target_pattern ("bla/*.e")
			assert_equal ("mapped_filename9", "bla/foobar.e", map.mapped_filename ("bla/foobar.ge")) 
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
			create project.make (a_variables, an_options, "test_project")
			project.set_output_file (null_output_stream)
		end

	tear_down is
			-- Tear down after a test.
		do
			map := Void
			project := Void
		end

feature {NONE} -- Implementation

	project: GEANT_PROJECT
			-- Dummy project for test

	map: GEANT_MAP
			-- Map under test

end
