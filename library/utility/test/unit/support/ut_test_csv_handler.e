note

	description:

		"Test features of class UT_CSV_HANDLER"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	revision: "$Revision$"
	date: "$Date$"

class UT_TEST_CSV_HANDLER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Tests

	test_read_row
			-- Test feature 'read_row'.
		local
			l_csv_handler: UT_CSV_HANDLER
			l_cells: DS_ARRAYED_LIST [STRING]
		do
			create l_csv_handler.make
			create l_cells.make (2)
			l_csv_handler.read_row ("%"%",foo", l_cells)
			assert_integers_equal ("count_1", 2, l_cells.count)
			assert_strings_equal ("item1_1", "", l_cells.item (1))
			assert_strings_equal ("item2_1", "foo", l_cells.item (2))
			l_cells.wipe_out
			l_csv_handler.read_row ("%"%"%"bar%",foo", l_cells)
			assert_integers_equal ("count_2", 2, l_cells.count)
			assert_strings_equal ("item1_2", "%"bar", l_cells.item (1))
			assert_strings_equal ("item2_2", "foo", l_cells.item (2))
			l_cells.wipe_out
			l_csv_handler.read_row ("%"bar%"%",foo%"", l_cells)
			assert_integers_equal ("count_3", 1, l_cells.count)
			assert_strings_equal ("item1_3", "bar%",foo", l_cells.item (1))
		end

	test_read_file
			-- Test feature 'read_file'.
		local
			l_csv_handler: UT_CSV_HANDLER
			l_string: STRING
			l_file: KL_STRING_INPUT_STREAM
			i, nb: INTEGER
		do
			create l_csv_handler.make
			create l_string.make_filled ('a', 1031)
			l_string.put (',', 1021)
			l_string.put ('%"', 1022)
			l_string.put ('%"', 1023)
			l_string.put ('%"', 1024)
			l_string.put ('g', 1025)
			l_string.put ('o', 1026)
			l_string.put ('b', 1027)
			l_string.put ('o', 1028)
			l_string.put ('%"', 1029)
			l_string.put ('%"', 1030)
			l_string.put ('%"', 1031)
			create l_file.make (l_string)
			l_csv_handler.read_file (l_file, agent (a_cells: DS_ARRAYED_LIST [STRING])
				local
					l_cell: STRING
				do
					assert_integers_equal ("two_cells", 2, a_cells.count)
					create l_cell.make_filled ('a', 1020)
					assert_strings_equal ("first_cell", l_cell, a_cells.item (1))
					assert_strings_equal ("second_cell", "%"gobo%"", a_cells.item (2))
				end)
		end

end
