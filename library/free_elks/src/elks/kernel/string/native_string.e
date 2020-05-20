note
	description: "[
			Platform specific encoding of Unicode strings. By default, UTF-8 on unix or UTF-16 on Windows.

			Mixed-encoding consideration
			============================

			Most operating systems have conventions for strings that are incompatible with Unicode.
			On UNIX, a string is just a null-terminated byte sequence, it does not follow any
			specific encoding. Usually the locale setting enables you to see the string the way
			you expect.
			On Windows, the sequence of names is made of null-terminated UTF-16 code unit sequence. Windows
			does not guarantee that the sequence is actually a valid UTF-16 sequence.

			In other words, when there is an invalid UTF-8 encoding on UNIX, or an invalid UTF-16 encoding
			on Windows, the string is not directly representable as a Unicode string. To make it possible
			to create and store strings in a textually representable form, the query `string' will create
			an encoded representation that can be then later used in `make' to create a NATIVE_STRING
			equivalent to the original string. The encoding is described in UTF_CONVERTER's note clause
			and is a fourth variant of the recommended practice for replacement characters in Unicode
			(see http://www.unicode.org/review/pr-121.html).

			]"
	date: "$Date$"
	revision: "$Revision$"

class
	NATIVE_STRING

inherit
	NATIVE_STRING_HANDLER
		redefine
			is_equal
		end

create
	make, make_empty, make_from_pointer, make_from_raw_string

feature {NONE} -- Initialization

	make (a_string: READABLE_STRING_GENERAL)
			-- Initialize an instance of Current using `a_string' treated as a sequence
			-- of Unicode characters.
		require
			a_string_not_void: a_string /= Void
		do
			make_empty (a_string.count)
			set_string (a_string)
		end

	make_empty (a_length: INTEGER)
			-- Initialize an empty instance of Current that will accommodate `a_length' code units.
			-- The memory area is not initialized.
		require
			a_length_positive: a_length >= 0
		do
				-- Allocate for `a_length' code units and the null character.
			create managed_data.make ((a_length + 1) * unit_size)
			unit_count := 0
		end

	make_from_pointer (a_pointer: POINTER)
			-- Initialize current from `a_pointer', a platform system specific null-terminated string.
		require
			a_path_pointer_not_null: a_pointer /= default_pointer
		local
			l_count: INTEGER
		do
				-- Calculate the length of the string pointed by `a_pointer'.
			l_count := pointer_length_in_bytes (a_pointer)
				-- Make a copy of `a_pointer' including the null character.
			create managed_data.make_from_pointer (a_pointer, l_count + unit_size)
				-- Update `unit_count'.
			unit_count := l_count // unit_size
		end

	make_from_raw_string (a_raw_string: like raw_string)
			-- Initialize current from `a_raw_string'.
		require
			a_raw_string_not_void: a_raw_string /= Void
		local
			i: INTEGER
		do
				-- Create the memory area including the null-terminating character.
			create managed_data.make (a_raw_string.count + unit_size)
			across a_raw_string as l_c loop
				managed_data.put_character (l_c.item, i)
				i := i + 1
			end
				-- Write null terminator
			if {PLATFORM}.is_windows then
				managed_data.put_natural_16 (0, i)
			else
				managed_data.put_natural_8 (0, i)
			end
				-- Update `unit_count'.
			unit_count := (managed_data.count - unit_size) // unit_size
		ensure
			set: raw_string.same_string (a_raw_string)
		end

feature -- Access

	raw_string: STRING_8
			-- Sequence of bytes representing `Current'.
		local
			l_cstr: C_STRING
		do
				-- Alias `managed_data' to be a C string so that we copy the raw sequence
				-- of bytes into a STRING_8 but we do not include the null-terminating character.
			create l_cstr.make_shared_from_pointer_and_count (managed_data.item, managed_data.count)
			Result := l_cstr.substring_8 (1, managed_data.count - unit_size)
		end

	string: STRING_32
			-- Representation of Current up to the first null character.
		local
			u: UTF_CONVERTER
		do
				-- Taking the `raw_string' representation of Current, we decode it as a Unicode string.
			if {PLATFORM}.is_windows then
				Result := u.utf_16_0_pointer_to_escaped_string_32 (managed_data)
			else
				Result := u.utf_8_0_pointer_to_escaped_string_32 (managed_data)
			end
		end

	substring (start_pos, end_pos: INTEGER): STRING_32
			-- Copy of substring containing all code units at indices
			-- between `start_pos' and `end_pos'.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_position_not_too_big: end_pos <= (capacity // unit_size)
		local
			u: UTF_CONVERTER
		do
			create Result.make (end_pos - start_pos + 1)
			if {PLATFORM}.is_windows then
				u.utf_16_0_subpointer_into_escaped_string_32 (managed_data,
					start_pos - 1, end_pos - 1, False, Result)
			else
				Result := u.utf_8_0_pointer_to_escaped_string_32 (managed_data)
				u.utf_8_0_subpointer_into_escaped_string_32 (managed_data,
					start_pos - 1, end_pos - 1, False, Result)
			end
		ensure
			susbstring_not_void: Result /= Void
		end

	item: POINTER
			-- Get pointer to allocated area.
		do
			Result := managed_data.item
		ensure
			item_not_null: Result /= default_pointer
		end

	managed_data: MANAGED_POINTER
			-- Hold data of Current.

