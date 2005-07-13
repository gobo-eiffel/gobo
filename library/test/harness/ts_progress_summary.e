indexing

	description:

		"Test result summaries and progress status"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_PROGRESS_SUMMARY

inherit

	TS_SUMMARY
		rename
			make as make_summary
		redefine
			put_failure, put_abort, start_test
		end

create

	make

feature {NONE} -- Initialization

	make (a_file: like output_file) is
			-- Create a new result summary.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			make_summary
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

feature -- Access

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Where to print progress status

feature -- Element change

	put_failure (a_test: TS_TEST; a_reason: STRING) is
			-- Add failed test `a_test'.
		local
			a_result: TS_FAILED_RESULT
		do
			create a_result.make (a_test, a_reason)
			results.put_last (a_result)
			failure_count := failure_count + 1
			a_result.print_result (output_file)
			output_file.put_new_line
			output_file.flush
		end

	put_abort (a_test: TS_TEST; a_reason: STRING) is
			-- Add aborted test `a_test'.
		local
			a_result: TS_ABORTED_RESULT
		do
			create a_result.make (a_test, a_reason)
			results.put_last (a_result)
			abort_count := abort_count + 1
			a_result.print_result (output_file)
			output_file.put_new_line
			output_file.flush
		end

	start_test (a_test: TS_TEST) is
			-- Inform Current that a test will be started.
		do
			output_file.put_character ('@')
			output_file.put_line (a_test.name)
			output_file.flush
		end

invariant

	output_file_not_void: output_file /= Void
	output_file_open_write: output_file.is_open_write

end
