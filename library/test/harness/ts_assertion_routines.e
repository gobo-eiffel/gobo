indexing

	description:

		"Assertion routines"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_ASSERTION_ROUTINES

inherit

	TS_SHARED_ASSERTIONS
	KL_SHARED_EXCEPTIONS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_IMPORTED_STRING_ROUTINES
	UT_IMPORTED_FORMATTERS

feature -- Basic operations

	assert (a_tag: STRING; a_condition: BOOLEAN) is
			-- Assert `a_condition'.
		require
			a_tag_not_void: a_tag /= Void
		do
			Assertions.add_assertion
			if not a_condition then
				Assertions.set_error_message (a_tag)
				Exceptions.raise (Assertion_failure)
			end
		end

feature -- Equality

	assert_equal (a_tag: STRING; expected, actual: ANY) is
			-- Assert that `equal (expected, actual)'.
		require
			a_tag_not_void: a_tag /= Void
		local
			a_message: STRING
		do
			Assertions.add_assertion
			if not equal (expected, actual) then
				a_message := assert_equal_message (a_tag, expected, actual)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			end
		end

	assert_not_equal (a_tag: STRING; expected, actual: ANY) is
			-- Assert that `not equal (expected, actual)'.
		require
			a_tag_not_void: a_tag /= Void
		local
			a_message: STRING
		do
			Assertions.add_assertion
			if equal (expected, actual) then
				a_message := assert_not_equal_message (a_tag, expected, actual)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			end
		end

	assert_same (a_tag: STRING; expected, actual: ANY) is
			-- Assert that `expected = actual'.
		require
			a_tag_not_void: a_tag /= Void
		local
			a_message: STRING
		do
			Assertions.add_assertion
			if expected /= actual then
				a_message := assert_equal_message (a_tag, expected, actual)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			end
		end