feature -- Status Report

	is_empty: BOOLEAN
			-- Is current empty?
		do
			Result := unit_count = 0
		end

feature -- Measurement

	capacity: INTEGER
			-- Number of bytes in Current.
		do
			Result := managed_data.count
		end

	bytes_count: INTEGER
			-- Number of bytes used by Current not including the null terminating character.
		do
			Result := unit_count * unit_size
		ensure
			bytes_count_non_negative: Result >= 0
		end

	unit_count: INTEGER
			-- Number of units used by Current not including the null terminating unit.

	unit_size: INTEGER
			-- Size in bytes of a unit for `storage'.
		do
			if {PLATFORM}.is_windows then
				Result := 2
			else
				Result := 1
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is content of string identical to content of string `other'?
		do
			Result := item.is_equal (other.item)
		end

feature -- Element change

	set_string (a_string: READABLE_STRING_GENERAL)
			-- Set `string' with `a_string'	treated as a sequence of Unicode characters.
		require
			a_string_not_void: a_string /= Void
		do
			set_substring (a_string, 1, a_string.count)
		end

	set_substring (a_string: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER)
			-- Set `string' with a subset of `a_string' from `a_start_pos' index to `end_pos' index.
		require
			a_string_not_void: a_string /= Void
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
		local
			u: UTF_CONVERTER
		do
			if {PLATFORM}.is_windows then
				u.escaped_utf_32_substring_into_utf_16_0_pointer (a_string, start_pos, end_pos,
					managed_data, 0, upper_cell)
			else
				u.escaped_utf_32_substring_into_utf_8_0_pointer (a_string, start_pos, end_pos,
					managed_data, 0, upper_cell)
			end
			unit_count := upper_cell.item // unit_size
		end

	set_shared_from_pointer (a_ptr: POINTER)
			-- New instance sharing `a_ptr'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		do
			set_shared_from_pointer_and_count (a_ptr, pointer_length_in_bytes (a_ptr))
		end

	set_shared_from_pointer_and_count (a_ptr: POINTER; a_length: INTEGER)
			-- New instance sharing `a_ptr' of `a_length' byte. Space for an additional
			-- null terminating code unit is added to `managed_data'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
			a_length_non_negative: a_length >= 0
			a_length_valid: (a_length \\ unit_size) = 0
		do
			unit_count := a_length // unit_size
			if not managed_data.is_shared then
				create managed_data.share_from_pointer (a_ptr, a_length + unit_size)
			else
				managed_data.set_from_pointer (a_ptr, a_length + unit_size)
			end
		end

feature {NONE} -- Implementation

	platform: PLATFORM
			-- Access underlying platform info, used to satisfy invariant below.
		once
			create Result
		end

	upper_cell: CELL [INTEGER]
			-- Temporary storage for byte index of last insertions when using UTF_CONVERTER routines.
		once
			create Result.put (0)
		end

invariant
	little_endian_windows: {PLATFORM}.is_windows implies platform.is_little_endian
	even_count_on_windows: {PLATFORM}.is_windows implies managed_data.count \\ unit_size = 0

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
