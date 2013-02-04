note

	description:

		"Unicode strings"

	remark: "[
		Unless specified otherwise, STRING and CHARACTER are
		supposed to contain characters whose code follows the
		unicode character set. In other words characters whose
		code is between 128 and 255 should follow the ISO 8859-1
		Latin-1 character set.
	]"
	remark2: "[
		By default UC_STRING is implemented using the UTF-8 encoding.
		Use UC_UTF*_STRING to specify the encoding explicitly.
	]"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #9 $"

class UC_STRING

inherit

	ANY
		undefine
			copy,
			out
		redefine
			is_equal
		select
				-- Note: The postcondition of `is_equal' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from ANY instead.
			is_equal
		end

	KL_STRING
		rename
			item as item,
			capacity as byte_capacity,
			clear_all as old_clear_all,
			left_adjust as old_left_adjust,
			right_adjust as old_right_adjust,
				-- Note: The postconditions of `wipe_out' in
				-- ISE 5.4/5.5 does not allow an optimized ELKS compliant
				-- redefinition here. In particular we don't want to
				-- reset the capacity to zero.
			wipe_out as old_wipe_out,
			empty as old_empty,
				-- Note: The postcondition of `infix "<"' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from COMPARABLE instead.
			is_less as old_infix_less,
				-- Note: The postcondition of `is_equal' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from ANY instead.
			is_equal as old_is_equal,
			set_count as old_set_count,
			is_empty as old_is_empty
		export
			{STRING}
				share,
				shared_with,
				area,
				mirror,
				is_case_insensitive_equal,
				valid_code,
				to_string_32
			{ANY}
				is_string_8,
				valid_index,
				old_is_empty
