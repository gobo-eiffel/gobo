indexing

   description:

   "Sequence of UC_CHARACTERs, accessible through integer indices in a contigous range.";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_STRING

inherit
   COMPARABLE
      redefine infix "<=", infix ">", infix ">=", is_equal,
	 three_way_comparison, out, copy
      end
   HASHABLE
      redefine is_equal, out, copy
      end

creation
   make, make_from_string, make_from_utf8

feature -- Creation

   frozen make (n: INTEGER) is
	 -- Allocate space for at least `n' characters.
      require
	 non_negative_size: n >= 0
      do
	 i_representation := i_settings.create_representation
      ensure
	 empty_string: count = 0;
	 -- correctly_allocated_size: capacity >= n;
      end

   make_from_string (other: STRING) is
	 -- Initialize from the characters of `other'.
	 -- (Useful in proper descendants of class STRING,
	 -- to initialize a string-like object from a manifest string.)
      require
	 string_exists: other /= Void;
      do
	 make(other.count)
	 append_string(other)
      ensure
	 count_set: count = other.count;
      end

   make_from_utf8 (other: STRING) is
	 -- Initialize from the characters of `other' which are
	 -- stored in UFT8-Format
      require
	 string_exists: other /= Void
	 valid_utf8: valid_utf8(other)
      local
	 pos: INTEGER
      do
	 make(other.count)

	 from
	    pos := 1
	 until
	    pos > other.count
	 loop
	    utf8utils.read_code(other, pos)
	    append_ucc_code(utf8utils.last_code)
	    pos := utf8utils.next_pos
	 end
      end

feature -- Initialization

--   from_c (c_string: POINTER) is
--	 -- not implemented
--      require
--	 C_string_exists: c_string /= void
--      do
--	 --! not implemented
--      end

   frozen remake (n: INTEGER) is
	 -- Allocate space for at least `n' characters.
      require
	 non_negative_size: n >= 0
      do
	 wipe_out
      ensure
	 empty_string: count = 0
      end;

feature -- Access

   hash_code: INTEGER is
      local
	 i: INTEGER
      do
	 -- taken from SmallEiffel

         i := count;
         if i > 5 then
            Result := i * item(i).code
            i := 5
         end
         from until i <= 0 loop
            Result := Result + item(i).code
            i := i - 1
         end
         Result := Result * count
      end

   index_of (c: UC_CHARACTER; start: INTEGER): INTEGER is
	 -- Position of first occurrence of `c' at or after `start';
	 -- 0 if none.
      require
	 start_large_enough: start >= 1
	 start_small_enough: start <= count
      local
	 i: INTEGER;
      do
	 from
	    i := start
	 until
	    i > count or else item_code(i) = c.code
	 loop
	    i := i + 1;
	 end

	 if i<= count then
	    Result := i
	 end
      ensure
	 non_negative_result: Result >= 0;
         at_this_position: Result > 0 implies item(Result).code = c.code
	 -- none_before: For every i in start..Result, item (i) /= c
	 -- zero_iff_absent:
	 --     (Result = 0) = For every i in 1..count, item (i) /= c
      end

   item, infix "@" (i: INTEGER): UC_CHARACTER is
	 -- Character at position `i'
      require
	 good_key: valid_index (i)
      do
	 Result.make_from_integer(item_code(i))
      end

   substring_index (other: UC_STRING; start: INTEGER): INTEGER is
	 -- Position of first occurrence of `other' at or after `start';
	 -- 0 if none.
      require
	 start_in_range: valid_index(start);     --! mk
	 other_non_void: other /= void;		 --! mk
      local
	 i,j: INTEGER;
      do
	 from
	    i := start
	 until
	    Result /= 0 or else i > count - other.count + 1
	 loop
	    from
	       j := 1
	    until
	       j > other.count or else not item(i+j-1).is_equal(other.item(j))
	    loop
	       j := j + 1;
	    end

	    if j > other.count then
	       Result := i
	    end

	    i := i + 1
	 end
      ensure
	 non_negative_result: Result >= 0; -- mk
         at_this_position: Result > 0 implies
			   substring(Result,
				     Result+other.count-1).is_equal(other);--mk
      end

