indexing

	description:

		"C-like preprocessors"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP

inherit

	GEPP_VERSION

	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

creation

	execute

feature -- Processing

	execute is
			-- Start 'gepp' execution.
		do
			if False then resurrect_code end

			Arguments.set_program_name ("gepp")
			!! error_handler.make_standard
			!! parser.make (error_handler)
			in_filename := "-"
			out_filename := "-"
			read_arguments
			preprocess
		end

	preprocess is
			-- Preprocess `in_filename' and put
			-- results to `out_filename'.
		local
			in_file: like INPUT_STREAM_TYPE
			out_file: like OUTPUT_STREAM_TYPE
		do
			if not out_filename.is_equal ("-") then
				out_file := OUTPUT_STREAM_.make_file_open_write (out_filename)
				if OUTPUT_STREAM_.is_open_write (out_file) then
					parser.set_output_file (out_file)
				else
					report_cannot_write_error (out_filename)
					Exceptions.die (1)
				end
			else
				parser.set_output_file (std.output)
			end
			if in_filename.is_equal ("-") then
				parser.parse_file (std.input)
			else
				in_file := INPUT_STREAM_.make_file_open_read (in_filename)
				if INPUT_STREAM_.is_open_read (in_file) then
					parser.parse_file (in_file)
					INPUT_STREAM_.close (in_file)
				else
					report_cannot_read_error (in_filename)
					Exceptions.die (1)
				end
			end
			if parser.syntax_error then
				Exceptions.die (1)
			end
			if
				out_file /= Void and then
				not OUTPUT_STREAM_.is_closed (out_file)
			then
				OUTPUT_STREAM_.close (out_file)
			end
		end

	read_arguments is
			-- Read command-line arguments.
		local
			an_arg: STRING
			stop: BOOLEAN
			i, nb, args_count: INTEGER
		do
				-- Read options.
			args_count:= Arguments.argument_count
			if args_count = 1 then
				an_arg := Arguments.argument (1)
				if
					an_arg.is_equal ("-V") or
					an_arg.is_equal ("--version")
				then
					report_version_number
					Exceptions.die (0)
				elseif
					an_arg.is_equal ("-h") or
					an_arg.is_equal ("-?") or
					an_arg.is_equal ("--help")
				then
					report_usage_message
					Exceptions.die (0)
				end
			end
			from
				i := 1
			until
				i > args_count or stop
			loop	
				an_arg := Arguments.argument (i)
				nb := an_arg.count
				if
					nb < 2 or else
					an_arg.item (1) /= '-'
					or else an_arg.item (2) /= 'D'
				then
					stop := True
				else
					if nb > 2 then
						parser.define_value ("", an_arg.substring (3, nb))
					end
					i := i + 1
				end
			end
				-- Read filenames.
			inspect args_count - i + 1
			when 0 then
				check equal (in_filename, "-") end
				check equal (out_filename, "-") end
			when 1 then
				in_filename := Arguments.argument (i)
				check equal (out_filename, "-") end
			when 2 then
				in_filename := Arguments.argument (i)
				out_filename := Arguments.argument (i + 1)
			else
				report_usage_error
				Exceptions.die (1)
			end
		end

feature -- Access

	in_filename, out_filename: STRING
			-- Input and output filenames

	parser: GEPP_PARSER
			-- Preprocessor parser

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Error handling

	report_cannot_read_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			!! an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_cannot_write_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			!! an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	report_usage_message is
			-- Report usage message.
		do
			error_handler.report_message (Usage_message)
		end

	report_version_number is
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			!! a_message.make (Version_number)
			error_handler.report_message (a_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gepp usage message.
		once
			!! Result.make
				("[--version] [--help] [-hV?]%N%
					%%T[-Dname ...] [filename | -] [filename | -]")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	resurrect_code is
			-- Make sure that SmallEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: DS_EQUALITY_TESTER [STRING]
		do
			!! et1
		end

invariant

	parser_not_void: parser /= Void
	error_handler_not_void: error_handler /= Void
	in_filename_not_void: in_filename /= Void
	out_filename_not_void: out_filename /= Void

end -- class GEPP
