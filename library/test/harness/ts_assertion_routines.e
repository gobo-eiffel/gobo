indexing

	description:

		"Assertion routines"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TS_ASSERTION_ROUTINES

inherit

	TS_SHARED_ASSERTIONS
	KL_SHARED_EXCEPTIONS
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

feature -- Containers

	assert_array (a_tag: STRING; expected, actual: ARRAY [ANY]) is
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

	assert_iarray (a_tag: STRING; expected, actual: ARRAY [INTEGER]) is
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

feature {NONE} -- Messages

	assert_equal_message (a_tag: STRING; expected, actual: ANY): STRING is
			-- Message stating that `expected' and `actual' should be equal.
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
			Result.append_string (" but got: ")
			if actual = Void then
				Result.append_string ("Void")
			else
				Result.append_string (actual.out)
			end
			Result.append_character (')')
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

end -- class TS_ASSERTION_ROUTINES