feature -- Measurement

   count: INTEGER is
	 -- Actual number of characters making up the string
      do
	 Result := i_representation.count
      end

   occurrences (c: UC_CHARACTER): INTEGER is
	 -- Number of times `c' appears in the string
      local
	 i: INTEGER
      do
	 from
	    i := 1
	 until
	    i > count
	 loop
	    if item_code(i) = c.code then
	       Result := Result + 1
	    end
	    i := i + 1
	 end
      ensure
	 non_negative_occurrences: Result >= 0
      end

feature -- Comparison

   is_equal (other: like Current): BOOLEAN is
	 -- Is string made of same character sequence as other?
	 -- (Redefined from `GENERAL')
      do
	 if Current = other then
	    Result := true
         else
	    if count = other.count then
	       Result := three_way_comparison(other) = 0
            end
         end
      end

   infix "<" (other: like Current): BOOLEAN is
      do
	 Result := three_way_comparison(other) < 0
      end

   infix "<=" (other: like Current): BOOLEAN is
      do
	 Result := three_way_comparison(other) <= 0
      end

   infix ">=" (other: like Current): BOOLEAN is
      do
	 Result := three_way_comparison(other) >= 0
      end

   infix ">" (other: like Current): BOOLEAN is
      do
	 Result := three_way_comparison(other) > 0
      end

   three_way_comparison (other: like Current): INTEGER is
      local
	 stop: BOOLEAN
	 i: INTEGER
      do
	 if Current = other then
	    Result := 0
         else
	    from
	       i := 1
	    until
	       stop or else i > count.min(other.count)
	    loop
	       if item(i) < other.item(i) then
		  Result := -1
		  stop := true
	       elseif item(i) > other.item(i) then
		  Result := 1
		  stop := true
	       end

	       i := i + 1
	    end

	    if Result = 0 then
	       if count > other.count then
		  Result := 1
	       elseif count < other.count then
		  Result := -1
	       end
	    end
	 end
      end

