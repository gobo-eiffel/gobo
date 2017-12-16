note

	description:

		"String routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_STRING_ROUTINES

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Basic operations

	split_string (s: STRING; c: CHARACTER): DS_LINKED_LIST [STRING]
			-- Split `s' on `c' and return token list
		require
			s_not_void: s /= Void
		local
			i, nb, mark: INTEGER
		do
			from
				create Result.make
				i := 1
				nb := s.count
				mark := i
			until
				i > nb
			loop
				if s.item (i) = c then
					if i > mark then
						Result.put_last (s.substring (mark, i - 1))
					else
						Result.put_last (STRING_.new_empty_string (s, 0))
					end
					mark := i + 1
				end
				i := i + 1
			end
			if nb >= mark then
				Result.put_last (s.substring (mark, nb))
			else
				Result.put_last (STRING_.new_empty_string (s, 0))
			end
		ensure
			result_not_void: Result /= Void
			result_has_at_least_one_element: Result.count >= 1
			result_items_not_void: not Result.has_void
		end

	split_on_first (s: STRING; c: CHARACTER): DS_PAIR [STRING, detachable STRING]
			-- Similar to `split' but return a pair consisting of the first item
			-- and the rest; if `c' does not occur `Result.second' is Void.
		require
			s_not_void: s /= Void
		local
			i, nb, mark: INTEGER
			first: detachable STRING
			second: STRING
		do
			from
				i := 1
				nb := s.count
				mark := i
			until
				i > nb
			loop
				if s.item (i) = c then
					if i > mark then
						first := s.substring (mark, i - 1)
					else
						first := STRING_.new_empty_string (s, 0)
					end
					mark := i + 1
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
			if nb >= mark then
				second := s.substring (mark, nb)
			else
				second := STRING_.new_empty_string (s, 0)
			end
			if first = Void then
				create Result.make (second, Void)
			else
				create Result.make (first, second)
			end
		ensure
			result_not_void: Result /= Void
			first_not_void: Result.first /= Void
		end

	replace_all_characters (str: STRING; old_char, new_char: CHARACTER): STRING
			-- Replace all occurrences of `old_char' in `str' by `new_char';
			-- Return a new string.
		require
			str_not_void: str /= Void
		local
			i, nb: INTEGER
		do
			Result := STRING_.cloned_string (str)
			nb := Result.count
			from i := 1 until i > nb loop
				if Result.item (i) = old_char then
					Result.put (new_char, i)
				end
				i := i + 1
			end
		ensure
			str_not_void: str /= Void
		end

	remove_all_characters (str: STRING; char: CHARACTER): STRING
			-- Remove all occurrences of `old_char';
			-- Return a new string.
		require
			str_not_void: str /= Void
		local
			i, j, nb: INTEGER
		do
			Result := STRING_.cloned_string (str)
			nb := str.count
			j := 1
			from i := 1 until i > nb loop
				if str.item (i) = char then
					Result.remove (j)
				else
					j := j + 1
				end
				i := i + 1
			end
		ensure
			str_not_void: str /= Void
		end

	array_to_string (a: ARRAY [STRING]): STRING
			-- Concatenate all array items into one string;
			-- Return a new string every time.
		require
			a_not_void: a /= Void
			-- no_element_void: not a.has (Void)
			a_count_bigger_zero: a.count > 0
		local
			i, nb: INTEGER
		do
			i := a.lower
			nb := a.upper
			Result := STRING_.new_empty_string (a.item (i), 50)
			from until i > nb loop
				Result := STRING_.appended_string (Result, a.item (i))
				i := i + 1
			end
		end

end
