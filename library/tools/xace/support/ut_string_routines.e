class

   UT_STRING_ROUTINES

feature

   split_string (s: STRING; c: CHARACTER): DS_LINKED_LIST [STRING] is
	 -- split `s' on `c' and return token list
      require
	 s_not_void: s /= Void
      local
	 i, mark: INTEGER
      do
	 from
	    !! Result.make
	    i := 1
	    mark := i
	 until
	    i > s.count
	 loop
	    if
	       s.item (i) = c and
		  i > mark
	     then
	       Result.put_last (s.substring (mark, i - 1))
	       mark := i + 1
	    end
	    i := i + 1
	 end
	 if
	    i > mark
	  then
	    Result.put_last (s.substring (mark, i - 1))
	 end
      ensure
	 result_not_void: Result /= Void
	 result_has_at_least_one_element: Result.count >= 1
	 result_items_not_void: not Result.has (Void)
	 -- result items are not empty
      end

   split_on_first (s: STRING; c: CHARACTER): DS_PAIR [STRING, STRING] is
	 -- similar to `split' but returns a pair consisting of the first item
	 -- and the rest
	 -- if `c' does not occure `Result.second' is `Void'
	 -- note: implementation could use a performance rewrite (;
      require
	 s_not_void: s /= Void
      local
	 l: DS_LINKED_LIST [STRING]
	 cs: DS_LINKED_LIST_CURSOR [STRING]
	 first, second: STRING
      do
	 l := split_string (s, c)
	 first := l.first
	 if
	    l.count > 1
	  then
	    from
	       second := clone ("")
	       cs := l.new_cursor
	       cs.start
	       cs.forth
	    until
	       cs.off
	    loop
	       second.append_string (cs.item)
	       cs.forth
	       if
		  not cs.off
		then
		  second.append_character (c)
	       end
	    end
	 end
	 !! Result.make (first, second)
      ensure
	 result_not_void: Result /= Void
	 first_not_void: Result.first /= Void
      end

   replace_all_characters (str: STRING; old_char, new_char: CHARACTER): STRING is
	 -- replace all occurences of `old_char' in `str' with `new_char'
	 -- returen a new string
      require
	 str_not_void: str /= Void
      local
	 i: INTEGER
      do
	 from
	    i := 1
	    Result := clone ("")
	 until
	    i > str.count
	 loop
	    if
	       str.item (i) = old_char
	     then
	       Result.append_character (new_char)
	    else
	       Result.append_character (str.item (i))
	    end
	    i := i + 1
	 end
      ensure
	 str_not_void: str /= Void
      end

   remove_all_characters (str: STRING; char: CHARACTER): STRING is
	 -- remove all occurences of `old_char'
	 -- returen a new string
      require
	 str_not_void: str /= Void
      local
	 i: INTEGER
      do
	 from
	    i := 1
	    Result := clone ("")
	 until
	    i > str.count
	 loop
	    if
	       str.item (i) /= char
	     then
	       Result.append_character (str.item (i))
	    end
	    i := i + 1
	 end
      ensure
	 str_not_void: str /= Void
      end

   array_to_string (a: ARRAY [STRING]): STRING is
	 -- concatenates all array items into one string
	 -- returns a new string everytime.
      require
	 a_not_void: a /= Void
--	 no_element_void: not a.has (Void)
	 a_count_bigger_zero: a.count > 0
      local
	 i: INTEGER
      do
	 from
	    i := a.lower
	    Result := clone ("")
	 until
	    i > a.upper
	 loop
	    Result.append_string (a.item (i))
	    i := i + 1
	 end
      end

end
