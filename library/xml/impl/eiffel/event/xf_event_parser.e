class XF_EVENT_PARSER

obsolete "Use XM_EIFFEL_PARSER or XM_EXPAT_PARSER(_FACTORY)"

inherit

	XF_PARSER
		rename
			position as position_nat_parser
		redefine
			print_last_token, report_error
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
			in_file: KL_TEXT_INPUT_FILE
		do
			!! in_file.make (a_file_name.out)
			in_file.open_read
			check
				is_open_read: in_file.is_open_read
			end
			parse_from_stream (in_file)
			in_file.close
		end

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
		local
			a_filename: UC_STRING
		do
			a_filename := new_unicode_string (a_stream.name)
			!XM_DEFAULT_URI_SOURCE! source.make (a_filename)
			reset
			set_input_buffer (new_file_buffer (a_stream))
			parse
		end

	parse_from_string (data: STRING) is
		do
			reset
			set_input_buffer (new_string_buffer (data))
			parse
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
		do
			check
				False   -- Not supported
			end
		end

	parse_incremental_from_string (data: STRING) is
		do
			check
				False   -- Not supported
			end
		end

	set_end_of_document is
		do
			check
				False   -- Not supported
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
				-- last_error := err
				-- last_error_description := clone ("Unknown error occured")
		end

end
