note

	description:

		"Test config testcases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_TESTCASES

inherit

	ANY
			-- Export features of ANY.

	KL_GOBO_VERSION

	KL_SHARED_FILE_SYSTEM

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_testgen: like testgen; an_error_handler: like error_handler)
			-- Create a new testcases.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create testcases.make (10)
			testgen := a_testgen
			error_handler := an_error_handler
			tester_parent := default_tester_parent
			version := Version_number
		ensure
			testgen_set: testgen = a_testgen
			error_handler_set: error_handler = an_error_handler
		end

feature -- Element change

	put (a_class: ET_CLASS; feature_names: DS_LIST [STRING]; class_prefix: STRING)
			-- Add (`class_name', `feature_names') to the list of testcases.
		require
			a_classnot_void: a_class /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has_void
			class_prefix_not_void: class_prefix /= Void
		local
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
		do
			create a_pair.make (feature_names, class_prefix)
			testcases.force (a_pair, a_class)
		end

feature -- Generation

	generate_test_classes
			-- Generate test classes.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
			l_class: ET_CLASS
		do
			a_cursor := testcases.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				l_class := a_cursor.key
				if l_class.is_deferred then
						-- Generate a new class only when the test case class
						-- is deferred. Otherwise use the test case class directly.
					a_pair := a_cursor.item
					generate_test_class (l_class, a_pair.first, a_pair.second)
				end
				a_cursor.forth
			end
		end

	generate_test_class (a_class: ET_CLASS; feature_names: DS_LIST [STRING]; class_prefix: STRING)
			-- Generate test class `class_name'.
		require
			a_class_not_void: a_class /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has_void
			class_prefix_not_void: class_prefix /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_class_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			a_filename: STRING
			a_dirname: STRING
			a_dir: KL_DIRECTORY
			new_name: STRING
		do
			a_class_name := a_class.upper_name
			create new_name.make (a_class_name.count + class_prefix.count)
			new_name.append_string (class_prefix)
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

	generate_root_class (class_name: STRING)
			-- Generate root class `class_name'.
		require
			class_name_not_void: class_name /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
			a_file: KL_TEXT_OUTPUT_FILE
			a_filename: STRING
			a_dirname: STRING
			a_dir: KL_DIRECTORY
			l_test_name: STRING
			upper_class_name: STRING
			l_test_features: DS_LIST [STRING]
			l_test_features_cursor: DS_LIST_CURSOR [STRING]
			l_test_feature_name: STRING
			l_test_index: INTEGER
			l_class: ET_CLASS
			l_class_prefix: STRING
			has_test: BOOLEAN
		do
			if testgen /= Void and then testgen.count > 0 then
				a_dirname := file_system.pathname_from_file_system (testgen, unix_file_system)
				a_dirname := Execution_environment.interpreted_string (a_dirname)
				create a_dir.make (a_dirname)
				if not a_dir.exists then
					a_dir.recursive_create_directory
				end
				a_filename := file_system.pathname (a_dirname, class_name.as_lower + ".e")
			else
				create a_filename.make (class_name.count + 2)
				a_filename.append_string (class_name.as_lower)
				a_filename.append_string (".e")
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				upper_class_name := class_name.as_upper
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
				a_file.put_line ("%Tbuild_suite")
				a_file.put_line ("%T%T%T-- Add to `suite' the test cases that need to executed.")
				a_cursor := testcases.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_pair := a_cursor.item
					if not a_pair.first.is_empty then
						l_test_index := l_test_index + 1
						if not has_test then
							a_file.put_line ("%T%Tlocal")
							a_file.put_line ("%T%T%Tl_regexp: like enabled_test_cases")
							a_file.put_line ("%T%T%Tl_name: STRING")
							has_test := True
						end
						a_file.put_string ("%T%T%Tl_test")
						a_file.put_integer (l_test_index)
						a_file.put_string (": ")
						l_class := a_cursor.key
						l_test_name := l_class.upper_name
						if l_class.is_deferred then
								-- A new class has been generated only when the test case class
								-- is deferred. Otherwise use the test case class directly.
								-- `a_pair.second' correspond to the class name prefix of the
								-- generated class if any.
							l_class_prefix := a_pair.second
						else
							l_class_prefix := ""
						end
						a_file.put_string (l_class_prefix)
						a_file.put_line (l_test_name)
					end
					a_cursor.forth
				end
				a_file.put_line ("%T%Tdo")
				if has_test then
					a_file.put_line ("%T%T%Tl_regexp := enabled_test_cases")
				end
				l_test_index := 0
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_pair := a_cursor.item
					l_test_features := a_pair.first
					if not l_test_features.is_empty then
						l_test_index := l_test_index + 1
						l_class := a_cursor.key
						l_test_name := l_class.upper_name
						l_test_features_cursor := l_test_features.new_cursor
						from
							l_test_features_cursor.start
						until
							l_test_features_cursor.after
						loop
							l_test_feature_name := l_test_features_cursor.item
							a_file.put_string ("%T%T%Tl_name := %"")
							a_file.put_string (l_test_name)
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
							l_test_features_cursor.forth
						end
					end
					a_cursor.forth
				end
				a_file.put_line ("%T%Tend")
				a_file.put_new_line
				a_file.put_line ("end")
				a_file.close
			else
				create cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

feature -- Access

	testgen: STRING
			-- Directory where test classes are generated;
			-- Void means current directory

	tester_parent: STRING
			-- Name of tester parent class to be used when
			-- generating root class (Default: TS_TESTER)

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
		local
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			a_list: DS_LIST [STRING]
		do
			a_cursor := testcases.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_list := a_cursor.item.first
				if a_list /= Void then
					Result := Result + a_list.count
				end
				a_cursor.forth
			end
		ensure
			count_nonnegative: Result >= 0
		end

feature {NONE} -- Implementation

	testcases: DS_HASH_TABLE [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			-- Testcases (lists of feature names and
			-- class prefix indexed by classes)

	default_tester_parent: STRING = "TS_TESTER"
			-- Default value for `tester_parent'

invariant

	testcases_not_void: testcases /= Void
	no_void_class_name: not testcases.has_void
	no_void_testcase: not testcases.has_void_item
--	feature_names_not_void: forall item in testcases, item.first /= Void
--	no_void_feature_names: forall item in testcases, not item.has_void
--	class_prefix_not_void: forall item in testcases, item.second /= Void
	error_handler_not_void: error_handler /= Void
	tester_parent_not_void: tester_parent /= Void
	version_not_void: version /= Void

end
