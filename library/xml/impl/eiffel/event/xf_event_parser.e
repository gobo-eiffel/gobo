class
   XF_EVENT_PARSER
inherit
   XF_PARSER
      rename
	 position as position_nat_parser
      redefine
	 print_last_token,
	 report_error
      end
   XI_EVENT_PARSER
	 

creation
   make
feature {ANY}
   
   is_incremental: BOOLEAN is False
   
   source: XM_SOURCE
   
   set_source (a_source: XM_SOURCE) is
      do
	 source := a_source
      end


   parse_from_file_name (a_file_name: UC_STRING) is
      local
	 in_file: like INPUT_STREAM_TYPE
      do
	 in_file := INPUT_STREAM_.make_file_open_read (a_file_name.out)
	 check
	    is_open_read: INPUT_STREAM_.is_open_read (in_file)
	 end
	 parse_from_stream (in_file)
	 INPUT_STREAM_.close (in_file)
      end
   
   parse_from_stream (a_stream: like INPUT_STREAM_TYPE) is
		local
			a_filename: UC_STRING
      do
			!! a_filename.make_from_string (INPUT_STREAM_.name (a_stream))
			!XM_DEFAULT_URI_SOURCE! source.make (a_filename)
	 set_input_buffer (new_file_buffer (a_stream))
	 parse
      end
   
   parse_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
      do
	 check
	    False -- TODO
	 end
      end
   
   
   parse_from_string (data: STRING) is
      do
	 check
	    False -- TODO
	 end
      end

feature {ANY} -- Incremental Parsing
   
   parse_incremental_from_stream (a_stream: like INPUT_STREAM_TYPE) is
      do
	 check
	    False -- Not supported
	 end
      end
   
   parse_incremental_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
      do
	 check
	    False -- Not supported
	 end
      end
   
   
   parse_incremental_from_string (data: STRING) is
      do
	 check
	    False -- Not supported
	 end
      end

   set_end_of_document is
      do
	 check
	    False -- Not supported
	 end
      end

feature -- Status
   
   last_error: INTEGER
   
   last_error_description: STRING

   position: XM_POSITION is
      do
	 !XM_DEFAULT_POSITION! Result.make (source, position_nat_parser, column, line)
      end
		
feature -- Debug   
   
   print_last_token is
      do
	 std.error.put_string ("[")
	 std.error.put_string (token_name (last_token))
	 std.error.put_string (",")
	 if yyLine_used then
	    -- Line and column numbers are used.
	    std.error.put_integer (line)
	    std.error.put_string (",")
	    std.error.put_integer (column)
	    std.error.put_string (",")
	 end
	 if yyPosition_used then
	    -- Position number is used.
	    std.error.put_integer (position_nat_parser)
	    std.error.put_string (",")
	 end
	 inspect last_token
	 when yyEOF_token then
	    std.error.put_string ("EOF]")
	 when yyError_token then
	    std.error.put_string ("ERR]")
	 when yyUnknown_token then
	    -- Should never happen.
	    std.error.put_string ("Unknown token%N")
	 else
	    std.error.put_character ('%"')
	    std.error.put_string (text)
	    std.error.put_string ("%"]%N")
	 end
      end
   
   report_error (m: STRING) is
      do
	 last_error := Xml_err_unknown
	 last_error_description := clone (m)
      end
   
   handle_error (err: INTEGER) is
      do
--	 last_error := err
--	 last_error_description := clone ("Unknown error occured")
      end

end
