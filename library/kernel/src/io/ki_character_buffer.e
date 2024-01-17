note

	description:

		"Interface for character buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

deferred class KI_CHARACTER_BUFFER

inherit

	KI_BUFFER [CHARACTER_8]
		redefine
			fill_from_stream
		end

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create a new character buffer being able
			-- to contain `n' characters.
		require
			non_negative_n: n >= 0
		deferred
		ensure
			count_set: count = n
		end

	make_from_string (a_string: STRING_8)
			-- Create a new character buffer with
			-- characters from `a_string'.
			-- (The newly created buffer and `a_string'
			-- may not share internal representation.)
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		do
			make (a_string.count)
			fill_from_string (a_string, 1)
		ensure
			count_set: count = a_string.count
			charaters_set: to_text.is_equal (a_string)
		end

feature -- Access

	unicode_item (i: INTEGER): CHARACTER_32
			-- Unicode character at position `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).to_character_32
		end

	item_code (i: INTEGER): NATURAL_32
			-- Code of character at position `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).natural_32_code
		ensure
			definition: Result = unicode_item (i).natural_32_code
		end

	substring (s, e: INTEGER): STRING_8
			-- New string made up of characters held in
			-- buffer between indexes `s' and `e'
		require
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		deferred
		ensure
			substring_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			count_set: Result.count = e - s + 1
		end

	unicode_substring (s, e: INTEGER): STRING_32
			-- New Unicode string made up of characters held in
			-- buffer between indexes `s' and `e'
		require
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		do
			Result := substring (s, e).to_string_32
		ensure
			substring_not_void: Result /= Void
			count_set: Result.count = e - s + 1
		end

	utf8_substring (s, e: INTEGER): STRING_8
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of the characters held
			-- in buffer between indexes `s' and `e'
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		do
			Result := {UC_UTF8_ROUTINES}.string_to_utf8 (unicode_substring (s, e))
		ensure
			utf8_substring_not_void: Result /= Void
			utf8_substring_is_string_8: Result.same_type ({STRING_8} "")
			correct_count: Result.count = {UC_UTF8_ROUTINES}.string_byte_count (unicode_substring (s, e))
			valid_utf8: across unicode_substring (s, e) as l_string all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (l_string.item.natural_32_code) end implies {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

feature -- Conversion

	to_text: STRING_8
			-- New string made up of characters held in buffer
		do
			Result := substring (1, count)
		ensure
			to_text_not_void: Result /= Void
			string_type: Result.same_type ({STRING_8} "")
			same_count: Result.count = count
		end

	to_unicode_text: STRING_32
			-- New Unicode string made up of characters held in buffer
		do
			Result := unicode_substring (1, count)
		ensure
			to_text_not_void: Result /= Void
			same_count: Result.count = count
		end

	as_special: detachable SPECIAL [CHARACTER_8]
			-- 'SPECIAL [CHARACTER_8]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- Note that the result may share the internal data with `Current'.
		do
		end

	as_unicode_special: detachable SPECIAL [CHARACTER_32]
			-- 'SPECIAL [CHARACTER_32]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- Note that the result may share the internal data with `Current'.
		do
		end

feature -- Element change

	append_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		require
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		do
			if s <= e then
				a_string.append_string (substring (s, e))
			end
		ensure
			count_set: a_string.count = old (a_string.count) + (e - s + 1)
			characters_set: s <= e implies a_string.substring (old (a_string.count) + 1, a_string.count).same_string (substring (s, e))
		end

	append_unicode_substring_to_string (s, e: INTEGER; a_string: STRING_32)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		require
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		do
			if s <= e then
				a_string.append (unicode_substring (s, e))
			end
		ensure
			count_set: a_string.count = old (a_string.count) + (e - s + 1)
			characters_set: s <= e implies a_string.substring (old (a_string.count) + 1, a_string.count).same_string (unicode_substring (s, e))
		end

	append_utf8_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append bytes corresponding to the UTF-8 representation
			-- of the characters held in buffer between indexes `s'
			-- and `e' to `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string_8: a_string.same_type ({STRING_8} "")
			s_large_enough: s >= 1
			e_small_enough: e <= count
			valid_interval: s <= e + 1
		do
			if s <= e then
				a_string.append (utf8_substring (s, e))
			end
		ensure
			count_set: a_string.count = old (a_string.count) + utf8_substring (s, e).count
			characters_set: s <= e implies a_string.substring (old (a_string.count) + 1, a_string.count).same_string (utf8_substring (s, e))
		end

	fill_from_string (a_string: STRING_8; pos: INTEGER)
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
			pos_large_enough: pos >= 1
			enough_space: (pos + a_string.count - 1) <= count
		do
			fill_from_substring (a_string, 1, a_string.count, pos)
		ensure
			charaters_set: substring (pos, a_string.count + pos - 1).is_equal (a_string)
		end

	fill_from_substring (a_string: STRING_8; s, e, pos: INTEGER)
			-- Copy characters of `a_string' between indexes `s' and `e'
			-- to buffer starting at position `pos'.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
			pos_large_enough: pos >= 1
			enough_space: (pos + e - s) <= count
		local
			nb: INTEGER
			i, j: INTEGER
		do
			if s <= e then
				j := pos
				from
					i := s
					nb := e
				until
					i > nb
				loop
					put (a_string.item (i), j)
					j := j + 1
					i := i + 1
				end
			end
		ensure
			charaters_set: substring (pos, e - s + pos).is_equal (a_string.substring (s, e))
		end

	fill_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER): INTEGER
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' items read from `a_stream'.
			-- Return the number of items actually read.
		do
			Result := a_stream.read_to_buffer (Current, pos, nb)
		end

end
