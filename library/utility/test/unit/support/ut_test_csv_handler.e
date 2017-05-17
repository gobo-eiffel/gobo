note

	description:

		"Test features of class UT_CSV_HANDLER"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
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

end
