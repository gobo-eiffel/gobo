note

	description:

		"Unicode character buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_UNICODE_CHARACTER_BUFFER

inherit

	KI_CHARACTER_BUFFER
		rename
			make_from_string as make_from_iso_8859_1_string,
			fill_from_string as fill_from_iso_8859_1_string,
			fill_from_stream as fill_from_iso_8859_1_stream
		redefine
			unicode_item,
			item_code,
			as_unicode_special,
			unicode_substring,
			append_substring_to_string,
			append_substring_to_unicode_string,
			fill_from_iso_8859_1_string,
			fill_from_iso_8859_1_stream,
			move_left,
			move_right
		end

	STRING_HANDLER
		export {NONE} all end

create

	make,
	make_from_iso_8859_1_string,
	make_from_utf8_string,
	make_from_string

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create a new character buffer being able
			-- to contain `n' characters.
		do
			create unicode_area.make_filled ({CHARACTER_32} '%U', n + 1)
			as_unicode_special := unicode_area.area
			invalid_character := {CHARACTER_8}.max_value.to_character_8
			invalid_unicode_character := {CHARACTER_32}.max_value.to_character_32
		end

	make_from_string (a_string: READABLE_STRING_GENERAL)
			-- Create a new character buffer with
			-- characters from `a_string'.
			-- (The newly created buffer and `a_string'
			-- may not share internal representation.)
		require
			a_string_not_void: a_string /= Void
		do
			make (a_string.count)
			fill_from_string (a_string, 1)
		ensure
			count_set: count = a_string.count
			charaters_set: to_unicode_text.same_string_general (a_string)
		end

	make_from_utf8_string (a_string: STRING_8)
			-- Create a new character buffer with
			-- characters encoded in `a_string'.
			-- `a_string' is expected to be encoded with UTF-8.
			-- Replace invalid UTF-8 sequence by `invalid_unicode_charater'.
			-- (The newly created buffer and `a_string'
			-- may not share internal representation.)
		require
			a_string_not_void: a_string /= Void
		local
			nb: INTEGER
		do
			make (a_string.count)
			nb := fill_from_utf8_string (a_string, 1)
		ensure
			at_least_one: not a_string.is_empty implies count > 0
			nb_item_copied_small_enough: count <= a_string.count
		end

feature -- Access

	item (i: INTEGER): CHARACTER_8
			-- Item at position `i'.
			-- Return `invalid_character' when the Unicode character
			-- at position `i' is too large.
		local
			l_c: CHARACTER_32
		do
			l_c := unicode_item (i)
			if l_c.is_character_8 then
				Result := l_c.to_character_8
			else
				Result := invalid_character
			end
		ensure then
			same: unicode_item (i).is_character_8 implies Result = unicode_item (i).to_character_8
			too_large: not unicode_item (i).is_character_8 implies Result = invalid_character
		end

	unicode_item (i: INTEGER): CHARACTER_32
			-- Unicode character at position `i'
		do
			Result := as_unicode_special.item (i)
		end

	item_code (i: INTEGER): NATURAL_32
			-- Code of character at position `i'
		do
			Result := unicode_item (i).natural_32_code
		end

	substring (s, e: INTEGER): STRING_8
			-- New string made up of characters held in
			-- buffer between indexes `s' and `e'.
			-- Use `invalid_character' when a Unicode character is too large.
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				create Result.make (e - s + 1)
				append_substring_to_string (s, e, Result)
			end
		end

	unicode_substring (s, e: INTEGER): STRING_32
			-- New Unicode string made up of characters held in
			-- buffer between indexes `s' and `e'
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				Result := unicode_area.substring (s + 1, e + 1)
			end
		end

	invalid_character: CHARACTER_8
			-- Character to the used in place of a Unicode character which is
			-- too large to fit into a CHARACTER_8

	invalid_unicode_character: CHARACTER_32
			-- Unicode character to the used in place of an invalid UTF-8 sequence

feature -- Measurement

	count: INTEGER
			-- Number of characters in buffer
		do
			Result := unicode_area.count - 1
		end

feature -- Conversion

	as_unicode_special: SPECIAL [CHARACTER_32]
			-- 'SPECIAL [CHARACTER_32]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- Note that the result may share the internal data with `Current'.

feature -- Setting

	set_invalid_character (c: CHARACTER_8)
			-- Set `invalid_character' to `c'.
		do
			invalid_character := c
		ensure
			invalid_character_set: invalid_character = c
		end

	set_invalid_unicode_character (c: CHARACTER_32)
			-- Set `invalid_unicode_character' to `c'.
		do
			invalid_unicode_character := c
		ensure
			invalid_unicode_character_set: invalid_unicode_character = c
		end

feature -- Element change

	put (v: CHARACTER_8; i: INTEGER)
			-- Replace character at position `i' by `v'.
		do
			as_unicode_special.put (v.to_character_32, i)
		end

	put_unicode (v: CHARACTER_32; i: INTEGER)
			-- Replace character at position `i' by `v'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			as_unicode_special.put (v, i)
		ensure
			inserted: unicode_item (i) = v
		end

	append_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
			-- Use `invalid_character' when a Unicode character is too large.
		local
			i, nb: INTEGER
		do
			if s <= e then
				from
					i := s
					nb := e
				until
					i > nb
				loop
					a_string.append_character (item (i))
					i := i + 1
				end
			end
		end

	append_substring_to_unicode_string (s, e: INTEGER; a_string: STRING_32)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		do
			if s <= e then
				a_string.append_substring (unicode_area, s + 1, e + 1)
			end
		end

	fill_from_string (a_string: READABLE_STRING_GENERAL; pos: INTEGER)
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
		require
			a_string_not_void: a_string /= Void
			pos_large_enough: pos >= 1
			enough_space: (pos + a_string.count - 1) <= count
		local
			i, j, nb: INTEGER
		do
			nb := a_string.count
			if nb > 0 then
				if attached {READABLE_STRING_32} a_string as l_string_32 then
					unicode_area.subcopy (l_string_32, 1, nb, pos + 1)
				else
					j := pos + 1
					from i := 1 until i > nb loop
						unicode_area.put (a_string.item (i), j)
						j := j + 1
						i := i + 1
					end
				end
			end
		ensure
			charaters_set: unicode_substring (pos, a_string.count + pos - 1).same_string_general (a_string)
		end

	fill_from_iso_8859_1_string (a_string: STRING_8; pos: INTEGER)
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
			-- `a_stream' is expected to be encoded with ISO 8859-1.
		local
			i, j, nb: INTEGER
			l_area: SPECIAL [CHARACTER_8]
		do
			nb := a_string.count
			if nb > 0 then
				j := pos + 1
				l_area := a_string.area
				nb := nb - 1
				from i := 0 until i > nb loop
					unicode_area.put (l_area.item (i).to_character_32, j)
					j := j + 1
					i := i + 1
				end
			end
		end

	fill_from_utf8_string (a_string: STRING_8; pos: INTEGER): INTEGER
			-- Copy characters encoded in `a_string' to buffer
			-- starting at position `pos'.
			-- `a_string' is expected to be encoded with UTF-8.
			-- Replace invalid UTF-8 sequence by `invalid_unicode_charater'.
			-- Return the number of items actually copied.
		require
			a_string_not_void: a_string /= Void
			pos_large_enough: pos >= 1
				-- The precondition below assumes the worse case
				-- were all UTF-8 encoded characters are ASCII.
			enough_space: (pos + a_string.count - 1) <= count
		local
			i, nb: INTEGER
			j: INTEGER
			l_byte1, l_byte2, l_byte3, l_byte4: CHARACTER_8
			l_area: SPECIAL [CHARACTER_8]
		do
			nb := a_string.count
			if nb > 0 then
				j := pos + 1
				l_area := a_string.area
				nb := nb - 1
				from i := 0 until i > nb loop
					l_byte1 := l_area.item (i)
					if not {UC_UTF8_ROUTINES}.is_encoded_first_byte (l_byte1) then
						unicode_area.put (invalid_unicode_character, j)
						j := j + 1
						i := i + 1
					else
						inspect {UC_UTF8_ROUTINES}.encoded_byte_count (l_byte1)
						when 1 then
							unicode_area.put (l_byte1.to_character_32, j)
							i := i + 1
						when 2 then
							if i + 1 > nb then
								unicode_area.put (invalid_unicode_character, j)
							else
								l_byte2 := l_area.item (i + 1)
								if not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) then
									unicode_area.put (invalid_unicode_character, j)
								else
									unicode_area.put (({UC_UTF8_ROUTINES}.two_byte_character_code (l_byte1, l_byte2).to_character_32), j)
								end
							end
							i := i + 2
						when 3 then
							if i + 2 > nb then
								unicode_area.put (invalid_unicode_character, j)
							else
								l_byte2 := l_area.item (i + 1)
								l_byte3 := l_area.item (i + 2)
								if
									not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) or
									not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte3)
								then
									unicode_area.put (invalid_unicode_character, j)
								else
									unicode_area.put (({UC_UTF8_ROUTINES}.three_byte_character_code (l_byte1, l_byte2, l_byte3).to_character_32), j)
								end
							end
							i := i + 3
						else
							if i + 3 > nb then
								unicode_area.put (invalid_unicode_character, j)
							else
								l_byte2 := l_area.item (i + 1)
								l_byte3 := l_area.item (i + 2)
								l_byte4 := l_area.item (i + 3)
								if
									not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) or
									not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte3) or
									not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte4)
								then
									unicode_area.put (invalid_unicode_character, j)
								else
									unicode_area.put (({UC_UTF8_ROUTINES}.four_byte_character_code (l_byte1, l_byte2, l_byte3, l_byte4).to_character_32), j)
								end
							end
							i := i + 4
						end
						j := j + 1
					end
				end
				Result := j - (pos + 1)
			end
		ensure
			nb_item_copied_large_enough: Result >= 0
			at_least_one: not a_string.is_empty implies Result > 0
			nb_item_copied_small_enough: Result <= a_string.count
		end

	fill_from_iso_8859_1_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER): INTEGER
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' characters read from `a_stream'.
			-- Return the number of characters actually read.
			-- `a_stream' is expected to be encoded with ISO 8859-1.
		local
			l_area: like area
		do
			l_area := area
			if l_area = Void then
				create l_area.make_filled ('%U', count)
				area := l_area
			elseif l_area.count < nb then
				l_area.resize (count)
				l_area.set_count (count)
			end
			Result := a_stream.read_to_string (l_area, 1, nb)
			fill_from_string (l_area, pos)
		end

	fill_from_utf8_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER_32): INTEGER_32
			-- Fill buffer, starting at position `pos`, with
			-- at most `nb` items read from `a_stream`.
			-- Return the number of items actually read.
			-- `a_stream' is expected to be encoded with UTF-8.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: a_stream.is_open_read
			not_end_of_input: not a_stream.end_of_input
			pos_large_enough: pos >= 1
			nb_large_enough: nb > 0
			enough_space: (pos + nb - 1) <= count
		local
			l_area: like area
			l_area_area: SPECIAL [CHARACTER_8]
			i, nb_utf8: INTEGER
			j: INTEGER
			l_byte1, l_byte2, l_byte3, l_byte4: CHARACTER_8
			nb1, nb2: INTEGER
		do
			l_area := area
			if l_area = Void then
				create l_area.make_filled ('%U', count)
				area := l_area
			elseif l_area.count < nb then
				l_area.resize (count)
				l_area.set_count (count)
			end
			nb_utf8 := a_stream.read_to_string (l_area, 1, nb)
			j := pos + 1
			l_area_area := l_area.area
			nb_utf8 := nb_utf8 - 1
			from i := 0 until i > nb_utf8 loop
				l_byte1 := l_area_area.item (i)
				if not {UC_UTF8_ROUTINES}.is_encoded_first_byte (l_byte1) then
					unicode_area.put (invalid_unicode_character, j)
					j := j + 1
					i := i + 1
				else
					inspect {UC_UTF8_ROUTINES}.encoded_byte_count (l_byte1)
					when 1 then
						unicode_area.put (l_byte1.to_character_32, j)
						i := i + 1
					when 2 then
						if i + 1 <= nb_utf8 then
							l_byte2 := l_area_area.item (i + 1)
						elseif not a_stream.end_of_input then
								-- Try to read the byte which is missing.
							nb1 := 1
							if l_area.count < nb1 then
								l_area.resize (nb1)
								l_area.set_count (nb1)
								l_area_area := l_area.area
							end
							nb2 := a_stream.read_to_string (l_area, 1, nb1)
							i := 0
							nb_utf8 := nb2 - 1
							if i + 1 <= nb_utf8 then
								l_byte2 := l_area_area.item (i + 1)
							else
									-- Invalid UTF-8 byte.
								l_byte2 := '%/255/'
							end
						else
								-- Invalid UTF-8 byte.
							l_byte2 := '%/255/'
						end
						if not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) then
							unicode_area.put (invalid_unicode_character, j)
						else
							unicode_area.put (({UC_UTF8_ROUTINES}.two_byte_character_code (l_byte1, l_byte2).to_character_32), j)
						end
						i := i + 2
					when 3 then
						if i + 2 <= nb_utf8 then
							l_byte2 := l_area_area.item (i + 1)
							l_byte3 := l_area_area.item (i + 2)
						else
								-- Try to read missing byte(s).
							nb1 := nb_utf8 - i
							if nb1 > 0 then
								l_area.subcopy (l_area, i + 2, i + 1 + nb1, 1)
							end
							from
								i := 0
								nb_utf8 := nb1 - 1
								nb1 := 2 - nb1
								if l_area.count < nb1 then
									l_area.resize (nb1)
									l_area.set_count (nb1)
									l_area_area := l_area.area
								end
							until
								nb1 <= 0 or else a_stream.end_of_input
							loop
								nb2 := a_stream.read_to_string (l_area, 1, nb1)
								nb_utf8 := nb_utf8 + nb2
								nb1 := nb1 - nb2
							end
							if i + 2 <= nb_utf8 then
								l_byte2 := l_area_area.item (i + 1)
								l_byte3 := l_area_area.item (i + 2)
							else
									-- Invalid UTF-8 byte.
								l_byte2 := '%/255/'
								l_byte3 := '%/255/'
							end
						end
						if
							not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) or
							not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte3)
						then
							unicode_area.put (invalid_unicode_character, j)
						else
							unicode_area.put (({UC_UTF8_ROUTINES}.three_byte_character_code (l_byte1, l_byte2, l_byte3).to_character_32), j)
						end
						i := i + 3
					else
						if i + 3 <= nb_utf8 then
							l_byte2 := l_area_area.item (i + 1)
							l_byte3 := l_area_area.item (i + 2)
							l_byte4 := l_area_area.item (i + 3)
						else
								-- Try to read missing byte(s).
							nb1 := nb_utf8 - i
							if nb1 > 0 then
								l_area.subcopy (l_area, i + 2, i + 1 + nb1, 1)
							end
							from
								i := 0
								nb_utf8 := nb1 - 1
								nb1 := 3 - nb1
								if l_area.count < nb1 then
									l_area.resize (nb1)
									l_area.set_count (nb1)
									l_area_area := l_area.area
								end
							until
								nb1 <= 0 or else a_stream.end_of_input
							loop
								nb2 := a_stream.read_to_string (l_area, 1, nb1)
								nb_utf8 := nb_utf8 + nb2
								nb1 := nb1 - nb2
							end
							if i + 3 <= nb_utf8 then
								l_byte2 := l_area_area.item (i + 1)
								l_byte3 := l_area_area.item (i + 2)
								l_byte4 := l_area_area.item (i + 3)
							else
									-- Invalid UTF-8 byte.
								l_byte2 := '%/255/'
								l_byte3 := '%/255/'
								l_byte4 := '%/255/'
							end
						end
						if
							not {UC_UTF8_ROUTINES}.is_encoded_second_byte (l_byte2, l_byte1) or
							not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte3) or
							not {UC_UTF8_ROUTINES}.is_encoded_next_byte (l_byte4)
						then
							unicode_area.put (invalid_unicode_character, j)
						else
							unicode_area.put (({UC_UTF8_ROUTINES}.four_byte_character_code (l_byte1, l_byte2, l_byte3, l_byte4).to_character_32), j)
						end
						i := i + 4
					end
					j := j + 1
				end
			end
			Result := j - (pos + 1)
		ensure
			nb_item_read_large_enough: Result >= 0
			nb_item_read_small_enough: Result <= nb
			not_end_of_input: not a_stream.end_of_input implies Result > 0
		end

	move_left (old_pos, new_pos: INTEGER; nb: INTEGER)
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				unicode_area.subcopy (unicode_area, old_pos + 1, old_pos + nb, new_pos + 1)
			end
		end

	move_right (old_pos, new_pos: INTEGER; nb: INTEGER)
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				unicode_area.subcopy (unicode_area, old_pos + 1, old_pos + nb, new_pos + 1)
			end
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize buffer so that it contains `n' characters.
			-- Do not lose any previously entered characters.
		local
			l_old_count: INTEGER
		do
			l_old_count := count
			if n > l_old_count then
			  unicode_area.resize (n + 1)
			  unicode_area.set_count (n + 1)
			  as_unicode_special := unicode_area.area
			  as_unicode_special.fill_with ('%U', l_old_count + 2, n + 1)
			end
		end

feature {NONE} -- Implementation

	area: detachable STRING_8
			-- Implementation

	unicode_area: STRING_32
			-- Implementation

invariant

	unicode_area_not_void: unicode_area /= Void
	as_unicode_special_not_void: as_unicode_special /= Void

end
