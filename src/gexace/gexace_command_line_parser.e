class
   
   GEXACE_COMMAND_LINE_PARSER
   
inherit
   
   KL_SHARED_ARGUMENTS
   
   UT_STRING_ROUTINES
   
feature {ANY} -- Operations
   
   reset is
	 -- reset internal option position to first option
	 -- must be called before first use.
      do
	 next_option_position := 1
      end
   
   consume_option is
	 -- move `next_token_position' to the next token position
      do
	 next_option_position := next_option_position + 1
      end
   
feature {ANY} -- Status
   
   has_next_option: BOOLEAN is
	 -- is there an unconsumed token left ?
      do
	 Result := is_valid_option_position (next_option_position)
      end
   
   is_next_option_long_option: BOOLEAN is
	 -- is the next option a long option (with or without a value)
      do
	 Result := next_option.substring (1, 2).is_equal ("--")
      end
   
   has_next_option_value: BOOLEAN is
	 -- has the next option a value ?
      require
	 has_next_option: has_next_option
	 next_option_is_long_option: is_next_option_long_option
      do
	 Result := next_option.occurrences ('=') > 0 and then next_option.index_of ('=', 1) < next_option.count
      end
   
feature -- Access
   
   next_option: STRING is
	 -- returns the next option
      require
	 has_next_option: has_next_option
      do
	 Result := Arguments.argument (next_option_position)
      ensure
	 result_not_void: Result /= Void
      end
   
   next_option_value: STRING is
	 -- returns the value of the next option
      require
	 next_option_is_long_option: is_next_option_long_option
	 has_next_option_value: has_next_option_value
      local
	 pair: DS_PAIR [STRING, STRING]
      do
	 pair := split_on_first (next_option, '=')
	 Result := pair.second
      ensure
	 result_not_void: Result /= Void
      end

feature -- Matching
   
   match_long_option (option_name: STRING): BOOLEAN is
	 -- returns `True' if the next token is a long options (with or
	 -- without a value).
	 -- `option_name' must be only the pure option name (without the "--" prefix).
      require
	 option_name_not_void: option_name /= Void
      local
	 full_option_name: STRING
	 str: STRING
      do
	 full_option_name := clone ("--")
	 full_option_name.append_string (option_name)
	 if
	    has_next_option
	  then
	    str := next_option
	    if
	       str.count >= full_option_name.count and then 
	       str.substring (1, full_option_name.count).is_equal (full_option_name)
	     then
	       -- TODO: check if next char is a seperator (WS,'=')
	       Result := True
	    end
	 end
      end

feature {NONE} -- Implementation

   next_option_position: INTEGER
	 -- index of next option

   is_valid_option_position (i: INTEGER): BOOLEAN is
	 -- Is `i' a valid token position ?
      do
	 Result := i >= 1 and i <= Arguments.argument_count
      end

end
