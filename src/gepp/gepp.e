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

creation

	execute

feature -- Processing

	execute (args: ARRAY [STRING]) is
			-- Start 'ge2e' execution.
		require
			args_not_void: args /= Void
#ifdef ISE || HACT
			no_void_string: not args.has (Void)
#else
			-- no_void_string: not args.has (Void)
#endif
		local
			a_parser: GE2E_PARSER
			an_arg: STRING
			stop: BOOLEAN
			i, nb, argument_count: INTEGER
			in_filename, out_filename: STRING
#ifdef ISE || HACT
			in_file, out_file: PLAIN_TEXT_FILE
#else
			in_file, out_file: FILE
#endif
		do
			!! a_parser.make
			argument_count:= args.upper
				-- Read options.
			from
				i := 1
			until
				i > argument_count or stop
			loop	
				an_arg := args.item (i)
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
			inspect argument_count - i + 1
			when 0 then
				in_filename := "-"
				out_filename := "-"
			when 1 then
				in_filename := args.item (i)
				out_filename := "-"
			when 2 then
				in_filename := args.item (i)
				out_filename := args.item (i + 1)
			else
				io.error.put_string
					("usage: ge2e [-D...] [filename | -] [filename | -]%N")
				die (1)
			end
				-- Preprocess.
			if not out_filename.is_equal ("-") then
				!! out_file.make (out_filename)
				open_write_file (out_file)
				a_parser.set_output_file (out_file)
			end
			if in_filename.is_equal ("-") then
				a_parser.parse_file (io.input)
			else
				!! in_file.make (in_filename)
				open_read_file (in_file)
				a_parser.parse_file (in_file)
				in_file.close
			end
			if out_file /= Void and then out_file.is_open_write then
				out_file.close
			end
		rescue
			io.error.put_string ("ge2e: internal error%N")
			die (1)
		end
			
feature {NONE} -- Implementation

	open_read_file (a_file: FILE) is
			-- Open `a_file' in read-only mode.
		require
			a_file_not_void: a_file /= Void
			a_file_is_closed: a_file.is_closed
		do
#ifdef ISE || HACT
			if a_file.is_readable then
				a_file.open_read
			else
				io.error.put_string ("ge2e: cannot open ")
				io.error.put_string (a_file.name)
				io.error.put_character ('%N')
				die (1)
			end
#else
			a_file.open_read
#endif
		ensure
			a_file_open_read: a_file.is_open_read
		rescue
			io.error.put_string ("ge2e: cannot open ")
			io.error.put_string (a_file.name)
			io.error.put_character ('%N')
			die (1)
		end
			
	open_write_file (a_file: FILE) is
			-- Open `a_file' in write-only mode.
		require
			a_file_not_void: a_file /= Void
			a_file_is_closed: a_file.is_closed
		do
#ifdef ISE || HACT
			if a_file.is_writable then
				a_file.open_write
			else
				io.error.put_string ("ge2e: cannot open ")
				io.error.put_string (a_file.name)
				io.error.put_character ('%N')
				die (1)
			end
#else
			a_file.open_write
#endif
		ensure
			a_file_open_write: a_file.is_open_write
		rescue
			io.error.put_string ("ge2e: cannot open ")
			io.error.put_string (a_file.name)
			io.error.put_character ('%N')
			die (1)
		end
			
end -- class GE2E
