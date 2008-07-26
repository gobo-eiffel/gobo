indexing

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
			fill_from_string, fill_from_stream,
			move_left, move_right
		end

	STRING_HANDLER
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES

create

	make, make_from_string

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create a new character buffer being able
			-- to contain `n' characters.
		do
			if not operating_system.is_dotnet then
				create area.make (n + 1)
				area.set_count (n + 1)
				as_special := area.area
			else
				create area.make (n)
				area.set_count (n)
			end
		end

feature -- Access

	item (i: INTEGER): CHARACTER is
			-- Item at position `i'
		do
			if as_special /= Void then
				Result := as_special.item (i)
			else
				Result := area.item (i)
			end
		end

	substring (s, e: INTEGER): STRING is
			-- New string made up of characters held in
			-- buffer between indexes `s' and `e'
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				if as_special /= Void then
					Result := area.substring (s + 1, e + 1)
				else
					Result := area.substring (s, e)
				end
			end
		end

feature -- Measurement

	count: INTEGER is
			-- Number of characters in buffer
		do
			if as_special /= Void then
				Result := area.count - 1
			else
				Result := area.count
			end
		end

feature -- Conversion

	as_special: SPECIAL [CHARACTER]
			-- 'SPECIAL [CHARACTER]' version of current character buffer;
			-- Characters are indexed starting at 1;
			-- May return void in some descendants, and the result may share
			-- the internal data with `Current'

feature -- Element change

	put (v: CHARACTER; i: INTEGER) is
			-- Replace character at position `i' by `v'.
		do
			if as_special /= Void then
				as_special.put (v, i)
			else
				area.put (v, i)
			end
		end

	append_substring_to_string (s, e: INTEGER; a_string: STRING) is
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
					if as_special /= Void then
						a_string.subcopy (area, s + 1, e + 1, old_count + 1)
					else
						a_string.subcopy (area, s, e, old_count + 1)
					end
				else
					if as_special /= Void then
						from i := s until i > e loop
							a_string.append_character (as_special.item (i))
							i := i + 1
						end
					else
						from i := s until i > e loop
							a_string.append_character (area.item (i))
							i := i + 1
						end
					end
				end
			end
		end

	fill_from_string (a_string: STRING; pos: INTEGER) is
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
		local
			nb: INTEGER
		do
			nb := a_string.count
			if nb > 0 then
				if as_special /= Void then
					area.subcopy (a_string, 1, nb, pos + 1)
				else
					area.subcopy (a_string, 1, nb, pos)
				end
			end
		end

	fill_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER): INTEGER is
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' characters read from `a_stream'.
			-- Return the number of characters actually read.
		do
			if as_special /= Void then
				Result := a_stream.read_to_string (area, pos + 1, nb)
			else
				Result := a_stream.read_to_string (area, pos, nb)
			end
		end

	move_left (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				if as_special /= Void then
					area.subcopy (area, old_pos + 1, old_pos + nb, new_pos + 1)
				else
					area.subcopy (area, old_pos, old_pos + nb - 1, new_pos)
				end
			end
		end

	move_right (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.
		do
			if nb > 0 then
				if as_special /= Void then
					area.subcopy (area, old_pos + 1, old_pos + nb, new_pos + 1)
				else
					area.subcopy (area, old_pos, old_pos + nb - 1, new_pos)
				end
			end
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize buffer so that it contains `n' characters.
			-- Do not lose any previously entered characters.
		do
			if as_special /= Void then
				area.resize (n + 1)
				area.set_count (n + 1)
				as_special := area.area
			else
				area.resize (n)
				area.set_count (n)
			end
		end

feature {NONE} -- Implementation

	area: STRING
			-- Implementation

invariant

	area_not_void: area /= Void

end
