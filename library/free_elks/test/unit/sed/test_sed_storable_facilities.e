note

	description:

		"Test features of class SED_STORABLE_FACILITIES"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2024-2025, Eric Bezault and others"
	license: "MIT License"

class TEST_SED_STORABLE_FACILITIES

inherit

	SED_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_store_in_medium
			-- Test feature `store_in_medium'.
		local
			l_sed: SED_STORABLE_FACILITIES
			l_filename: STRING
			l_file: RAW_FILE
			l_object: STRING
			l_retrieved: detachable ANY
			l_retrieved_object: detachable STRING
			l_expected_object: STRING
		do
			create l_sed
			l_object := "gobo"
			l_filename := new_filename ("gobo", ".tmp")
			create l_file.make_open_write (l_filename)
			l_sed.store_in_medium (l_object, l_file)
			l_file.close
			l_file.open_read
			l_retrieved := l_sed.retrieved_from_medium (l_file)
			l_file.close
			l_expected_object := "gobo"
			if attached {STRING} l_retrieved as l_string then
				l_retrieved_object := l_string
			end
			assert_strings_equal ("retrieved", l_expected_object, l_retrieved_object)
		end

	test_retrieved_from_medium_1
			-- Test feature `retrieved_from_medium'.
		local
			l_sed: SED_STORABLE_FACILITIES
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
			l_retrieved_object: detachable STRING
			l_expected_object: STRING
		do
			create l_sed
			l_filename := Execution_environment.interpreted_string (gobo_ge_sed_filename)
			create l_file.make_open_read (l_filename)
			l_retrieved := l_sed.retrieved_from_medium (l_file)
			l_file.close
			l_expected_object := "gobo"
			if attached {STRING} l_retrieved as l_string then
				l_retrieved_object := l_string
			end
			assert_strings_equal ("retrieved", l_expected_object, l_retrieved_object)
		end

	test_retrieved_from_medium_2
			-- Test feature `retrieved_from_medium'.
		local
			l_sed: SED_STORABLE_FACILITIES
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
			l_retrieved_object: detachable STRING
			l_expected_object: STRING
		do
			create l_sed
			l_filename := Execution_environment.interpreted_string (gobo_ge_debug_sed_filename)
			create l_file.make_open_read (l_filename)
			l_retrieved := l_sed.retrieved_from_medium (l_file)
			l_file.close
			l_expected_object := "gobo"
			if attached {STRING} l_retrieved as l_string then
				l_retrieved_object := l_string
			end
			assert_strings_equal ("retrieved", l_expected_object, l_retrieved_object)
		end

	test_retrieved_from_medium_3
			-- Test feature `retrieved_from_medium'.
		local
			l_sed: SED_STORABLE_FACILITIES
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
			l_retrieved_object: detachable STRING
			l_expected_object: STRING
		do
			create l_sed
			l_filename := Execution_environment.interpreted_string (gobo_ise_sed_filename)
			create l_file.make_open_read (l_filename)
			l_retrieved := l_sed.retrieved_from_medium (l_file)
			l_file.close
			l_expected_object := "gobo"
			if attached {STRING} l_retrieved as l_string then
				l_retrieved_object := l_string
			end
			assert_strings_equal ("retrieved", l_expected_object, l_retrieved_object)
		end

	test_retrieved_from_medium_4
			-- Test feature `retrieved_from_medium'.
		local
			l_sed: SED_STORABLE_FACILITIES
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
			l_retrieved_object: detachable STRING
			l_expected_object: STRING
		do
			create l_sed
			l_filename := Execution_environment.interpreted_string (gobo_ise_debug_sed_filename)
			create l_file.make_open_read (l_filename)
			l_retrieved := l_sed.retrieved_from_medium (l_file)
			l_file.close
			l_expected_object := "gobo"
			if attached {STRING} l_retrieved as l_string then
				l_retrieved_object := l_string
			end
			assert_strings_equal ("retrieved", l_expected_object, l_retrieved_object)
		end

end