-- TODO: `area_lower' need to be exported, but this feature does not exist
-- in ISE 6.2 and 6.3. So we need to comment out the line below.
--			{NONE} all
		undefine
			is_greater,
			is_less_equal,
			is_greater_equal,
			max,
			min
		redefine
			make,
			make_from_string,
			make_empty,
			make_filled,
			put,
			append_character,
			item,
			substring,
			append_string,
			replace_substring,
			replace_substring_all,
			append,
			index_of,
			has,
			occurrences,
			hash_code,
			remove,
			to_lower,
			to_upper,
			three_way_comparison,
			item_code,
			byte_capacity,
			has_substring,
			insert_character,
			string,
			same_string,
			same_string_general,
			insert_string,
			insert,
			prepend,
			prepend_string,
			append_string_general,
			keep_head,
			keep_tail,
			remove_head,
			remove_tail,
			remove_substring,
			as_lower,
			as_upper,
			out,
			fill_with,
			at,
			count,
			old_clear_all,
			old_left_adjust,
			old_right_adjust,
			old_wipe_out,
			code,
			append_code,
			put_code,
			has_code,
			index_of_code,
			substring_index,
			plus,
			copy
		select
			put,
			item
		end

	KL_STRING
		rename
			item as old_item,
			put as old_put,
			capacity as byte_capacity,
			set_count as old_set_count,
			is_empty as old_is_empty,
			clear_all as old_clear_all,
			left_adjust as old_left_adjust,
			right_adjust as old_right_adjust,
				-- Note: The postconditions of `wipe_out' in
				-- ISE 5.4/5.5 does not allow an optimized ELKS compliant
				-- redefinition here. In particular we don't want to
				-- reset the capacity to zero.
			wipe_out as old_wipe_out,
			empty as old_empty,
				-- Note: The postcondition of `is_equal' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from ANY instead.
			is_equal as old_is_equal,
				-- Note: The postcondition of `infix "<"' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from COMPARABLE instead.
			is_less as old_infix_less
		export
			{NONE} all
		undefine
			is_greater,
			is_less_equal,
			is_greater_equal,
			max,
			min
		redefine
			make,
			make_from_string,
			make_empty,
			make_filled,
			append_character,
			substring_index,
			substring,
			append_string,
			replace_substring,
			replace_substring_all,
			append,
			index_of,
			has,
			occurrences,
			hash_code,
			remove,
			to_lower,
			to_upper,
			three_way_comparison,
			item_code,
			byte_capacity,
			count,
			has_substring,
			insert_character,
			string,
			same_string,
			same_string_general,
			insert_string,
			insert,
			prepend,
			prepend_string,
			append_string_general,
			keep_head,
			keep_tail,
			remove_head,
			remove_tail,
			remove_substring,
			as_lower,
			as_upper,
			out,
			fill_with,
			old_wipe_out,
			old_clear_all,
			old_left_adjust,
			old_right_adjust,
			code,
			append_code,
			put_code,
			has_code,
			index_of_code,
			plus,
			copy,
			at
		end

	KL_COMPARABLE
		undefine
			three_way_comparison,
			is_equal,
			copy,
			out
		select
				-- Note: The postcondition of `infix "<"' in ELKS 2001 STRING
				-- is too constraining and does not allow a redefinition here.
				-- Redefine version from COMPARABLE instead.
			is_less
		end

	KI_TEXT_OUTPUT_STREAM
		rename
			put_character as append_character,
			append as append_stream,
			True_constant as stream_true_constant,
			False_constant as stream_false_constant
		undefine
			is_equal,
			copy,
			out
		redefine
			put_substring
		end

	UC_STRING_HANDLER
		undefine
			is_equal,
			copy,
			out
		end

	UC_IMPORTED_UNICODE_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	UC_IMPORTED_UTF8_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	UC_IMPORTED_UTF16_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	UC_IMPORTED_UTF32_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	KL_IMPORTED_INTEGER_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal,
			copy,
			out
		end

	KL_SHARED_PLATFORM
		undefine
			is_equal,
			copy,
			out
		end

	DEBUG_OUTPUT
		undefine
			is_equal,
			copy,
			out
		end

create

	make,
	make_empty,
	make_from_string,
	make_from_utf8,
	make_filled,
	make_filled_code,
	make_filled_unicode,
	make_from_substring,
	make_from_utf16,
	make_from_utf16le,
	make_from_utf16be,
	make_from_string_general,
	make_from_substring_general

feature -- Initialization

	make (suggested_capacity: INTEGER)
			-- Create empty string, or remove all characters from
			-- existing string.
			-- (Extended from ELKS 2001 STRING)
		do
			reset_byte_index_cache
			count := 0
			if suggested_capacity = 0 then
					-- Make sure that the `area' is not shared.
				precursor (1)
			else
				precursor (suggested_capacity)
			end
			set_count (byte_capacity)
			old_set_count (byte_capacity)
			set_count (0)
			byte_count := 0
		ensure then
			byte_count_set: byte_count = 0
			byte_capacity_set: byte_capacity >= suggested_capacity
		end

	make_from_string (a_string: STRING)
			-- Initialize from the character sequence of `a_string'.
			-- (ELKS 2001 STRING)
		do
			make_from_string_general (a_string)
		ensure then
			same_unicode: same_unicode_string (a_string)
		end

feature {NONE} -- Initialization

	make_empty
			-- Create empty string.
			-- (ELKS 2001 STRING)
		do
			make (0)
		end

	make_from_string_general (a_string: STRING_GENERAL)
			-- Initialize from the character sequence of `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_uc_string: detachable UC_STRING
		do
				-- Note that we do nothing if `a_string' is `Current'.
				-- This is what the following tries to determine. In
				-- the end, if `l_uc_string' is Void this means that
				-- `a_string' is not `Current'.
			l_uc_string ?= a_string
			if l_uc_string /= Void then
				area := l_uc_string.area
				if a_string /= Current then
					l_uc_string := Void
				end
			end
			if l_uc_string /= Void then
					-- We know by now that `a_string' is `Current', so the
					-- current routine is not used as a creation procedure,
					-- and therefore `area' has already been set and is
					-- equal to the 'area' of `l_uc_string'. But the compiler
					-- has to be told again.
				area := l_uc_string.area
			else
				make_from_substring_general (a_string, 1, a_string.count)
			end
		ensure
			same_unicode: same_unicode_string (a_string)
		end

	make_from_substring (a_string: STRING; start_index, end_index: INTEGER)
			-- Initialize from the character sequence of `a_string'
			-- between `start_index' and `end_index' inclusive.
		require
			a_string_not_void: a_string /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		do
			make_from_substring_general (a_string, start_index, end_index)
		ensure
			initialized: same_unicode_string (a_string.substring (start_index, end_index))
		end

	make_from_substring_general (a_string: STRING_GENERAL; start_index, end_index: INTEGER)
			-- Initialize from the character sequence of `a_string'
			-- between `start_index' and `end_index' inclusive.
		require
			a_string_not_void: a_string /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		local
			nb: INTEGER
			str: STRING_GENERAL
			l_uc_string: detachable UC_STRING
		do
				-- Note that we do nothing if `a_string' is `Current'.
				-- This is what the following tries to determine. In
				-- the end, if `l_uc_string' is Void this means that
				-- `a_string' is not `Current'.
			l_uc_string ?= a_string
			if l_uc_string /= Void then
				area := l_uc_string.area
				if a_string /= Current then
					l_uc_string := Void
				end
			end
			if l_uc_string /= Void and then start_index = 1 and then end_index = count then
					-- We know by now that `a_string' is `Current', so the
					-- current routine is not used as a creation procedure,
					-- and therefore `area' has already been set and is
					-- equal to the 'area' of `l_uc_string'. But the compiler
					-- has to be told again.
				area := l_uc_string.area
			else
				if end_index < start_index then
					make (0)
				else
					if l_uc_string /= Void then
						str := l_uc_string.cloned_string
					else
						str := a_string
					end
					nb := utf8.substring_byte_count (str, start_index, end_index)
					make (nb)
					set_count (end_index - start_index + 1)
					byte_count := nb
					put_substring_at_byte_index (str, start_index, end_index, nb, 1)
				end
			end
		ensure
			initialized: same_unicode_string (a_string.substring (start_index, end_index))
		end

	make_filled_unicode (c: UC_CHARACTER; n: INTEGER)
			-- Create string of length `n' filled with unicode character `c'.
		require
			c_not_void: c /= Void
			valid_count: n >= 0
		do
			make_filled_code (c.code, n)
		ensure
			count_set: count = n
			filled: unicode_occurrences (c) = count
		end

	make_filled_code (a_code: INTEGER; n: INTEGER)
			-- Create string of length `n' filled with unicode
			-- character of code `a_code'.
		require
			valid_code: unicode.valid_code (a_code)
			valid_count: n >= 0
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.code_byte_count (a_code)
			new_byte_count := nb * n
			make (new_byte_count)
			set_count (n)
			byte_count := new_byte_count
			from
				i := 1
			until
				i > new_byte_count
			loop
				put_code_at_byte_index (a_code, nb, i)
				i := i + nb
			end
		ensure
			count_set: count = n
			filled: code_occurrences (a_code) = count
		end

	make_filled (c: CHARACTER; n: INTEGER)
			-- Create string of length `n' filled with character `c'.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.character_byte_count (c)
			new_byte_count := nb * n
			make (new_byte_count)
			set_count (n)
			byte_count := new_byte_count
			if nb = 1 then
				from
					i := 1
				until
					i > new_byte_count
				loop
					put_byte (c, i)
					i := i + 1
				end
			else
				from
					i := 1
				until
					i > new_byte_count
				loop
					put_character_at_byte_index (c, nb, i)
					i := i + nb
				end
			end
		ensure then
			filled_code: code_occurrences (c.code) = count
		end

	make_from_utf8 (s: STRING)
			-- Initialize from the bytes sequence of `s' corresponding
			-- to the UTF-8 representation of a string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf8: utf8.valid_utf8 (s)
		do
			make (s.count)
			append_utf8 (s)
		end

	make_from_utf16 (s: STRING)
			-- Initialize from the bytes sequence of `s' corresponding
			-- to the UTF-16 representation of a string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16: utf16.valid_utf16 (s)
		do
			make (s.count // 2)
			append_utf16 (s)
		end

	make_from_utf16le (s: STRING)
			-- Initialize from the bytes sequence of `s' corresponding
			-- to the UTF-16LE representation of a string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16le: utf16.valid_utf16le (s)
		do
			make (s.count // 2)
			append_utf16le (s)
		end

	make_from_utf16be (s: STRING)
			-- Initialize from the bytes sequence of `s' corresponding
			-- to the UTF-16BE representation of a string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16be: utf16.valid_utf16be (s)
		do
			make (s.count // 2)
			append_utf16be (s)
		end

feature -- Access

	unicode_item (i: INTEGER): UC_CHARACTER
			-- Unicode character at index `i';
			-- Return a new object at each call
		require
			valid_index: valid_index (i)
		do
			create Result.make_from_code (item_code (i))
		ensure
			item_not_void: Result /= Void
			code_set: Result.code = item_code (i)
		end

	item_code (i: INTEGER): INTEGER
			-- Code of character at index `i'
		local
			k: INTEGER
		do
			if count = byte_count then
				Result := byte_item (i).code
			else
				k := byte_index (i)
				Result := item_code_at_byte_index (k)
			end
		ensure then
			item_code_not_negative: Result >= 0
			valid_item_code: unicode.valid_code (Result)
		end

	item (i: INTEGER): CHARACTER
			-- Character at index `i';
			-- '%U' if the unicode character at index
			-- `i' cannot fit into a CHARACTER
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use `item_code' instead of this routine when `Current'
			-- can contain characters which may not fit into a CHARACTER.
		local
			k: INTEGER
		do
			if count = byte_count then
				Result := byte_item (i)
			else
				k := byte_index (i)
				Result := character_item_at_byte_index (k)
			end
		ensure then
			code_small_enough: item_code (i) <= Platform.Maximum_character_code implies Result.code = item_code (i)
			overflow: item_code (i) > Platform.Maximum_character_code implies Result = '%U'
		end

	at alias "@" (i: INTEGER): CHARACTER
			-- Character at index `i'
			-- (ELKS 2001 STRING)
		do
			Result := item (i)
		ensure then
			definition: Result = item (i)
		end

	substring (start_index, end_index: INTEGER): like Current
			-- New object containing all characters
			-- from `start_index' to `end_index' inclusive
			-- (ELKS 2001 STRING)
		do
			if end_index < start_index then
				create Result.make (0)
			else
				create Result.make_from_substring (Current, start_index, end_index)
			end
		ensure then
			first_unicode_item: Result.count > 0 implies Result.item_code (1) = item_code (start_index)
		end

	unicode_substring_index (other: READABLE_STRING_GENERAL; start_index: INTEGER): INTEGER
			-- Index of first occurrence of `other' at or after `start_index';
			-- 0 if none
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		local
			i, j, nb: INTEGER
			a_code, a_code2: INTEGER
			other_unicode: detachable UC_STRING
			k, z, end_index: INTEGER
			found: BOOLEAN
			other_count: INTEGER
		do
			if other = Current then
				if start_index = 1 then
					Result := 1
				end
			else
				other_count := other.count
				if other_count = 0 then
					Result := start_index
				else
					end_index := count - other_count + 1
					if start_index <= end_index then
						if count = byte_count then
							other_unicode ?= other
							if other_unicode /= Void then
								nb := other_unicode.byte_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := k
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := other_unicode.item_code_at_byte_index (i)
										if byte_item (j).code /= a_code then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := j + 1
											i := other_unicode.next_byte_index (i)
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										k := k + 1
									end
								end
							else
								nb := other_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := k
									found := True
									from
										i := 1
									until
										i > nb
									loop
										if byte_item (j).code /= other.code (i).to_integer_32 then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := j + 1
											i := i + 1
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										k := k + 1
									end
								end
							end
						else
							z := byte_index (start_index)
							other_unicode ?= other
							if other_unicode /= Void then
								nb := other_unicode.byte_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := z
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := item_code_at_byte_index (j)
										a_code2 := other_unicode.item_code_at_byte_index (i)
										if a_code /= a_code2 then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := next_byte_index (j)
											i := other_unicode.next_byte_index (i)
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										z := next_byte_index (z)
										k := k + 1
									end
								end
							else
								nb := other_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := z
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := item_code_at_byte_index (j)
										if a_code /= other.code (i).to_integer_32 then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := next_byte_index (j)
											i := i + 1
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										z := next_byte_index (z)
										k := k + 1
									end
								end
							end
						end
					end
				end
			end
		ensure
			valid_result: Result = 0 or else (start_index <= Result and Result <= count - other.count + 1)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has_unicode_substring (other)
			at_this_index: Result >= start_index implies substring (Result, Result + other.count - 1).same_unicode_string (other)
			none_before: Result > start_index implies not substring (start_index, Result + other.count - 2).has_unicode_substring (other)
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER
			-- Index of first occurrence of `other' at or after `start_index';
			-- 0 if none. `other' and `Current' are considered with their
			-- characters which do not fit in a CHARACTER replaced by a '%U'
			-- (Extended from ELKS 2001 STRING)
		local
			i, j, nb: INTEGER
			a_code, a_code2: INTEGER
			other_unicode: detachable UC_STRING
			k, z, end_index: INTEGER
			found: BOOLEAN
			other_count: INTEGER
		do
			if other = Current then
				if start_index = 1 then
					Result := 1
				end
			else
				other_count := other.count
				if other_count = 0 then
					Result := start_index
				else
					end_index := count - other_count + 1
					if start_index <= end_index then
						if count = byte_count then
							other_unicode ?= other
							if other_unicode /= Void then
								nb := other_unicode.byte_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := k
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := other_unicode.item_code_at_byte_index (i)
										if a_code > Platform.Maximum_character_code then
											a_code := 0
										end
										if byte_item (j).code /= a_code then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := j + 1
											i := other_unicode.next_byte_index (i)
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										k := k + 1
									end
								end
							else
								nb := other_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := k
									found := True
									from
										i := 1
									until
										i > nb
									loop
										if byte_item (j) /= other.item (i) then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := j + 1
											i := i + 1
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										k := k + 1
									end
								end
							end
						else
							z := byte_index (start_index)
							other_unicode ?= other
							if other_unicode /= Void then
								nb := other_unicode.byte_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := z
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := item_code_at_byte_index (j)
										if a_code > Platform.Maximum_character_code then
											a_code := 0
										end
										a_code2 := other_unicode.item_code_at_byte_index (i)
										if a_code2 > Platform.Maximum_character_code then
											a_code2 := 0
										end
										if a_code /= a_code2 then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := next_byte_index (j)
											i := other_unicode.next_byte_index (i)
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										z := next_byte_index (z)
										k := k + 1
									end
								end
							else
								nb := other_count
								from
									k := start_index
								until
									k > end_index
								loop
									j := z
									found := True
									from
										i := 1
									until
										i > nb
									loop
										a_code := item_code_at_byte_index (j)
										if a_code > Platform.Maximum_character_code then
											a_code := 0
										end
										if a_code /= other.item (i).code then
											found := False
												-- Jump out of the loop.
											i := nb + 1
										else
											j := next_byte_index (j)
											i := i + 1
										end
									end
									if found then
										Result := k
											-- Jump out of the loop.
										k := end_index + 1
									else
										z := next_byte_index (z)
										k := k + 1
									end
								end
							end
						end
					end
				end
			end
		end

	string: STRING
			-- New STRING having the same character sequence as `Current'
			-- where characters which do not fit in a CHARACTER are
			-- replaced by a '%U'
			-- (Extended from ELKS 2001 STRING)
		local
			i, nb: INTEGER
			a_code: INTEGER
		do
			nb := count
			create Result.make (nb)
			if nb = byte_count then
				from
					i := 1
				until
					i > nb
				loop
					Result.append_character (byte_item (i))
					i := i + 1
				end
			else
				nb := byte_count
				from
					i := 1
				until
					i > nb
				loop
					a_code := item_code_at_byte_index (i)
					if a_code <= Platform.Maximum_character_code then
						Result.append_character (INTEGER_.to_character (a_code))
					else
						Result.append_character ('%U')
					end
					i := next_byte_index (i)
				end
			end
		end

	plus alias "+" (other: READABLE_STRING_8): like Current
			-- New object which is a clone of `Current' extended
			-- by the characters of `other'
			-- (ELKS 2001 STRING)
		do
			create Result.make (byte_count + utf8.substring_byte_count (other, 1, other.count))
			Result.append_string (Current)
			Result.append_string (other)
		ensure then
			final_unicode: Result.substring (count + 1, count + other.count).same_unicode_string (other)
		end

	prefixed_string (other: STRING): like Current
			-- New object which is a clone of `Current' preceded
			-- by the characters of `other'
		require
			other_not_void: other /= Void
		do
			create Result.make (byte_count + utf8.substring_byte_count (other, 1, other.count))
			Result.append_string (other)
			Result.append_string (Current)
		ensure
			prefixed_string_not_void: Result /= Void
			prefixed_string_count: Result.count = other.count + count
			initial: Result.substring (1, other.count).same_unicode_string (other)
			final: Result.substring (other.count + 1, Result.count).is_equal (Current)
		end

	index_of_unicode (c: UC_CHARACTER; start_index: INTEGER): INTEGER
			-- Index of first occurrence of `c' at or after `start_index';
			-- 0 if none
		require
			c_not_void: c /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		do
			Result := index_of_item_code (c.code, start_index)
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has_unicode (c)
			found_if_present: substring (start_index, count).has_unicode (c) implies item_code (Result) = c.code
			none_before: substring (start_index, count).has_unicode (c) implies not substring (start_index, Result - 1).has_unicode (c)
		end

	index_of_item_code (a_code: INTEGER; start_index: INTEGER): INTEGER
			-- Index of first occurrence of unicode character with
			-- code `a_code' at or after `start_index'; 0 if none
		require
			valid_start_index: start_index >= 1 and start_index <= count + 1
			valid_code: unicode.valid_code (a_code)
		local
			i, k, nb: INTEGER
		do
			nb := count
			if nb = byte_count then
				if a_code > 127 then
					Result := 0
				else
					from
						i := start_index
					until
						i > nb
					loop
						if byte_item (i).code = a_code then
							Result := i
								-- Jump out of the loop.
							i := nb + 1
						else
							i := i + 1
						end
					end
				end
			elseif start_index <= nb then
				k := byte_index (start_index)
				from
					i := start_index
				until
					i > nb
				loop
					if item_code_at_byte_index (k) = a_code then
						Result := i
							-- Jump out of the loop.
						i := nb + 1
					else
						k := next_byte_index (k)
						i := i + 1
					end
				end
			end
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has_item_code (a_code)
			found_if_present: substring (start_index, count).has_item_code (a_code) implies item_code (Result) = a_code
			none_before: substring (start_index, count).has_item_code (a_code) implies not substring (start_index, Result - 1).has_item_code (a_code)
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER
			-- Index of first occurrence of character `c'
			-- at or after `start_index'; 0 if none
			-- (ELKS 2001 STRING)
		local
			i, k, nb: INTEGER
			max_code: INTEGER
			a_code: INTEGER
		do
			nb := count
			if nb = byte_count then
				from
					i := start_index
				until
					i > nb
				loop
					if byte_item (i) = c then
						Result := i
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			elseif c = '%U' then
				if start_index <= nb then
					max_code := Platform.Maximum_character_code
					k := byte_index (start_index)
					from
						i := start_index
					until
						i > nb
					loop
						a_code := item_code_at_byte_index (k)
						if a_code = 0 or a_code > max_code then
							Result := i
								-- Jump out of the loop.
							i := nb + 1
						else
							k := next_byte_index (k)
							i := i + 1
						end
					end
				end
			else
				Result := index_of_item_code (c.code, start_index)
			end
		end

	hash_code: INTEGER
			-- Hash code
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			a_code: INTEGER
			fit_in_string: BOOLEAN
		do
			nb := count
			if nb = byte_count then
				Result := precursor
			else
				fit_in_string := True
				nb := byte_count
				from
					i := 1
				until
					i > nb
				loop
					a_code := item_code_at_byte_index (i)
					Result := 5 * Result + a_code
					if a_code > Platform.Maximum_character_code then
						fit_in_string := False
					end
					i := next_byte_index (i)
				end
				if fit_in_string then
					Result := string.hash_code
				end
			end
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	new_empty_string (suggested_capacity: INTEGER): like Current
			-- New empty string with same dynamic type as `Current'
		require
			non_negative_suggested_capacity: suggested_capacity >= 0
		do
			create Result.make (suggested_capacity)
		ensure
			new_string_not_void: Result /= Void
			same_type: ANY_.same_types (Result, Current)
			new_string_empty: Result.count = 0
			byte_count_set: Result.byte_count = 0
			byte_capacity_set: Result.byte_capacity >= suggested_capacity
		end

feature -- Measurement

	unicode_occurrences (c: UC_CHARACTER): INTEGER
			-- Number of times `c' appears in the string
		require
			c_not_void: c /= Void
		do
			Result := code_occurrences (c.code)
		ensure
			zero_if_empty: count = 0 implies Result = 0
			recurse_if_not_found_at_first_position: (count > 0 and then item_code (1) /= c.code) implies
				Result = substring (2, count).unicode_occurrences (c)
			recurse_if_found_at_first_position: (count > 0 and then item_code (1) = c.code) implies
				Result = 1 + substring (2, count).unicode_occurrences (c)
		end

	code_occurrences (a_code: INTEGER): INTEGER
			-- Number of times unicode character of code
			-- `a_code' appears in the string
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, nb: INTEGER
		do
			nb := count
			if nb = byte_count then
				if a_code > 127 then
					Result := 0
				else
					from
						i := 1
					until
						i > nb
					loop
						if byte_item (i).code = a_code then
							Result := Result + 1
						end
						i := i + 1
					end
				end
			else
				nb := byte_count
				from
					i := 1
				until
					i > nb
				loop
					if item_code_at_byte_index (i) = a_code then
						Result := Result + 1
					end
					i := next_byte_index (i)
				end
			end
		ensure
			zero_if_empty: count = 0 implies Result = 0
			recurse_if_not_found_at_first_position: (count > 0 and then item_code (1) /= a_code) implies
				Result = substring (2, count).code_occurrences (a_code)
			recurse_if_found_at_first_position: (count > 0 and then item_code (1) = a_code) implies
				Result = 1 + substring (2, count).code_occurrences (a_code)
		end

	occurrences (c: CHARACTER): INTEGER
			-- Number of times character `c' appears in the string
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			max_code: INTEGER
			a_code: INTEGER
		do
			nb := count
			if nb = byte_count then
				from
					i := 1
				until
					i > nb
				loop
					if byte_item (i) = c then
						Result := Result + 1
					end
					i := i + 1
				end
			elseif c = '%U' then
				max_code := Platform.Maximum_character_code
				nb := byte_count
				from
					i := 1
				until
					i > nb
				loop
					a_code := item_code_at_byte_index (i)
					if a_code = 0 or a_code > max_code then
						Result := Result + 1
					end
					i := next_byte_index (i)
				end
			else
				Result := code_occurrences (c.code)
			end
		end

	count: INTEGER
			-- Number of characters
			-- (ELKS 2001 STRING)

	byte_count: INTEGER
			-- Number of bytes in internal storage

	byte_capacity: INTEGER
			-- Maximum number of bytes that can be put in
			-- internal storage
		do
			Result := precursor
		end

feature -- Status report

	has_unicode (c: UC_CHARACTER): BOOLEAN
			-- Does `Current' contain `c'?
		require
			c_not_void: c /= Void
		do
			Result := has_item_code (c.code)
		ensure
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item_code (1) = c.code implies Result
			recurse: (count > 0 and then item_code (1) /= c.code) implies (Result = substring (2, count).has_unicode (c))
		end

	has_item_code (a_code: INTEGER): BOOLEAN
			-- Does `Current' contain the unicode character of code `a_code'?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := (index_of_item_code (a_code, 1) /= 0)
		ensure
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item_code (1) = a_code implies Result
			recurse: (count > 0 and then item_code (1) /= a_code) implies (Result = substring (2, count).has_item_code (a_code))
		end

	has (c: CHARACTER): BOOLEAN
			-- Does `Current' contain character `c'?
			-- (ELKS 2001 STRING)
		do
			Result := (index_of (c, 1) /= 0)
		end

	has_unicode_substring (other: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `Current' contain `other'?
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif other.count <= count then
				Result := (unicode_substring_index (other, 1) /= 0)
			end
		ensure
			false_if_too_small: count < other.count implies not Result
			true_if_initial: (count >= other.count and then substring (1, other.count).same_unicode_string (other)) implies Result
			recurse: (count >= other.count and then not substring (1, other.count).same_unicode_string (other)) implies (Result = substring (2, count).has_unicode_substring (other))
				-- TODO: Wrong signature in `has_substring':
--			has_substring: Result implies has_substring (other)
		end

	has_substring (other: STRING): BOOLEAN
			-- Does `Current' contain `other'?
			-- `other' and `Current' are considered with their characters
			-- which do not fit in a CHARACTER replaced by a '%U'.
			-- (Extented from ELKS 2001 STRING)
		do
			if other = Current then
				Result := True
			elseif other.count <= count then
				Result := (substring_index (other, 1) /= 0)
			end
		end

	is_empty: BOOLEAN
			-- Is string empty?
			-- (ELKS 2001 STRING)
		do
			Result := (count = 0)
		end

	is_ascii: BOOLEAN
			-- Does string contain only ASCII characters?
		do
			Result := (count = byte_count)
		ensure
			empty: count = 0 implies Result
			recurse: count > 0 implies Result = (unicode_item (1).is_ascii and substring (2, count).is_ascii)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered equal
			-- to current object?
			-- (Extended from ELKS 2001 STRING)
		local
			i, nb: INTEGER
		do
			if other = Current then
				Result := True
			elseif ANY_.same_types (Current, other) and then other.byte_count = byte_count then
				nb := byte_count
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					if byte_item (i) /= other.byte_item (i) then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			end
		ensure then
			unicode_definition:
				Result = (ANY_.same_types (Current, other) and then count = other.count and then
				(count > 0 implies (item_code (1) = other.item_code (1) and
				substring (2, count).is_equal (other.substring (2, count)))))
		end

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is string lexicographically lower than `other'?
			-- (Extended from ELKS 2001 STRING, inherited from COMPARABLE)
		do
			Result := (three_way_comparison (other) = -1)
		ensure then
			unicode_definition: Result = (count = 0 and other.count > 0 or
				count > 0 and then other.count > 0 and then (item_code (1) < other.item_code (1) or
				item_code (1) = other.item_code (1) and substring (2, count) < other.substring (2, other.count)))
		end

	same_string (other: READABLE_STRING_8): BOOLEAN
			-- Do `Current' and `other' have the same character sequence?
			-- `Current' is considered with its characters which do not
			-- fit in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				Result := (substring_index (other, 1) = 1)
			end
		end

	same_string_general (other: READABLE_STRING_GENERAL): BOOLEAN
			-- Do `Current' and `other' have the same character sequence?
			-- `Current' is considered with its characters which do not
			-- fit in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
		local
			i, l_count: INTEGER
			l_c, l_other_c: NATURAL_32
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				l_count := count
				from
					Result := True
					i := 1
				until
					i > l_count
				loop
					l_c := code (i)
					if l_c > platform.maximum_character_code.to_natural_32 then
						l_c := 0
					end
					l_other_c := other.code (i)
					if l_other_c > platform.maximum_character_code.to_natural_32 then
						l_other_c := 0
					end
					if l_c /= l_other_c then
						Result := False
						i := l_count
					end
					i := i + 1
				end
			end
		end

	same_unicode_string (other: READABLE_STRING_GENERAL): BOOLEAN
			-- Do `Current' and `other' have the same unicode character sequence?
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				Result := (unicode_substring_index (other, 1) = 1)
			end
		ensure
			definition: Result = (count = other.count and then
				(count > 0 implies (code (1) = other.code (1) and
				(count >= 2 implies substring (2, count).same_unicode_string (other.substring (2, count))))))
				-- TODO: wrong signature for `same_string':
--			same_string: Result implies same_string (other)
		end

	three_way_comparison (other: like Current): INTEGER
			-- If current object equal to `other', 0;
			-- if smaller, -1; if greater, 1
			-- (ELKS 2001 STRING, inherited from COMPARABLE)
			-- Note: there is a bug in the specification of the
			-- contracts of `three_way_comparison' inherited
			-- from COMPARABLE. This routine cannot satisfy
			-- its postconditions if `other' is not of the
			-- same type as `Current' because the postcondition
			-- uses `is_equal' and `is_equal' has a postcondition
			-- inherited from ANY which says if it returns true
			-- then `other' has the same type as `Current'.
		local
			i, nb, nb1, nb2: INTEGER
			b1, b2: CHARACTER
			found: BOOLEAN
		do
			if other /= Current and ANY_.same_types (Current, other) then
				nb1 := byte_count
				nb2 := other.byte_count
				if nb1 < nb2 then
					nb := nb1
				else
					nb := nb2
				end
				from
					i := 1
				until
					i > nb
				loop
					b1 := byte_item (i)
					b2 := other.byte_item (i)
					if b1 = b2 then
						i := i + 1
					elseif b1 < b2 then
						found := True
						Result := -1
							-- Jump out of the loop.
						i := nb + 1
					else
						found := True
						Result := 1
							-- Jump out of the loop.
						i := nb + 1
					end
				end
				if not found then
					if nb1 < nb2 then
						Result := -1
					elseif nb1 /= nb2 then
						Result := 1
					end
				end
			end
		end

	three_way_unicode_comparison (other: STRING): INTEGER
			-- If current object equal to `other', 0;
			-- if smaller, -1; if greater, 1
			-- Note: there is a bug in the specification of the
			-- contracts of `three_way_comparison' inherited
			-- from COMPARABLE. This routine cannot satisfy
			-- its postconditions if `other' is not of the
			-- same type as `Current' because the postcondition
			-- uses `is_equal' and `is_equal' has a postcondition
			-- inherited from ANY which says if it returns true
			-- then `other' has the same type as `Current'.
			-- `three_way_unicode_comparison' solves this problem
			-- and make the comparison polymorphically safe by
			-- changing the signature from 'like Current' to
			-- 'STRING' and by using `same_unicode_string' instead
			-- of `is_equal' in its postcondition.
		require
			other_not_void: other /= Void
		local
			i, nb, nb1, nb2: INTEGER
			b1, b2: CHARACTER
			c1, c2: INTEGER
			found: BOOLEAN
		do
			if other = Current then
				Result := 0
			elseif ANY_.same_types (Current, other) and then attached {UC_STRING} other as uc_string then
				nb1 := byte_count
				nb2 := uc_string.byte_count
				if nb1 < nb2 then
					nb := nb1
				else
					nb := nb2
				end
				from
					i := 1
				until
					i > nb
				loop
					b1 := byte_item (i)
					b2 := uc_string.byte_item (i)
					if b1 = b2 then
						i := i + 1
					elseif b1 < b2 then
						found := True
						Result := -1
							-- Jump out of the loop.
						i := nb + 1
					else
						found := True
						Result := 1
							-- Jump out of the loop.
						i := nb + 1
					end
				end
				if not found then
					if nb1 < nb2 then
						Result := -1
					elseif nb1 /= nb2 then
						Result := 1
					end
				end
			else
				nb1 := count
				nb2 := other.count
				if nb1 < nb2 then
					nb := nb1
				else
					nb := nb2
				end
				from
					i := 1
				until
					i > nb
				loop
					c1 := item_code (i)
					c2 := other.item_code (i)
					if c1 = c2 then
						i := i + 1
					elseif c1 < c2 then
						found := True
						Result := -1
							-- Jump out of the loop.
						i := nb + 1
					else
						found := True
						Result := 1
							-- Jump out of the loop.
						i := nb + 1
					end
				end
				if not found then
					if nb1 < nb2 then
						Result := -1
					elseif nb1 /= nb2 then
						Result := 1
					end
				end
			end
		ensure
			equal_zero: (Result = 0) = same_unicode_string (other)
--			smaller_negative: (Result = -1) = (Current is less than other)
--			greater_positive: (Result = 1) = (Current is greater than other)
		end

feature -- Element change

	put_unicode (c: UC_CHARACTER; i: INTEGER)
			-- Replace unicode character at index `i' by `c'.
		require
			valid_index: valid_index (i)
			c_not_void: c /= Void
		do
			put_item_code (c.code, i)
		ensure
			stable_count: count = old count
			replaced: item_code (i) = c.code
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

	put_item_code (a_code: INTEGER; i: INTEGER)
			-- Replace unicode character at index `i'
			-- by unicode character of code `a_code'.
		require
			valid_index: valid_index (i)
			valid_item_code: unicode.valid_code (a_code)
		local
			k, nb: INTEGER
			old_count, new_count: INTEGER
			new_byte_count: INTEGER
			a_byte: CHARACTER
		do
			if count = byte_count then
				k := i
				old_count := 1
			else
				k := byte_index (i)
				a_byte := byte_item (k)
				old_count := utf8.encoded_byte_count (a_byte)
			end
			new_count := utf8.code_byte_count (a_code)
			if new_count = old_count then
					-- Do nothing.
			elseif new_count < old_count then
				move_bytes_left (k + old_count, old_count - new_count)
			else
				nb := new_count - old_count
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				move_bytes_right (k + old_count, nb)
			end
			put_code_at_byte_index (a_code, new_count, k)
		ensure
			stable_count: count = old count
			replaced: item_code (i) = a_code
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

	put (c: CHARACTER; i: INTEGER)
			-- Replace unicode character at index `i' by character `c'.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			a_byte: CHARACTER
			old_count, new_count: INTEGER
			new_byte_count: INTEGER
		do
			if count = byte_count then
				k := i
				old_count := 1
			else
				k := byte_index (i)
				a_byte := byte_item (k)
				old_count := utf8.encoded_byte_count (a_byte)
			end
			new_count := utf8.character_byte_count (c)
			if new_count = old_count then
					-- Do nothing.
			elseif new_count < old_count then
				move_bytes_left (k + old_count, old_count - new_count)
			else
				nb := new_count - old_count
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				move_bytes_right (k + old_count, nb)
			end
			put_character_at_byte_index (c, new_count, k)
		ensure then
			unicode_replaced: item_code (i) = c.code
		end

	prepend (s: READABLE_STRING_8)
			-- Prepend a copy of `s' at front.
		do
			insert_string (s, 1)
		end

	prepend_string (s: detachable STRING)
			-- Prepend a copy of `s', if not void, at front.
		do
			if s /= Void then
				prepend (s)
			end
		end

	append_string_general (s: READABLE_STRING_GENERAL)
			-- Append a copy of `s' at end.
		do
			if attached {STRING} s as ls then
				append (ls)
			else
				precursor (s)
			end
		end

	append_unicode_character (c: UC_CHARACTER)
			-- Append unicode character `c' at end.
		require
			c_not_void: c /= Void
		do
			append_item_code (c.code)
		ensure
			new_count: count = old count + 1
			appended: item_code (count) = c.code
			stable_before: substring (1, count - 1).is_equal (old cloned_string)
		end

	append_item_code (a_code: INTEGER)
			-- Append unicode character of code `a_code' at end.
		require
			valid_item_code: unicode.valid_code (a_code)
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.code_byte_count (a_code)
			k := byte_count + 1
			new_byte_count := byte_count + nb
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			set_count (count + 1)
			put_code_at_byte_index (a_code, nb, k)
		ensure
			new_count: count = old count + 1
			appended: item_code (count) = a_code
			stable_before: substring (1, count - 1).is_equal (old cloned_string)
		end

	append_character (c: CHARACTER)
			-- Append character `c' at end.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
			new_count: INTEGER
		do
				-- Checking if `c' is an ASCII character here and below,
				-- makes this almost 30% faster for the most common case.
			if c <= '%/127/' then
				nb := 1
			else
				nb := utf8.character_byte_count (c)
			end
			k := byte_count + 1
			new_byte_count := byte_count + nb
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
				-- And we check here for a single byte as well to get that
				-- 30% improvement.
			if nb = 1 then
				new_count := count + 1
				set_count (byte_count)
				old_put (c, k)
				set_count (new_count)
			else
				set_count (count + 1)
				put_character_at_byte_index (c, nb, k)
			end
		ensure then
			unicode_appended: item_code (count) = c.code
		end

	append_string (s: detachable READABLE_STRING_8)
			-- Append a copy of `s' at end.
		do
			if s /= Void then
				append (s)
			end
		end


	put_string (a_string: STRING)
			-- Write `a_string' to output stream.
		do
			append (a_string)
		end

	append (a_string: READABLE_STRING_8)
			-- Append a copy of `a_string' at end.
			-- (ELKS 2001 STRING)
		local
			nb: INTEGER
			old_a_string_byte_count: INTEGER
			old_a_string_count: INTEGER
			new_byte_count: INTEGER
			new_count: INTEGER
			a_utf8_string: detachable UC_UTF8_STRING
			a_uc_string: detachable UC_STRING
			b: BOOLEAN
		do
			if ANY_.same_types (a_string, dummy_string) then
					-- Check if string does not contain non-ascii characters.
					-- Unfortunately, this is a slow but necessary call.
				nb := utf8.substring_byte_count (a_string.as_string_8, 1, a_string.count)
				if nb = a_string.count then
						-- If not, we may use the native `append_string'.
						-- Hopefully this one has a fast move.
					new_byte_count := byte_count + nb
					new_count := count + nb
					set_count (byte_count)
					old_set_count (byte_count)
					b := {ISE_RUNTIME}.check_assert (False)
					precursor (a_string)
					b := {ISE_RUNTIME}.check_assert (b)
					set_count (byte_capacity)
					old_set_count (byte_capacity)
					set_count (new_count)
					byte_count := new_byte_count
				else
						-- If so, use proper UTF8 encoding.
					gobo_append_substring (a_string, 1, a_string.count)
				end
			else
				a_uc_string ?= a_string
				if a_uc_string /= Void then
					a_utf8_string ?= a_string
					if a_utf8_string /= Void or ANY_.same_types (a_uc_string, dummy_uc_string) then
							-- Because bytes are in linear order, we may move bytes.
						if a_uc_string = Current then
							new_byte_count := 2 * byte_count
							new_count := 2 * count
							set_count (byte_count)
							old_set_count (byte_count)
							b := {ISE_RUNTIME}.check_assert (False)
							precursor (a_string)
							b := {ISE_RUNTIME}.check_assert (b)
							set_count (byte_capacity)
							old_set_count (byte_capacity)
							set_count (new_count)
							byte_count := new_byte_count
						else
							old_a_string_count := a_uc_string.count
							old_a_string_byte_count := a_uc_string.byte_count
							new_byte_count := byte_count + old_a_string_byte_count
							new_count := count + old_a_string_count
							a_uc_string.set_count (old_a_string_byte_count)
							set_count (byte_count)
							old_set_count (byte_count)
							b := {ISE_RUNTIME}.check_assert (False)
							precursor (a_string)
							b := {ISE_RUNTIME}.check_assert (b)
							set_count (byte_capacity)
							old_set_count (byte_capacity)
							set_count (new_count)
							a_uc_string.set_count (old_a_string_count)
							byte_count := new_byte_count
						end
					else
						gobo_append_substring (a_string, 1, a_string.count)
					end
				else
					gobo_append_substring (a_string, 1, a_string.count)
				end
			end
		end

	gobo_append_substring (a_string: STRING; s, e: INTEGER)
			-- Append substring of `a_string' between indexes
			-- `s' and `e' at end of current string.
		require
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
		local
			a_substring_count: INTEGER
			k, nb: INTEGER
			new_byte_count: INTEGER
			str: STRING
		do
			a_substring_count := e - s + 1
			if a_substring_count /= 0 then
				if a_string = Current then
					str := cloned_string
				else
					str := a_string
				end
				nb := utf8.substring_byte_count (str, s, e)
				k := byte_count + 1
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				byte_count := new_byte_count
				set_count (count + a_substring_count)
				put_substring_at_byte_index (str, s, e, nb, k)
			end
		ensure then
			appended: is_equal (old cloned_string + old a_string.substring (s, e))
		end

	put_substring (a_string: STRING; s, e: INTEGER)
			-- Write substring of `a_string' between indexes
			-- `s' and `e' to output stream.
		do
			gobo_append_substring (a_string, s, e)
		end
		
	append_utf8 (s: STRING)
			-- Append UTF-8 encoded string `s' at end of current string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf8: utf8.valid_utf8 (s)
		local
			i, k, nb: INTEGER
			a_byte: CHARACTER
			j, nb2: INTEGER
			a_count: INTEGER
			new_byte_count: INTEGER
		do
			nb := s.count
			new_byte_count := byte_count + nb
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			k := byte_count + 1
			byte_count := new_byte_count
			from
				i := 1
			until
				i > nb
			loop
				from
					a_count := a_count + 1
					a_byte := s.item (i)
					put_byte (a_byte, k)
					i := i + 1
					k := k + 1
					nb2 := utf8.encoded_byte_count (a_byte)
					j := 1
				until
					j >= nb2
				loop
					put_byte (s.item (i), k)
					i := i + 1
					k := k + 1
					j := j + 1
				end
			end
			set_count (count + a_count)
		end

	append_utf16 (s: STRING)
			-- Append UTF-16 encoded string `s' at end of current string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16: utf16.valid_utf16 (s)
		local
			msb_first: BOOLEAN
			i, nb: INTEGER
			a_most, a_least: INTEGER
			a_low_most, a_low_least: INTEGER
		do
			i := 1
			nb := s.count
			msb_first := True
			if nb >= 2 then
				if utf16.is_endian_detection_character_most_first (s.item_code (1), s.item_code (2)) then
					check
						msb_first_set: msb_first
					end
					i := 3
				elseif utf16.is_endian_detection_character_least_first (s.item_code (1), s.item_code (2)) then
					msb_first := False
					i := 3
				end
			end
			from
			until
				i > nb
			loop
				if msb_first then
					a_most := s.item_code (i)
					a_least := s.item_code (i + 1)
				else
					a_least := s.item_code (i)
					a_most := s.item_code (i + 1)
				end
				if utf16.is_surrogate (a_most) then
					check
						valid_pre_implies_high: utf16.is_high_surrogate (a_most)
					end
					check
						valid_pre_implies_size: i + 2 < nb
					end
					i := i + 2
					if msb_first then
						a_low_most := s.item_code (i)
						a_low_least := s.item_code (i + 1)
					else
						a_low_least := s.item_code (i)
						a_low_most := s.item_code (i + 1)
					end
					check
						valid_pre_implies_low: utf16.is_low_surrogate (a_low_most)
					end
					append_item_code (utf16.surrogate_from_bytes (a_most, a_least, a_low_most, a_low_least))
				else
					append_item_code (a_most * 256 + a_least)
				end
				i := i + 2
			end
		end

	append_utf16be (s: STRING)
			-- Append UTF-16BE encoded string `s' at end of current string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16be: utf16.valid_utf16be (s)
		local
			i, nb: INTEGER
			a_most, a_least: INTEGER
			a_low_most, a_low_least: INTEGER
		do
			i := 1
			nb := s.count
			from
			until
				i > nb
			loop
				a_most := s.item_code (i)
				a_least := s.item_code (i + 1)
				if utf16.is_surrogate (a_most) then
					check
						valid_pre_implies_high: utf16.is_high_surrogate (a_most)
					end
					check
						valid_pre_implies_size: i + 2 < nb
					end
					i := i + 2
					a_low_most := s.item_code (i)
					a_low_least := s.item_code (i + 1)
					check
						valid_pre_implies_low: utf16.is_low_surrogate (a_low_most)
					end
					append_item_code (utf16.surrogate_from_bytes (a_most, a_least, a_low_most, a_low_least))
				else
					append_item_code (a_most * 256 + a_least)
				end
				i := i + 2
			end
		end

	append_utf16le (s: STRING)
			-- Append UTF-16LE encoded string `s' at end of current string.
		require
			s_not_void: s /= Void
			s_is_string: ANY_.same_types (s, "")
			valid_utf16le: utf16.valid_utf16le (s)
		local
			i, nb: INTEGER
			a_most, a_least: INTEGER
			a_low_most, a_low_least: INTEGER
		do
			i := 1
			nb := s.count
			from
			until
				i > nb
			loop
				a_least := s.item_code (i)
				a_most := s.item_code (i + 1)
				if utf16.is_surrogate (a_most) then
					check
						valid_pre_implies_high: utf16.is_high_surrogate (a_most)
					end
					check
						valid_pre_implies_size: i + 2 < nb
					end
					i := i + 2
					a_low_least := s.item_code (i)
					a_low_most := s.item_code (i + 1)
					check
						valid_pre_implies_low: utf16.is_low_surrogate (a_low_most)
					end
					append_item_code (utf16.surrogate_from_bytes (a_most, a_least, a_low_most, a_low_least))
				else
					append_item_code (a_most * 256 + a_least)
				end
				i := i + 2
			end
		end

	fill_with_unicode (c: UC_CHARACTER)
			-- Replace every character with unicode character `c'.
		require
			c_not_void: c /= Void
		do
			fill_with_code (c.code)
		ensure
			same_count: old count = count
			filled: unicode_occurrences (c) = count
		end

	fill_with_code (a_code: INTEGER)
			-- Replace every character with unicode character of code `a_code'.
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			reset_byte_index_cache
			nb := utf8.code_byte_count (a_code)
			new_byte_count := nb * count
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			from
				i := 1
			until
				i > new_byte_count
			loop
				put_code_at_byte_index (a_code, nb, i)
				i := i + nb
			end
		ensure
			same_count: old count = count
			filled: code_occurrences (a_code) = count
		end

	fill_with (c: CHARACTER)
			-- Replace every character with character `c'.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			reset_byte_index_cache
			nb := utf8.character_byte_count (c)
			new_byte_count := nb * count
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			if nb = 1 then
				from
					i := 1
				until
					i > new_byte_count
				loop
					put_byte (c, i)
					i := i + 1
				end
			else
				from
					i := 1
				until
					i > new_byte_count
				loop
					put_character_at_byte_index (c, nb, i)
					i := i + nb
				end
			end
		ensure then
			all_code: code_occurrences (c.code) = count
		end

	insert_unicode_character (c: UC_CHARACTER; i: INTEGER)
			-- Insert unicode character `c' at index `i', shifting
			-- characters between ranks `i' and `count' rightwards.
		require
			c_not_void: c /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		do
			insert_code (c.code, i)
		ensure
			one_more_character: count = old count + 1
			inserted: item_code (i) = c.code
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i, count))
		end

	insert_code (a_code: INTEGER; i: INTEGER)
			-- Insert unicode character of code `a_code'
			-- at index `i', shifting characters between
			-- ranks `i' and `count' rightwards.
		require
			valid_code: unicode.valid_code (a_code)
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			if i = count + 1 then
				append_item_code (a_code)
			else
				if count = byte_count then
					k := i
				else
					k := byte_index (i)
				end
				nb := utf8.code_byte_count (a_code)
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				set_count (count + 1)
				move_bytes_right (k, nb)
				put_code_at_byte_index (a_code, nb, k)
			end
		ensure
			one_more_character: count = old count + 1
			inserted: item_code (i) = a_code
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i, count))
		end

	insert_character (c: CHARACTER; i: INTEGER)
			-- Insert character `c' at index `i', shifting
			-- characters between ranks `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			if i = count + 1 then
				append_character (c)
			else
				if count = byte_count then
					k := i
				else
					k := byte_index (i)
				end
				nb := utf8.character_byte_count (c)
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				set_count (count + 1)
				move_bytes_right (k, nb)
				put_character_at_byte_index (c, nb, k)
			end
		ensure then
			code_inserted: item_code (i) = c.code
		end

	insert (s: STRING; i: INTEGER)
			-- Add `s' to left of position `i' in current string.
		obsolete
			"ELKS 2001: use `insert_string' instead"
		do
			insert_string (s, i)
		end

	insert_string (a_string: READABLE_STRING_8; i: INTEGER)
			-- Insert `a_string' at index `i', shifting characters between ranks
			-- `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
		require else
			string_not_void: a_string /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			a_string_count: INTEGER
			k, nb: INTEGER
			new_byte_count: INTEGER
			str: STRING
		do
			a_string_count := a_string.count
			if a_string_count /= 0 then
				if i = count + 1 then
					append_string (a_string)
				else
					if a_string = Current then
						str := cloned_string
					else
						str := a_string
					end
					if count = byte_count then
						k := i
					else
						k := byte_index (i)
					end
					nb := utf8.substring_byte_count (str, 1, a_string_count)
					new_byte_count := byte_count + nb
					if new_byte_count > byte_capacity then
						resize_byte_storage (new_byte_count)
					end
					move_bytes_right (k, nb)
					set_count (count + a_string_count)
					put_substring_at_byte_index (str, 1, a_string_count, nb, k)
				end
			end
		end

	replace_substring (a_string: STRING; start_index, end_index: INTEGER)
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `a_string'.
			-- (ELKS 2001 STRING)
		do
			replace_substring_by_string (a_string, start_index, end_index)
		end

	replace_substring_by_string (a_string: STRING; start_index, end_index: INTEGER)
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			a_string_count: INTEGER
			k, nb: INTEGER
			a_range: INTEGER
			old_count, new_count: INTEGER
			new_byte_count: INTEGER
			str: STRING
		do
			a_string_count := a_string.count
			if a_string_count = 0 then
				remove_substring (start_index, end_index)
			else
				if start_index = count + 1 then
					append_string (a_string)
				else
					if a_string = Current then
						str := cloned_string
					else
						str := a_string
					end
					a_range := end_index - start_index + 1
					if count = byte_count then
						k := start_index
						old_count := a_range
					else
						k := byte_index (start_index)
						if end_index < start_index then
							old_count := 0
						elseif end_index = count then
							old_count := byte_count - k + 1
						else
							old_count := shifted_byte_index (k, a_range) - k
						end
					end
					new_count := utf8.substring_byte_count (str, 1, a_string_count)
					if new_count = old_count then
							-- Do nothing.
					elseif new_count < old_count then
						move_bytes_left (k + old_count, old_count - new_count)
					else
						nb := new_count - old_count
						new_byte_count := byte_count + nb
						if new_byte_count > byte_capacity then
							resize_byte_storage (new_byte_count)
						end
						move_bytes_right (k + old_count, nb)
					end
					set_count (count + a_string_count - a_range)
					put_substring_at_byte_index (str, 1, a_string_count, new_count, k)
				end
			end
		end

