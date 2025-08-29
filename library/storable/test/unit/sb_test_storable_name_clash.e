note

	description:

		"Test features of class STORABLE when there are two classes with the same name."

	remarks: "[
		When storing two objects of different types but with the same class name, on
		retrievable one of these types will be chosen arbitrarily and both retrieved
		objects will have this same type.
	]"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TEST_STORABLE_NAME_CLASH

inherit

	SB_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_independent_store
			-- Test feature `independent_store'.
		local
			l_object: SB_DATA_24
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
		do
			create l_object.make
			check_values (l_object, False)
			l_filename := new_filename ("gobo", ".tmp")
			create l_file.make_with_name (l_filename)
			l_file.open_write
			l_file.independent_store (l_object)
			l_file.close
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_24} l_retrieved as l_retrieved_object then
				check_values (l_retrieved_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_3_ge
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by Gobo Eiffel.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_3_ge_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_24} l_retrieved as l_object then
				check_values (l_object, True)
			else
				print (l_retrieved)
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_3_workbench_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in workbench mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_3_workbench_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_24} l_retrieved as l_object then
				check_values (l_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_3_finalized_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in finalized mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_3_finalized_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_24} l_retrieved as l_object then
				check_values (l_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

feature {NONE} -- Implementation

	check_values (a_object: SB_DATA_24; a_retrieved: BOOLEAN)
			-- Check that the attributes of `a_object' have the expected values.
		do
			assert ("attr1", attached {STRING} {INTERNAL}.field (1, a_object.attr1) as l_string and then l_string.same_string ("library_1"))
			assert ("attr2", attached {STRING} {INTERNAL}.field (1, a_object.attr2) as l_string and then l_string.same_string ("library_2"))
			if a_retrieved then
				assert ("attr1_out", a_object.attr1.out.is_equal ("library_1") or a_object.attr1.out.is_equal ("library_2"))
				assert ("attr2_out", a_object.attr2.out.is_equal ("library_1") or a_object.attr2.out.is_equal ("library_2"))
				assert ("same_type", a_object.attr1.out.is_equal (a_object.attr2.out))
			else
				assert_strings_equal ("attr1_out", "library_1", a_object.attr1.out)
				assert_strings_equal ("attr2_out", "library_2", a_object.attr2.out)
			end
		end

end
