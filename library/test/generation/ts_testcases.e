note

	description:

		"Test config testcases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/10/08 $"
	revision: "$Revision: #17 $"

class TS_TESTCASES

inherit

	ANY
			-- Export features of ANY.

	KL_GOBO_VERSION

	KL_SHARED_FILE_SYSTEM

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_IMPORTED_STRING_ROUTINES

	TS_CONFIG_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_testgen: like testgen; an_error_handler: like error_handler)
			-- Create a new testcases.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create testcases.make (100)
			create class_prefixes.make_map (10)
			testgen := a_testgen
			error_handler := an_error_handler
			tester_parent := default_tester_parent
			max_testcases_per_build_suite_feature := default_max_testcases_per_build_suite_feature
			version := Version_number
		ensure
			testgen_set: testgen = a_testgen
			error_handler_set: error_handler = an_error_handler
		end

feature -- Element change

	put_testcase (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME)
			-- Add (`a_class', `a_feature_name') to the list of testcases.
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			testcases.force_last ([a_class, a_feature_name])
		end

	set_class_prefix (a_class: ET_CLASS; a_class_prefix: STRING)
			-- Set the prefix for `a_class' to be `a_class_prefix'
		require
			a_class_not_void: a_class /= Void
			a_class_prefix_not_void: a_class_prefix /= Void
		do
			class_prefixes.force (a_class_prefix, a_class)
		end

feature -- Generation

	generate_test_classes
			-- Generate test classes.
		local
			l_class: ET_CLASS
			i, nb: INTEGER
		do
			nb := testcases.count
			from i := 1 until i > nb loop
				l_class := testcases.item (i).a_class
				if l_class.is_deferred then
						-- Generate a new class only when the test case class
						-- is deferred. Otherwise use the test case class directly.
					generate_test_class (l_class)
				end
				i := i + 1
			end
		end

	generate_test_class (a_class: ET_CLASS)
			-- Generate test class associated with `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_class_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			a_filename: STRING
			a_dirname: STRING
			a_dir: KL_DIRECTORY
			new_name: STRING
			l_class_prefix: STRING
		do
			class_prefixes.search (a_class)
			if class_prefixes.found then
				l_class_prefix := class_prefixes.found_item
			else
				l_class_prefix := Default_class_prefix
			end
			a_class_name := a_class.upper_name
			create new_name.make (a_class_name.count + l_class_prefix.count)
			new_name.append_string (l_class_prefix)
			new_name.append_string (a_class_name)
			if testgen /= Void and then testgen.count > 0 then
				a_dirname := file_system.pathname_from_file_system (testgen, unix_file_system)
				a_dirname := Execution_environment.interpreted_string (a_dirname)
				create a_dir.make (a_dirname)
				if not a_dir.exists then
					a_dir.recursive_create_directory
				end
				a_filename := file_system.pathname (a_dirname, new_name.as_lower + ".e")
			else
				create a_filename.make (new_name.count + 2)
				a_filename.append_string (new_name.as_lower)
				a_filename.append_string (".e")
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_line ("note")
				a_file.put_new_line
				a_file.put_string ("%Tdescription: %"Executable test case derived from class")
				a_file.put_string (a_class_name)
				a_file.put_character ('%"')
				a_file.put_new_line
				a_file.put_string ("%Tgenerator: %"getest version ")
				a_file.put_string (version)
				a_file.put_character ('%"')
				a_file.put_new_line
				a_file.put_new_line
				a_file.put_string ("class ")
				a_file.put_line (new_name)
				a_file.put_new_line
				a_file.put_line ("inherit")
				a_file.put_new_line
				a_file.put_character ('%T')
				a_file.put_line (a_class_name)
				a_file.put_new_line
				a_file.put_line ("create")
				a_file.put_new_line
				a_file.put_line ("%Tmake_default")
				a_file.put_new_line
				a_file.put_line ("end")
				a_file.close
			else
				create cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

	generate_root_class (a_class_name: STRING)
			-- Generate root class `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_file: KL_TEXT_OUTPUT_FILE
			a_filename: STRING
			a_dirname: STRING
			a_dir: KL_DIRECTORY
			upper_class_name: STRING
		do
			if testgen /= Void and then testgen.count > 0 then
				a_dirname := file_system.pathname_from_file_system (testgen, unix_file_system)
				a_dirname := Execution_environment.interpreted_string (a_dirname)
				create a_dir.make (a_dirname)
				if not a_dir.exists then
					a_dir.recursive_create_directory
				end
				a_filename := file_system.pathname (a_dirname, a_class_name.as_lower + ".e")
			else
				create a_filename.make (a_class_name.count + 2)
				a_filename.append_string (a_class_name.as_lower)
				a_filename.append_string (".e")
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				upper_class_name := a_class_name.as_upper
				a_file.put_line ("note")
				a_file.put_new_line
				a_file.put_line ("%Tdescription: %"Test harness root class%"")
				a_file.put_string ("%Tgenerator: %"getest version ")
				a_file.put_string (version)
				a_file.put_character ('%"')
				a_file.put_new_line
				a_file.put_new_line
				a_file.put_string ("class ")
				a_file.put_line (upper_class_name)
				a_file.put_new_line
				a_file.put_line ("inherit")
				a_file.put_new_line
				a_file.put_string ("%T")
				a_file.put_line (tester_parent)
				a_file.put_line ("%T%Tredefine")
				a_file.put_line ("%T%T%Tbuild_suite")
				a_file.put_line ("%T%Tend")
				a_file.put_new_line
				a_file.put_line ("create")
				a_file.put_new_line
				a_file.put_line ("%Tmake, make_default")
				a_file.put_new_line
				a_file.put_line ("feature -- Element change")
				a_file.put_new_line
				generate_build_suite_feature (a_file)
				a_file.put_line ("end")
				a_file.close
			else
				create cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

feature {NONE} -- Generation

	generate_build_suite_feature (a_file: KL_TEXT_OUTPUT_FILE)
			-- Generate in `a_file' feature 'build_suite'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open: a_file.is_open_write
		local
			nb: INTEGER
		do
			nb := testcases.count // max_testcases_per_build_suite_feature
			if (testcases.count \\ max_testcases_per_build_suite_feature) /= 0 then
				nb := nb + 1
			end
			if nb > 1 then
					-- Split the feature 'build_suite' into smaller features, so that
					-- the back-end C compiler can compile the generated C code for
					-- this routime in a reasonable amount of time.
				a_file.put_line ("%Tbuild_suite")
				a_file.put_line ("%T%T%T-- Add to `suite' the test cases that need to executed.")
				a_file.put_line ("%T%Tdo")
				(1 |..| nb).do_all (agent generate_call_to_i_th_build_suite_feature (?, a_file))
				a_file.put_line ("%T%Tend")
				a_file.put_new_line;
				(1 |..| nb).do_all (agent generate_i_th_build_suite_feature (?, a_file))
			else
				generate_bounded_build_suite_feature ("build_suite", 1, testcases.count, a_file)
			end
		end

	generate_i_th_build_suite_feature (i: INTEGER; a_file: KL_TEXT_OUTPUT_FILE)
			-- Generate in `a_file' the `i'-th 'build_suite' feature.
		require
			i_positive: i > 0
			a_file_not_void: a_file /= Void
			a_file_is_open: a_file.is_open_write
		do
			generate_bounded_build_suite_feature ("build_suite_" + i.out, (i - 1) * max_testcases_per_build_suite_feature + 1, (i * max_testcases_per_build_suite_feature).min (testcases.count), a_file)
		end

	generate_call_to_i_th_build_suite_feature (i: INTEGER; a_file: KL_TEXT_OUTPUT_FILE)
			-- Generate in `a_file' a call to the `i'-th 'build_suite' feature.
		require
			i_positive: i > 0
			a_file_not_void: a_file /= Void
			a_file_is_open: a_file.is_open_write
		do
			a_file.put_string ("%T%T%Tbuild_suite_")
			a_file.put_integer (i)
			a_file.put_new_line
		end

	generate_bounded_build_suite_feature (a_feature_name: STRING; a_lower, a_upper: INTEGER; a_file: KL_TEXT_OUTPUT_FILE)
			-- Generate in `a_file' feature 'build_suite' named `a_feature_name' and
			-- containing testcases indexed from `a_lower' to `a_upper'.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: not a_feature_name.is_empty
			a_lower_large_enough: a_lower >= 1
			a_upper_small_enough: a_upper <= testcases.count
			valid_bounds: a_lower <= a_upper + 1
			a_file_not_void: a_file /= Void
			a_file_is_open: a_file.is_open_write
		local
			i, nb: INTEGER
			l_has_test: BOOLEAN
			l_testcase: TUPLE [a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME]
			l_test_class_name: STRING
			l_test_feature_name: STRING
			l_test_indexes: DS_HASH_TABLE [INTEGER, ET_CLASS]
			l_test_index: INTEGER
			l_class: ET_CLASS
			l_class_prefix: STRING
		do
			a_file.put_character ('%T')
			a_file.put_line (a_feature_name)
			a_file.put_line ("%T%T%T-- Add to `suite' the test cases that need to executed.")
			nb := a_upper - a_lower + 1
			create l_test_indexes.make_map (nb)
			l_has_test := (nb > 0)
				-- Declare local variables.
			if l_has_test then
				a_file.put_line ("%T%Tlocal")
				a_file.put_line ("%T%T%Tl_regexp: like enabled_test_cases")
				a_file.put_line ("%T%T%Tl_name: STRING")
			end
			from
				i := a_lower
			until
				i > a_upper
			loop
				l_testcase := testcases.item (i)
				l_class := l_testcase.a_class
				l_test_indexes.search (l_class)
				if l_test_indexes.found then
					l_test_index := l_test_indexes.found_item
				else
					l_test_index := l_test_indexes.count + 1
					l_test_indexes.force_last_new (l_test_index, l_class)
					a_file.put_string ("%T%T%Tl_test")
					a_file.put_integer (l_test_index)
					a_file.put_string (": ")
					l_test_class_name := l_class.upper_name
					if l_class.is_deferred then
							-- A new class has been generated only when the test case class
							-- is deferred. Otherwise use the test case class directly.
						class_prefixes.search (l_class)
						if class_prefixes.found then
							l_class_prefix := class_prefixes.found_item
						else
							l_class_prefix := Default_class_prefix
						end
					else
						l_class_prefix := ""
					end
					a_file.put_string (l_class_prefix)
					a_file.put_line (l_test_class_name)
				end
				i := i + 1
			end
				-- Declare body.
			a_file.put_line ("%T%Tdo")
			if l_has_test then
				a_file.put_line ("%T%T%Tl_regexp := enabled_test_cases")
			end
			from
				i := a_lower
			until
				i > a_upper
			loop
				l_testcase := testcases.item (i)
				l_test_feature_name := l_testcase.a_feature_name.lower_name
				l_class := l_testcase.a_class
				l_test_class_name := l_class.upper_name
				l_test_index := l_test_indexes.item (l_class)
				a_file.put_string ("%T%T%Tl_name := %"")
				a_file.put_string (l_test_class_name)
				a_file.put_character ('.')
				a_file.put_string (l_test_feature_name)
				a_file.put_line ("%"")
				a_file.put_line ("%T%T%Tif l_regexp = Void or else l_regexp.recognizes (l_name) then")
				a_file.put_string ("%T%T%T%Tcreate l_test")
				a_file.put_integer (l_test_index)
				a_file.put_line (".make_default")
				a_file.put_string ("%T%T%T%Tl_test")
				a_file.put_integer (l_test_index)
				a_file.put_string (".set_test (l_name, agent l_test")
				a_file.put_integer (l_test_index)
				a_file.put_character ('.')
				a_file.put_string (l_test_feature_name)
				a_file.put_character (')')
				a_file.put_new_line
				a_file.put_string ("%T%T%T%Tput_test (l_test")
				a_file.put_integer (l_test_index)
				a_file.put_character (')')
				a_file.put_new_line
				a_file.put_line ("%T%T%Tend")
				i := i + 1
			end
			a_file.put_line ("%T%Tend")
			a_file.put_new_line
		end

feature -- Access

	testgen: STRING
			-- Directory where test classes are generated;
			-- Void means current directory

	tester_parent: STRING
			-- Name of tester parent class to be used when
			-- generating root class (Default: TS_TESTER)

	max_testcases_per_build_suite_feature: INTEGER
			-- Maximum number of testcases per 'build_suite' feature

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	version: STRING
			-- Version of generating tool

feature -- Setting

	set_tester_parent (a_parent: like tester_parent)
			-- Set `tester_parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			tester_parent := a_parent
		ensure
			tester_parent_set: tester_parent = a_parent
		end

	set_max_testcases_per_build_suite_feature (n: INTEGER)
			-- Set `max_testcases_per_build_suite_feature' to `n'.
		require
			n_positive: n > 0
		do
			max_testcases_per_build_suite_feature := n
		ensure
			max_testcases_per_build_suite_feature_set: max_testcases_per_build_suite_feature = n
		end

	set_version (a_version: like version)
			-- Set `version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			version := a_version
		ensure
			version_set: version = a_version
		end

feature -- Measurement

	count: INTEGER
			-- Number of testcases
		do
			Result := testcases.count
		ensure
			count_not_negative: Result >= 0
		end

feature {NONE} -- Implementation

	testcases: DS_ARRAYED_LIST [TUPLE [a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME]]
			-- Testcases (lists of feature names in their classes)

	class_prefixes: DS_HASH_TABLE [STRING, ET_CLASS]
			-- Class prefixes indexed by class

	default_tester_parent: STRING = "TS_TESTER"
			-- Default value for `tester_parent'

	default_max_testcases_per_build_suite_feature: INTEGER = 100
			-- Default value for the maximum number of testcases per 'build_suite' feature

invariant

	testcases_not_void: testcases /= Void
	no_void_testcase: not testcases.has_void
	class_prefixes_not_void: class_prefixes /= Void
	no_void_class_prefix: not class_prefixes.has_void_item
	no_void_prefix_class: not class_prefixes.has_void
	error_handler_not_void: error_handler /= Void
	tester_parent_not_void: tester_parent /= Void
	version_not_void: version /= Void
	max_testcases_per_build_suite_feature_positive: max_testcases_per_build_suite_feature > 0

end