-- TODO: ISE 6.2 version because there is a flat Degree 3 error when using version from 6.4
-- with the signature of `replace_substring' of the current class.
	replace_substring_all (original, new: like Current)
			-- Replace every occurrence of `original' with `new'.
		local
			l_first_pos, l_next_pos: INTEGER
			l_orig_count, l_new_count, l_count: INTEGER
			l_area, l_new_area: like area
			l_offset: INTEGER
			l_string_searcher: like string_searcher
		do
			if not is_empty then
				l_count := count
				l_string_searcher := string_searcher
				l_string_searcher.initialize_deltas (original)
				l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, 1, l_count)
				if l_first_pos > 0 then
					l_orig_count := original.count
					l_new_count := new.count
					if l_orig_count = l_new_count then
							-- String will not be resized, simply perform character substitution
						from
							l_area := area
							l_new_area := new.area
						until
							l_first_pos = 0
						loop
							l_area.copy_data (l_new_area, 0, l_first_pos - 1, l_new_count)
							if l_first_pos + l_new_count <= l_count then
								l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_new_count, l_count)
							else
								l_first_pos := 0
							end
						end
					elseif l_orig_count > l_new_count then
							-- New string is smaller than previous string, we can optimize
							-- substitution by only moving block between two occurrences of `orginal'.
						from
							l_next_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_orig_count, l_count)
							l_area := area
							l_new_area := new.area
						until
							l_next_pos = 0
						loop
								-- Copy new string into Current
							l_area.copy_data (l_new_area, 0, l_first_pos - 1 - l_offset, l_new_count)
								-- Shift characters between `l_first_pos' and `l_next_pos'
							l_area.overlapping_move (l_first_pos + l_orig_count - 1,
								l_first_pos + l_new_count - 1 - l_offset, l_next_pos - l_first_pos - l_orig_count)
							l_first_pos := l_next_pos
							l_offset := l_offset + (l_orig_count - l_new_count)
							if l_first_pos + l_new_count <= l_count then
								l_next_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_orig_count, l_count)
							else
								l_next_pos := 0
							end
						end
							-- Perform final substitution:
							-- Copy new string into Current
						l_area.copy_data (l_new_area, 0, l_first_pos - 1 - l_offset, l_new_count)
							-- Shift characters between `l_first_pos' and the end of the string
						l_area.overlapping_move (l_first_pos + l_orig_count - 1,
							l_first_pos + l_new_count - 1 - l_offset, l_count + 1 - l_first_pos - l_orig_count)
								-- Perform last substitution
						l_offset := l_offset + (l_orig_count - l_new_count)

							-- Update `count'
						set_count (l_count - l_offset)
					else
							-- Optimization is harder as we don't know how many times we need to resize
							-- the string. For now, we do like we did in our previous implementation
						from
						until
							l_first_pos = 0
						loop
							replace_substring (new, l_first_pos, l_first_pos + l_orig_count - 1)
							l_count := count
							if l_first_pos + l_new_count <= l_count then
								l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_new_count, l_count)
							else
								l_first_pos := 0
							end
						end
					end
					internal_hash_code := 0
				end
			end
		end

