note

	description:

		"Character buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CHARACTER_BUFFER

inherit

	KI_CHARACTER_BUFFER
		redefine
			as_special,
			append_substring_to_string,
			fill_from_string,
			fill_from_stream,
			move_left,
			move_right
		end

	STRING_HANDLER
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES

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

	item (i: INTEGER): CHARACTER
			-- Item at position `i'
		do
			Result := as_special.item (i)
		end

	substring (s, e: INTEGER): STRING
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

feature -- Measurement

	count: INTEGER
			-- Number of characters in buffer
		do
			Result := area.count - 1
		end

feature -- Conversion

	as_special: SPECIAL [CHARACTER]
			-- 'SPECIAL [CHARACTER]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- Note that the result may share the internal data with `Current'.

feature -- Element change

	put (v: CHARACTER; i: INTEGER)
			-- Replace character at position `i' by `v'.
		do
			as_special.put (v, i)
		end

	append_substring_to_string (s, e: INTEGER; a_string: STRING)
			-- Append string made up of characters held in buffer
			-- between indexes `s' and `e' to `a_string'.
		local
			i, nb: INTEGER
			old_count, new_count: INTEGER
		do
			if s <= e then
				nb := e - s + 1
				old_count := a_string.count
				new_count := old_count + nb
				if new_count > a_string.capacity then
					a_string.resize (new_count)
				end
				if ANY_.same_types (a_string, dummy_string) then
					a_string.set_count (new_count)
					a_string.subcopy (area, s + 1, e + 1, old_count + 1)
				else
					from
						i := s
					until
						i > e
					loop
						a_string.append_character (as_special.item (i))
						i := i + 1
					end
				end
			end
		end

	fill_from_string (a_string: STRING; pos: INTEGER)
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
		local
			nb: INTEGER
		do
			nb := a_string.count
			if nb > 0 then
				area.subcopy (a_string, 1, nb, pos + 1)
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

	area: STRING
			-- Implementation

invariant

	area_not_void: area /= Void

end
