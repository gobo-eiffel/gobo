indexing

	description:

		"Unicode strings with UTF-8 encoding"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF8_STRING

inherit

	UC_STRING

creation

	make, make_empty, make_from_string, make_from_utf8,
	make_filled, make_filled_code, make_filled_latin1,
	make_from_substring

feature -- Initialization

	make_from_string (a_string: STRING) is
			-- Initialize from the character sequence of `s'.
			-- (ELKS 2001 STRING)
		do
			if a_string /= Current then
				make_from_substring (a_string, 1, a_string.count)
			end
		end

feature {NONE} -- Initialization

	make_from_substring (a_string: STRING; start_index, end_index: INTEGER) is
			-- Initialize from the character sequence of `a_string'
			-- between `start_index' and `end_index' inclusive.
		local
			nb: INTEGER
			str: STRING
		do
			if a_string /= Current or else start_index /= 1 or else end_index /= count then
				if end_index < start_index then
					make (0)
				else
					if a_string = Current then
						str := clone (a_string)
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
		end

	make_filled_code (a_code: INTEGER; n: INTEGER) is
			-- Create string of length `n' filled with unicode
			-- character of code `a_code'.
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.code_byte_count (a_code)
			new_byte_count := nb * n
			make (new_byte_count)
			set_count (n)
			byte_count := new_byte_count
			from i := 1 until i > new_byte_count loop
				put_code_at_byte_index (a_code, nb, i)
				i := i + nb
			end
		end

	make_filled_latin1 (c: CHARACTER; n: INTEGER) is
			-- Create string of length `n' filled with Latin-1 character `c'.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.latin1_byte_count (c)
			new_byte_count := nb * n
			make (new_byte_count)
			set_count (n)
			byte_count := new_byte_count
			if nb = 1 then
				from i := 1 until i > new_byte_count loop
					put_byte (c, i)
					i := i + 1
				end
			else
				from i := 1 until i > new_byte_count loop
					put_latin1_at_byte_index (c, nb, i)
					i := i + nb
				end
			end
		end

	make_from_utf8 (s: STRING) is
			-- Initialize from the bytes sequence of `s' corresponding
			-- to the UTF-8 representation of a string.
		local
			i, nb: INTEGER
			a_byte: CHARACTER
			j, nb2: INTEGER
			a_count: INTEGER
		do
			nb := s.count
			make (nb)
			byte_count := nb
			from i := 1 until i > nb loop
				from
					a_count := a_count + 1
					a_byte := s.item (i)
					put_byte (a_byte, i)
					i := i + 1
					nb2 := utf8.encoded_byte_count (a_byte)
					j := 1
				until
					j >= nb2
				loop
					put_byte (s.item (i), i)
					i := i + 1
					j := j + 1
				end
			end
			set_count (a_count)
		ensure then
			byte_count_set: byte_count = s.count
		end

feature -- Access

	item_code (i: INTEGER): INTEGER is
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
		end

	latin1_item (i: INTEGER): CHARACTER is
			-- Latin-1 character at index `i';
			-- '%U' is the unicode character at index
			-- `i' cannot fit into a CHARACTER
			-- (Extended from ELKS 2001 STRING)
		local
			k: INTEGER
		do
			if count = byte_count then
				Result := byte_item (i)
			else
				k := byte_index (i)
				Result := latin1_item_at_byte_index (k)
			end
		end

	index_of_code (a_code: INTEGER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of unicode character with
			-- code `a_code' at or after `start_index'; 0 if none
		local
			i, k, nb: INTEGER
		do
			nb := count
			if nb = byte_count then
				if a_code > 127 then
					-- Result := 0
				else
					from i := start_index until i > nb loop
						if byte_item (i).code = a_code then
							Result := i
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			elseif start_index <= nb then
				k := byte_index (start_index)
				from i := start_index until i > nb loop
					if item_code_at_byte_index (k) = a_code then
						Result := i
						i := nb + 1 -- Jump out of the loop.
					else
						k := next_byte_index (k)
						i := i + 1
					end
				end
			end
		end

	index_of_latin1 (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of Latin-1 character `c'
			-- at or after `start_index'; 0 if none
			-- (ELKS 2001 STRING)
		local
			i, k, nb: INTEGER
			max_code: INTEGER
			a_code: INTEGER
		do
			nb := count
			if nb = byte_count then
				from i := start_index until i > nb loop
					if byte_item (i) = c then
						Result := i
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			elseif c = '%U' then
				if start_index <= nb then
					max_code := Platform.Maximum_character_code
					k := byte_index (start_index)
					from i := start_index until i > nb loop
						a_code := item_code_at_byte_index (k)
						if a_code = 0 or a_code > max_code then
							Result := i
							i := nb + 1 -- Jump out of the loop.
						else
							k := next_byte_index (k)
							i := i + 1
						end
					end
				end
			else
				Result := index_of_code (c.code, start_index)
			end
		end

	substring (start_index, end_index: INTEGER): like Current is
			-- New object containing all characters
			-- from `start_index' to `end_index' inclusive
			-- (ELKS 2001 STRING)
		do
			if end_index < start_index then
				!! Result.make (0)
			else
				!! Result.make_from_substring (Current, start_index, end_index)
			end
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `other' at or after `start_index';
			-- 0 if none
		local
			i, j, nb: INTEGER
			a_code, a_code2: INTEGER
			other_unicode: UC_STRING
			k, z, end_index: INTEGER
			found: BOOLEAN
		do
			if other = Current then
				if start_index = 1 then
					Result := 1
				end
			elseif other.count = 0 then
				Result := start_index
			else
				end_index := count - other.count + 1
				if start_index <= end_index then
					if count = byte_count then
						other_unicode ?= other
						if other_unicode /= Void then
							nb := other_unicode.byte_count
							from k := start_index until k > end_index loop
								j := k
								found := True
								from i := 1 until i > nb loop
									a_code := other_unicode.item_code_at_byte_index (i)
									if byte_item (j).code /= a_code then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := j + 1
										i := other_unicode.next_byte_index (i)
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
								else
									k := k + 1
								end
							end
						else
							nb := other.count
							from k := start_index until k > end_index loop
								j := k
								found := True
								from i := 1 until i > nb loop
									if byte_item (j).code /= other.item_code (i) then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := j + 1
										i := i + 1
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
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
							from k := start_index until k > end_index loop
								j := z
								found := True
								from i := 1 until i > nb loop
									a_code := item_code_at_byte_index (j)
									a_code2 := other_unicode.item_code_at_byte_index (i)
									if a_code /= a_code2 then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := next_byte_index (j)
										i := other_unicode.next_byte_index (i)
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
								else
									z := next_byte_index (z)
									k := k + 1
								end
							end
						else
							nb := other.count
							from k := start_index until k > end_index loop
								j := z
								found := True
								from i := 1 until i > nb loop
									a_code := item_code_at_byte_index (j)
									if a_code /= other.item_code (i) then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := next_byte_index (j)
										i := i + 1
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
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

	latin1_substring_index (other: STRING; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `other' at or after `start_index';
			-- 0 if none. `other' and `Current' are considered with their
			-- characters which do not fit in a CHARACTER replaced by a '%U'
			-- (ELKS 2001 STRING)
		local
			i, j, nb: INTEGER
			a_code, a_code2: INTEGER
			other_unicode: UC_STRING
			k, z, end_index: INTEGER
			found: BOOLEAN
		do
			if other = Current then
				if start_index = 1 then
					Result := 1
				end
			elseif other.count = 0 then
				Result := start_index
			else
				end_index := count - other.count + 1
				if start_index <= end_index then
					if count = byte_count then
						other_unicode ?= other
						if other_unicode /= Void then
							nb := other_unicode.byte_count
							from k := start_index until k > end_index loop
								j := k
								found := True
								from i := 1 until i > nb loop
									a_code := other_unicode.item_code_at_byte_index (i)
									if a_code > Platform.Maximum_character_code then
										a_code := 0
									end
									if byte_item (j).code /= a_code then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := j + 1
										i := other_unicode.next_byte_index (i)
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
								else
									k := k + 1
								end
							end
						else
							nb := other.count
							from k := start_index until k > end_index loop
								j := k
								found := True
								from i := 1 until i > nb loop
									if byte_item (j) /= other.item (i) then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := j + 1
										i := i + 1
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
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
							from k := start_index until k > end_index loop
								j := z
								found := True
								from i := 1 until i > nb loop
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
										i := nb + 1 -- Jump out of the loop.
									else
										j := next_byte_index (j)
										i := other_unicode.next_byte_index (i)
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
								else
									z := next_byte_index (z)
									k := k + 1
								end
							end
						else
							nb := other.count
							from k := start_index until k > end_index loop
								j := z
								found := True
								from i := 1 until i > nb loop
									a_code := item_code_at_byte_index (j)
									if a_code > Platform.Maximum_character_code then
										a_code := 0
									end
									if a_code /= other.item (i).code then
										found := False
										i := nb + 1 -- Jump out of the loop.
									else
										j := next_byte_index (j)
										i := i + 1
									end
								end
								if found then
									Result := k
									k := end_index + 1 -- Jump out of the loop.
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

	latin1_string: STRING is
			-- New STRING having the same character sequence as `Current'
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			a_code: INTEGER
		do
			nb := count
			Result := STRING_.make (nb)
			if nb = byte_count then
				from i := 1 until i > nb loop
					Result.append_character (byte_item (i))
					i := i + 1
				end
			else
				nb := byte_count
				from i := 1 until i > nb loop
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

	infix "+" (other: STRING): like Current is
			-- New object which is a clone of `Current' extended
			-- by the characters of `other'
			-- (ELKS 2001 STRING)
		do
			!! Result.make (byte_count + utf8.substring_byte_count (other, 1, other.count))
			Result.append_string (Current)
			Result.append_string (other)
		end

	hash_code: INTEGER is
			-- Hash code
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
		do
			nb := byte_count
			from i := 1 until i > nb loop
				Result := 5 * Result + byte_item (i).code
				i := i + 1
			end
			if Result < 0 then
				Result := - (Result + 1)
			end
		end

feature -- Measurement

	code_occurrences (a_code: INTEGER): INTEGER is
			-- Number of times unicode character of code
			-- `a_code' appears in the string
		local
			i, nb: INTEGER
		do
			nb := count
			if nb = byte_count then
				if a_code > 127 then
					-- Result := 0
				else
					from i := 1 until i > nb loop
						if byte_item (i).code = a_code then
							Result := Result + 1
						end
						i := i + 1
					end
				end
			else
				nb := byte_count
				from i := 1 until i > nb loop
					if item_code_at_byte_index (i) = a_code then
						Result := Result + 1
					end
					i := next_byte_index (i)
				end
			end
		end

	latin1_occurrences (c: CHARACTER): INTEGER is
			-- Number of times Latin-1 character `c' appears in the string
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			max_code: INTEGER
			a_code: INTEGER
		do
			nb := count
			if nb = byte_count then
				from i := 1 until i > nb loop
					if byte_item (i) = c then
						Result := Result + 1
					end
					i := i + 1
				end
			elseif c = '%U' then
				max_code := Platform.Maximum_character_code
				nb := byte_count
				from i := 1 until i > nb loop
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

feature -- Status report

	has_code (a_code: INTEGER): BOOLEAN is
			-- Does `Current' contain the unicode character of code `a_code'?
		do
			Result := (index_of_code (a_code, 1) /= 0)
		end

	has_latin1 (c: CHARACTER): BOOLEAN is
			-- Does `Current' contain Latin-1 character `c'?
			-- (ELKS 2001 STRING)
		do
			Result := (index_of_latin1 (c, 1) /= 0)
		end

	is_ascii: BOOLEAN is
			-- Does string contain only ASCII characters?
		do
			Result := (count = byte_count)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered equal
			-- to current object?
			-- (Extended from ELKS 2001 STRING)
		local
			i, nb: INTEGER
		do
			if other = Current then
				Result := True
			elseif same_type (other) and then other.byte_count = byte_count then
				nb := byte_count
				Result := True
				from i := 1 until i > nb loop
					if byte_item (i) /= other.byte_item (i) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	same_latin1_string (other: STRING): BOOLEAN is
			-- Do `Current' and `other' have the same Latin-1 character sequence?
			-- (ELKS 2001 STRING)
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				Result := (latin1_substring_index (other, 1) = 1)
			end
		end

	same_string (other: STRING): BOOLEAN is
			-- Do `Current' and `other' have the same unicode character sequence?
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				Result := (substring_index (other, 1) = 1)
			end
		end

	three_way_comparison (other: like Current): INTEGER is
			-- If current object equal to `other', 0;
			-- if smaller, -1; if greater, 1
			-- (ELKS 2001 STRING, inherited from COMPARABLE)
		local
			i, nb, nb1, nb2: INTEGER
			b1, b2: CHARACTER
			found: BOOLEAN
		do
			if other /= Current then
				nb1 := byte_count
				nb2 := other.byte_count
				if nb1 < nb2 then
					nb := nb1
				else
					nb := nb2
				end
				from i := 1 until i > nb loop
					b1 := byte_item (i)
					b2 := other.byte_item (i)
					if b1 = b2 then
						i := i + 1
					elseif b1 < b2 then
						found := True
						Result := -1
						i := nb + 1 -- Jump out of the loop.
					else
						found := True
						Result := 1
						i := nb + 1 -- Jump out of the loop.
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

feature -- Element change

	put_code (a_code: INTEGER; i: INTEGER) is
			-- Replace unicode character at index `i'
			-- by unicode character of code `a_code'.
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
		end

	put_latin1 (c: CHARACTER; i: INTEGER) is
			-- Replace unicode character at index `i'
			-- by Latin-1 character `c'.
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
			new_count := utf8.latin1_byte_count (c)
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
			put_latin1_at_byte_index (c, new_count, k)
		end

	append_code (a_code: INTEGER) is
			-- Append unicode character of code `a_code' at end.
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
		end

	append_latin1 (c: CHARACTER) is
			-- Append Latin-1 character `c' at end.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.latin1_byte_count (c)
			k := byte_count + 1
			new_byte_count := byte_count + nb
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			set_count (count + 1)
			put_latin1_at_byte_index (c, nb, k)
		end

	append_string (a_string: STRING) is
			-- Append a copy of `a_string' at end.
			-- (ELKS 2001 STRING)
		local
			a_string_count: INTEGER
			k, nb: INTEGER
			new_byte_count: INTEGER
			str: STRING
		do
			a_string_count := a_string.count
			if a_string_count /= 0 then
				if a_string = Current then
					str := clone (a_string)
				else
					str := a_string
				end
				nb := utf8.substring_byte_count (str, 1, a_string_count)
				k := byte_count + 1
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				byte_count := new_byte_count
				set_count (count + a_string_count)
				put_substring_at_byte_index (str, 1, a_string_count, nb, k)
			end
		end

	fill_with_code (a_code: INTEGER) is
			-- Replace every character with unicode character of code `a_code'.
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.code_byte_count (a_code)
			new_byte_count := nb * count
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			from i := 1 until i > new_byte_count loop
				put_code_at_byte_index (a_code, nb, i)
				i := i + nb
			end
		end

	fill_with_latin1 (c: CHARACTER) is
			-- Replace every character with Latin-1 character `c'.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			new_byte_count: INTEGER
		do
			nb := utf8.latin1_byte_count (c)
			new_byte_count := nb * count
			if new_byte_count > byte_capacity then
				resize_byte_storage (new_byte_count)
			end
			byte_count := new_byte_count
			if nb = 1 then
				from i := 1 until i > new_byte_count loop
					put_byte (c, i)
					i := i + 1
				end
			else
				from i := 1 until i > new_byte_count loop
					put_latin1_at_byte_index (c, nb, i)
					i := i + nb
				end
			end
		end

	insert_code (a_code: INTEGER; i: INTEGER) is
			-- Insert unicode character of code `a_code'
			-- at index `i', shifting characters between
			-- ranks `i' and `count' rightwards.
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			if i = count + 1 then
				append_code (a_code)
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
		end

	insert_latin1 (c: CHARACTER; i: INTEGER) is
			-- Insert Latin-1 character `c' at index `i', shifting
			-- characters between ranks `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
		local
			k, nb: INTEGER
			new_byte_count: INTEGER
		do
			if i = count + 1 then
				append_latin1 (c)
			else
				if count = byte_count then
					k := i
				else
					k := byte_index (i)
				end
				nb := utf8.latin1_byte_count (c)
				new_byte_count := byte_count + nb
				if new_byte_count > byte_capacity then
					resize_byte_storage (new_byte_count)
				end
				set_count (count + 1)
				move_bytes_right (k, nb)
				put_latin1_at_byte_index (c, nb, k)
			end
		end

	insert_string (a_string: STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters between ranks
			-- `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
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
						str := clone (a_string)
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

	replace_substring (a_string: like Current; start_index, end_index: INTEGER) is
	-- Note: VE 4.0, HACT 4.0.1 and ISE 5.1 have 'like Current' in their
	-- signature instead of STRING as specified in ELKS 2001:
	--replace_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
			-- (ELKS 2001 STRING)
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
						str := clone (a_string)
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

feature -- Removal

	head (n: INTEGER) is
			-- Remove all the characters except for the first `n';
			-- if `n' > `count', do nothing.
			-- (named `keep_head' in ELKS 2001 STRING)
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

	tail (n: INTEGER) is
			-- Remove all the characters except for the last `n';
			-- if `n' > `count', do nothing.
			-- (named `keep_tail' in ELKS 2001 STRING)
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

	remove (i: INTEGER) is
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

	remove_substring (start_index, end_index: INTEGER) is
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

feature -- Output

	out: STRING is
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
			Result := STRING_.make (nb)
			if nb = byte_count then
				max_ascii_char := unicode.maximum_ascii_character
				from i := 1 until i > nb loop
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
				from i := 1 until i > nb loop
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

feature -- Conversion

	as_lower: like Current is
			-- New object with all letters in lower case
			-- (Extended from ELKS 2001 STRING)
		do
			!! Result.make_from_string (Current)
			Result.to_lower
		end

	as_upper: like Current is
			-- New object with all letters in upper case
			-- (Extended from ELKS 2001 STRING)
		do
			!! Result.make_from_string (Current)
			Result.to_upper
		end

	to_lower is
			-- Convert all letters to lower case.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			b: INTEGER
			a_code, new_code: INTEGER
		do
			nb := byte_count
			from i := 1 until i > nb loop
				a_code := item_code_at_byte_index (i)
				new_code := unicode.lower_code (a_code)
				if new_code /= a_code then
					b := utf8.code_byte_count (new_code)
					put_code_at_byte_index (new_code, b, i)
				end
				i := next_byte_index (i)
			end
		end

	to_upper is
			-- Convert all letters to upper case.
			-- (ELKS 2001 STRING)
		local
			i, nb: INTEGER
			b: INTEGER
			a_code, new_code: INTEGER
		do
			nb := byte_count
			from i := 1 until i > nb loop
				a_code := item_code_at_byte_index (i)
				new_code := unicode.upper_code (a_code)
				if new_code /= a_code then
					b := utf8.code_byte_count (new_code)
					put_code_at_byte_index (new_code, b, i)
				end
				i := next_byte_index (i)
			end
		end

	to_utf8: STRING is
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of current string
		local
			i, nb: INTEGER
		do
			nb := byte_count
			Result := STRING_.make (nb)
			from i := 1 until i > nb loop
				Result.append_character (byte_item (i))
				i := i + 1
			end
		end

feature -- Traversal

	item_code_at_byte_index (i: INTEGER): INTEGER is
			-- Code of character at byte index `i'
		local
			k, nb: INTEGER
			a_byte: CHARACTER
		do
			k := i
			a_byte := byte_item (k)
			Result := utf8.encoded_first_value (a_byte)
			nb := k + utf8.encoded_byte_count (a_byte) - 1
			from k := k + 1 until k > nb loop
				a_byte := byte_item (k)
				Result := Result * 64 + utf8.encoded_next_value (a_byte)
				k := k + 1
			end
		end

	next_byte_index (i: INTEGER): INTEGER is
			-- Byte index of unicode character after character
			-- at byte index `i'; Return 'byte_count + 1' if
			-- character at byte index `i' is the last character
			-- in the string
		do
			Result := i + utf8.encoded_byte_count (byte_item (i))
		end

	shifted_byte_index (i: INTEGER; n: INTEGER): INTEGER is
			-- Byte index of unicode character `n' positions after
			-- character at byte index `i'; Return 'byte_count + 1'
			-- if no such character in the string
		local
			j: INTEGER
		do
			Result := i
			from j := 1 until j > n loop
				Result := Result + utf8.encoded_byte_count (byte_item (Result))
				if Result > byte_count then
					j := n + 1 -- Jump out of the loop.
				else
					j := j + 1
				end
			end
		end

	byte_index (i: INTEGER): INTEGER is
			-- Byte index of character at index `i'
		local
			j: INTEGER
			a_byte: CHARACTER
		do
			if byte_count = count then
				Result := i
			else
				Result := 1
				from j := 1 until j = i loop
					a_byte := byte_item (Result)
					Result := Result + utf8.encoded_byte_count (a_byte)
					j := j + 1
				end
			end
		end

	is_encoded_first_byte (i: INTEGER): BOOLEAN is
			-- Is byte at index `i' the first byte of an encoded unicode character?
		do
			Result := utf8.is_encoded_first_byte (byte_item (i))
		end

feature {NONE} -- Implementation

	latin1_item_at_byte_index (i: INTEGER): CHARACTER is
			-- Latin-1 character at byte_index `i';
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
					-- Overflow.
				Result := '%U'
			end
		ensure
			latin1_code: item_code_at_byte_index (i) <= Platform.Maximum_character_code implies Result.code = item_code_at_byte_index (i)
			overflow: item_code_at_byte_index (i) > Platform.Maximum_character_code implies Result = '%U'
		end

	put_code_at_byte_index (a_code: INTEGER; b: INTEGER; i: INTEGER) is
			-- Put unicode character of code `a_code'
			-- at byte index `i'. `b' is the number of
			-- bytes necessary to encode this character.
		require
			i_large_enough: i >= 1
			enough_space: (i + b - 1) <= byte_count
			valid_code: unicode.valid_code (a_code)
			valid_b: b = utf8.code_byte_count (a_code)
		local
			j: INTEGER
			a_byte: CHARACTER
			c: INTEGER
		do
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

	put_latin1_at_byte_index (c: CHARACTER; b: INTEGER; i: INTEGER) is
			-- Put Latin-1 character `c' at byte index `i'.
			-- `b' is the number of bytes necessary to encode `c'.
		require
			i_large_enough: i >= 1
			enough_space: (i + b - 1) <= byte_count
			valid_b: b = utf8.latin1_byte_count (c)
		local
			a_byte: CHARACTER
			a_code: INTEGER
		do
			if b = 1 then
					-- 0xxxxxxx
				put_byte (c, i)
			else
					-- 110xxxxx 10xxxxxx
				a_code := c.code
				a_byte := INTEGER_.to_character ((a_code // 64) + 192)
				put_byte (a_byte, i)
				a_byte := INTEGER_.to_character ((a_code \\ 64) + 128)
				put_byte (a_byte, i + 1)
			end
		end

	put_substring_at_byte_index (a_string: STRING; start_index, end_index, b: INTEGER; i: INTEGER) is
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
			valid_b: b = utf8.substring_byte_count (a_string, start_index, end_index)
		local
			j, nb: INTEGER
			k, z: INTEGER
			c: CHARACTER
			a_code: INTEGER
			a_utf8_string: UC_UTF8_STRING
			a_uc_string: UC_STRING
		do
			if b > 0 then
				if a_string.same_type (dummy_latin1) then
					nb := end_index - start_index + 1
					if nb = b then
						k := i
						from j := start_index until j > end_index loop
							put_byte (a_string.item (j), k)
							k := k + 1
							j := j + 1
						end
					else
						k := i
						from j := start_index until j > end_index loop
							c := a_string.item (j)
							z := utf8.latin1_byte_count (c)
							put_latin1_at_byte_index (c, z, k)
							k := k + z
							j := j + 1
						end
					end
				elseif a_string.same_type (Current) then
					a_utf8_string ?= a_string
					check is_utf8: a_utf8_string /= Void end
					k := i
					j := a_utf8_string.byte_index (start_index)
					nb := j + b - 1
					from until j > nb loop
						put_byte (a_utf8_string.byte_item (j), k)
						k := k + 1
						j := j + 1
					end
				else
					a_uc_string ?= a_string
					if a_uc_string /= Void then
						k := i
						j := a_uc_string.byte_index (start_index)
						nb := j + b - 1
						from until j > nb loop
							a_code := a_uc_string.item_code_at_byte_index (j)
							z := utf8.code_byte_count (a_code)
							put_code_at_byte_index (a_code, z, k)
							k := k + z
							j := a_uc_string.next_byte_index (j)
						end
					else
						k := i
						from j := start_index until j > end_index loop
							a_code := a_string.item_code (j)
							z := utf8.code_byte_count (a_code)
							put_code_at_byte_index (a_code, z, k)
							k := k + z
							j := j + 1
						end
					end
				end
			end
		end

end