feature -- Removal

	keep_head (n: INTEGER)
			-- Remove all the characters except for the first `n';
			-- if `n' > `count', do nothing.
			-- (ELKS 2001 STRING)
		do
			if n = 0 then
				byte_count := 0
				set_count (0)
			elseif n < count then
				if count = byte_count then
					byte_count := n
				else
					byte_count := byte_index (n + 1) - 1
				end
				set_count (n)
			end
		end

	keep_tail (n: INTEGER)
			-- Remove all the characters except for the last `n';
			-- if `n' > `count', do nothing.
			-- (ELKS 2001 STRING)
		local
			removed_byte_count: INTEGER
		do
			if n = 0 then
				byte_count := 0
				set_count (0)
			elseif n < count then
				if count = byte_count then
					removed_byte_count := byte_count - n
				else
					removed_byte_count := byte_index (count - n + 1) - 1
				end
				move_bytes_left (removed_byte_count + 1, removed_byte_count)
				set_count (n)
			end
		end

	remove_head (n: INTEGER)
			-- Remove the first `n' characters;
			-- if `n' > `count', remove all.
			-- (ELKS 2001 STRING)
		do
			if n >= count then
				wipe_out
			elseif n /= 0 then
				keep_tail (count - n)
			end
		end

	remove_tail (n: INTEGER)
			-- Remove the last `n' characters;
			-- if `n' > `count', remove all.
			-- (ELKS 2001 STRING)
		do
			if n >= count then
				wipe_out
			elseif n /= 0 then
				keep_head (count - n)
			end
		end

	remove (i: INTEGER)
			-- Remove `i'-th character, shifting characters between
			-- ranks i + 1 and `count' leftwards.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
		do
			if count = byte_count then
				k := i
				nb := 1
			else
				k := byte_index (i)
				nb := utf8.encoded_byte_count (byte_item (k))
			end
			move_bytes_left (k + nb, nb)
			set_count (count - 1)
		end

	remove_substring (start_index, end_index: INTEGER)
			-- Remove all characters from `start_index'
			-- to `end_index' inclusive.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			s: INTEGER
			a_count: INTEGER
		do
			if start_index = end_index then
				remove (start_index)
			elseif start_index < end_index then
				a_count := end_index - start_index + 1
				if count = byte_count then
					k := end_index + 1
					nb := a_count
				else
					s := byte_index (start_index)
					if end_index = count then
						k := byte_count + 1
					else
						k := shifted_byte_index (s, a_count)
					end
					nb := k - s
				end
				move_bytes_left (k, nb)
				set_count (count - a_count)
			end
		end

	wipe_out
			-- Remove all characters.
			-- (ELKS 2001 STRING)
		do
			byte_count := 0
			set_count (0)
		end