feature -- Status report

   empty: BOOLEAN is
	 -- Is string empty?
      do
	 Result := count = 0
      end

   valid_index (i: INTEGER): BOOLEAN is
	 -- Is `i' within the bounds of the string?
      do
	 Result := (1 <= i) and (i <= count)
      end

feature -- Element change

   append_boolean (b: BOOLEAN) is
	 -- Append the string representation of `b' at end.
      do
	 append_string(b.out)
      end

   append_character (c: CHARACTER) is
      do
	 append_ucc_code(c.code)
      ensure
	 item_inserted: item_code(count) = c.code;
         -- one_more_occurrence: occurrences(c) = old (occurrences(c)) + 1;
      end

   append_double (d: DOUBLE) is
	 -- Append the string representation of `d' at end.
      do
	 append_string(d.out)
      end

   append_integer (i: INTEGER) is
	 -- Append the string representation of `i' at end.
      do
	 append_string(i.out)
      end

   append_real (r: REAL) is
	 -- Append the string representation of `r' at end.
      do
	 append_string(r.out)
      end

   append_string (s: STRING) is
	 -- Append a copy of `s' if not void, at end
      local
	 i: INTEGER
      do
	 if s /= void then
	    from
	       i := 1
	    until
	       i > s.count
	    loop
	       append_ucc_code(s.item(i).code)
	       i := i + 1
	    end
	 end
      ensure
	 new_count: s /= void and then count = old count + s.count;
         -- appended: For every `ì' in 1..s.count
         --   item(old count + 1) = s.item(i)
      end

   append_ucchar (c: UC_CHARACTER) is
	 -- Append `c' at end.
      obsolete "Use `append_uc_character' instead."
      do
         append_uc_character(c)
      end

   append_uc_character (c: UC_CHARACTER) is
	 -- Append `c' at end.
      do
	 append_ucc_code(c.code)
      ensure
	 item_inserted: item(count).code = c.code
	 one_more_occurrence: occurrences (c) = old (occurrences (c)) + 1
	 -- item_inserted: has (c)
      end

   append_ucstring (s: UC_STRING) is
	 -- Append a copy of `s', if not void, at end.
      obsolete "Use `append_uc_string' instead."
      do
         append_uc_string(s)
      end

   append_uc_string (s: UC_STRING) is
	 -- Append a copy of `s', if not void, at end.
      do
	 if s /= void and then not s.empty then
	    i_representation.insert(count+1, s.i_representation, 1, s.count)
         end
      ensure
	 new_count: count = (old count) + s.count
	 -- appended: For every i in 1.. s.count,
	 --     item (old count + i) = s.item (i)
      end

   fill (c: UC_CHARACTER) is
	 -- Replace every character with `c'.
      local
	 i: INTEGER;
      do
	 from
	    i := 1
	 until
	    i > count
	 loop
	    put_code(c.code, i)
	    i := i + 1
	 end
      ensure
	 -- allblank: For every i in 1..count, item (i) = Blank
      end

   head (n: INTEGER) is
	 -- Remove all characters except for the first `n';
	 -- do nothing if `n' >= count.
      require
	 non_negative_argument: n >= 0
      do
	 if n < count then
	    remove_between(n+1, count)
         end
      ensure
	 new_count: count = n.min (old count)
	 -- first_kept: For every i in 1..n, item (i) = old item (i)
      end

   insert (s: like Current; i: INTEGER) is
	 -- Add `s' to the left of position `i'.
      require
	 string_exists: s /= Void;
	 index_small_enough: i <= count;
	 index_large_enough: i > 0
      do
	 if not s.empty then
	    i_representation.insert(i, s.i_representation, 1, s.count)
	 end
      ensure
	 new_count: count = old count + s.count
      end

   insert_ucchar (c: UC_CHARACTER; i: INTEGER) is
      obsolete "Use `insert_uc_character' instead"
      do
         insert_uc_character(c, i)
      end

   insert_uc_character (c: UC_CHARACTER; i: INTEGER) is
	 -- Add `c' to the left of position `i'.
      do
	 i_representation.insert_code(c.code, i)
      ensure
         new_count: count = old count + 1
      end

   left_adjust is
	 -- Remove leading white space.
      local
	 i: INTEGER
      do
	 from
	    i := 1
	 until
	    i > count or else not is_whitespace(item(i).code)
	 loop
	    i := i + 1
	 end

         if i > 1 then
	    i_representation.remove(1, i-1)
         end
      ensure
	 --! new_count: (count /= 0) implies (item(1).code /= (' ').code)
      end

   put (c: UC_CHARACTER; i: INTEGER) is
	 -- Replace character at position `i' by `c'.
      require
	 good_key: valid_index (i)
      do
	 put_code(c.code, i);
      ensure
	 insertion_done: item(i).code = c.code
      end

--   put_substring (s: like Current; start_pos, end_pos: INTEGER) is
--	 -- Copy the characters of `s' to positions
--	 -- `start_pos' .. `end_pos'.
--      require
--	 string_exists: s /= Void;
--	 index_small_enough: end_pos <= count;
--	 order_respected: start_pos <= end_pos;
--	 index_large_enough: start_pos > 0
--      local
--	 i: INTEGER
--      do
--	 --!!!!! completely unclear
--	 from
--	    i := 0
--	 until
--	    i > s.count.min(end_pos - start_pos + 1)
--	 loop
--	    i_storage.put(s.i_storage.item(i+1), i)
--	    i := i + 1
--	 end
--      ensure
--	 new_count: count = old count + s.count - end_pos + start_pos - 1
--      end

   right_adjust is
	 -- Remove trailing white space.
      local
	 i: INTEGER
      do
	 from
	    i := count
	 until
	    i <= 0 or else not is_whitespace(item(i).code)
	 loop
	    i := i - 1
	 end
	 if i < count then
	    remove_between(i+1,count)
	 end
      ensure
	 --! new_count: (count /= 0) implies (item(count).code /= (' ').code)
      end

   tail (n: INTEGER) is
	 -- Remove all characters except for the last `n';
	 -- do nothing if `n' >= count.
      require
	 non_negative_argument: n >= 0
      do
	 if n < count then
	    remove_between(1,count-n)
	 end
      ensure
	 new_count: count = n.min (old count)
      end

