note

	description:

		"Routines that ought to be in class STRING"

	remark: "[
		Unless otherwise specified in their preconditions,
		the features of this class can deal with UC_STRING
		whenever a STRING is expected.
	]"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_ROUTINES

inherit

	KL_IMPORTED_CHARACTER_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

	UC_IMPORTED_UNICODE_ROUTINES

	UC_IMPORTED_UTF16_ROUTINES

	UC_IMPORTED_UTF32_ROUTINES

feature -- Initialization

	make_from_string (s: READABLE_STRING_GENERAL): STRING
			-- Initialize from the character sequence of `s'.
			-- `s' is considered with its characters which do not fit
			-- in a CHARACTER replaced by a '%U'.
			-- (ELKS 2001 STRING)
			-- Note: Use this routine instead of 'STRING.make_from_string (s)'
			-- when `s' is of dynamic type other than STRING (e.g. UC_STRING)
			-- because the class STRING provided with the Eiffel compilers
			-- is not necessarily aware of the implementation of UC_STRING
			-- and this may lead to run-time errors or crashes.
		require
			s_not_void: s /= Void
		local
			i, j, nb: INTEGER
			l_code: NATURAL_32
			l_max_code: NATURAL_32
		do
			nb := s.count
			create Result.make (nb)
			if attached {STRING_8} Result then
				if attached {UC_STRING} s as uc_string then
					nb := uc_string.byte_count
					from
						j := 1
					until
						j > nb
					loop
						Result.append_character (uc_string.character_item_at_byte_index (j))
						j := uc_string.next_byte_index (j)
					end
				else
					l_max_code := {CHARACTER_8}.max_value.to_natural_32
					from
						i := 1
					until
						i > nb
					loop
						l_code := s.code (i)
						if l_code > l_max_code then
							l_code := 0
						end
						Result.append_code (l_code)
						i := i + 1
					end
				end
			else
				if attached {UC_STRING} s as uc_string then
					nb := uc_string.byte_count
					from
						j := 1
					until
						j > nb
					loop
						Result.append_code (uc_string.item_code_at_byte_index (j).to_natural_32)
						j := uc_string.next_byte_index (j)
					end
				else
					Result.append_string_general (s)
				end
			end
		ensure
			instance_free: class
			string_not_void: Result /= Void
			new_string: Result /= s
			string_type: Result.same_type ("")
			initialized: elks_same_string (Result, s)
		end

	make_buffer (n: INTEGER): STRING
			-- Create a new string containing `n' characters.
			-- (Not in ELKS 2001 STRING)
		require
			non_negative_n: n >= 0
		do
			create Result.make_filled ('%U', n)
		ensure
			instance_free: class
			string_not_void: Result /= Void
			string_type: Result.same_type ("")
			count_set: Result.count = n
		end