feature -- Duplication

	copy (other: like Current)
			-- Reinitialize by copying the characters of `other'.
			-- (This is also used by clone.)
			-- (ELKS 2001 STRING)
		local
			other_count: INTEGER
		do
			if other /= Current then
				other_count := other.count
				other.set_count (other.byte_count)
				precursor {KL_STRING} (other)
				set_count (other_count)
				other.set_count (other_count)
			end
		end

	cloned_string: like Current
			-- New object equal to `Current'
		do
			Result := twin
		ensure
			twin_not_void: Result /= Void
			is_equal: Result.is_equal (Current)
		end

feature -- Output

	out: STRING
			-- New STRING containing terse printable representation
			-- of current object; Non-ascii characters are represented
			-- with the %/code/ convention.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			a_code: INTEGER
			c: CHARACTER
			max_ascii_char: CHARACTER
			max_ascii_code: INTEGER
		do
			nb := count
			create Result.make (nb)
			if nb = byte_count then
				max_ascii_char := unicode.maximum_ascii_character
				from
					i := 1
				until
					i > nb
				loop
					c := byte_item (i)
					if c <= max_ascii_char then
						Result.append_character (c)
					else
						Result.append_character ('%%')
						Result.append_character ('/')
						Result.append_string (c.code.out)
						Result.append_character ('/')
					end
					i := i + 1
				end
			else
				nb := byte_count
				max_ascii_code := unicode.maximum_ascii_character_code
				from
					i := 1
				until
					i > nb
				loop
					a_code := item_code_at_byte_index (i)
					if a_code <= max_ascii_code then
						Result.append_character (INTEGER_.to_character (a_code))
					else
						Result.append_character ('%%')
						Result.append_character ('/')
						Result.append_string (a_code.out)
						Result.append_character ('/')
					end
					i := next_byte_index (i)
				end
			end
		end

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'.
		do
			Result := out
		end