feature -- Removal

   remove (i: INTEGER) is
	 -- Remove `i'-th character.
      require
	 index_small_enough: i <= count;
	 index_large_enough: i > 0
      do
	 remove_between(i, i)
      ensure
	 new_count: count = old count - 1
      end

   wipe_out is
	 -- Remove all characters.
      do
	 if not empty then
	    remove_between(1, count)
	 end
      ensure
	 empty_string: count = 0;
	 wiped_out: empty
      end

feature -- Resizing

   resize (newsize: INTEGER) is
	 -- Rearrange string so that it can accommodate
	 -- at least newsize characters.
	 -- Do not lose any previously entered character.
      require
	 new_size_non_negative: newsize >= 0
      local
	 i: INTEGER
      do
	 --? what's the correct definition of this method?

	 if newsize > count then
	    from
	       i := newsize - count
	    until
	       i = 0
	    loop
	       append_ucc_code((' ').code)
	       i := i - 1
	    end
	 elseif newsize < count then
	    head (newsize)
	 end
      end

feature -- Conversion

--   to_boolean: BOOLEAN is
--	 -- Boolean value;
--	 -- "true" yields true, "false" yields false
--	 -- (case-insensitive)
--      do
--	 --! TBD
--      end

--   to_double: DOUBLE is
--	 -- "Double" value; for example, when applied to "123.0",
--	 -- will yield 123.0 (double)
--      do
--	 --! TBD
--      end

   to_integer: INTEGER is
	 -- Integer value;
	 -- for example, when applied to "123", will yield 123
      local
	 i: INTEGER
         last_character: INTEGER
	 state: INTEGER;
         sign: BOOLEAN;
         last_integer: INTEGER
         -- state = 0 : waiting sign or first digit.
         -- state = 1 : sign read, waiting first digit.
         -- state = 2 : in the number.
         -- state = 3 : end state.
         -- state = 4 : error state.
      do
	 -- taken from SmallEiffel

         from
	    i := 1
         until
            i > count or state > 2
         loop
            last_character := item(i).code
            inspect
               state
            when 0 then
               if is_whitespace(last_character) then
               elseif is_digit(last_character) then
                  last_integer := int_value(last_character)
                  state := 2;
               elseif last_character = ('-').code then
                  sign := true;
                  state := 1;
               elseif last_character = ('+').code then
                  state := 1;
               else
                  state := 4;
               end;
            when 1 then
               if is_whitespace(last_character) then
               elseif is_digit(last_character) then
                  last_integer := int_value(last_character)
                  state := 2;
               else
                  state := 4;
               end;
            else -- 2
               if is_digit(last_character) then
                  last_integer := (last_integer * 10) + int_value(last_character)
               else
                  state := 3;
               end;
            end;
            if i = count then
               inspect
                  state
               when 0 .. 1 then
                  state := 4;
               when 2 .. 3 then
                  state := 3;
               else -- 4
               end;
            end;
            i := i + 1
         end
         debug
            if state = 4 then
               io.error.put_string("Error in UC_STRING.to_integer.%N");
               --crash;
            end;
         end;
         if sign then
            last_integer := - last_integer;
         end;

         Result := last_integer
      end

   to_lower is
	 -- Convert to lower case.
      local
	 i: INTEGER
	 ucc: UC_CHARACTER
      do
	 from
	    i := 1
	 until
	    i > count
	 loop
	    ucc := item(i)
	    ucc.to_lower
            put(ucc, i)
	    i := i + 1
	 end
      end

   to_title is
	 -- Convert to title case.
      local
	 i: INTEGER
	 ucc: UC_CHARACTER
      do
	 from
	    i := 1
	 until
	    i > count
	 loop
	    ucc := item(i)
	    ucc.to_title
            put(ucc, i)
	    i := i + 1
	 end
      end

--   to_real: REAL is
--	 -- Real value;
--	 -- for example, when applied to "123.0", will yield 123.0
--      do
--	 --! TBD
--      end

   to_upper is
	 -- Convert to upper case.
      local
	 i: INTEGER
	 ucc: UC_CHARACTER
      do
	 from
	    i := 1
	 until
	    i > count
	 loop
	    ucc := item(i)
	    ucc.to_upper
            put(ucc, i)
	    i := i + 1
	 end
      end

   to_utf8: STRING is
	 -- Conversion to UTF-8 (as defined by RFC 2279)
      local
	 i,c,pos: INTEGER
      do
	 !!Result.make(count)

         -- Visual Eiffel makes things a little bit complicated
         if Result.count /= 0 then
	    Result.wipe_out
         end

	 from
	    i := 1
	 until
	    i > count
	 loop
	    c := item(i).code
	    pos := Result.count + 1
	    utf8utils.put_code(c, Result, pos)

	    i := i + 1
	 end
      ensure
	 result_not_void: Result /= Void
      end

feature -- Duplication

   copy (other: like Current) is
      do
	 -- we can't wipe_out representation, if available, for it is
	 -- the same as other.i_reprresentation for VE. have to
	 -- reread the clone semantics

	 i_representation := i_settings.create_representation

	 if not other.empty then
	    i_representation.insert(1, other.i_representation, 1, other.count)
	 end
      end

   substring (n1, n2: INTEGER): like Current is
	 -- Copy of substring containing all characters at indices
	 -- between `n1' and `n2'
      require
	 meaningful_origin: 1 <= n1;
	 meaningful_interval: n1 <= n2;
	 meaningful_end: n2 <= count
      local
	 i: INTEGER
      do
	 !!Result.make(n2-n1+1)

	 from
	    i := n1
	 until
	    i > n2
	 loop
	    Result.append_ucc_code(item_code(i))
	    i := i + 1
	 end
      ensure
	 new_result_count: Result.count = n2 - n1 + 1
	 -- original_characters: For every i in 1..n2-n1,
	 --     Result.item (i) = item (n1 + i -1)
      end

