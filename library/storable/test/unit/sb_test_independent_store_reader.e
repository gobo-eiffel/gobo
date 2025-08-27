note

	description:

		"Test features of classes SB_INDEPENDENT_STORE_*_READER"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TEST_INDEPENDENT_STORE_READER

inherit

	SB_TEST_CASE

create

	make_default

feature -- Test

	test_independent_store_6_6_ge
			-- Test reading Storable file with format independent_store_6_6
			-- stored by system compiled by Gobo Eiffel.
		do
			check_read (storable_1_ge_filename)
		end

	test_independent_store_6_6_ise_workbench
			-- Test reading Storable file with format independent_store_6_6
			-- stored by system compiled by ISE Eiffel in workbench mode.
		do
			check_read (storable_1_workbench_ise_filename)
		end

	test_independent_store_6_6_ise_finalized
			-- Test reading Storable file with format independent_store_6_6
			-- stored by system compiled by ISE Eiffel in finalized mode.
		do
			check_read (storable_1_finalized_ise_filename)
		end

feature {NONE} -- Implementation

	check_read (a_input_filename: STRING)
			-- Read Storable from `a_input_filename'.
		require
			a_input_filename_not_void: a_input_filename /= Void
		local
			l_schema: SB_SCHEMA
			l_objects: SB_OBJECTS
			l_input_file: SB_INPUT_FILE
			l_input_filename: STRING
			l_error_handler: SB_ERROR_HANDLER
		do
			l_input_filename := Execution_environment.interpreted_string (a_input_filename)
			create l_input_file.make (l_input_filename)
			l_input_file.open_read
			if l_input_file.is_open_read then
				create l_error_handler.make_null
				l_input_file.set_error_handler (l_error_handler)
				create l_schema.make
				create l_objects.make
				l_schema.read_schema (l_input_file)
				if l_error_handler.has_error then
					l_objects.read_objects (l_schema, l_input_file)
				end
				l_input_file.close
				if l_error_handler.has_error or l_schema.has_attribute_type_error then
					assert ("error when reading storable file " + l_input_filename, False)
				end
			else
				assert ("cannot read file " + l_input_filename, False)
			end
		end

end