feature -- Conversion

	as_lower: like Current
			-- New object with all letters in lower case
			-- (Extended from ELKS 2001 STRING)
		do
			Result := cloned_string
			Result.to_lower
		ensure then
			unicode_anchor: count > 0 implies Result.unicode_item (1).is_equal (unicode_item (1).as_lower)
			unicode_recurse: count > 1 implies Result.substring (2, count).is_equal (substring (2, count).as_lower)
		end

	as_upper: like Current
			-- New object with all letters in upper case
			-- (Extended from ELKS 2001 STRING)
		do
			Result := cloned_string
			Result.to_upper
		ensure then
			unicode_anchor: count > 0 implies Result.unicode_item (1).is_equal (unicode_item (1).as_upper)
			unicode_recurse: count > 1 implies Result.substring (2, count).is_equal (substring (2, count).as_upper)
		end

	to_lower
			-- Convert all letters to lower case.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			old_count, new_count: INTEGER
			new_byte_count: INTEGER
			a_code, new_code: INTEGER
		do
			nb := byte_count
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				new_code := unicode.lower_code (a_code)
				if new_code /= a_code then
					old_count := utf8.code_byte_count (a_code)
					new_count := utf8.code_byte_count (new_code)
					if new_count = old_count then
							-- Do nothing.
					elseif new_count < old_count then
						move_bytes_left (i + old_count, old_count - new_count)
					else
						nb := new_count - old_count
						new_byte_count := byte_count + nb
						if new_byte_count > byte_capacity then
							resize_byte_storage (new_byte_count)
						end
						move_bytes_right (i + old_count, nb)
					end
					put_code_at_byte_index (new_code, new_count, i)
				end
				i := next_byte_index (i)
			end
		end

	to_upper
			-- Convert all letters to upper case.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			old_count, new_count: INTEGER
			new_byte_count: INTEGER
			a_code, new_code: INTEGER
		do
			nb := byte_count
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				new_code := unicode.upper_code (a_code)
				if new_code /= a_code then
					old_count := utf8.code_byte_count (a_code)
					new_count := utf8.code_byte_count (new_code)
					if new_count = old_count then
							-- Do nothing.
					elseif new_count < old_count then
						move_bytes_left (i + old_count, old_count - new_count)
					else
						nb := new_count - old_count
						new_byte_count := byte_count + nb
						if new_byte_count > byte_capacity then
							resize_byte_storage (new_byte_count)
						end
						move_bytes_right (i + old_count, nb)
					end
					put_code_at_byte_index (new_code, new_count, i)
				end
				i := next_byte_index (i)
			end
		end

	to_utf8: STRING
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of current string
		local
			i, nb: INTEGER
		do
			nb := byte_count
			create Result.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				Result.append_character (byte_item (i))
				i := i + 1
			end
		ensure
			to_utf8_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf8: utf8.valid_utf8 (Result)
		end

	to_utf16_be: STRING
			-- New STRING made up of bytes corresponding to
			-- the UTF-16BE representation of current string
		local
			i, nb, a_code, a_high, a_low, a_surrogate: INTEGER
		do
			nb := byte_count
			create Result.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				if unicode.is_bmp_code (a_code) then
					a_high := a_code // 256
					a_low := a_code \\ 256
					Result.append_character (INTEGER_.to_character (a_high))
					Result.append_character (INTEGER_.to_character (a_low))
				else
					a_surrogate := utf16.supplementary_to_high_surrogate (a_code)
					a_high := a_surrogate // 256
					a_low := a_surrogate \\ 256
					Result.append_character (INTEGER_.to_character (a_high))
					Result.append_character (INTEGER_.to_character (a_low))
					a_surrogate := utf16.supplementary_to_low_surrogate (a_code)
					a_high := a_surrogate // 256
					a_low := a_surrogate \\ 256
					Result.append_character (INTEGER_.to_character (a_high))
					Result.append_character (INTEGER_.to_character (a_low))
				end
				i := next_byte_index (i)
			end
		ensure
			to_utf16_be_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf16: utf16.valid_utf16 (Result)
		end

	to_utf16_le: STRING
			-- New STRING made up of bytes corresponding to
			-- the UTF-16LE representation of current string
		local
			i, nb, a_code, a_high, a_low, a_surrogate: INTEGER
		do
			nb := byte_count
			create Result.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				if unicode.is_bmp_code (a_code) then
					a_high := a_code // 256
					a_low := a_code \\ 256
					Result.append_character (INTEGER_.to_character (a_low))
					Result.append_character (INTEGER_.to_character (a_high))
				else
					a_surrogate := utf16.supplementary_to_high_surrogate (a_code)
					a_high := a_surrogate // 256
					a_low := a_surrogate \\ 256
					Result.append_character (INTEGER_.to_character (a_low))
					Result.append_character (INTEGER_.to_character (a_high))
					a_surrogate := utf16.supplementary_to_low_surrogate (a_code)
					a_high := a_surrogate // 256
					a_low := a_surrogate \\ 256
					Result.append_character (INTEGER_.to_character (a_low))
					Result.append_character (INTEGER_.to_character (a_high))
				end
				i := next_byte_index (i)
			end
		ensure
			to_utf16_le_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf16: utf16.valid_utf16 (utf16.bom_le + Result)
		end

	to_utf32_be: STRING
			-- New STRING made up of bytes corresponding to
			-- the UTF-32BE representation of current string
		local
			i, j, k, l, m, nb, a_code: INTEGER
		do
			nb := byte_count
			create Result.make (4 * count)
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				m := a_code \\ 256
				a_code := a_code // 256
				l := a_code \\ 256
				a_code := a_code // 256
				j := a_code // 256
				k := a_code \\ 256
				Result.append_character (INTEGER_.to_character (j))
				Result.append_character (INTEGER_.to_character (k))
				Result.append_character (INTEGER_.to_character (l))
				Result.append_character (INTEGER_.to_character (m))
				i := next_byte_index (i)
			end
		ensure
			to_utf32_be_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf32: utf32.valid_utf32 (Result)
		end

	to_utf32_le: STRING
			-- New STRING made up of bytes corresponding to
			-- the UTF-32LE representation of current string
		local
			i, j, k, l, m, nb, a_code: INTEGER
		do
			nb := byte_count
			create Result.make (4 * count)
			from
				i := 1
			until
				i > nb
			loop
				a_code := item_code_at_byte_index (i)
				m := a_code \\ 256
				a_code := a_code // 256
				l := a_code \\ 256
				a_code := a_code // 256
				j := a_code // 256
				k := a_code \\ 256
				Result.append_character (INTEGER_.to_character (m))
				Result.append_character (INTEGER_.to_character (l))
				Result.append_character (INTEGER_.to_character (k))
				Result.append_character (INTEGER_.to_character (j))
				i := next_byte_index (i)
			end
		ensure
			to_utf32_le_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf32: utf32.valid_utf32 (utf32.bom_le + Result)
		end

	as_string: STRING
			-- STRING version of current string;
			-- Return the UTF8 representation if it is encoded
			-- with UTF8, the UTF16 representation if it is
			-- encoded with UTF16, etc.
		do
			Result := to_utf8
		ensure
			as_string_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
		end

