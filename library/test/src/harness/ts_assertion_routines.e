note

	description:

		"Assertion routines"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2011/03/17 $"
	revision: "$Revision: #17 $"

deferred class TS_ASSERTION_ROUTINES

inherit

	ANY

	EXCEPTION_MANAGER_FACTORY
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

feature -- Access

	logger: TS_TEST_LOGGER
			-- Logger for tests and assertion checkings
		deferred
		ensure
			logger_not_void: Result /= Void
		end

feature {TS_TEST_HANDLER} -- Access

	assertions: TS_ASSERTIONS
			-- Assertions
		deferred
		ensure
			assertions_not_void: Result /= Void
		end

feature {TS_TEST_HANDLER} -- Basic operations

	assert (a_tag: STRING; a_condition: BOOLEAN)
			-- Assert `a_condition'.
		require
			a_tag_not_void: a_tag /= Void
		do
			assert_true (a_tag, a_condition)
		end

	assert_true (a_tag: STRING; a_condition: BOOLEAN)
			-- Assert that `a_condition' is true.
		require
			a_tag_not_void: a_tag /= Void
		do
			assertions.add_assertion
			if not a_condition then
				logger.report_failure (a_tag, a_tag)
				assertions.report_error (a_tag)
			else
				logger.report_success (a_tag)
			end
		end

	check_true (a_tag: STRING; a_condition: BOOLEAN)
			-- Check that `a_condition' is true.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_true (a_tag, a_condition)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_false (a_tag: STRING; a_condition: BOOLEAN)
			-- Assert that `a_condition' is false.
		require
			a_tag_not_void: a_tag /= Void
		do
			assertions.add_assertion
			if a_condition then
				logger.report_failure (a_tag, a_tag)
				assertions.report_error (a_tag)
			else
				logger.report_success (a_tag)
			end
		end

	check_false (a_tag: STRING; a_condition: BOOLEAN)
			-- Check that `a_condition' is false.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_false (a_tag, a_condition)
			assertions.set_exception_on_error (l_fatal)
		end

feature {TS_TEST_HANDLER} -- Equality

	assert_equal (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Assert that `equal (expected, actual)'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected /~ actual then
				l_message := assert_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_equal (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Check that `equal (expected, actual)'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_not_equal (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Assert that `not equal (expected, actual)'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected ~ actual then
				l_message := assert_not_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_not_equal (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Check that `not equal (expected, actual)'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_not_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_same (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Assert that `expected = actual'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected /= actual then
				l_message := assert_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_same (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Check that `expected = actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_same (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_not_same (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Assert that `expected /= actual'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected = actual then
				l_message := assert_not_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_not_same (a_tag: STRING; expected, actual: detachable separate ANY)
			-- Check that `expected /= actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_not_same (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_integers_equal (a_tag: STRING; expected, actual: INTEGER)
			-- Assert that `expected = actual'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected /= actual then
				l_message := assert_strings_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_integers_equal (a_tag: STRING; expected, actual: INTEGER)
			-- Check that `expected = actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_integers_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_integers_not_equal (a_tag: STRING; expected, actual: INTEGER)
			-- Assert that `expected /= actual'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected = actual then
				l_message := assert_strings_not_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_integers_not_equal (a_tag: STRING; expected, actual: INTEGER)
			-- Check that `expected /= actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_integers_not_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_doubles_equal_with_tolerance (a_tag: STRING; expected, actual, tolerance: DOUBLE)
			-- Assert that `(expected - actual).abs <= tolerance'.
		require
			a_tag_not_void: a_tag /= Void
			tolerance_not_negative: tolerance >= 0
		local
			l_message: STRING
		do
			assertions.add_assertion
				-- Take NaN into account.
			if (actual /= actual and expected = expected) or (actual = actual and expected /= expected) or (actual = actual and expected = expected and (expected - actual).abs > tolerance) then
				l_message := assert_strings_equal_with_tolerance_message (a_tag, expected.out, actual.out, tolerance.out, False)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_doubles_equal_with_tolerance (a_tag: STRING; expected, actual, tolerance: DOUBLE)
			-- Check that `(expected - actual).abs <= tolerance'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			tolerance_not_negative: tolerance >= 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_doubles_equal_with_tolerance (a_tag, expected, actual, tolerance)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_doubles_equal_with_strict_tolerance (a_tag: STRING; expected, actual, tolerance: DOUBLE)
			-- Assert that `(expected - actual).abs < tolerance'.
		require
			a_tag_not_void: a_tag /= Void
			tolerance_not_negative: tolerance >= 0
		local
			l_message: STRING
		do
			assertions.add_assertion
				-- Take NaN into account.
			if (actual /= actual and expected = expected) or (actual = actual and expected /= expected) or (actual = actual and expected = expected and (expected - actual).abs >= tolerance) then
				l_message := assert_strings_equal_with_tolerance_message (a_tag, expected.out, actual.out, tolerance.out, True)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_doubles_equal_with_strict_tolerance (a_tag: STRING; expected, actual, tolerance: DOUBLE)
			-- Check that `(expected - actual).abs < tolerance'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			tolerance_not_negative: tolerance >= 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_doubles_equal_with_strict_tolerance (a_tag, expected, actual, tolerance)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_strings_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Assert that `expected' and `actual' are the same string.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
			l_condition: BOOLEAN
		do
			assertions.add_assertion
			if expected = Void then
				l_condition := actual = Void
			elseif actual = Void then
				l_condition := False
			else
				l_condition := STRING_.same_string (expected, actual)
			end
			if not l_condition then
				l_message := assert_strings_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_strings_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Check that `expected' and `actual' are the same string.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_strings_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_strings_not_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Assert that `expected' and `actual' are not the same string.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
			l_condition: BOOLEAN
		do
			assertions.add_assertion
			if expected = Void then
				l_condition := actual /= Void
			elseif actual = Void then
				l_condition := True
			else
				l_condition := not STRING_.same_string (expected, actual)
			end
			if not l_condition then
				l_message := assert_strings_not_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_strings_not_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Check that `expected' and `actual' are not the same string.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_strings_not_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_strings_case_insensitive_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Assert that `expected' and `actual' are the same string (case insensitive).
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
			l_condition: BOOLEAN
		do
			assertions.add_assertion
			if expected = Void then
				l_condition := actual = Void
			elseif actual = Void then
				l_condition := False
			else
				l_condition := STRING_.same_case_insensitive (expected, actual)
			end
			if not l_condition then
				l_message := assert_strings_equal_message (a_tag, expected, actual)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_strings_case_insensitive_equal (a_tag: STRING; expected, actual: detachable STRING)
			-- Check that `expected' and `actual' are the same string (case insensitive).
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_strings_case_insensitive_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_characters_equal (a_tag: STRING; expected, actual: CHARACTER)
			-- Assert that `expected = actual'
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected /= actual then
				l_message := assert_strings_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_characters_equal (a_tag: STRING; expected, actual: CHARACTER)
			-- Check that `expected = actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_characters_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_characters_not_equal (a_tag: STRING; expected, actual: CHARACTER)
			-- Assert that `expected /= actual'
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected = actual then
				l_message := assert_strings_not_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_characters_not_equal (a_tag: STRING; expected, actual: CHARACTER)
			-- Check that `expected /= actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_characters_not_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_booleans_equal (a_tag: STRING; expected, actual: BOOLEAN)
			-- Assert that `expected = actual'
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected /= actual then
				l_message := assert_strings_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_booleans_equal (a_tag: STRING; expected, actual: BOOLEAN)
			-- Check that `expected = actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_booleans_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_booleans_not_equal (a_tag: STRING; expected, actual: BOOLEAN)
			-- Assert that `expected /= actual'
		require
			a_tag_not_void: a_tag /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if expected = actual then
				l_message := assert_strings_equal_message (a_tag, expected.out, actual.out)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_booleans_not_equal (a_tag: STRING; expected, actual: BOOLEAN)
			-- Check that `expected /= actual'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_booleans_not_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

feature {TS_TEST_HANDLER} -- Files

	assert_files_equal (a_tag: STRING; a_filename1, a_filename2: STRING)
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
			a_message: detachable STRING
			done: BOOLEAN
			i: INTEGER
		do
			assertions.add_assertion
			create a_file1.make (Execution_environment.interpreted_string (a_filename1))
			a_file1.open_read
			if a_file1.is_open_read then
				create a_file2.make (Execution_environment.interpreted_string (a_filename2))
				a_file2.open_read
				if a_file2.is_open_read then
					from
					until
						done
					loop
						a_file1.read_line
						a_file2.read_line
						i := i + 1
						if a_file1.end_of_file then
							if not a_file2.end_of_file then
								create a_message.make (50)
								a_message.append_string (a_tag)
								a_message.append_string (" (diff between files '")
								a_message.append_string (a_filename1)
								a_message.append_string ("' and '")
								a_message.append_string (a_filename2)
								a_message.append_string ("' at line ")
								INTEGER_.append_decimal_integer (i, a_message)
								a_message.append_string (")")
								a_file1.close
								a_file2.close
								done := True
							else
								a_file1.close
								a_file2.close
								done := True
							end
						elseif a_file2.end_of_file then
							create a_message.make (50)
							a_message.append_string (a_tag)
							a_message.append_string (" (diff between files '")
							a_message.append_string (a_filename1)
							a_message.append_string ("' and '")
							a_message.append_string (a_filename2)
							a_message.append_string ("' at line ")
							INTEGER_.append_decimal_integer (i, a_message)
							a_message.append_string (")")
							a_file1.close
							a_file2.close
							done := True
						elseif not a_file1.last_string.is_equal (a_file2.last_string) then
							create a_message.make (50)
							a_message.append_string (a_tag)
							a_message.append_string (" (diff between files '")
							a_message.append_string (a_filename1)
							a_message.append_string ("' and '")
							a_message.append_string (a_filename2)
							a_message.append_string ("' at line ")
							INTEGER_.append_decimal_integer (i, a_message)
							a_message.append_string (")")
							a_file1.close
							a_file2.close
							done := True
						end
					end
				else
					create a_message.make (50)
					a_message.append_string (a_tag)
					a_message.append_string (" (cannot read file '")
					a_message.append_string (a_filename2)
					a_message.append_string ("')")
					a_file1.close
				end
			else
				create a_message.make (50)
				a_message.append_string (a_tag)
				a_message.append_string (" (cannot read file '")
				a_message.append_string (a_filename1)
				a_message.append_string ("')")
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_files_equal (a_tag: STRING; a_filename1, a_filename2: STRING)
			-- Check that there is no difference between the
			-- files named `a_filename1' and `a_filename2'.
			-- (Expand environment variables in filenames.)
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_filename1_not_void: a_filename1 /= Void
			a_filename1_not_empty: a_filename1.count > 0
			a_filename2_not_void: a_filename2 /= Void
			a_filename2_not_empty: a_filename2.count > 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_files_equal (a_tag, a_filename1, a_filename2)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_file_equal_to_string (a_tag: STRING; a_filename, a_string: STRING)
			-- Assert that there is no difference between the
			-- content of the file named `a_filename' and `a_string'.
			-- (Expand environment variables in filename.)
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
			a_string_not_void: a_string /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			a_message: detachable STRING
			done: BOOLEAN
			i: INTEGER
			l_start, l_end, l_actual_end, l_count: INTEGER
		do
			assertions.add_assertion
			create a_file.make (Execution_environment.interpreted_string (a_filename))
			a_file.open_read
			if a_file.is_open_read then
				from
					l_count := a_string.count
				until
					done
				loop
					a_file.read_line
					l_start := l_end + 1
					l_end := a_string.index_of ('%N', l_start)
					if l_end = 0 then
						l_end := l_count + 1
					end
					l_actual_end := l_end
					if l_start < l_end and then a_string.item (l_end - 1) = '%R' then
						l_actual_end := l_actual_end - 1
					end
					i := i + 1
					if a_file.end_of_file then
						if l_start <= l_count then
							create a_message.make (50)
							a_message.append_string (a_tag)
							a_message.append_string (" (diff between files '")
							a_message.append_string (a_filename)
							a_message.append_string ("' and string at line ")
							INTEGER_.append_decimal_integer (i, a_message)
							a_message.append_string (")")
							a_file.close
							done := True
						else
							a_file.close
							done := True
						end
					elseif l_start > l_count then
						create a_message.make (50)
						a_message.append_string (a_tag)
						a_message.append_string (" (diff between files '")
						a_message.append_string (a_filename)
						a_message.append_string ("' and string at line ")
						INTEGER_.append_decimal_integer (i, a_message)
						a_message.append_string (")")
						a_file.close
						done := True
					elseif a_file.last_string.is_equal (a_string.substring (l_start, l_actual_end - 1)) then
						-- OK.
					elseif i = 1 and then a_file.last_string.starts_with (bom) and then a_file.last_string.substring (bom.count + 1, a_file.last_string.count).is_equal (a_string.substring (l_start, l_actual_end - 1)) then
						-- OK.
					else
						create a_message.make (50)
						a_message.append_string (a_tag)
						a_message.append_string (" (diff between files '")
						a_message.append_string (a_filename)
						a_message.append_string ("' and string at line ")
						INTEGER_.append_decimal_integer (i, a_message)
						a_message.append_string (")")
						a_file.close
						done := True
					end
				end
			else
				create a_message.make (50)
				a_message.append_string (a_tag)
				a_message.append_string (" (cannot read file '")
				a_message.append_string (a_filename)
				a_message.append_string ("')")
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_file_equal_to_string (a_tag: STRING; a_filename, a_string: STRING)
			-- Check that there is no difference between the
			-- content of the file named `a_filename' and `a_string'.
			-- (Expand environment variables in filename.)
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
			a_string_not_void: a_string /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_file_equal_to_string (a_tag, a_filename, a_string)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_filenames_equal (a_tag: STRING; a_filename1, a_filename2: STRING)
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
			a_message: detachable STRING
		do
			assertions.add_assertion
			nb := a_filename1.count
			if a_filename2.count = nb then
				a_name1 := a_filename1.as_lower
				a_name2 := a_filename2.as_lower
				from
					i := 1
				until
					i > nb
				loop
					c1 := a_name1.item (i)
					c2 := a_name2.item (i)
					if c1 /= c2 and not ((c1 = '\' and c2 = '/') or (c1 = '/' and c2 = '\')) then
							-- Jump out of the loop.
						i := nb + 1
						create a_message.make (50)
						a_message.append_string (a_tag)
						a_message.append_string (" (filenames '")
						a_message.append_string (a_filename1)
						a_message.append_string ("' and '")
						a_message.append_string (a_filename2)
						a_message.append_string ("' are not equal)")
					end
					i := i + 1
				end
			else
				create a_message.make (50)
				a_message.append_string (a_tag)
				a_message.append_string (" (filenames '")
				a_message.append_string (a_filename1)
				a_message.append_string ("' and '")
				a_message.append_string (a_filename2)
				a_message.append_string ("' are not equal)")
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_filenames_equal (a_tag: STRING; a_filename1, a_filename2: STRING)
			-- Check that filenames `a_filename1' and `a_filename2'
			-- only differ by the letters '/' and '\'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_filename1_not_void: a_filename1 /= Void
			a_filename2_not_void: a_filename2 /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_filenames_equal (a_tag, a_filename1, a_filename2)
			assertions.set_exception_on_error (l_fatal)
		end

feature {TS_TEST_HANDLER} -- Containers

	assert_arrays_same (a_tag: STRING; expected, actual: ARRAY [detachable ANY])
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag: STRING
			a_message: detachable STRING
			expected_item, actual_item: detachable ANY
		do
			assertions.add_assertion
			if expected.count /= actual.count then
				create new_tag.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_strings_equal_message (new_tag, expected.count.out, actual.count.out)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from
					i := 1
				until
					i > nb
				loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i2)
					if expected_item /= actual_item then
						create new_tag.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_.append_decimal_integer (i, new_tag)
						a_message := assert_equal_message (new_tag, expected_item, actual_item)
						i := nb + 1
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_arrays_same (a_tag: STRING; expected, actual: ARRAY [detachable ANY])
			-- Check that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_arrays_same (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_arrays_equal (a_tag: STRING; expected, actual: ARRAY [detachable ANY])
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use `equal' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag: STRING
			a_message: detachable STRING
			expected_item, actual_item: detachable ANY
		do
			assertions.add_assertion
			if expected.count /= actual.count then
				create new_tag.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_strings_equal_message (new_tag, expected.count.out, actual.count.out)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from
					i := 1
				until
					i > nb
				loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i2)
					if expected_item /~ actual_item then
						create new_tag.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_.append_decimal_integer (i, new_tag)
						a_message := assert_equal_message (new_tag, expected_item, actual_item)
						i := nb + 1
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_arrays_equal (a_tag: STRING; expected, actual: ARRAY [ANY])
			-- Check that `expected' and `actual' have the same items
			-- in the same order (use `equal' for item comparison).
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_arrays_equal (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_iarrays_same (a_tag: STRING; expected, actual: ARRAY [INTEGER])
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag: STRING
			a_message: detachable STRING
			expected_item, actual_item: INTEGER
		do
			assertions.add_assertion
			if expected.count /= actual.count then
				create new_tag.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_strings_equal_message (new_tag, expected.count.out, actual.count.out)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from
					i := 1
				until
					i > nb
				loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i2)
					if expected_item /= actual_item then
						create new_tag.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_.append_decimal_integer (i, new_tag)
						a_message := assert_strings_equal_message (new_tag, expected_item.out, actual_item.out)
						i := nb + 1
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_iarrays_same (a_tag: STRING; expected, actual: ARRAY [INTEGER])
			-- Check that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_iarrays_same (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_barrays_same (a_tag: STRING; expected, actual: ARRAY [BOOLEAN])
			-- Assert that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			i, nb: INTEGER
			i1, i2: INTEGER
			new_tag: STRING
			a_message: detachable STRING
			expected_item, actual_item: BOOLEAN
		do
			assertions.add_assertion
			if expected.count /= actual.count then
				create new_tag.make (15)
				new_tag.append_string (a_tag)
				new_tag.append_string ("-count")
				a_message := assert_strings_equal_message (new_tag, expected.count.out, actual.count.out)
			else
				i1 := expected.lower
				i2 := actual.lower
				nb := expected.count
				from
					i := 1
				until
					i > nb
				loop
					expected_item := expected.item (i1)
					actual_item := actual.item (i2)
					if expected_item /= actual_item then
						create new_tag.make (15)
						new_tag.append_string (a_tag)
						new_tag.append_string ("-item #")
						INTEGER_.append_decimal_integer (i, new_tag)
						a_message := assert_strings_equal_message (new_tag, expected_item.out, actual_item.out)
						i := nb + 1
					else
						i1 := i1 + 1
						i2 := i2 + 1
						i := i + 1
					end
				end
			end
			if a_message /= Void then
				logger.report_failure (a_tag, a_message)
				assertions.report_error (a_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_barrays_same (a_tag: STRING; expected, actual: ARRAY [BOOLEAN])
			-- Check that `expected' and `actual' have the same items
			-- in the same order (use '=' for item comparison).
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			expected_not_void: expected /= Void
			actual_not_void: actual /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_barrays_same (a_tag, expected, actual)
			assertions.set_exception_on_error (l_fatal)
		end

feature {TS_TEST_HANDLER} -- Exception

	assert_exception (a_tag: STRING; a_routine: ROUTINE)
			-- Assert that the execution of `a_routine' raises an exception.
		require
			a_tag_not_void: a_tag /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if not attached raised_exception (a_routine) then
				l_message := assert_strings_equal_message (a_tag, "Exception", "No exception")
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_exception (a_tag: STRING; a_routine: ROUTINE)
			-- Check that the execution of `a_routine' raises an exception.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_exception (a_tag, a_routine)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_no_exception (a_tag: STRING; a_routine: ROUTINE)
			-- Assert that the execution of `a_routine' raises no exception.
		require
			a_tag_not_void: a_tag /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if attached raised_exception (a_routine) as l_exception then
				l_message := assert_strings_equal_message (a_tag, "No exception", l_exception.generating_type.name.as_string_8)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_no_exception (a_tag: STRING; a_routine: ROUTINE)
			-- Check that the execution of `a_routine' raises no exception.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_no_exception (a_tag, a_routine)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_developer_exception_with_name (a_tag: STRING; a_exception_name: STRING; a_routine: ROUTINE)
			-- Assert that the execution of `a_routine' raises a developer exception
			-- with name `a_exception_name'.
		require
			a_tag_not_void: a_tag /= Void
			a_exception_name_not_void: a_exception_name /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_message: STRING
		do
			assertions.add_assertion
			if not attached raised_exception (a_routine) as l_exception then
				l_message := assert_strings_equal_message (a_tag, ({DEVELOPER_EXCEPTION}).name.as_string_8, "No exception")
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			elseif not attached {DEVELOPER_EXCEPTION} l_exception as l_developer_exception then
				l_message := assert_strings_equal_message (a_tag, ({DEVELOPER_EXCEPTION}).name.as_string_8, l_exception.generating_type.name.as_string_8)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			elseif not attached l_developer_exception.description as l_description then
				l_message := assert_strings_equal_message (a_tag, a_exception_name, "No exception name")
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			elseif l_description.as_string_8 /~ a_exception_name then
				l_message := assert_strings_equal_message (a_tag, a_exception_name, l_description.as_string_8)
				logger.report_failure (a_tag, l_message)
				assertions.report_error (l_message)
			else
				logger.report_success (a_tag)
			end
		end

	check_developer_exception_with_name (a_tag: STRING; a_exception_name: STRING; a_routine: ROUTINE)
			-- Check that the execution of `a_routine' raises a developer exception
			-- with name `a_exception_name'.
			-- Violation of this assertion is not fatal.
		require
			a_tag_not_void: a_tag /= Void
			a_exception_name_not_void: a_exception_name /= Void
			a_routine_not_void: a_routine /= Void
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_developer_exception_with_name (a_tag, a_exception_name, a_routine)
			assertions.set_exception_on_error (l_fatal)
		end

feature {NONE} -- Exception (Implementation)

	raised_exception (a_routine: ROUTINE): detachable EXCEPTION
			-- Exception raised by the execution of `a_routine', if any
		require
			a_routine_not_void: a_routine /= Void
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
				a_routine.call ([])
			elseif attached exception_manager.last_exception as l_exception then
				Result := l_exception.original
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

feature {TS_TEST_HANDLER} -- Execution

	assert_execute (a_shell_command: STRING)
			-- Execute `a_shell_command' and check whether the
			-- exit status code is zero.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		do
			assert_exit_code_execute (a_shell_command, 0)
		end

	check_execute (a_shell_command: STRING)
			-- Execute `a_shell_command' and check whether the
			-- exit status code is zero.
			-- Violation of this assertion is not fatal.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_execute (a_shell_command)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER)
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
			assert_integers_equal (a_shell_command, an_exit_code, a_command.exit_code)
		end

	check_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER)
			-- Execute `a_shell_command' and check whether the
			-- exit status code is `an_exit_code'.
			-- Violation of this assertion is not fatal.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_exit_code_execute (a_shell_command, an_exit_code)
			assertions.set_exception_on_error (l_fatal)
		end

	assert_not_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER)
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
			assert_integers_not_equal (a_shell_command, an_exit_code, a_command.exit_code)
		end

	check_not_exit_code_execute (a_shell_command: STRING; an_exit_code: INTEGER)
			-- Execute `a_shell_command' and check whether the
			-- exit status code is not equal to `an_exit_code'.
			-- Violation of this assertion is not fatal.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			l_fatal: BOOLEAN
		do
			l_fatal := assertions.exception_on_error
			assertions.set_exception_on_error (False)
			assert_not_exit_code_execute (a_shell_command, an_exit_code)
			assertions.set_exception_on_error (l_fatal)
		end

feature {NONE} -- Messages

	void_or_out (an_any: detachable separate ANY): detachable STRING
			-- Return `an_any.out' or Void if `an_any' is Void.
		do
			if an_any /= Void then
				create Result.make_from_separate (an_any.out)
			end
		end

	assert_equal_message (a_tag: STRING; expected, actual: detachable separate ANY): STRING
			-- Message stating that `expected' and `actual' should be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			Result := assert_strings_equal_message (a_tag, void_or_out (expected), void_or_out (actual))
		end

	assert_not_equal_message (a_tag: STRING; expected, actual: detachable separate ANY): STRING
			-- Message stating that `expected' and `actual' should not be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			Result := assert_strings_not_equal_message (a_tag, void_or_out (expected), void_or_out (actual))
		end

	assert_strings_equal_message (a_tag: STRING; expected, actual: detachable separate STRING): STRING
			-- Message stating that `expected' and `actual' should be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			create Result.make (50)
			Result.append_string (a_tag)
			Result.append_string ("%N   expected: ")
			if expected = Void then
				Result.append_string ("Void")
			else
				Result.append_string (create {STRING}.make_from_separate (expected))
			end
			Result.append_string ("%N   but  got: ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (create {STRING}.make_from_separate (actual))
			end
		ensure
			message_not_void: Result /= Void
		end

	assert_strings_not_equal_message (a_tag: STRING; expected, actual: detachable separate STRING): STRING
			-- Message stating that `expected' and `actual' should not be equal.
		require
			a_tag_not_void: a_tag /= Void
		do
			create Result.make (50)
			Result.append_string (a_tag)
			Result.append_string ("%N   got actual value: ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (create {STRING}.make_from_separate (actual))
			end
			Result.append_string ("%N   should not match: ")
			if expected = Void then
				Result.append_string ("Void")
			else
				Result.append_string (create {STRING}.make_from_separate (expected))
			end
		ensure
			message_not_void: Result /= Void
		end

	assert_strings_equal_with_tolerance_message (a_tag: STRING; expected, actual: detachable STRING; tolerance: STRING; a_strict: BOOLEAN): STRING
			-- Message stating that `expected' and `actual' should be equal
			-- with some (possibly strict) `tolerance'.
		require
			a_tag_not_void: a_tag /= Void
			tolerance_not_void: tolerance /= Void
		do
			create Result.make (50)
			Result.append_string (a_tag)
			Result.append_string ("%N   expected: ")
			if expected = Void then
				Result.append_string ("Void")
			else
				Result.append_string (expected)
			end
			Result.append_string (" with ")
			if a_strict then
				Result.append_string ("strict ")
			end
			Result.append_string ("tolerance: ")
			Result.append_string (tolerance)
			Result.append_string ("%N   but  got: ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (actual)
			end
		ensure
			message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	bom: STRING = "%/239/%/187/%/191/"
			-- Byte Order Mark

end
