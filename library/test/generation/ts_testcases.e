indexing

	description:

		"Test config testcases"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TS_TESTCASES

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_testgen: like testgen; an_error_handler: like error_handler) is
			-- Create a new testcases.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			!! testcases.make (10)
			testgen := a_testgen
			error_handler := an_error_handler
		ensure
			testgen_set: testgen = a_testgen
			error_handler_set: error_handler = an_error_handler
		end

feature -- Element change

	put (class_name: STRING; feature_names: DS_LIST [STRING]; class_prefix: STRING) is
			-- Add (`class_name', `feature_names') to the list of testcases.
		require
			class_name_not_void: class_name /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has (Void)
			class_prefix_not_void: class_prefix /= Void
		local
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
		do
			!! a_pair.make (feature_names, class_prefix)
			testcases.force (a_pair, class_name)
		end

feature -- Generation

	generate_test_classes is
			-- Generate test classes.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], STRING]
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
		do
			a_cursor := testcases.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_pair := a_cursor.item
				generate_test_class (a_cursor.key, a_pair.first, a_pair.second)
				a_cursor.forth
			end
		end

	generate_test_class (class_name: STRING;
		feature_names: DS_LIST [STRING]; class_prefix: STRING) is
			-- Generate test class `class_name'.
		require
			class_name_not_void: class_name /= Void
			feature_names_not_void: feature_names /= Void
			no_void_feature_name: not feature_names.has (Void)
			class_prefix_not_void: class_prefix /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_file: like OUTPUT_STREAM_TYPE
			a_filename: STRING
			new_name: STRING
			i: INTEGER
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			new_name := STRING_.make (class_name.count + class_prefix.count)
			new_name.append_string (class_prefix)
			new_name.append_string (class_name)
			if testgen /= Void and then testgen.count > 0 then
				a_filename := STRING_.make (testgen.count + new_name.count + 3)
				a_filename.append_string (testgen)
				a_filename.append_character (Directory_separator)
			else
				a_filename := STRING_.make (new_name.count + 2)
			end
			a_filename.append_string (STRING_.to_lower (new_name))
			a_filename.append_string (".e")
			a_file := OUTPUT_STREAM_.make_file_open_write (a_filename)
			if OUTPUT_STREAM_.is_open_write (a_file) then
				a_file.put_string ("class ")
				a_file.put_string (new_name)
				a_file.put_string ("%N%Ninherit%N%N%T")
				a_file.put_string (class_name)
				a_file.put_string ("%N%Ncreation%N%N%Tmake%N%N%
					%feature {NONE} -- Execution%N%N%
					%%Texecute_i_th (an_id: INTEGER) is%N%
					%%T%T%T-- Run test case of id `an_id'.%N%
					%%T%Tdo%N%
					%%T%T%Tinspect an_id%N")
				i := 1
				a_cursor := feature_names.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (i)
					a_file.put_string (" then%N%T%T%T%T")
					a_file.put_string (a_cursor.item)
					a_file.put_character ('%N')
					i := i + 1
					a_cursor.forth
				end
				a_file.put_string ("%T%T%Telse%N%
					%%T%T%T%T-- Unknown id.%N%
					%%T%T%Tend%N%T%Tend%N%N%
					%feature {NONE} -- Implementation%N%N%
					%%Tname_of_id (an_id: INTEGER): STRING is%N%
					%%T%T%T-- Name of test case of id `an_id'%N%
					%%T%Tdo%N%
					%%T%T%Tinspect an_id%N")
				i := 1
				from a_cursor.start until a_cursor.after loop
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (i)
					a_file.put_string (" then%N%T%T%T%TResult := %"")
					a_file.put_string (STRING_.to_upper (class_name))
					a_file.put_character ('.')
					a_file.put_string (STRING_.to_lower (a_cursor.item))
					a_file.put_string ("%"%N")
					i := i + 1
					a_cursor.forth
				end
				a_file.put_string ("%T%T%Telse%N%
					%%T%T%T%TResult := %"Unknown id%"%N%
					%%T%T%Tend%N%T%Tend%N%Nend -- class ")
				a_file.put_string (new_name)
				a_file.put_character ('%N')
				OUTPUT_STREAM_.close (a_file)
			else
				!! cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

	generate_root_class (class_name: STRING) is
			-- Generate root class `class_name'.
		require
			class_name_not_void: class_name /= Void
		local
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			a_cursor: DS_HASH_TABLE_CURSOR [DS_PAIR [DS_LIST [STRING], STRING], STRING]
			a_pair: DS_PAIR [DS_LIST [STRING], STRING]
			a_file: like OUTPUT_STREAM_TYPE
			a_filename: STRING
			test_name: STRING
			upper_class_name: STRING
			i, nb: INTEGER
		do
			if testgen /= Void and then testgen.count > 0 then
				a_filename := STRING_.make (testgen.count + class_name.count + 3)
				a_filename.append_string (testgen)
				a_filename.append_character (Directory_separator)
			else
				a_filename := STRING_.make (class_name.count + 2)
			end
			a_filename.append_string (STRING_.to_lower (class_name))
			a_filename.append_string (".e")
			a_file := OUTPUT_STREAM_.make_file_open_write (a_filename)
			if OUTPUT_STREAM_.is_open_write (a_file) then
				upper_class_name := STRING_.to_upper (class_name)
				a_file.put_string ("class ")
				a_file.put_string (upper_class_name)
				a_file.put_string ("%N%Ninherit%N%N%T")
				a_file.put_string ("TS_TESTER")
				a_file.put_string ("%N%Ncreation%N%N%
					%%Tmake, make_default%N%N%
					%feature -- Access%N%N%
					%%Tsuite: TS_TEST_SUITE is%N%
					%%T%T%T-- Suite of tests to be run%N%
					%%T%Tlocal%N%
					%%T%T%Ta_test: TS_TEST%N%
					%%T%Tdo%N%
					%%T%T%T!! Result.make (%"")
				a_file.put_string (class_name)
				a_file.put_string ("%")%N")
				a_cursor := testcases.new_cursor
				from a_cursor.start until a_cursor.after loop
					test_name := a_cursor.key
					a_pair := a_cursor.item
					nb := a_pair.first.count
					from i := 1 until i > nb loop
						a_file.put_string ("%T%T%T!")
						a_file.put_string (a_pair.second)
						a_file.put_string (test_name)
						a_file.put_string ("! a_test.make (")
						a_file.put_integer (i)
						a_file.put_string (")%N%T%T%TResult.put_test (a_test)%N")
						i := i + 1
					end
					a_cursor.forth
				end
				a_file.put_string ("%T%Tend%N%Nend -- class ")
				a_file.put_string (upper_class_name)
				a_file.put_character ('%N')
				OUTPUT_STREAM_.close (a_file)
			else
				!! cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
		end

feature -- Access

	testgen: STRING
			-- Directory where test classes are generated;
			-- Void means current directory

	error_handler: TS_ERROR_HANDLER
			-- Error handler

feature {NONE} -- Implementation

	testcases: DS_HASH_TABLE [DS_PAIR [DS_LIST [STRING], STRING], STRING]
			-- Testcases (lists of feature names and
			-- class prefix indexed by class names)

feature {NONE} -- Constants

	Directory_separator: CHARACTER is '/'
			-- Directory separator used to build
			-- filenames of generated classes

invariant

	testcases_not_void: testcases /= Void
	no_void_class_name: not testcases.has (Void)
	no_void_testcase: not testcases.has_item (Void)
--	feature_names_not_void: forall item in testcases, item.first /= Void
--	no_void_feature_names: forall item in testcases, not item.has (Void)
--	class_prefix_not_void: forall item in testcases, item.second /= Void
	error_handler_not_void: error_handler /= Void

end -- class TS_TESTCASES
