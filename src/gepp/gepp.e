indexing

	description:

		"'ge2e' preprocessors";

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class GE2E

inherit

	EXCEPTIONS
		export
			{NONE} all
		end

	UT_FILE_ROUTINES
		export
			{NONE} all
		end

	ARGUMENTS
		export
			{NONE} all
		end

creation

	execute

feature -- Processing

	execute is
			-- Start 'ge2e' execution.
		local
			a_parser: GE2E_PARSER
			an_arg: STRING
			stop: BOOLEAN
			i, nb, args_count: INTEGER
			in_filename, out_filename: STRING
#ifdef ISE || HACT
			in_file, out_file: PLAIN_TEXT_FILE
#else
			in_file, out_file: FILE
#endif
		do
			!! a_parser.make
			args_count:= argument_count
				-- Read options.
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
				io.error.put_string
					("usage: ge2e [-D...] [filename | -] [filename | -]%N")
				die (1)
			end
				-- Preprocess.
			if not out_filename.is_equal ("-") then
				!! out_file.make (out_filename)
				file_open_write (out_file)
				if out_file.is_open_write then
					a_parser.set_output_file (out_file)
				else
					io.error.put_string ("ge2e: cannot open %'")
					io.error.put_string (out_filename)
					io.error.put_string ("%'%N")
					die (1)
				end
			end
			if in_filename.is_equal ("-") then
				a_parser.parse_file (io.input)
			else
				!! in_file.make (in_filename)
				file_open_read (in_file)
				if in_file.is_open_read then
					a_parser.parse_file (in_file)
					in_file.close
				else
					io.error.put_string ("ge2e: cannot open %'")
					io.error.put_string (in_filename)
					io.error.put_string ("%'%N")
					die (1)
				end
			end
			if out_file /= Void and then out_file.is_open_write then
				out_file.close
			end
		rescue
			io.error.put_string ("ge2e: internal error%N")
			die (1)
		end
			
end -- class GE2E