feature -- Output

   out: STRING is
	 --| characters with code >= 256 will be represented as
	 --| "\uxxxx;", where "xxxx" is the hexadecimal
	 --| representation of code.
      local
	 i: INTEGER
      do
         !!Result.make(0)

	 from
	    i := 1
	 until
	    i > count
	 loop
	    Result.append_string(item(i).out)
	    i := i + 1
	 end
      end

   valid_utf8 (s: STRING): BOOLEAN is
	 -- is `s' a valid UTF8-representation.
	 --| this will not check all errors!
      require
	 string_exists: s /= void;
      do
	 Result := utf8utils.valid_utf8(s, 1, s.count)
      end

feature {UC_STRING} -- Implementation

   utf8utils: UC_UTF8_UTILS is
      once
	 !!Result
      end

   remove_between (p_from, p_end: INTEGER) is
      require
	 valid_index(p_from);
	 valid_index(p_end);
	 p_from <= p_end;
      do
	 i_representation.remove(p_from, p_end-p_from+1)
      end

feature{UC_STRING}

   item_code (i: INTEGER): INTEGER is
      do
	 Result := i_representation.item_code(i)
      end

   put_code (c, i: INTEGER) is
      do
	 i_representation.put_code(c,i)
      end

   append_ucc_code(n: INTEGER) is
	 -- append single ucchar with code `n'
      require
	 is_unicode: 0 <= n and n <= maximum_uc_character_code
      do
	 i_representation.insert_code(n,count+1)
      ensure
	 count = (old count) + 1;
      end

   is_whitespace (i: INTEGER): BOOLEAN is
	 -- is character with code `i' a whitespace?
      do
	 inspect i
	 when 32, 9, 10, 12, 13
	  then Result := true
	 else
	    Result := false
         end
      end

   is_digit (i: INTEGER): BOOLEAN is
	 -- is character with code `i' a digit?
      do
	 if i >= ('0').code and i <= ('9').code then
	    Result := true
         end
      end

   int_value (code: INTEGER): INTEGER is
	 -- return the value of integer `code'.
      require
	 is_digit: is_digit(code)
      do
	 Result := code - ('0').code
      end

   maximum_uc_character_code: INTEGER is
      local
	 ucc: UC_CHARACTER
      once
	 Result := ucc.maximum_uc_character_code
      end

feature {UC_STRING} -- representation

   i_representation: UC_REPRESENTATION

   i_settings: UC_SETTINGS is
      once
	 !!Result
      end

invariant

   empty_definition       : empty = (count = 0);
   non_negative_count     : count >= 0;

end
