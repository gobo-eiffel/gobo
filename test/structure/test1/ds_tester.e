indexing

	description:

		"List testers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_TESTER

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_SHARED_EXCEPTIONS

creation

	make, make_and_test

feature {NONE} -- Initialization

	make is
			-- Make a new list tester.
		do
		end

	make_and_test is
			-- Make a new list tester and run the test.
		local
			a_filename: STRING
			a_file: like OUTPUT_STREAM_TYPE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			error_handler: UT_ERROR_HANDLER
		do
			a_filename := "output.txt"
			a_file := OUTPUT_STREAM_.make_file_open_write (a_filename)
			if OUTPUT_STREAM_.is_open_write (a_file) then
				test (a_file)
				a_file.put_string ("%NEnd of Test%N")
				OUTPUT_STREAM_.close (a_file)
			else
				!! cannot_write.make (a_filename)
				!! error_handler.make_standard
				error_handler.report_error (cannot_write)
				Exceptions.die (1)
			end
		end

feature -- Test

	test (a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features of class DS_LIST and its descendants
			-- DS_LINKED_LIST, DS_BILINKED_LIST and DS_ARRAYED_LIST.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			lli: DS_LINKED_LIST [INTEGER]
			bli: DS_LINKED_LIST [INTEGER]
			ali: DS_ARRAYED_LIST [INTEGER]
		do
			a_file.put_string ("%NTest DS_LINKED_LIST:%N%N")
			!! lli.make
			test_integer_list (lli, a_file)
			a_file.put_string ("%NTest DS_BILINKED_LIST:%N%N")
			!! bli.make_equal
			test_integer_list (bli, a_file)
			a_file.put_string ("%NTest DS_ARRAYED_LIST:%N%N")
			!! ali.make (10)
			test_integer_list (ali, a_file)
		end

	test_integer_list (a_list: DS_LIST [INTEGER]; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features of list `a_list'.
			-- Make results of test available in `a_file'.
		require
			a_list_not_void: a_list /= Void
			extendible: a_list.extendible (10)
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i: INTEGER
			other: DS_LINKED_LIST [INTEGER]
		do
			a_file.put_string ("Insert 10 items in list:%N")
			a_list.put_first (2)
			from i := 3 until i > 10 loop
				a_list.put_last (i)
				i := i + 1
			end
			a_list.force_first (1)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Go to item '5':%N")
			a_list.start
			a_list.search_forth (5)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Insert '44' to the left and '55' to the right:%N")
			a_list.force_left (44)
			a_list.force_right (55)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Remove item '5':%N")
			a_list.remove_at
			print_integer_list (a_list, a_file)

			a_file.put_string ("Add '66' and '77' to right:%N")
			!! other.make
			other.put_last (66)
			other.put_last (77)
			a_list.append_right (other)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Go to item '6':%N")
			from a_list.start until a_list.after or else a_list.item_for_iteration = 6 loop
				a_list.forth
			end
			print_integer_list (a_list, a_file)

			a_file.put_string ("Add '88' and '99' to left:%N")
			!! other.make
			other.put_last (88)
			other.put_last (99)
			a_list.append_left (other)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Insert '3' at position 5:%N")
			a_list.force (3, 5)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Delete all occurrences of '3':%N")
			a_list.delete (3)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Go to 5-th item:%N")
			a_list.go_i_th (5)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Remove 5-th item:%N")
			a_list.remove (5)
			print_integer_list (a_list, a_file)

			a_file.put_string ("Wipe out list:%N")
			a_list.wipe_out
			print_integer_list (a_list, a_file)
		end

	print_integer_list (a_list: DS_LIST [INTEGER]; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print contents of `a_list' and its internal
			-- cursor position to `a_file'.
		require
			a_list_not_void: a_list /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			a_file.put_string ("  ")
			a_cursor := a_list.new_cursor
			if a_list.before then
				a_file.put_character ('^')
			end
			a_file.put_string ("before ")
			from a_cursor.start until a_cursor.after loop
				if a_list.same_position (a_cursor) then
					a_file.put_string ("^")
				end
				a_file.put_integer (a_cursor.item)
				a_file.put_character (' ')
				a_cursor.forth
			end
			if a_list.after then
				a_file.put_character ('^')
			end
			a_file.put_string ("after%N")
		end

end -- class DS_TESTER