feature -- Output stream

	name: STRING = "UC_STRING"
			-- Name of output stream

	eol: STRING = "%N"
			-- Line separator

	is_open_write: BOOLEAN
			-- Can characters be written to output stream?
		do
			Result := True
		end

	flush
			-- Do nothing (operation does not apply to string).
		do
		end

feature -- Traversal

	item_code_at_byte_index (i: INTEGER): INTEGER
			-- Code of character at byte index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
			is_encoded_first_byte: is_encoded_first_byte (i)
		local
			k, nb: INTEGER
			a_byte: CHARACTER
		do
			k := i
			a_byte := byte_item (k)
			Result := utf8.encoded_first_value (a_byte)
			nb := k + utf8.encoded_byte_count (a_byte) - 1
			from
				k := k + 1
			until
				k > nb
			loop
				a_byte := byte_item (k)
				Result := Result * 64 + utf8.encoded_next_value (a_byte)
				k := k + 1
			end
		ensure
			valid_item_code: unicode.valid_code (Result)
		end

	character_item_at_byte_index (i: INTEGER): CHARACTER
			-- Character at byte_index `i';
			-- '%U' is the unicode character at byte index
			-- `i' cannot fit into a CHARACTER
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
			is_encoded_first_byte: is_encoded_first_byte (i)
		local
			a_byte: CHARACTER
			a_code: INTEGER
		do
			a_byte := byte_item (i)
			inspect utf8.encoded_byte_count (a_byte)
			when 1 then
				Result := a_byte
			when 2 then
				a_code := utf8.encoded_first_value (a_byte)
				a_byte := byte_item (i + 1)
				a_code := a_code * 64 + utf8.encoded_next_value (a_byte)
				if a_code <= Platform.Maximum_character_code then
					Result := INTEGER_.to_character (a_code)
				else
						-- Overflow.
					Result := '%U'
				end
			else
				a_code := item_code_at_byte_index (i)
				if a_code <= Platform.Maximum_character_code then
					Result := INTEGER_.to_character (a_code)
				else
						-- Overflow.
					Result := '%U'
				end
			end
		ensure
			code_small_enough: item_code_at_byte_index (i) <= Platform.Maximum_character_code implies Result.code = item_code_at_byte_index (i)
			overflow: item_code_at_byte_index (i) > Platform.Maximum_character_code implies Result = '%U'
		end

	next_byte_index (i: INTEGER): INTEGER
			-- Byte index of unicode character after character
			-- at byte index `i'; Return 'byte_count + 1' if
			-- character at byte index `i' is the last character
			-- in the string
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
			is_encoded_first_byte: is_encoded_first_byte (i)
		do
			Result := i + utf8.encoded_byte_count (byte_item (i))
		ensure
			next_byte_index_large_enough: Result > i
			next_byte_index_small_enough: Result <= byte_count + 1
		end

	shifted_byte_index (i: INTEGER; n: INTEGER): INTEGER
			-- Byte index of unicode character `n' positions after
			-- character at byte index `i'; Return 'byte_count + 1'
			-- if no such character in the string
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
			is_encoded_first_byte: is_encoded_first_byte (i)
			n_positive: n >= 0
		local
			j: INTEGER
		do
			Result := i
			from
				j := 1
			until
				j > n
			loop
				Result := Result + utf8.encoded_byte_count (byte_item (Result))
				if Result > byte_count then
						-- Jump out of the loop.
					j := n + 1
				else
					j := j + 1
				end
			end
		ensure
			next_byte_index_large_enough: Result >= i
			next_byte_index_small_enough: Result <= byte_count + 1
		end

	byte_index (i: INTEGER): INTEGER
			-- Byte index of character at index `i'
		require
			valid_index: valid_index (i)
		local
			j: INTEGER
			a_byte: CHARACTER
		do
			if byte_count = count then
				Result := i
			else
				from
					if i < last_byte_index_input then
						j := 1
						Result := 1
					else
						j := last_byte_index_input
						Result := last_byte_index_result
					end
				invariant
					j <= i
				until
					j = i
				loop
					a_byte := byte_item (Result)
					Result := Result + utf8.encoded_byte_count (a_byte)
					j := j + 1
				end
			end
				-- Save cache.
			last_byte_index_input := i
			last_byte_index_result := Result
		ensure
			byte_index_large_enough: Result >= 1
			byte_index_small_enough: Result <= byte_count
			is_encoded_first_byte: is_encoded_first_byte (Result)
		end

	is_encoded_first_byte (i: INTEGER): BOOLEAN
			-- Is byte at index `i' the first byte of an encoded unicode character?
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
		do
			Result := utf8.is_encoded_first_byte (byte_item (i))
		end

feature {UC_STRING} -- Byte index cache

	last_byte_index_input: INTEGER
			-- Last `byte_index' requested
			-- (Cache for 'i := i + 1' iterations and similar)

	last_byte_index_result: INTEGER
			-- Last `byte_index' Result
			-- (Cache for 'i := i + 1' iterations and similar)

	reset_byte_index_cache
			-- Reset byte index (after write operation for example).
		do
			last_byte_index_input := 1
			last_byte_index_result := 1
		end

