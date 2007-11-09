indexing

	description:

		"Character buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CHARACTER_BUFFER

inherit

	KI_CHARACTER_BUFFER
		redefine




			append_substring_to_string,

			fill_from_string, fill_from_stream,
			move_left, move_right
		end









	KL_IMPORTED_ANY_ROUTINES

create

	make, make_from_string

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create a new character buffer being able
			-- to contain `n' characters.
		do














			create area_string.make_filled ('%U', n + 2)
			area_string.remove_tail (1)
			area := area.from_pointer (area_string.to_external)
			count := n

		end

feature -- Access

	item (i: INTEGER): CHARACTER is
			-- Item at position `i'
		do







			Result := area.item (i)

		end

	substring (s, e: INTEGER): STRING is
			-- New string made up of characters held in
			-- buffer between indexes `s' and `e'

		local
			i, nb: INTEGER




		do
			if e < s then
					-- Empty string



				create Result.make (0)

			else








				nb := e - s + 1
				create Result.make (nb)
				from i := s until i > e loop
					Result.append_character (area.item (i))
					i := i + 1
				end










			end
		end

feature -- Measurement


	count: INTEGER
			-- Number of characters in buffer


























feature -- Element change

	put (v: CHARACTER; i: INTEGER) is
			-- Replace character at position `i' by `v'.
		do







			area.put (v, i)

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
					a_string.keep_head (old_count)
				end
				from i := s until i > e loop
					a_string.append_character (area.item (i))
					i := i + 1
				end
			end

		end


	fill_from_string (a_string: STRING; pos: INTEGER) is
			-- Copy characters of `a_string' to buffer
			-- starting at position `pos'.
		local
			nb: INTEGER

			i, j: INTEGER

		do
			nb := a_string.count
			if nb > 0 then







				j := pos
				from i := 1 until i > nb loop
					area.put (a_string.item (i), j)
					j := j + 1
					i := i + 1
				end

			end
		end

	fill_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; pos, nb: INTEGER): INTEGER is
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' characters read from `a_stream'.
			-- Return the number of characters actually read.
		do

			Result := a_stream.read_to_string (area_string, pos + 1, nb)











		end

	move_left (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.

		local
			i, j, nb2: INTEGER

		do
			if nb > 0 then







				j := new_pos
				nb2 := old_pos + nb - 1
				from i := old_pos until i > nb2 loop
					area.put (area.item (i), j)
					j := j + 1
					i := i + 1
				end

			end
		end

	move_right (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in buffer.

		local
			i, j: INTEGER

		do
			if nb > 0 then







				j := new_pos + nb - 1
				from i := old_pos + nb - 1 until i < old_pos loop
					area.put (area.item (i), j)
					j := j - 1
					i := i - 1
				end

			end
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize buffer so that it contains `n' characters.
			-- Do not lose any previously entered characters.





		do
			area_string.resize (n + 2)
			area_string.remove_tail (1)
			area := area.from_pointer (area_string.to_external)
			count := n












		end

feature {NONE} -- Implementation






	area: NATIVE_ARRAY [CHARACTER]
	area_string: STRING
			-- Implementation






invariant






	area_string_not_void: area_string /= Void


end
