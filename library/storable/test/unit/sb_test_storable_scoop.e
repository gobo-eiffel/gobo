note

	description:

		"Test features of class STORABLE in SCOOP mode."

	remark: "[
		Objects in other SCOOP regions are stored without waiting even
		if they are busy executing some code. They are retrieved in the
		same SCOOP region as the root object.
	]"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TEST_STORABLE_SCOOP

inherit

	SB_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_independent_store
			-- Test feature `independent_store'.
		local
			l_object: SB_DATA_11 [separate STRING]
			a2: separate SB_DATA_12
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
		do
			create a2
			create l_object.make (a2)
			check_values (l_object, False)
			l_filename := new_filename ("gobo", ".tmp")
			create l_file.make_with_name (l_filename)
			l_file.open_write
			l_file.independent_store (l_object)
			l_file.close
			separate a2 as l_a2 do
				l_a2.set_stopped (True)
			end
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_11 [separate STRING]} l_retrieved as l_retrieved_object then
				check_values (l_retrieved_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_2_ge
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by Gobo Eiffel.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_2_ge_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_11 [separate STRING]} l_retrieved as l_object then
				check_values (l_object, True)
			else
				print (l_retrieved)
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_2_workbench_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in workbench mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_2_workbench_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_11 [separate STRING]} l_retrieved as l_object then
				check_values (l_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_2_finalized_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in finalized mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_2_finalized_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_11 [separate STRING]} l_retrieved as l_object then
				check_values (l_object, True)
			else
				assert ("is_retrieved", False)
			end
		end

feature {NONE} -- Implementation

	check_values (a_object: SB_DATA_11 [separate STRING]; a_retrieved: BOOLEAN)
			-- Check that the attributes of `a_object' have the expected values.
		local
			l_generating_type: STRING
			l_attr1_attr1: STRING
		do
			l_generating_type := a_object.generating_type.name_32.to_string_8
			assert_strings_equal ("generating_type", "SB_DATA_11 [!separate STRING_8]", l_generating_type)
			if a_retrieved then
				separate a_object.attr1 as l_attr1 do
					create l_attr1_attr1.make_from_separate (l_attr1.attr1)
					assert_strings_equal ("attr1", "gobo", l_attr1_attr1)
				end
				separate a_object.attr2 as l_attr2 do
					assert_false ("attr2", l_attr2.stopped)
				end
			end
			assert ("object_scoop_region", {ISE_SCOOP_RUNTIME}.region_id (a_object) = {ISE_SCOOP_RUNTIME}.region_id (Current))
			assert ("attr1__scoop_region", a_retrieved = ({ISE_SCOOP_RUNTIME}.region_id (a_object.attr1) = {ISE_SCOOP_RUNTIME}.region_id (Current)))
			assert ("attr2__scoop_region", a_retrieved = ({ISE_SCOOP_RUNTIME}.region_id (a_object.attr2) = {ISE_SCOOP_RUNTIME}.region_id (Current)))
		end

end
