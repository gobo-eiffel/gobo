indexing

	description:

		"C-like preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP

inherit

	ARGUMENTS
		export
			{NONE} all
		end

	KL_SHARED_INPUT_STREAM_ROUTINES

	KL_SHARED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_EXCEPTIONS

creation

	execute

feature -- Processing

	execute is
			-- Start 'gepp' execution.
		local
			a_parser: GEPP_PARSER
			an_arg: STRING
			stop: BOOLEAN
			i, nb, args_count: INTEGER
			in_filename, out_filename: STRING
			in_file: like INPUT_STREAM_TYPE
			out_file: like OUTPUT_STREAM_TYPE
		do
			!! a_parser.make
			args_count:= argument_count
				-- Read options.
			if args_count = 1 then
				an_arg := argument (i)
				if
					an_arg.is_equal ("-V") or
					an_arg.is_equal ("--version")
				then
					std.out.put_string ("gepp version 1.2%N")
					exceptions_.die (0)
				elseif
					an_arg.is_equal ("-h") or
					an_arg.is_equal ("-?") or
					an_arg.is_equal ("--help")
				then
					std.out.put_string (Usage_message)
					std.out.put_character ('%N')
					exceptions_.die (0)
				end
			end
			from
				i := 1
			until
				i > args_count or stop
			loop	
				an_arg := argument (i)
				nb := an_arg.count
				if
					nb < 2 or else
					an_arg.item (1) /= '-'
					or else an_arg.item (2) /= 'D'
				then
					stop := True
				else
					if nb > 2 then
						a_parser.define_value ("", an_arg.substring (3, nb))
					end
					i := i + 1
				end
			end
				-- Read filenames.
			inspect args_count - i + 1
			when 0 then
				in_filename := "-"
				out_filename := "-"
			when 1 then
				in_filename := argument (i)
				out_filename := "-"
			when 2 then
				in_filename := argument (i)
				out_filename := argument (i + 1)
			else
				std.error.put_string (Usage_message)
				std.error.put_character ('%N')
				exceptions_.die (1)
			end
				-- Preprocess.
			if not out_filename.is_equal ("-") then
				out_file := output_stream_.make_file_open_write (out_filename)
				if output_stream_.is_open_write (out_file) then
					a_parser.set_output_file (out_file)
				else
					std.error.put_string ("gepp: cannot open %'")
					std.error.put_string (out_filename)
					std.error.put_string ("%'%N")
					exceptions_.die (1)
				end
			else
				a_parser.set_output_file (std.output)
			end
			if in_filename.is_equal ("-") then
				a_parser.parse_file (std.input)
			else
				in_file := input_stream_.make_file_open_read (in_filename)
				if input_stream_.is_open_read (in_file) then
					a_parser.parse_file (in_file)
					input_stream_.close (in_file)
				else
					std.error.put_string ("gepp: cannot open %'")
					std.error.put_string (in_filename)
					std.error.put_string ("%'%N")
					exceptions_.die (1)
				end
			end
			if
				out_file /= Void and then
				not output_stream_.is_closed (out_file)
			then
				output_stream_.close (out_file)
			end
		rescue
			std.error.put_string ("gepp: internal error%N")
			exceptions_.die (1)
		end

feature -- Access

	Usage_message: STRING is
		"usage: gepp [--version] [--help] [-hV?]%N%
			%[-Dname ...] [filename | -] [filename | -]"

end -- class GEPP
