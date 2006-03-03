indexing
	description: "A low-level string class to solve some garbage %
		%collector problems (mainly objects moving around) when %
		%interfacing with C APIs."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	C_STRING

inherit
	STRING_HANDLER

create
	make,
	make_empty,
	make_by_pointer,
	make_by_pointer_and_count,
	share_from_pointer,
	share_from_pointer_and_count

feature --{NONE} -- Initialization

	make (a_string: STRING) is
			-- Make a C string from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			make_empty (a_string.count)
			set_string (a_string)
		end

	make_empty (a_length: INTEGER) is
			-- Make an empty C string of `a_length' characters.
			-- C memory area is not initialized.
		require
			a_length_positive: a_length >= 0
		do
			create managed_data.make ((a_length + 1))
			count := 0
		end

	make_by_pointer (a_ptr: POINTER) is
			-- Make a copy of string pointed by `a_ptr'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		do
			make_by_pointer_and_count (a_ptr, c_strlen (a_ptr))
		end

	make_by_pointer_and_count (a_ptr: POINTER; a_length: INTEGER) is
			-- Make a copy of first `a_length' byte of string pointed by `a_ptr'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
			a_length_non_negative: a_length >= 0
		do
			count := a_length
			create managed_data.make ((a_length + 1))
			managed_data.item.memory_copy (a_ptr, a_length)
		end

feature -- Initialization

	share_from_pointer (a_ptr: POINTER) is
			-- New instance sharing `a_ptr'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		do
			share_from_pointer_and_count (a_ptr, c_strlen (a_ptr))
		end

	share_from_pointer_and_count (a_ptr: POINTER; a_length: INTEGER) is
			-- New instance sharing `a_ptr' of `a_length' byte.
		require
			a_ptr_not_null: a_ptr /= default_pointer
			a_length_non_negative: a_length >= 0
		do
			count := a_length
			if managed_data = Void or else not managed_data.is_shared then
				create managed_data.share_from_pointer (a_ptr, a_length + 1)
			else
				managed_data.set_from_pointer (a_ptr, a_length + 1)
			end
		end

feature -- Access

	substring (start_pos, end_pos: INTEGER): STRING is
			-- Copy of substring containing all characters at indices
			-- between `start_pos' and `end_pos'.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_position_not_too_big: end_pos <= capacity
		local
			l_count: INTEGER
		do
			l_count := end_pos - start_pos + 1
			create Result.make (l_count)
			Result.set_count (l_count)
			read_substring_into (Result, start_pos, end_pos)
		ensure
			susbstring_not_void: Result /= Void
		end

	string: STRING is
			-- Eiffel string, ignoring `count'. Reads until a null character is being read.
		do
			Result := substring (1, c_strlen (item))
		ensure
			string_not_void: Result /= Void
		end

	read_substring_into (a_string: STRING; start_pos, end_pos: INTEGER) is
			-- Copy of substring containing all characters at indices
			-- between `start_pos' and `end_pos' into `a_string'.
		require
			a_string_not_void: a_string /= Void
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_position_not_too_big: end_pos <= capacity
			a_string_large_enough: a_string.count >= end_pos - start_pos + 1
		local
			l_area: SPECIAL [CHARACTER]
			l_data: like managed_data
			i, nb: INTEGER
		do
			from
				i := start_pos - 1
				nb := end_pos
				l_area := a_string.area
				l_data := managed_data
			until
				i = nb
			loop
				l_area.put (l_data.read_natural_8 (i).to_character, i)
				i := i + 1
			end
		end

	read_string_into (a_string: STRING) is
			-- Copy of substring containing all characters at indices
			-- between `start_pos' and `end_pos' into `a_string' replacing any
			-- existing characters.
		require
			a_string_not_void: a_string /= Void
			a_string_large_enough: a_string.count >= count
		do
			read_substring_into (a_string, 1, count)
		end

	item: POINTER is
			-- Get pointer to allocated area.
		do
			Result := managed_data.item
		ensure
			item_not_null: Result /= default_pointer
		end

	managed_data: MANAGED_POINTER
			-- Hold data of Current.

feature -- Measurement

	capacity: INTEGER is
			-- Number of characters in Current.
		do
			Result := managed_data.count
		end

	count: INTEGER
			-- Number of characters in Current.

feature -- Element change

	set_string (a_string: STRING) is
			-- Set `string' with `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			new_size: INTEGER
			l_area: SPECIAL [CHARACTER]
			l_c: CHARACTER
		do
			nb := a_string.count
			count := nb

			new_size := nb + 1

			if managed_data.count < new_size  then
				managed_data.resize (new_size)
			end

			from
				i := 0
				l_area := a_string.area
			until
				i = nb
			loop
				l_c := l_area.item (i)
				managed_data.put_natural_8 (l_c.code.to_natural_8, i)
				i := i + 1
			end
			managed_data.put_natural_8 (0, nb)
		end

	set_count (a_count: INTEGER) is
			-- Set `count' with `a_count'.
			-- Note: Current content from index `1' to
			-- `count.min (a_count)' is unchanged.
		require
			a_count_non_negative: a_count >= 0
		local
			new_size: INTEGER
		do
			new_size := a_count + 1
			if managed_data.count < new_size then
				managed_data.resize (new_size)
			end
			count := a_count
		ensure
			count_set: count = a_count
		end

	fill_blank is
			-- Fill Current with zeros.
		do
			fill_value (0)
		ensure
			-- all_values: For every `i' in 1..`count', `item' (`i') = `0'
		end

	fill_value (a_value: INTEGER_8) is
			-- Fill Current with `a_value'.
		do
			managed_data.item.memory_set (a_value, managed_data.count)
		ensure
			-- all_values: For every `i' in 1..`count', `item' (`i') = `a_value'
		end

feature {NONE} -- Implementation

	c_strlen (ptr: POINTER): INTEGER is
		external
			"C signature (char *): EIF_INTEGER use <string.h>"
		alias
			"strlen"
		end

invariant
	managed_data_not_void: managed_data /= Void
	count_not_negative: count >= 0

end