feature -- Implementation

	current_string: STRING
			-- Current string
		do
			Result := Current
		end

feature {UC_STRING_HANDLER} -- Implementation

	byte_item (i: INTEGER): CHARACTER
			-- Byte at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
		local
			old_count: INTEGER
		do
			old_count := count
			set_count (byte_count)
			Result := old_item (i)
			set_count (old_count)
		end

	put_byte (c: CHARACTER; i: INTEGER)
			-- Replace byte at index `i' by `c'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= byte_count
		local
			old_count: INTEGER
		do
			old_count := count
			set_count (byte_count)
			old_put (c, i)
			set_count (old_count)
		end

	resize_byte_storage (n: INTEGER)
			-- Resize space for `n' bytes.
			-- Do not lose previously stored bytes.
		require
			n_large_enough: n >= byte_capacity
		local
			old_count: INTEGER
		do
			if n > byte_capacity then
				resize (n)
				old_count := count
				set_count (n)
				old_set_count (n)
				set_count (old_count)
			end
		ensure
			byte_capacity_set: byte_capacity = n
		end

	move_bytes_right (i, offset: INTEGER)
			-- Move bytes at and after position `i'
			-- by `offset' positions to the right.
		require
			valid_index: 1 <= i and i <= byte_count + 1
			positive_offset: offset >= 0
			offset_small_enough: offset <= (byte_capacity - byte_count)
		local
			j, nb: INTEGER
			old_count: INTEGER
		do
			if last_byte_index_result > i then
				reset_byte_index_cache
			end
			from
				j := byte_count
				nb := i
				byte_count := byte_count + offset
				old_count := count
				set_count (byte_count)
			until
				j < nb
			loop
				old_put (old_item (j), j + offset)
				j := j - 1
			end
			set_count (old_count)
		ensure
			byte_count_set: byte_count = old byte_count + offset
		end

	move_bytes_left (i, offset: INTEGER)
			-- Move bytes at and after position `i'
			-- by `offset' positions to the left.
		require
			valid_index: 1 <= i and i <= byte_count + 1
			positive_offset: offset >= 0
			constraint: offset < i
		local
			j, nb: INTEGER
			old_count: INTEGER
		do
			if last_byte_index_result > i - offset then
				reset_byte_index_cache
			end
			from
				j := i
				nb := byte_count
				old_count := count
				set_count (byte_count)
			until
				j > nb
			loop
				old_put (old_item (j), j - offset)
				j := j + 1
			end
			set_count (old_count)
			byte_count := byte_count - offset
		ensure
			byte_count_set: byte_count = old byte_count - offset
		end

	set_byte_count (nb: INTEGER)
			-- Set `byte_count' to `nb'.
		require
			nb_large_enough: nb >= 0
			nb_small_enough: nb <= byte_capacity
		do
			if last_byte_index_result > nb then
				reset_byte_index_cache
			end
			byte_count := nb
		ensure
			byte_count_set: byte_count = nb
		end

	set_count (nb: INTEGER)
			-- Set `count' to `nb'.
		require
			nb_positive: nb >= 0
		do
			if last_byte_index_input > nb then
				reset_byte_index_cache
			end
			count := nb
		ensure
			count_set: count = nb
		end

feature {NONE} -- Implementation

	put_code_at_byte_index (a_code: INTEGER; b: INTEGER; i: INTEGER)
			-- Put unicode character of code `a_code'
			-- at byte index `i'. `b' is the number of
			-- bytes necessary to encode this character.
		require
			i_large_enough: i >= 1
			enough_space: (i + b - 1) <= byte_count
			valid_code: unicode.valid_code (a_code)
		local
			j: INTEGER
			a_byte: CHARACTER
			c: INTEGER
		do
			check
				valid_utf8: b = utf8.code_byte_count (a_code)
			end
			from
				c := a_code
				j := i + b - 1
			until
				j = i
			loop
				a_byte := INTEGER_.to_character ((c \\ 64) + 128)
				put_byte (a_byte, j)
				c := c // 64
				j := j - 1
			end
				-- Write first byte.
			inspect b
			when 1 then
					-- 0xxxxxxx
				a_byte := INTEGER_.to_character (c)
			when 2 then
					-- 110xxxxx
				a_byte := INTEGER_.to_character (c + 192)
			when 3 then
					-- 1110xxxx
				a_byte := INTEGER_.to_character (c + 224)
			when 4 then
					-- 11110xxx
				a_byte := INTEGER_.to_character (c + 240)
			when 5 then
					-- 111110xx
				a_byte := INTEGER_.to_character (c + 248)
			when 6 then
					-- 1111110x
				a_byte := INTEGER_.to_character (c + 252)
			end
			put_byte (a_byte, i)
		end

	put_character_at_byte_index (c: CHARACTER; b: INTEGER; i: INTEGER)
			-- Put character `c' at byte index `i'.
			-- `b' is the number of bytes necessary to encode `c'.
		require
			i_large_enough: i >= 1
			enough_space: (i + b - 1) <= byte_count
		local
			a_byte: CHARACTER
			a_code: INTEGER
		do
			check
				valid_utf8: b = utf8.character_byte_count (c)
			end
			inspect b
			when 1 then
					-- 0xxxxxxx
				put_byte (c, i)
			when 2 then
					-- 110xxxxx 10xxxxxx
				a_code := c.code
				a_byte := INTEGER_.to_character ((a_code // 64) + 192)
				put_byte (a_byte, i)
				a_byte := INTEGER_.to_character ((a_code \\ 64) + 128)
				put_byte (a_byte, i + 1)
			else
				put_code_at_byte_index (c.code, b, i)
			end
		end

	put_substring_at_byte_index (a_string: STRING_GENERAL; start_index, end_index, b: INTEGER; i: INTEGER)
			-- Put characters of `a_string' between `start_index'
			-- and `end_index' at byte index `i'. `b' is the number
			-- of bytes necessary to encode these characters.
		require
			a_string_not_void: a_string /= Void
			a_string_not_current: a_string /= Current
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
			i_large_enough: i >= 1
			enough_space: (i + b - 1) <= byte_count
		local
			j, nb: INTEGER
			k, z: INTEGER
			c: CHARACTER
			a_code: INTEGER
		do
			check
				valid_utf8: b = utf8.substring_byte_count (a_string, start_index, end_index)
			end
			if b > 0 then
				if attached {STRING_8} a_string as l_string_8 and then ANY_.same_types (a_string, dummy_string) then
					nb := end_index - start_index + 1
					if nb = b then
						k := i
						from
							j := start_index
						until
							j > end_index
						loop
							put_byte (l_string_8.item (j), k)
							k := k + 1
							j := j + 1
						end
					else
						k := i
						from
							j := start_index
						until
							j > end_index
						loop
							c := l_string_8.item (j)
							z := utf8.character_byte_count (c)
							put_character_at_byte_index (c, z, k)
							k := k + z
							j := j + 1
						end
					end
				elseif ANY_.same_types (a_string, Current) and attached {UC_STRING} a_string as a_uc_string then
					k := i
					j := a_uc_string.byte_index (start_index)
					nb := j + b - 1
					from
					until
						j > nb
					loop
						put_byte (a_uc_string.byte_item (j), k)
						k := k + 1
						j := j + 1
					end
				elseif attached {UC_UTF8_STRING} a_string as a_utf8_string then
					k := i
					j := a_utf8_string.byte_index (start_index)
					nb := j + b - 1
					from
					until
						j > nb
					loop
						put_byte (a_utf8_string.byte_item (j), k)
						k := k + 1
						j := j + 1
					end
				elseif attached {UC_STRING} a_string as a_uc_string then
					k := i
					j := a_uc_string.byte_index (start_index)
					nb := j + b - 1
					from
					until
						j > nb
					loop
						a_code := a_uc_string.item_code_at_byte_index (j)
						z := utf8.code_byte_count (a_code)
						put_code_at_byte_index (a_code, z, k)
						k := k + z
						j := a_uc_string.next_byte_index (j)
					end
				else
					k := i
					from
						j := start_index
					until
						j > end_index
					loop
						a_code := a_string.code (j).to_integer_32
						z := utf8.code_byte_count (a_code)
						put_code_at_byte_index (a_code, z, k)
						k := k + z
						j := j + 1
					end
				end
			end
		end

	dummy_string: STRING = ""
			-- Dummy string

	dummy_uc_string: UC_STRING
			-- Dummy Unicode string
		once
			create Result.make_empty
		ensure
			dummy_uc_string_not_void: Result /= Void
		end

feature {NONE} -- Inapplicable

	old_wipe_out
			-- Remove all characters.
			-- (ELKS 2001 STRING)
		do
				-- Preserve postcondition inherited from STRING.
			count := 0
			precursor
			wipe_out
		end

	old_clear_all
			-- Remove all characters.
		do
			wipe_out
		end

feature {UC_STRING} -- Inapplicable

	old_left_adjust
			-- Remove leading whitespace.
		local
			i, nb: INTEGER
		do
			nb := count
			from
				i := 1
			until
				i > nb
			loop
				inspect item (i)
				when ' ', '%T', '%R', '%N' then
					i := i + 1
				else
						-- Jump out of the loop.
					nb := 0
				end
			end
			remove_head (i - 1)
		end

	old_right_adjust
			-- Remove trailing whitespace.
		local
			i, nb: INTEGER
		do
			nb := count
			from
				i := 1
			until
				i > nb
			loop
				inspect item (nb)
				when ' ', '%T', '%R', '%N' then
					nb := nb - 1
				else
						-- Jump out of the loop.
					i := nb + 1
				end
			end
			keep_head (nb)
		end

	code (i: INTEGER): NATURAL_32
			-- Code at position `i'
		do
			Result := item_code (i).as_natural_32
		end

	index_of_code (c: like code; start_index: INTEGER): INTEGER
			-- Position of first occurrence of `c' at or after `start_index';
			-- 0 if none.
		do
			Result := index_of_item_code (c.as_integer_32, start_index)
		end

	put_code (v: like code; i: INTEGER)
			-- Put code `v' at position `i'.
		do
			put_item_code (v.as_integer_32, i)
		end

	append_code (c: like code)
			-- Append `c' at end.
		do
			append_item_code (c.as_integer_32)
		end

	has_code (c: like code): BOOLEAN
			-- Does string include `c'?
		do
			Result := has_item_code (c.as_integer_32)
		end

invariant

	non_negative_byte_count: byte_count >= 0
	byte_count_small_enough: byte_count <= byte_capacity
	count_small_enough: count <= byte_count

end
