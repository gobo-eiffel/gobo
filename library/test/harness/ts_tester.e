indexing

	description:

		"Testers"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class TS_TESTER

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_EXCEPTIONS
	KL_SHARED_STANDARD_FILES

feature {NONE} -- Initialization

	make_default is
			-- Create a new tester.
		do
			!! error_handler.make_standard
		end

	make is
			-- Create a new tester and execute it.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			make_default
			read_command_line
			if output_filename /= Void then
				!! a_file.make (output_filename)
				a_file.open_write
				if a_file.is_open_write then
					execute (a_file)
					a_file.close
				else
					!! cannot_write.make (output_filename)
					error_handler.report_error (cannot_write)
				end
			else
				execute (std.output)
			end
		end

feature -- Access

	suite: TS_TEST_SUITE is
			-- Suite of tests to be run
		deferred
		ensure
			suite_not_void: Result /= Void
		end

	output_filename: STRING
			-- Output filename

feature -- Execution

	execute (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Execute tester.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_writable
		local
			a_suite: like suite
			a_summary: TS_SUMMARY
		do
			a_suite := suite
			!! a_summary.make
			a_suite.execute (a_summary)
			a_summary.print_summary (a_suite, a_file)
			if not a_summary.is_successful then
				a_file.put_character ('%N')
				a_summary.print_errors (a_file)
			end
		end

feature {NONE} -- Command line

	read_command_line is
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
		do
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-o") then
					if i < nb then
						i := i + 1
						output_filename := Arguments.argument (i)
					else
						output_filename := Void
						report_usage_error
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_usage_error is
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Tester usage message
		once
			!! Result.make ("[-o filename]")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class TS_TESTER
