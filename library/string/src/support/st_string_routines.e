note

	description:

		"Routines on strings and characters."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2007-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_STRING_ROUTINES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	ST_IMPORTED_UNICODE_CHARACTER_CLASS_ROUTINES
		export {NONE} all end

feature -- Status report

	is_all_whitespace (chars: STRING): BOOLEAN
			-- Does `chars' consist only of XML white-space characters?
		require
			chars_not_void: chars /= Void
		local
			counter: INTEGER
		do
			from
				counter := 1
				Result := True
			until
				Result = False or else counter > chars.count
			loop
				if not is_xml_space (chars.code (counter)) then
					Result := False
				end
				counter := counter + 1
			variant
				chars.count + 1 - counter
			end
		ensure
			instance_free: class
		end

	is_alphanumeric (a_character_code: INTEGER): BOOLEAN
			-- Does `a_character_code' represent an alphanumeric character?
		require
			positive_character_code: a_character_code > 0
		do
			Result := unicode_character_class.unicode.valid_code (a_character_code)
				and then (unicode_character_class.is_letter (a_character_code)
							 or else unicode_character_class.is_number (a_character_code))
		ensure
			instance_free: class
		end

	is_xml_space (a_code: NATURAL_32): BOOLEAN
			-- Does `a_code' represent an XML space?
		do
			Result := a_code = 32 or a_code = 9 or a_code = 10 or a_code = 13
		ensure
			instance_free: class
		end

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

