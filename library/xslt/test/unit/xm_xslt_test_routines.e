note

	description:

		"Test character maps and other serialization features."

	library: "Gobo Eiffel XSLT test suite"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEST_ROUTINES

inherit

		TS_TEST_CASE

		XM_RESOLVER_FACTORY

		KL_IMPORTED_STRING_ROUTINES

create

	make_default

feature {NONE} -- Test support routines

	Buffer_size: INTEGER = 8000
			-- Size of read buffer used by `read_utf8_results_file'

	last_utf8_string: detachable UC_UTF8_STRING
			-- Last contents read by `read_utf8_results_file'

	last_latin1_string: detachable STRING
			-- Last contents read by `read_results_file'

	read_utf8_results_file (a_filename: STRING)
			-- Read `a_filename' within `data_dirname' as UTF-8 bytes and set `last_utf8_string' to contents.
		local
			l_test_file: KL_BINARY_INPUT_FILE
			l_test_string: STRING
		do
			create l_test_file.make (file_system.pathname (data_dirname, a_filename))
			assert ("Test file exists", l_test_file /= Void)
			l_test_file.open_read
			assert ("Test file readable", l_test_file.is_open_read)
			from
				l_test_file.read_string (Buffer_size)
				l_test_string := STRING_.cloned_string (l_test_file.last_string)
			until
				l_test_file.end_of_input
			loop
				l_test_file.read_string (Buffer_size)
				l_test_string := STRING_.appended_string (l_test_string, l_test_file.last_string)
			end
			l_test_file.close
			create {UC_UTF8_STRING} last_utf8_string.make_from_utf8 (l_test_string)
		ensure
			last_utf8_string_not_void: last_utf8_string /= Void
		end

	read_results_file (a_filename: STRING)
			-- Read `a_filename' within `data_dirname' as Latin-1 bytes and set `last_latin1_string' to contents.
		local
			l_test_file: KL_TEXT_INPUT_FILE
			l_last_latin1_string: like last_latin1_string
		do
			create l_test_file.make (file_system.pathname (data_dirname, a_filename))
			assert ("Test file exists", l_test_file /= Void)
			l_test_file.open_read
			assert ("Test file readable", l_test_file.is_open_read)
			from
				l_test_file.read_string (Buffer_size)
				l_last_latin1_string := STRING_.cloned_string (l_test_file.last_string)
				last_latin1_string := l_last_latin1_string
			until
				l_test_file.end_of_input
			loop
				l_test_file.read_string (Buffer_size)
				last_latin1_string := STRING_.appended_string (l_last_latin1_string, l_test_file.last_string)
			end
			l_test_file.close
		ensure
			last_latin1_string_not_void: last_latin1_string /= Void
		end

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xslt", "test", "unit", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

end
