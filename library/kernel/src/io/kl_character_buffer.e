note

	description:

		"Character buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CHARACTER_BUFFER

inherit

	KI_CHARACTER_BUFFER
		redefine
			as_special,
			unicode_substring,
			utf8_substring,
			append_substring_to_string,
			append_substring_to_unicode_string,
			fill_from_substring,
			fill_from_stream,
			move_left,
			move_right
		end

	STRING_HANDLER
		export {NONE} all end

create

	make,
	make_from_string

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create a new character buffer being able
			-- to contain `n' characters.
		do
			create area.make_filled ('%U', n + 1)
			as_special := area.area
		end

feature -- Access

	item (i: INTEGER): CHARACTER_8
			-- Item at position `i'
		do
			Result := as_special.item (i)
		end

	substring (s, e: INTEGER): STRING_8
			-- New string made up of characters held in
			-- buffer between indexes `s' and `e'
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				Result := area.substring (s + 1, e + 1)
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
				create Result.make (e - s + 1)
				append_substring_to_unicode_string (s, e, Result)
			end
		end

	utf8_substring (s, e: INTEGER): STRING_8
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of the characters held
			-- in buffer between indexes `s' and `e'
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				Result := {UC_UTF8_ROUTINES}.substring_to_utf8 (area, s + 1, e + 1)
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of characters in buffer
		do
			Result := area.count - 1
		end

feature -- Conversion

	as_special: SPECIAL [CHARACTER_8]
			-- 'SPECIAL [CHARACTER_8]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- Note that the result may share the internal data with `Current'.

feature -- Element change

	put (v: CHARACTER_8; i: INTEGER)
			-- Replace character at position `i' by `v'.
		do
			as_special.put (v, i)
		end

	append_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		do
			if s <= e then
				a_string.append_substring (area, s + 1, e + 1)
			end
		end

	append_substring_to_unicode_string (s, e: INTEGER; a_string: STRING_32)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		do
			if s <= e then
				a_string.append_substring_general (area, s + 1, e + 1)
			end
		end

	fill_from_substring (a_string: STRING_8; s, e, pos: INTEGER)
			-- Copy characters of `a_string' between indexes `s' and `e'
			-- to buffer starting at position `pos'.
		do
			if s <= e then
				area.subcopy (a_string, s, e, pos + 1)
			end
		end

	fill_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER): INTEGER
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' characters read from `a_stream'.
			-- Return the number of characters actually read.
		do
			Result := a_stream.read_to_string (area, pos + 1, nb)
		end

	move_left (old_pos, new_pos: INTEGER; nb: INTEGER)
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				area.subcopy (area, old_pos + 1, old_pos + nb, new_pos + 1)
			end
		end

	move_right (old_pos, new_pos: INTEGER; nb: INTEGER)
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				area.subcopy (area, old_pos + 1, old_pos + nb, new_pos + 1)
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
			  area.resize (n + 1)
			  area.set_count (n + 1)
			  as_special := area.area
			  as_special.fill_with ('%U', l_old_count + 2, n + 1)
			end
		end

feature {NONE} -- Implementation

	area: STRING_8
			-- Implementation

invariant

	area_not_void: area /= Void
	as_special_not_void: as_special /= Void

end
