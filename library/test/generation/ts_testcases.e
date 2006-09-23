indexing

	description:

		"Test config testcases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_TESTCASES

inherit

	ANY -- Export features of ANY.

	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_testgen: like testgen; an_error_handler: like error_handler) is
			-- Create a new testcases.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create testcases.make (10)
			testgen := a_testgen
			error_handler := an_error_handler
		ensure
			testgen_set: testgen = a_testgen
			error_handler_set: error_handler = an_error_handler
		end

feature -- Element change

	put (a_class: ET_CLASS; feature_names: DS_LIST [STRING]; class_prefix: STRING) is
			-- Add (`class_name', `feature_names') to the list of testcases.
		require
			a_classnot_void: a_class /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has (Void)
			class_prefix_not_void: class_prefix /= Void
		local
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
		do
			create a_pair.make (feature_names, class_prefix)
			testcases.force (a_pair, a_class)
		end

feature -- Generation

	generate_test_classes is
			-- Generate test classes.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
		do
			a_cursor := testcases.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_pair := a_cursor.item
				generate_test_class (a_cursor.key, a_pair.first, a_pair.second)
				a_cursor.forth
			end
		end

	generate_test_class (a_class: ET_CLASS; feature_names: DS_LIST [STRING]; class_prefix: STRING) is
			-- Generate test class `class_name'.
		require
			a_class_not_void: a_class /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has (Void)
			class_prefix_not_void: class_prefix /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_class_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			a_filename: STRING
			a_dirname: STRING
			a_dir: KL_DIRECTORY
			new_name: STRING
			i: INTEGER
			a_cursor: DS_LIST_CURSOR [STRING]
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
				a_file.put_string ("class ")
				a_file.put_line (new_name)
				a_file.put_new_line
				a_file.put_line ("inherit")
				a_file.put_new_line
				a_file.put_character ('%T')
				a_file.put_line (a_class_name)
				a_file.put_line ("%T%Tredefine")
				a_file.put_line ("%T%T%Texecute_i_th, name_of_id")
				a_file.put_line ("%T%Tend")
				a_file.put_new_line
				a_file.put_line ("create")
				a_file.put_new_line
				a_file.put_line ("%Tmake_test")
				a_file.put_new_line
				a_file.put_line ("feature {NONE} -- Execution")
				a_file.put_new_line
				a_file.put_line ("%Texecute_i_th (an_id: INTEGER) is")
				a_file.put_line ("%T%T%T-- Run test case of id `an_id'.")
				a_file.put_line ("%T%Tdo")
				a_file.put_line ("%T%T%Tinspect an_id")
				i := 1
				a_cursor := feature_names.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (i)
					a_file.put_line (" then")
					a_file.put_string ("%T%T%T%T")
					a_file.put_line (a_cursor.item)
					i := i + 1
					a_cursor.forth
				end
				a_file.put_line ("%T%T%Telse")
				a_file.put_line ("%T%T%T%Tdefault_test")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
				a_file.put_new_line
				a_file.put_line ("feature {NONE} -- Implementation")
				a_file.put_new_line
				a_file.put_line ("%Tname_of_id (an_id: INTEGER): STRING is")
				a_file.put_line ("%T%T%T-- Name of test case of id `an_id'")
				a_file.put_line ("%T%Tdo")
				a_file.put_line ("%T%T%Tinspect an_id")
				i := 1
				from a_cursor.start until a_cursor.after loop
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (i)
					a_file.put_line (" then")
					a_file.put_string ("%T%T%T%TResult := %"")
					a_file.put_string (a_class_name)
					a_file.put_character ('.')
					a_file.put_string (a_cursor.item.as_lower)
					a_file.put_line ("%"")
					i := i + 1
					a_cursor.forth
				end
				a_file.put_line ("%T%T%Telse")
				a_file.put_line ("%T%T%T%TResult := %"Default test%"")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
				a_file.put_new_line
				if a_class.is_deferred then
					a_file.put_line ("%Tdeferred_feature is")
					a_file.put_line ("%T%T%T-- VE needs at least a deferred feature in a deferred class.")
					a_file.put_line ("%T%Tdo")
					a_file.put_line ("%T%Tend")
					a_file.put_new_line
				end
				a_file.put_line ("end")
				a_file.close
			else
				create cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

	generate_root_class (class_name: STRING) is
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
			test_name: STRING
			upper_class_name: STRING
			has_test: BOOLEAN
			i, nb: INTEGER
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
				a_file.put_string ("class ")
				a_file.put_line (upper_class_name)
				a_file.put_new_line
				a_file.put_line ("inherit")
				a_file.put_new_line
				a_file.put_string ("%T")
				a_file.put_line ("TS_TESTER")
				a_file.put_new_line
				a_file.put_line ("create")
				a_file.put_new_line
				a_file.put_line ("%Tmake, make_default")
				a_file.put_new_line
				a_file.put_line ("feature -- Access")
				a_file.put_new_line
				a_file.put_line ("%Tsuite: TS_TEST_SUITE is")
				a_file.put_line ("%T%T%T-- Suite of tests to be run")
				a_cursor := testcases.new_cursor
				from a_cursor.start until a_cursor.after loop
					if a_cursor.item.first.count > 0 then
						has_test := True
						a_cursor.go_after -- Jump out of the loop.
					else
						a_cursor.forth
					end
				end
				if has_test then
					a_file.put_line ("%T%Tlocal")
					a_file.put_line ("%T%T%Ta_test: TS_TEST")
				end
				a_file.put_line ("%T%Tdo")
				a_file.put_string ("%T%T%Tcreate Result.make (%"")
				a_file.put_string (class_name)
				a_file.put_line ("%", variables)")
				from a_cursor.start until a_cursor.after loop
					test_name := a_cursor.key.upper_name
					a_pair := a_cursor.item
					nb := a_pair.first.count
					from i := 1 until i > nb loop
						a_file.put_string ("%T%T%Tcreate {")
						a_file.put_string (a_pair.second)
						a_file.put_string (test_name)
						a_file.put_string ("} a_test.make_test (")
						a_file.put_integer (i)
						a_file.put_line (", variables)")
						a_file.put_line ("%T%T%TResult.put_test (a_test)")
						i := i + 1
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

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Measurement

	count: INTEGER is
			-- Number of testcases
		local
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], ET_CLASS]
			a_list: DS_LIST [STRING]
		do
			a_cursor := testcases.new_cursor
			from a_cursor.start until a_cursor.after loop
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

invariant

	testcases_not_void: testcases /= Void
	no_void_class_name: not testcases.has (Void)
	no_void_testcase: not testcases.has_item (Void)
	-- feature_names_not_void: forall item in testcases, item.first /= Void
	-- no_void_feature_names: forall item in testcases, not item.has (Void)
	-- class_prefix_not_void: forall item in testcases, item.second /= Void
	error_handler_not_void: error_handler /= Void

end