feature -- Files

	assert_files_equal (a_tag: STRING; a_filename1, a_filename2: STRING) is
			-- Assert that there is no difference between the
			-- files named `a_filename1' and `a_filename2'.
			-- (Expand environment variables in filenames.)
		require
			a_tag_not_void: a_tag /= Void
			a_filename1_not_void: a_filename1 /= Void
			a_filename1_not_empty: a_filename1.count > 0
			a_filename2_not_void: a_filename2 /= Void
			a_filename2_not_empty: a_filename2.count > 0
		local
			a_file1, a_file2: KL_TEXT_INPUT_FILE
			a_message: STRING
			done: BOOLEAN
			i: INTEGER
		do
			Assertions.add_assertion
			create a_file1.make (Execution_environment.interpreted_string (a_filename1))
			a_file1.open_read
			if a_file1.is_open_read then
				create a_file2.make (Execution_environment.interpreted_string (a_filename2))
				a_file2.open_read
				if a_file2.is_open_read then
					from until done loop
						a_file1.read_line
						a_file2.read_line
						i := i + 1
						if a_file1.end_of_file then
							if not a_file2.end_of_file then
								a_message := STRING_.make (50)
								a_message.append_string (a_tag)
								a_message.append_string (" (diff between files '")
								a_message.append_string (a_filename1)
								a_message.append_string ("' and '")
								a_message.append_string (a_filename2)
								a_message.append_string ("' at line ")
								INTEGER_FORMATTER_.append_decimal_integer (a_message, i)
								a_message.append_string (")")
								a_file1.close
								a_file2.close
								Assertions.set_error_message (a_message)
								Exceptions.raise (Assertion_failure)
							else
								a_file1.close
								a_file2.close
								done := True
							end
						elseif a_file2.end_of_file then
							a_message := STRING_.make (50)
							a_message.append_string (a_tag)
							a_message.append_string (" (diff between files '")
							a_message.append_string (a_filename1)
							a_message.append_string ("' and '")
							a_message.append_string (a_filename2)
							a_message.append_string ("' at line ")
							INTEGER_FORMATTER_.append_decimal_integer (a_message, i)
							a_message.append_string (")")
							a_file1.close
							a_file2.close
							Assertions.set_error_message (a_message)
							Exceptions.raise (Assertion_failure)
						elseif not a_file1.last_string.is_equal (a_file2.last_string) then
							a_message := STRING_.make (50)
							a_message.append_string (a_tag)
							a_message.append_string (" (diff between files '")
							a_message.append_string (a_filename1)
							a_message.append_string ("' and '")
							a_message.append_string (a_filename2)
							a_message.append_string ("' at line ")
							INTEGER_FORMATTER_.append_decimal_integer (a_message, i)
							a_message.append_string (")")
							a_file1.close
							a_file2.close
							Assertions.set_error_message (a_message)
							Exceptions.raise (Assertion_failure)
						end
					end
				else
					a_message := STRING_.make (50)
					a_message.append_string (a_tag)
					a_message.append_string (" (cannot read file '")
					a_message.append_string (a_filename2)
					a_message.append_string ("')")
					a_file1.close
					Assertions.set_error_message (a_message)
					Exceptions.raise (Assertion_failure)
				end
			else
				a_message := STRING_.make (50)
				a_message.append_string (a_tag)
				a_message.append_string (" (cannot read file '")
				a_message.append_string (a_filename1)
				a_message.append_string ("')")
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			end
		end

	assert_filenames_equal (a_tag: STRING; a_filename1, a_filename2: STRING) is
			-- Assert that filenames `a_filename1' and `a_filename2'
			-- only differ by the letters '/' and '\'.
		require
			a_tag_not_void: a_tag /= Void
			a_filename1_not_void: a_filename1 /= Void
			a_filename2_not_void: a_filename2 /= Void
		local
			i, nb: INTEGER
			a_name1, a_name2: STRING
			c1, c2: CHARACTER
			a_message: STRING
		do
			Assertions.add_assertion
			nb := a_filename1.count
			if a_filename2.count = nb then
				a_name1 := STRING_.to_lower (a_filename1)
				a_name2 := STRING_.to_lower (a_filename2)
				from i := 1 until i > nb loop
					c1 := a_name1.item (i)
					c2 := a_name2.item (i)
					if c1 /= c2 and not ((c1 = '\' and c2 = '/') or (c1 = '/' and c2 = '\')) then
						i := nb + 1 -- Jump out of the loop.
						a_message := STRING_.make (50)
						a_message.append_string (a_tag)
						a_message.append_string (" (filenames '")
						a_message.append_string (a_filename1)
						a_message.append_string ("' and '")
						a_message.append_string (a_filename2)
						a_message.append_string ("' are not equal)")
						Assertions.set_error_message (a_message)
						Exceptions.raise (Assertion_failure)
					end
					i := i + 1
				end
			else
				a_message := STRING_.make (50)
				a_message.append_string (a_tag)
				a_message.append_string (" (filenames '")
				a_message.append_string (a_filename1)
				a_message.append_string ("' and '")
				a_message.append_string (a_filename2)
				a_message.append_string ("' are not equal)")
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			end
		end

feature -- Containers

	assert_array (a_tag: STRING; expected, actual: ARRAY [ANY]) is
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		obsolete
			"[010806] Use 'assert_arrays_same (a_tag, expected, actual)' instead"
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		do
			assert_arrays_same (a_tag, expected, actual)
		end

	assert_arrays_same (a_tag: STRING; expected, actual: ARRAY [ANY]) is
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag, a_message: STRING
			expected_item, actual_item: ANY
		do
			Assertions.add_assertion
			if expected.count /= actual.count then
				new_tag := STRING_.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_equal_message (new_tag, expected.count, actual.count)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from i := 1 until i > nb loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i1)
					if expected_item /= actual_item then
						new_tag := STRING_.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_FORMATTER_.append_decimal_integer (new_tag, i)
						a_message := assert_equal_message (new_tag, expected_item, actual_item)
						Assertions.set_error_message (a_message)
						Exceptions.raise (Assertion_failure)
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
		end

	assert_arrays_equal (a_tag: STRING; expected, actual: ARRAY [ANY]) is
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use `equal' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag, a_message: STRING
			expected_item, actual_item: ANY
		do
			Assertions.add_assertion
			if expected.count /= actual.count then
				new_tag := STRING_.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_equal_message (new_tag, expected.count, actual.count)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from i := 1 until i > nb loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i1)
					if not equal (expected_item, actual_item) then
						new_tag := STRING_.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_FORMATTER_.append_decimal_integer (new_tag, i)
						a_message := assert_equal_message (new_tag, expected_item, actual_item)
						Assertions.set_error_message (a_message)
						Exceptions.raise (Assertion_failure)
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
		end

	assert_iarray (a_tag: STRING; expected, actual: ARRAY [INTEGER]) is
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		obsolete
			"[010806] Use 'assert_iarrays_same (a_tag, expected, actual)' instead"
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		do
			assert_iarrays_same (a_tag, expected, actual)
		end

	assert_iarrays_same (a_tag: STRING; expected, actual: ARRAY [INTEGER]) is
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag, a_message: STRING
			expected_item, actual_item: INTEGER
		do
			Assertions.add_assertion
			if expected.count /= actual.count then
				new_tag := STRING_.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_equal_message (new_tag, expected.count, actual.count)
				Assertions.set_error_message (a_message)
				Exceptions.raise (Assertion_failure)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from i := 1 until i > nb loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i2)
					if expected_item /= actual_item then
						new_tag := STRING_.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_FORMATTER_.append_decimal_integer (new_tag, i)
						a_message := assert_equal_message (new_tag, expected_item, actual_item)
						Assertions.set_error_message (a_message)
						Exceptions.raise (Assertion_failure)
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
		end

feature -- Execution

	assert_execute (a_shell_command: STRING) is
			-- Execute `a_shell_command' and check whether the
			-- exit status code is zero.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		do
			assert_exit_code_execute (a_shell_command, 0)
		end

	assert_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER) is
			-- Execute `a_shell_command' and check whether the
			-- exit status code is `an_exit_code'.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			a_command: DP_SHELL_COMMAND
		do
			create a_command.make (a_shell_command)
			a_command.execute
			assert_equal (a_shell_command, an_exit_code, a_command.exit_code)
		end

	assert_not_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER) is
			-- Execute `a_shell_command' and check whether the
			-- exit status code is not equal to `an_exit_code'.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			a_command: DP_SHELL_COMMAND
		do
			create a_command.make (a_shell_command)
			a_command.execute
			assert_not_equal (a_shell_command, an_exit_code, a_command.exit_code)
		end

feature {NONE} -- Messages

	assert_equal_message (a_tag: STRING; expected, actual: ANY): STRING is
			-- Message stating that `expected' and `actual' should be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			Result := STRING_.make (50)
			Result.append_string (a_tag)
			Result.append_string ("%N   expected: ")
			if expected = Void then
				Result.append_string ("Void")
			else
				Result.append_string (expected.out)
			end
			Result.append_string ("%N   but got : ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (actual.out)
			end
			Result.append_character ('%N')
		ensure
			message_not_void: Result /= Void
		end

	assert_not_equal_message (a_tag: STRING; expected, actual: ANY): STRING is
			-- Message stating that `expected' and `actual' should not be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			Result := STRING_.make (50)
			Result.append_string (a_tag)
			Result.append_string (" (expected: ")
			if expected = Void then
				Result.append_string ("Void")
			else
				Result.append_string (expected.out)
			end
			Result.append_string (" should not match: ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (actual.out)
			end
			Result.append_character (')')
		ensure
			message_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Assertion_failure: STRING is "Gobo_assertion"
			-- Developer exception message

end
