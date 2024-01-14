note

	description:

		"C-like preprocessors"

	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"

class GEPP

inherit

	GEPP_VERSION

	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	execute

feature -- Processing

	execute
			-- Start 'gepp' execution.
		do
			if False then resurrect_code end

			Arguments.set_program_name ("gepp")
			create error_handler.make_standard
			create parser.make (error_handler)
			in_filename := "-"
			out_filename := "-"
			read_arguments
			preprocess
		end

	preprocess
			-- Preprocess `in_filename' and put
			-- results to `out_filename'.
		local
			in_file: KL_TEXT_INPUT_FILE
			out_file: KL_TEXT_OUTPUT_FILE
		do
			if not out_filename.is_equal ("-") then
				create out_file.make (out_filename)
				out_file.recursive_open_write
				if out_file.is_open_write then
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
				create in_file.make (in_filename)
				in_file.open_read
				if in_file.is_open_read then
					parser.parse_file (in_file)
					in_file.close
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
				not out_file.is_closed
			then
				out_file.close
			end
		end

	read_arguments
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
				if nb >= 2 and then an_arg.item (1) = '-' then
					if an_arg.item (2) = 'D' then
						if nb > 2 then
							parser.define_value ("", an_arg.substring (3, nb))
						end
						i := i + 1
					elseif nb = 2 and an_arg.item (2) = 'M' then
						parser.set_makefile_dependencies (True)
						i := i + 1
					elseif nb = 2 and an_arg.item (2) = 'l' then
						parser.set_empty_lines (True)
						i := i + 1
					elseif an_arg.is_equal ("--lines") then
						parser.set_empty_lines (True)
						i := i + 1
					else
						stop := True
					end
				else
					stop := True
				end
			end
				-- Read filenames.
			inspect args_count - i + 1
			when 0 then
				check in_filename.is_equal ("-") end
				check out_filename.is_equal ("-") end
			when 1 then
				in_filename := Arguments.argument (i)
				check out_filename.is_equal ("-") end
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

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_cannot_write_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_usage_error
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	report_usage_message
			-- Report usage message.
		do
			error_handler.report_info (Usage_message)
		end

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Gepp usage message.
		once
			create Result.make
				("[--version][--help][-hV?lM]%N%
					%%T[--lines][-Dname ...][filename | -][filename | -]")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	resurrect_code
			-- Make sure that SmartEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: KL_EQUALITY_TESTER [STRING]
		do
			create et1
		end

invariant

	parser_not_void: parser /= Void
	error_handler_not_void: error_handler /= Void
	in_filename_not_void: in_filename /= Void
	out_filename_not_void: out_filename /= Void

end