feature -- Status report

	has_substring (a_string, other: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `a_string' contain `other'? `a_string' and `other'
			-- are considered with their characters which do not fit
			-- in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use this feature instead of 'a_string.has_substring
			-- (other)' when `a_string' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING,
			-- because class STRING provided by the Eiffel compilers is
			-- not necessarily aware of the implementation of UC_STRING
			-- and this may lead to run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if other = a_string then
				Result := True
			elseif other.count <= a_string.count then
				Result := substring_index (a_string, other, 1) /= 0
			end
		ensure
			instance_free: class
			false_if_too_small: a_string.count < other.count implies not Result
			true_if_initial: (a_string.count >= other.count and then
				elks_same_string (other, a_string.substring (1, other.count))) implies Result
			recurse: (a_string.count >= other.count and then
				not elks_same_string (other, a_string.substring (1, other.count))) implies
				(Result = has_substring (a_string.substring (2, a_string.count), other))
		end

	is_decimal (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_string' only made up of characters 0-9?
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER_32
		do
			nb := a_string.count
			if nb = 0 then
				Result := False
			else
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					c := a_string.item (i)
					if c < '0' or c > '9' then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
		end

	is_integer_64 (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `a_string' represent a positive INTEGER_64?
		require
			a_string_not_void: a_string /= Void
		local
			i, j, k, l, m: INTEGER
			l_is_negative: BOOLEAN
			c, c2: CHARACTER_32
		do
			i := a_string.count
			if i > 0 then
				k := 1
				c := a_string.item (1)
				if c = '+' then
					k := k + 1
				elseif c = '-' then
					k := k + 1
					l_is_negative := True
				end
				from
					j := k
				until
					k /= j or j > i
				loop
					if a_string.item (j) = '0' then
						k := k + 1
					end
					j := j + 1
				end
				i := i - k + 1
				if i < 20 then
					Result := True
					from
						l := k
					until
						l > i + k - 1
					loop
						c := a_string.item (l)
						if c < '0' or c > '9' then
							Result := False
								-- Jump out of the loop.
							l := i + k + 1
						else
							l := l + 1
						end
					end
					if Result and i = 19 then
						from
							l := a_string.count
							m := l - i
						until
							not Result or k > l
						loop
							c := a_string.item (k)
							if l_is_negative then
								c2 := min_negative_integer_64_digits.item (k - m)
							else
								c2 := max_integer_64_digits.item (k - m)
							end
							if c < c2 then
								Result := True
								k := l + 1
							else
								Result := c = c2
								k := k + 1
							end
						end
					end
				end
			end
		ensure
			instance_free: class
		end

	is_hexadecimal (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Is a string made up of characters 0-9 or A-F or a-f?
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER_32
		do
			nb := a_string.count
			if nb = 0 then
				Result := False
			else
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					c := a_string.item (i)
					if (c < '0' or c > '9') and (c < 'a' or c > 'f') and (c < 'A' or c > 'F') then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
		end

	is_base64 (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Is a string made up of characters +, /, =, XML whitespace, 0-9 or A-Z or a-z?
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER_32
		do
			nb := a_string.count
			if nb = 0 then
				Result := False
			else
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					c := a_string.item (i)
					if
						(c < '0' or c > '9') and (c < 'a' or c > 'z') and (c < 'A' or c > 'Z')
						and c /= '+' and c /= '/' and c /= '='
						and c  /= ' ' and c /= '%T' and c /= '%R' and c /= '%N'
					then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
		end

feature -- Access

	new_empty_string (a_string: STRING; n: INTEGER): STRING
			-- New empty string with same dynamic type as `a_string';
			-- Try to allocate space for at least `n' characters.
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
			non_negative_n: n >= 0
		do
			if a_string.same_type (dummy_string) then
				create Result.make (n)
			elseif attached {UC_STRING} a_string as uc_string then
				check attached {STRING} uc_string.new_empty_string (n) as l_new_empty_string then
					Result := l_new_empty_string
				end
			else
				Result := a_string.twin
				Result.wipe_out
			end
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			same_type: Result.same_type (a_string)
			new_string_empty: Result.count = 0
		end

	new_empty_string_8 (a_string: STRING_8; n: INTEGER): STRING_8
			-- New empty string with same dynamic type as `a_string';
			-- Try to allocate space for at least `n' characters.
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
			non_negative_n: n >= 0
		do
			if a_string.same_type (dummy_string_8) then
				create Result.make (n)
			elseif attached {UC_STRING} a_string as uc_string then
				Result := uc_string.new_empty_string (n)
			else
				Result := a_string.twin
				Result.wipe_out
			end
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			same_type: Result.same_type (a_string)
			new_string_empty: Result.count = 0
		end

	to_utf16_be (a_string: READABLE_STRING_GENERAL): STRING_8
			-- New STRING_8 made up of bytes corresponding to
			-- the UTF-16BE representation of `a_string'.
			-- Characters which are not valid non-surrogate
			-- characters are replaced by a '%U'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb, a_code, a_high, a_low, a_surrogate: INTEGER
			l_natural_32_code: NATURAL_32
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.to_utf16_be
			else
				nb := a_string.count
				create Result.make (nb)
				from
					i := 1
				until
					i > nb
				loop
					l_natural_32_code := a_string.code (i)
					if unicode.valid_non_surrogate_natural_32_code (l_natural_32_code) then
						a_code := l_natural_32_code.to_integer_32
					else
						a_code := 0
					end
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
					i := i + 1
				end
			end
		ensure
			instance_free: class
			to_utf16_be_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			valid_utf16: utf16.valid_utf16 (Result)
		end

	to_utf16_le (a_string: READABLE_STRING_GENERAL): STRING_8
			-- New STRING_8 made up of bytes corresponding to
			-- the UTF-16LE representation of `a_string'.
			-- Characters which are not valid non-surrogate
			-- characters are replaced by a '%U'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb, a_code, a_high, a_low, a_surrogate: INTEGER
			l_natural_32_code: NATURAL_32
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.to_utf16_le
			else
				nb := a_string.count
				create Result.make (nb)
				from
					i := 1
				until
					i > nb
				loop
					l_natural_32_code := a_string.code (i)
					if unicode.valid_non_surrogate_natural_32_code (l_natural_32_code) then
						a_code := l_natural_32_code.to_integer_32
					else
						a_code := 0
					end
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
					i := i + 1
				end
			end
		ensure
			instance_free: class
			to_utf16_le_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			valid_utf16: utf16.valid_utf16 (utf16.bom_le + Result)
		end

	to_utf32_be (a_string: READABLE_STRING_GENERAL): STRING_8
			-- New STRING_8 made up of bytes corresponding to
			-- the UTF-32BE representation of `a_string'.
			-- Characters which are not valid non-surrogate
			-- characters are replaced by a '%U'.
		require
			a_string_not_void: a_string /= Void
		local
			i, j, k, l, m, nb, a_code: INTEGER
			l_natural_32_code: NATURAL_32
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.to_utf32_be
			else
				nb := a_string.count
				create Result.make (4 * nb)
				from
					i := 1
				until
					i > nb
				loop
					l_natural_32_code := a_string.code (i)
					if unicode.valid_non_surrogate_natural_32_code (l_natural_32_code) then
						a_code := l_natural_32_code.to_integer_32
					else
						a_code := 0
					end
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
					i := i + 1
				end
			end
		ensure
			instance_free: class
			to_utf32_be_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			valid_utf32: utf32.valid_utf32 (Result)
		end

	to_utf32_le (a_string: READABLE_STRING_GENERAL): STRING_8
			-- New STRING_8 made up of bytes corresponding to
			-- the UTF-32LE representation of `a_string'.
			-- Characters which are not valid non-surrogate
			-- characters are replaced by a '%U'.
		require
			a_string_not_void: a_string /= Void
		local
			i, j, k, l, m, nb, a_code: INTEGER
			l_natural_32_code: NATURAL_32
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.to_utf32_le
			else
				nb := a_string.count
				create Result.make (4 * nb)
				from
					i := 1
				until
					i > nb
				loop
					l_natural_32_code := a_string.code (i)
					if unicode.valid_non_surrogate_natural_32_code (l_natural_32_code) then
						a_code := l_natural_32_code.to_integer_32
					else
						a_code := 0
					end
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
					i := i + 1
				end
			end
		ensure
			instance_free: class
			to_utf32_le_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			valid_utf32: utf32.valid_utf32 (utf32.bom_le + Result)
		end

	substring_index (a_string, other: READABLE_STRING_GENERAL; start_index: INTEGER): INTEGER
			-- Index of first occurrence of `other' at or after `start_index' in
			-- `a_string'; 0 if none. `a_string' and `other' are considered with
			-- their characters which do not fit in a CHARACTER replaced by a '%U'.
			-- (ELKS 2001 STRING)
			-- Note: Use this feature instead of 'a_string.substring_index (other,
			-- start_index)' when `a_string' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= a_string.count + 1
		local
			i, j, nb: INTEGER
			a_code, other_code: NATURAL_32
			k, end_index: INTEGER
			found: BOOLEAN
			l_max_code: NATURAL_32
			other_count: INTEGER
		do
			if other = a_string then
				if start_index = 1 then
					Result := 1
				end
			else
				other_count := other.count
				if other_count = 0 then
					Result := start_index
				else
					end_index := a_string.count - other_count + 1
					if start_index <= end_index then
						if attached {UC_STRING} a_string as uc_string then
							Result := uc_string.substring_index (other, start_index)
						elseif attached {UC_STRING} other as other_unicode then
							if dummy_string.same_type (dummy_string_8) then
								l_max_code := {CHARACTER_8}.max_value.to_natural_32
							else
								l_max_code := {CHARACTER_32}.max_value
							end
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
									a_code := a_string.code (j)
									if a_code > l_max_code then
										a_code := 0
									end
									other_code := other_unicode.item_code_at_byte_index (i).to_natural_32
									if other_code > l_max_code then
										other_code := 0
									end
									if a_code /= other_code then
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
							Result := a_string.substring_index (other, start_index)
						end
					end
				end
			end
		ensure
			instance_free: class
			valid_result: Result = 0 or else (start_index <= Result and Result <= a_string.count - other.count + 1)
			zero_if_absent: (Result = 0) = not has_substring (a_string.substring (start_index, a_string.count), other)
			at_this_index: Result >= start_index implies elks_same_string (other, a_string.substring (Result, Result + other.count - 1))
			none_before: Result > start_index implies not has_substring (a_string.substring (start_index, Result + other.count - 2), other)
		end

	case_insensitive_hash_code (a_string: READABLE_STRING_GENERAL): INTEGER
			-- Hash code value of `a_string' which doesn't
			-- take case sensitivity into account
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
					-- The magic number 8388593 below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				Result := ((Result \\ 8388593) |<< 8) + a_string.item (i).upper.code
				i := i + 1
			end
			if Result < 0 then
				Result := -(Result + 1)
			end
		ensure
			instance_free: class
			hash_code_not_negative: Result >= 0
		end

	concat (a_string, other: READABLE_STRING_GENERAL): STRING
			-- New object which contains the characters of `a_string'
			-- followed by the characters of `other'.
			--
			-- When the mapping is STRING -> STRING_8:
			-- If `other' is of dynamic type UC_STRING or one of its
			-- descendants and `a_string' is not, then the dynamic type
			-- of the result is the same as the dynamic type of `other'.
			-- Otherwise the result is similar to 'a_string + other';
			-- Note: Use this routine instead of 'a_string + other' or
			-- 'a_string.append_string (other)' when `a_string'
			-- can be of dynamic type STRING and `other' of dynamic
			-- type other than STRING such as UC_STRING, because class
			-- STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
			--
			-- When the mapping is STRING -> STRING_32:
			-- Return a new object of type STRING_32, or of the same type
			-- as `a_string' if its dynamic type conforms to STRING_32.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if dummy_string.same_type (dummy_string_8) then
				Result := concat_string_8 (a_string, other)
			elseif attached {STRING_32} a_string as l_string_32 and then attached {STRING} (l_string_32 + as_readable_string_general_no_uc_string (other)) as l_result then
				Result := l_result
			elseif attached {STRING} (a_string.to_string_32 + as_readable_string_general_no_uc_string (other)) as l_string_32 then
				Result := l_string_32
			else
				Result := concat_string_8 (a_string, other)
			end
		ensure
			instance_free: class
			concat_not_void: Result /= Void
			concat_count: Result.count = a_string.count + other.count
			initial: same_string (Result.substring (1, a_string.count), a_string)
			final: same_string (Result.substring (a_string.count + 1, Result.count), other)
		end

	concat_string_8 (a_string, other: READABLE_STRING_GENERAL): STRING_8
			-- New object which contains the characters of `a_string'
			-- followed by the characters of `other'; If `other' is
			-- of dynamic type UC_STRING or one of its descendants and
			-- `a_string' is not, then the dynamic type of the result
			-- is the same as the dynamic type of `other'. Otherwise
			-- the result is similar to 'a_string + other';
			-- Note: Use this routine instead of 'a_string + other' or
			-- 'a_string.append_string (other)' when `a_string'
			-- can be of dynamic type STRING and `other' of dynamic
			-- type other than STRING such as UC_STRING, because class
			-- STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.gobo_plus_general (other)
			elseif attached {UC_STRING} other as uc_string then
				Result := uc_string.prefixed_string (a_string)
			elseif attached {READABLE_STRING_8} a_string as l_string_8 and attached {READABLE_STRING_8} other as l_other_8 then
				Result := l_string_8.to_string_8 + l_other_8
			else
				Result := (create {UC_STRING}.make_from_string_general (a_string)).gobo_plus_general (other)
			end
		ensure
			instance_free: class
			concat_not_void: Result /= Void
			concat_count: Result.count = a_string.count + other.count
			initial: same_string (Result.substring (1, a_string.count), a_string)
			final: same_string (Result.substring (a_string.count + 1, Result.count), other)
		end

feature -- Comparison

	elks_same_string (a_string, other: READABLE_STRING_GENERAL): BOOLEAN
			-- Do `a_string' and `other' have the same character sequence?
			-- `a_string' and `other' are considered with their characters
			-- which do not fit in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use this feature instead of 'a_string.same_string
			-- (other)' when `a_string' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING,
			-- because class STRING provided by the Eiffel compilers is
			-- not necessarily aware of the implementation of UC_STRING
			-- and this may lead to run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			l_c, l_other_c: NATURAL_32
			l_max_code: NATURAL_32
		do
			if other = a_string then
				Result := True
			elseif other.count /= a_string.count then
				Result := False
			elseif attached {UC_STRING} a_string as uc_string then
				Result := uc_string.same_string_general (other)
			elseif attached {UC_STRING} other as uc_string then
				Result := uc_string.same_string_general (a_string)
			elseif dummy_string.same_type (dummy_string_8) then
				l_max_code := {CHARACTER_8}.max_value.to_natural_32
				from
					i := 1
					nb := a_string.count
					Result := True
				until
					i > nb
				loop
					l_c := a_string.code (i)
					if l_c > l_max_code then
						l_c := 0
					end
					l_other_c := other.code (i)
					if l_other_c > l_max_code then
						l_other_c := 0
					end
					if l_c /= l_other_c then
						Result := False
						i := nb + 1
					else
						i := i + 1
					end
				end
			else
				Result := a_string.same_string (other)
			end
		ensure
			instance_free: class
			definition_string_32: ("").same_type ({STRING_32} "") implies Result = same_string (a_string, other)
			string_8: (("").same_type ({STRING_8} "") and attached {READABLE_STRING_8} a_string as a_string_8 and attached {READABLE_STRING_8} other as other_8) implies Result = (a_string_8.string.is_equal (other_8.string))
		end

	same_string (a_string, other: READABLE_STRING_GENERAL): BOOLEAN
			-- Do `a_string' and `other' have the same unicode character sequence?
			-- (Not in ELKS 2001 STRING)
			-- Note: the difference with `elks_same_string' is that here the
			-- implementation uses STRING.item_code instead of STRING.item
			-- and hence characters which have different codes are not
			-- considered equal even if they do not fit into a CHARACTER.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if other = a_string then
				Result := True
			elseif other.count /= a_string.count then
				Result := False
			elseif attached {UC_STRING} a_string as uc_string then
				Result := uc_string.same_unicode_string (other)
			elseif attached {UC_STRING} other as uc_string then
				Result := uc_string.same_unicode_string (a_string)
			else
				Result := a_string.same_string (other)
			end
		ensure
			instance_free: class
			definition: Result = (a_string.count = other.count and then
				(a_string.count > 0 implies (a_string.code (1) = other.code (1) and
				(a_string.count >= 2 implies same_string (a_string.substring (2, a_string.count), other.substring (2, a_string.count))))))
			elks_same_string: Result implies elks_same_string (a_string, other)
		end

	same_case_insensitive (s1, s2: READABLE_STRING_GENERAL): BOOLEAN
			-- Are `s1' and `s2' made up of the same
			-- characters (case insensitive)?
			-- (Not in ELKS 2001 STRING)
		require
			s1_not_void: s1 /= Void
			s2_not_void: s2 /= Void
		local
			c1, c2: CHARACTER_32
			a_code1, a_code2: NATURAL_32
			i, nb: INTEGER
		do
			if s1 = s2 then
				Result := True
			elseif s1.count = s2.count then
				nb := s1.count
				Result := True
				if attached {UC_STRING} s1 or attached {UC_STRING} s2 then
					from
						i := 1
					until
						i > nb
					loop
						a_code1 := s1.code (i)
						a_code2 := s2.code (i)
						if a_code1 = a_code2 then
							i := i + 1
						elseif not unicode.valid_non_surrogate_natural_32_code (a_code1) then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						elseif not unicode.valid_non_surrogate_natural_32_code (a_code2) then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						elseif unicode.lower_code (a_code1.to_integer_32) = unicode.lower_code (a_code2.to_integer_32) then
							i := i + 1
						else
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
					end
				else
					from
						i := 1
					until
						i > nb
					loop
						c1 := s1.item (i)
						c2 := s2.item (i)
						if c1 = c2 then
							i := i + 1
						elseif c1.lower = c2.lower then
							i := i + 1
						else
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
					end
				end
			end
		ensure
			instance_free: class
		end

	is_less (a_string, other: STRING): BOOLEAN
			-- Is `a_string' considered less than `other'?
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			Result := three_way_comparison (a_string, other) = - 1
		ensure
			instance_free: class
		end

	three_way_comparison (a_string, other: READABLE_STRING_GENERAL): INTEGER
			-- If `a_string' equal to `other', 0;
			-- if smaller, -1; if greater, 1
			-- (ELKS 2001 STRING)
			-- Note: there is a bug in the specification of the
			-- contracts of `three_way_comparison' from class
			-- COMPARABLE. This routine cannot satisfy its
			-- postconditions if `other' is not of the same type
			-- as `Current' because the postcondition uses `is_equal'
			-- and `is_equal' has a postcondition inherited from
			-- ANY which says if it returns true then `other' has
			-- the same type as `Current'. The current feature
			-- `three_way_comparison' in class KL_STRING_ROTUINES
			-- solves this problem and make the comparison
			-- polymorphically safe by changing the signature
			-- from 'like Current' to 'STRING' and by using
			-- `STRING_.same_string' instead of `is_equal' in
			-- its postcondition.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		local
			i, nb, nb1, nb2: INTEGER
			c1, c2: NATURAL_32
			found: BOOLEAN
		do
			if other = a_string then
				Result := 0
			elseif attached {UC_STRING} a_string as uc_string then
				Result := uc_string.three_way_unicode_comparison (other)
			elseif attached {UC_STRING} other as uc_string then
				Result := -uc_string.three_way_unicode_comparison (a_string)
			else
				nb1 := a_string.count
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
					c1 := a_string.code (i)
					c2 := other.code (i)
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
			instance_free: class
			equal_zero: (Result = 0) = same_string (a_string, other)
--			smaller_negative: (Result = -1) = (a_string is less than other)
--			greater_positive: (Result = 1) = (a_string is greater than other)
		end

	three_way_case_insensitive_comparison (a_string, other: READABLE_STRING_GENERAL): INTEGER
			-- If `a_string' equal to `other', 0; if smaller, -1; if greater, 1
			-- (case insensitive comparison)
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			Result := three_way_lower_case_comparison (a_string, other)
		ensure
			instance_free: class
		end

	three_way_lower_case_comparison (a_string, other: READABLE_STRING_GENERAL): INTEGER
			-- If `a_string' equal to `other', 0; if smaller, -1; if greater, 1
			-- (case insensitive comparison, consider letters as lower-case)
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		local
			i, nb, nb1, nb2: INTEGER
			c1, c2: CHARACTER_32
			d1, d2: NATURAL_32
			found: BOOLEAN
		do
			if other = a_string then
				Result := 0
			elseif attached {UC_STRING} a_string or attached {UC_STRING} other then
				nb1 := a_string.count
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
					d1 := a_string.code (i)
					d2 := other.code (i)
					if d1 = d2 then
						i := i + 1
					else
						if unicode.valid_non_surrogate_natural_32_code (d1) then
							d1 := unicode.lower_code (d1.to_integer_32).to_natural_32
						end
						if unicode.valid_non_surrogate_natural_32_code (d2) then
							d2 := unicode.lower_code (d2.to_integer_32).to_natural_32
						end
						if d1 = d2 then
							i := i + 1
						elseif d1 < d2 then
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
				end
				if not found then
					if nb1 < nb2 then
						Result := -1
					elseif nb1 /= nb2 then
						Result := 1
					end
				end
			else
				nb1 := a_string.count
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
					c1 := a_string.item (i)
					c2 := other.item (i)
					if c1 = c2 then
						i := i + 1
					else
						c1 := c1.lower
						c2 := c2.lower
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
			instance_free: class
		end

	three_way_upper_case_comparison (a_string, other: STRING): INTEGER
			-- If `a_string' equal to `other', 0; if smaller, -1; if greater, 1
			-- (case insensitive comparison, consider letters as upper-case)
			-- (Not in ELKS 2001 STRING)
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		local
			i, nb, nb1, nb2: INTEGER
			c1, c2: CHARACTER_32
			d1, d2: NATURAL_32
			found: BOOLEAN
		do
			if other = a_string then
				Result := 0
			elseif attached {UC_STRING} a_string or attached {UC_STRING} other then
				nb1 := a_string.count
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
					d1 := a_string.code (i)
					d2 := other.code (i)
					if d1 = d2 then
						i := i + 1
					else
						if unicode.valid_non_surrogate_natural_32_code (d1) then
							d1 := unicode.upper_code (d1.to_integer_32).to_natural_32
						end
						if unicode.valid_non_surrogate_natural_32_code (d2) then
							d2 := unicode.upper_code (d2.to_integer_32).to_natural_32
						end
						if d1 = d2 then
							i := i + 1
						elseif d1 < d2 then
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
				end
				if not found then
					if nb1 < nb2 then
						Result := -1
					elseif nb1 /= nb2 then
						Result := 1
					end
				end
			else
				nb1 := a_string.count
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
					c1 := a_string.item (i)
					c2 := other.item (i)
					if c1 = c2 then
						i := i + 1
					else
						c1 := c1.upper
						c2 := c2.upper
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
			instance_free: class
		end

feature -- Duplication

	cloned_string (a_string: STRING): STRING
			-- Clone of `a_string'
		require
			a_string_not_void: a_string /= Void
		do
			Result := a_string.twin
		ensure
			instance_free: class
			cloned_not_void: Result /= Void
			same_type: Result.same_type (a_string)
			is_equal: Result.is_equal (a_string)
		end

feature -- Element change

	appended_string (a_string, other: READABLE_STRING_GENERAL): STRING
			-- When the mapping is STRING -> STRING_8:
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' followed
			-- by the characters of `other'. Otherwise append the
			-- characters of `other' to `a_string' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.append_string (other)'
			-- when `a_string' can be of dynamic type STRING and `other'
			-- of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
			--
			-- When the mapping is STRING -> STRING_32:
			-- If the dynamic type of `a_string' conforms to STRING_32, then
			-- append the characters of `other' to `a_string' and return `a_string'.
			-- Otherwise return a new object of type STRING_32 which contains the
			-- characters of `a_string' followed by the characters of `other'.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if dummy_string.same_type (dummy_string_8) then
				Result := appended_string_8 (a_string, other)
			elseif attached {STRING} a_string as l_string_32 then
				l_string_32.append_string_general (as_readable_string_general_no_uc_string (other))
				Result := l_string_32
			elseif attached {STRING} a_string.to_string_32 as l_string_32 then
				l_string_32.append_string_general (as_readable_string_general_no_uc_string (other))
				Result := l_string_32
			else
				Result := appended_string_8 (a_string, other)
			end
		ensure
			instance_free: class
			append_not_void: Result /= Void
			new_count: Result.count = old a_string.count + old other.count
			initial: same_string (Result.substring (1, old a_string.count), old a_string.twin)
			final: same_string (Result.substring (old a_string.count + 1, Result.count), old other.twin)
		end

	appended_string_8 (a_string, other: READABLE_STRING_GENERAL): STRING_8
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' followed
			-- by the characters of `other'. Otherwise append the
			-- characters of `other' to `a_string' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.append_string (other)'
			-- when `a_string' can be of dynamic type STRING and `other'
			-- of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				uc_string.append_string_general (other)
				Result := uc_string
			elseif attached {UC_STRING} other as uc_string then
				Result := concat_string_8 (a_string, other)
			elseif attached {STRING_8} a_string as l_string_8 and attached {READABLE_STRING_8} other as l_other_8 then
				l_string_8.append_string (l_other_8)
				Result := l_string_8
			else
				Result := concat_string_8 (a_string, other)
			end
		ensure
			instance_free: class
			append_not_void: Result /= Void
			new_count: Result.count = old a_string.count + old other.count
			initial: same_string (Result.substring (1, old a_string.count), old a_string.twin)
			final: same_string (Result.substring (old a_string.count + 1, Result.count), old other.twin)
		end

	appended_substring (a_string, other: READABLE_STRING_GENERAL; s, e: INTEGER): STRING
			-- When the mapping is STRING -> STRING_8:
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' followed by
			-- the characters of `other' between indexes `s' and `e'.
			-- Otherwise append the characters of `other' between `s'
			-- and `e' to `a_string' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.append_string
			-- (other.substring (s, e)' when `a_string' can be of dynamic
			-- type STRING and `other' of dynamic type other than STRING
			-- such as UC_STRING, because class STRING provided by the
			-- Eiffel compilers is not necessarily aware of the
			-- implementation of UC_STRING and this may lead to run-time
			-- errors or crashes.
			--
			-- When the mapping is STRING -> STRING_32:
			-- If the dynamic type of `a_string' conforms to STRING_32, then
			-- append the characters of `other' between indexes `s' and `e'
			-- to `a_string' and return `a_string'. Otherwise return a new object
			-- of type STRING_32 which contains the characters of `a_string'
			-- followed by the characters of `other' between indexes `s' and `e'.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= other.count
			valid_interval: s <= e + 1
		do
			if dummy_string.same_type (dummy_string_8) then
				Result := appended_substring_8 (a_string, other, s, e)
			elseif attached {STRING} a_string as l_string_32 then
				l_string_32.append_substring_general (as_readable_string_general_no_uc_string (other), s, e)
				Result := l_string_32
			elseif attached {STRING} a_string.to_string_32 as l_string_32 then
				l_string_32.append_substring_general (as_readable_string_general_no_uc_string (other), s, e)
				Result := l_string_32
			else
				Result := appended_substring_8 (a_string, other, s, e)
			end
		ensure
			instance_free: class
			append_not_void: Result /= Void
			new_count: Result.count = old a_string.count + e - s + 1
			initial: same_string (Result.substring (1, old a_string.count), old a_string.twin)
			final: same_string (Result.substring (old a_string.count + 1, Result.count), old other.substring (s, e))
		end

	appended_substring_8 (a_string, other: READABLE_STRING_GENERAL; s, e: INTEGER): STRING_8
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' followed by
			-- the characters of `other' between indexes `s' and `e'.
			-- Otherwise append the characters of `other' between `s'
			-- and `e' to `a_string' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.append_string
			-- (other.substring (s, e)' when `a_string' can be of dynamic
			-- type STRING and `other' of dynamic type other than STRING
			-- such as UC_STRING, because class STRING provided by the
			-- Eiffel compilers is not necessarily aware of the
			-- implementation of UC_STRING and this may lead to run-time
			-- errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= other.count
			valid_interval: s <= e + 1
		local
			l_uc_string: UC_STRING
		do
			if attached {UC_STRING} a_string as uc_string then
				uc_string.gobo_append_substring (other, s, e)
				Result := uc_string
			elseif attached {UC_STRING} other as l_other_uc_string then
				l_uc_string := l_other_uc_string.new_empty_string (a_string.count + e - s + 1)
				l_uc_string.append_string_general (a_string)
				l_uc_string.gobo_append_substring (other, s, e)
				Result := l_uc_string
			elseif attached {STRING_8} a_string as l_string_8 and attached {READABLE_STRING_8} other as l_other_8 then
				l_string_8.append_substring (l_other_8, s, e)
				Result := l_string_8
			else
				create l_uc_string.make_from_string_general (a_string)
				l_uc_string.gobo_append_substring (other, s, e)
				Result := l_uc_string
			end
		ensure
			instance_free: class
			append_not_void: Result /= Void
			new_count: Result.count = old a_string.count + e - s + 1
			initial: same_string (Result.substring (1, old a_string.count), old a_string.twin)
			final: same_string (Result.substring (old a_string.count + 1, Result.count), old other.substring (s, e))
		end

	append_substring_to_string (a_string: STRING_GENERAL; other: READABLE_STRING_GENERAL; s, e: INTEGER)
			-- Append substring of `other' between indexes
			-- `s' and `e' at end of `a_string'.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			valid_codes: across s |..| e as i all a_string.valid_code (other.code (i.item)) end
			s_large_enough: s >= 1
			e_small_enough: e <= other.count
			valid_interval: s <= e + 1
		local
			j: INTEGER
		do
			if attached {UC_STRING} a_string as uc_string then
				uc_string.gobo_append_substring (other, s, e)
			else
				from
					j := s
				until
					j > e
				loop
					a_string.append_code (other.code (j))
					j := j + 1
				end
			end
		ensure
			instance_free: class
			appended: a_string.to_string_32.is_equal (old a_string.twin.to_string_32 + old other.substring (s, e).to_string_32)
		end

	replaced_substring (a_string, other: READABLE_STRING_GENERAL; start_index, end_index: INTEGER): STRING
			-- When the mapping is STRING -> STRING_8:
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' from which
			-- the substring from `start_index' to `end_index', inclusive,
			-- has been replaced with `other'. Otherwise replace the
			-- substring from `start_index' to `end_index', inclusive,
			-- in `a_string' with `other' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.replace_substring (other)'
			-- when `a_string' can be of dynamic type STRING and `other'
			-- of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
			--
			-- When the mapping is STRING -> STRING_32:
			-- If the dynamic type of `a_string' conforms to STRING_32, then
			-- replace its characters between indexes `start_index' and `end_index'
			-- with those of `other' and return `a_string'. Otherwise return a
			-- new object  of type STRING_32 which contains the characters of
			-- `a_string' from which the substring from `start_index' to `end_index',
			-- inclusive, has been replaced with the characters of `other'.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		local
			l_result: STRING_32
		do
			if dummy_string.same_type (dummy_string_8) then
				Result := replaced_substring_8 (a_string, other, start_index, end_index)
			else
				if attached {STRING_32} a_string as l_string_32 then
					l_result := l_string_32
				else
					l_result := a_string.to_string_32
				end
				if attached {READABLE_STRING_32} as_readable_string_general_no_uc_string (other) as l_other_32 then
					l_result.replace_substring (l_other_32, start_index, end_index)
				else
					l_result.replace_substring (other.to_string_32, start_index, end_index)
				end
				if attached {STRING} l_result as l_string_32 then

					Result := l_string_32
				else
					Result := replaced_substring_8 (a_string, other, start_index, end_index)
				end
			end
		ensure
			instance_free: class
			replaced_substring_not_void: Result /= Void
			replaced: same_string (Result, old (appended_string (appended_string (a_string.substring (1, start_index - 1), other), a_string.substring (end_index + 1, a_string.count))))
		end

	replaced_substring_8 (a_string, other: READABLE_STRING_GENERAL; start_index, end_index: INTEGER): STRING_8
			-- If the dynamic type of `other' is UC_STRING or one of
			-- its descendants and `a_string' is not, then return a
			-- new object with the same dynamic type as `other' and
			-- which contains the characters of `a_string' from which
			-- the substring from `start_index' to `end_index', inclusive,
			-- has been replaced with `other'. Otherwise replace the
			-- substring from `start_index' to `end_index', inclusive,
			-- in `a_string' with `other' and return `a_string'.
			-- Note: Use this routine instead of 'a_string.replace_substring (other)'
			-- when `a_string' can be of dynamic type STRING and `other'
			-- of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may
			-- lead to run-time errors or crashes.
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		do
			if attached {UC_STRING} a_string as uc_string then
				uc_string.replace_substring_by_string (other, start_index, end_index)
				Result := uc_string
			elseif attached {STRING_8} a_string as l_string_8 and attached {READABLE_STRING_8} other as l_other_8 then
				l_string_8.replace_substring (l_other_8, start_index, end_index)
				Result := l_string_8
			else
				Result := appended_string_8 (appended_string_8 (a_string.substring (1, start_index - 1), other), a_string.substring (end_index + 1, a_string.count))
			end
		ensure
			instance_free: class
			replaced_substring_not_void: Result /= Void
			replaced: same_string (Result, old (appended_string_8 (appended_string_8 (a_string.substring (1, start_index - 1), other), a_string.substring (end_index + 1, a_string.count))))
		end

	replaced_all_substrings (a_text, a_old, a_new: READABLE_STRING_GENERAL): STRING
			-- Copy of `a_text' for which each occurrence of `a_old' has been replaced
			-- by `a_new'; `a_text' if no occurrence could be found
		require
			a_text_not_void: a_text /= Void
			a_old_not_void: a_old /= Void
			a_new_not_void: a_new /= Void
		local
			a_text_count: INTEGER
			a_old_count: INTEGER
			a_start: INTEGER
			a_end: INTEGER
			l_string_8: STRING_8
		do
			a_start := 1
			a_end := substring_index (a_text, a_old, a_start)
			if a_end > 0 then
				a_text_count := a_text.count
				a_old_count := a_old.count
				if attached {STRING} a_text as l_string then
					Result := new_empty_string (l_string, a_text_count)
				else
					create Result.make (a_text_count)
				end
				from
				until
					a_end = 0
				loop
					Result := appended_substring (Result, a_text, a_start, a_end - 1)
					Result := appended_string (Result, a_new)
					a_start := a_end + a_old_count
					if a_start > a_text_count then
							-- Jump out of the loop.
						a_end := 0
					else
						a_end := substring_index (a_text, a_old, a_start)
					end
				end
				Result := appended_substring (Result, a_text, a_start, a_text_count)
			else
				check
					not_found: a_end = 0
				end
				if attached {STRING} a_text as l_string then
					Result := l_string
				elseif not dummy_string.same_type (dummy_string_8) and then attached {STRING} a_text.to_string_32 as l_string_32 then
					Result := l_string_32
				else
					create {UC_STRING} l_string_8.make_from_string_general (a_text)
					Result := l_string_8
				end
			end
		ensure
			instance_free: class
			replaced_all_substrings_not_void: Result /= Void
		end

	replaced_all_substrings_8 (a_text, a_old, a_new: READABLE_STRING_GENERAL): STRING_8
			-- Copy of `a_text' for which each occurrence of `a_old' has been replaced
			-- by `a_new'; `a_text' if no occurrence could be found
		require
			a_text_not_void: a_text /= Void
			a_old_not_void: a_old /= Void
			a_new_not_void: a_new /= Void
		local
			a_text_count: INTEGER
			a_old_count: INTEGER
			a_start: INTEGER
			a_end: INTEGER
		do
			a_start := 1
			a_end := substring_index (a_text, a_old, a_start)
			if a_end > 0 then
				a_text_count := a_text.count
				a_old_count := a_old.count
				if attached {STRING_8} a_text as l_string_8 then
					Result := new_empty_string_8 (l_string_8, a_text_count)
				else
					create Result.make (a_text_count)
				end
				from
				until
					a_end = 0
				loop
					Result := appended_substring_8 (Result, a_text, a_start, a_end - 1)
					Result := appended_string_8 (Result, a_new)
					a_start := a_end + a_old_count
					if a_start > a_text_count then
							-- Jump out of the loop.
						a_end := 0
					else
						a_end := substring_index (a_text, a_old, a_start)
					end
				end
				Result := appended_substring_8 (Result, a_text, a_start, a_text_count)
			else
				check
					not_found: a_end = 0
				end
				if attached {STRING_8} a_text as l_string_8 then
					Result := l_string_8
				else
					create {UC_STRING} Result.make_from_string_general (a_text)
				end
			end
		ensure
			instance_free: class
			replaced_all_substrings_not_void: Result /= Void
		end

	replaced_first_substring (a_text, a_old, a_new: READABLE_STRING_GENERAL): STRING
			-- Copy of `a_text' for which first occurrence of `a_old' has been replaced
			-- by `a_new'; `a_text' if no occurrence could be found
		require
			a_text_not_void: a_text /= Void
			a_old_not_void: a_old /= Void
			a_new_not_void: a_new /= Void
		local
			a_text_count: INTEGER
			a_old_count: INTEGER
			a_end: INTEGER
			l_string_8: STRING_8
		do
			a_end := substring_index (a_text, a_old, 1)
			if a_end > 0 then
				a_text_count := a_text.count
				a_old_count := a_old.count
				if attached {STRING} a_text as l_string then
					Result := new_empty_string (l_string, a_text_count - a_old_count + a_new.count)
				else
					create Result.make (a_text_count - a_old_count + a_new.count)
				end
				Result := appended_substring (Result, a_text, 1, a_end - 1)
				Result := appended_string (Result, a_new)
				Result := appended_substring (Result, a_text, a_end + a_old_count, a_text_count)
			else
				check
					not_found: a_end = 0
				end
				if attached {STRING} a_text as l_string then
					Result := l_string
				elseif not dummy_string.same_type (dummy_string_8) and then attached {STRING} a_text.to_string_32 as l_string_32 then
					Result := l_string_32
				else
					create {UC_STRING} l_string_8.make_from_string_general (a_text)
					Result := l_string_8
				end
			end
		ensure
			instance_free: class
			replaced_first_substring_not_void: Result /= Void
		end

	replaced_first_substring_8 (a_text: READABLE_STRING_GENERAL; a_old, a_new: READABLE_STRING_GENERAL): STRING_8
			-- Copy of `a_text' for which first occurrence of `a_old' has been replaced
			-- by `a_new'; `a_text' if no occurrence could be found
		require
			a_text_not_void: a_text /= Void
			a_old_not_void: a_old /= Void
			a_new_not_void: a_new /= Void
		local
			a_text_count: INTEGER
			a_old_count: INTEGER
			a_end: INTEGER
		do
			a_end := substring_index (a_text, a_old, 1)
			if a_end > 0 then
				a_text_count := a_text.count
				a_old_count := a_old.count
				if attached {STRING_8} a_text as l_string_8 then
					Result := new_empty_string_8 (l_string_8, a_text_count - a_old_count + a_new.count)
				else
					create Result.make (a_text_count - a_old_count + a_new.count)
				end
				Result := appended_substring_8 (Result, a_text, 1, a_end - 1)
				Result := appended_string_8 (Result, a_new)
				Result := appended_substring_8 (Result, a_text, a_end + a_old_count, a_text_count)
			else
				check
					not_found: a_end = 0
				end
				if attached {STRING_8} a_text as l_string_8 then
					Result := l_string_8
				else
					create {UC_STRING} Result.make_from_string_general (a_text)
				end
			end
		ensure
			instance_free: class
			replaced_first_substring_not_void: Result /= Void
		end

feature -- Conversion

	as_readable_string_8_no_uc_string (a_string: READABLE_STRING_8): READABLE_STRING_8
			-- UTF encoding version of `a_string' if it is a descendant
			-- of UC_STRING, `a_string' otherwise
		require
			a_string_not_void: a_string /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.as_string
			else
				Result := a_string
			end
		ensure
			instance_free: class
			as_readable_string_8_no_uc_string_not_void: Result /= Void
			aliasing: not attached {UC_STRING} a_string implies Result = a_string
		end

	as_string_8_no_uc_string (a_string: STRING_8): STRING_8
			-- UTF encoding version of `a_string' if it is a descendant
			-- of UC_STRING, `a_string' otherwise
		require
			a_string_not_void: a_string /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.as_string
			else
				Result := a_string
			end
		ensure
			instance_free: class
			as_string_8_no_uc_string_not_void: Result /= Void
			aliasing: not attached {UC_STRING} a_string implies Result = a_string
		end

	as_string_no_uc_string (a_string: STRING): STRING
			-- UTF encoding version of `a_string' if it is a descendant
			-- of UC_STRING, `a_string' otherwise
		require
			a_string_not_void: a_string /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				if not dummy_string.same_type (dummy_string_8) and then attached {STRING} uc_string.to_string_32 as l_string_32 then
					Result := l_string_32
				else
					Result := uc_string.as_string
				end
			else
				Result := a_string
			end
		ensure
			instance_free: class
			as_string_no_uc_string_not_void: Result /= Void
			aliasing: not attached {UC_STRING} a_string implies Result = a_string
		end

	as_readable_string_general_no_uc_string (a_string: READABLE_STRING_GENERAL): READABLE_STRING_GENERAL
			-- UTF encoding version of `a_string' if it is a descendant
			-- of UC_STRING, `a_string' otherwise
		require
			a_string_not_void: a_string /= Void
		do
			if attached {UC_STRING} a_string as uc_string then
				if dummy_string.same_type (dummy_string_8) then
					Result := uc_string.as_string
				else
					Result := uc_string.to_string_32
				end
			else
				Result := a_string
			end
		ensure
			instance_free: class
			as_readable_string_general_no_uc_string_not_void: Result /= Void
			aliasing: not attached {UC_STRING} a_string implies Result = a_string
		end

	as_string (a_string: READABLE_STRING_8): STRING_8
			-- String version of `a_string';
			-- Return `a_string' if it is of dynamic type STRING,
			-- return the UTF encoding version if it is a descendant
			-- of UC_STRING, return 'string (a_string)' otherwise.
		require
			a_string_not_void: a_string /= Void
		do
			if attached {STRING_8} a_string as l_string_8 and then a_string.same_type (dummy_string_8) then
				Result := l_string_8
			elseif attached {UC_STRING} a_string as uc_string then
				Result := uc_string.as_string
			else
				Result := a_string.string
			end
		ensure
			instance_free: class
			as_string_not_void: Result /= Void
			string_type: Result.same_type( {STRING_8} "")
			aliasing: a_string.same_type ({STRING_8} "") implies Result = a_string
		end

	hexadecimal_to_integer (a_string: READABLE_STRING_GENERAL): INTEGER
			-- Convert hexadecimal number string to integer;
			-- (Not in ELKS 2001 STRING)
			-- Note: Do not take overflow into account.
		require
			not_void: a_string /= Void
			hexadecimal: is_hexadecimal (a_string)
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
					-- Shift previous result.
				Result := Result * 16
					-- Add current digit
					-- (inspect independent of character set)
				inspect a_string.item (i)
				when '0' then
						-- Do nothing.
				when '1' then
					Result := Result + 1
				when '2' then
					Result := Result + 2
				when '3' then
					Result := Result + 3
				when '4' then
					Result := Result + 4
				when '5' then
					Result := Result + 5
				when '6' then
					Result := Result + 6
				when '7' then
					Result := Result + 7
				when '8' then
					Result := Result + 8
				when '9' then
					Result := Result + 9
				when 'a', 'A' then
					Result := Result + 10
				when 'b', 'B' then
					Result := Result + 11
				when 'c', 'C' then
					Result := Result + 12
				when 'd', 'D' then
					Result := Result + 13
				when 'e', 'E' then
					Result := Result + 14
				when 'f', 'F' then
					Result := Result + 15
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	to_integer_64 (a_string: READABLE_STRING_GENERAL): INTEGER_64
			-- `a_string' as `INTEGER_64'
		require
			a_string_not_void: a_string /= Void
			integer_64_string: is_integer_64 (a_string)
		do
			Result := a_string.to_integer_64
		ensure
			instance_free: class
		end

feature -- Removal

	left_adjust (a_string: STRING_GENERAL)
			-- Remove leading whitespace from `a_string'.
			-- (Not in ELKS 2001 STRING)
			-- Note: SE 1.1 removes the following characters: ' ';
			-- ISE 5.4 removes the following characters: ' ', '%T', '%R', '%N';
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
				inspect a_string.item (i)
				when ' ', '%T', '%R', '%N' then
					i := i + 1
				else
						-- Jump out of the loop.
					nb := 0
				end
			end
			a_string.remove_head (i - 1)
		ensure
			instance_free: class
			left_adjusted: (a_string.count /= 0) implies
				((a_string.item (1) /= ' ') and
				(a_string.item (1) /= '%T') and
				(a_string.item (1) /= '%R') and
				(a_string.item (1) /= '%N'))
		end

	right_adjust (a_string: STRING_GENERAL)
			-- Remove trailing whitespace from `a_string'.
			-- (Not in ELKS 2001 STRING)
			-- Note: SE 1.1 removes the following characters: ' ';
			-- ISE 5.4 removes the following characters: ' ', '%T', '%R', '%N';
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
				inspect a_string.item (nb)
				when ' ', '%T', '%R', '%N' then
					nb := nb - 1
				else
						-- Jump out of the loop.
					i := nb + 1
				end
			end
			a_string.keep_head (nb)
		ensure
			instance_free: class
			right_adjusted: (a_string.count /= 0) implies
				((a_string.item (a_string.count) /= ' ') and
				(a_string.item (a_string.count) /= '%T') and
				(a_string.item (a_string.count) /= '%R') and
				(a_string.item (a_string.count) /= '%N'))
		end

	wipe_out (a_string: STRING_GENERAL)
			-- Remove all characters in `a_string'.
			-- Do not discard allocated memory (i.e. do not
			-- change capacity) when allowed by the underlying
			-- Eiffel compiler.
			-- Note: currently ISE and SE will not change capacity.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.keep_head (0)
		ensure
			instance_free: class
			wiped_out: a_string.count = 0
		end

	prune_all_trailing (a_string: STRING_GENERAL; c: CHARACTER_32)
			-- Remove all trailing occurrences of `c' in `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			from
			until
				a_string.is_empty or else a_string.item (a_string.count) /= c
			loop
				a_string.remove_tail (1)
			end
		ensure
			instance_free: class
			no_more_trailing: a_string.is_empty or else a_string.item (a_string.count) /= c
		end

feature -- Resizing

	resize_buffer (a_string: STRING_8; n: INTEGER)
			-- Resize `a_string' so that it contains `n' characters.
			-- Do not lose any previously entered characters.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
			n_large_enough: n >= a_string.count
		local
			i: INTEGER
		do
			from
				i := n - a_string.count
				a_string.resize (n)
			until
				i = 0
			loop
				a_string.append_character ('#')
				i := i - 1
			end
		ensure
			instance_free: class
			count_set: a_string.count = n
		end

feature {NONE} -- Implementation

	dummy_string: STRING = ""
			-- Dummy string

	dummy_string_8: STRING_8 = ""
			-- Dummy string_8

	max_integer_64_digits: ARRAY [CHARACTER_32]
			-- Digits of maximum INTEGER_64 value
		once
			Result := {ARRAY [CHARACTER_32]} <<'9', '2', '2', '3', '3', '7', '2', '0', '3', '6', '8', '5', '4', '7', '7', '5', '8', '0', '7'>>
		ensure
			instance_free: class
			result_not_void: Result /= Void
			ninteen_digits: Result.count = 19
		end

	min_negative_integer_64_digits: ARRAY [CHARACTER_32]
			-- Digits of minimum INTEGER_64 value
		once
			Result := {ARRAY [CHARACTER_32]} <<'9', '2', '2', '3', '3', '7', '2', '0', '3', '6', '8', '5', '4', '7', '7', '5', '8', '0', '8'>>
		ensure
			instance_free: class
			result_not_void: Result /= Void
			ninteen_digits: Result.count = 19
		end

end
