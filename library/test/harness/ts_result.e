indexing

	description:

		"Test case results"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class TS_RESULT

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

feature -- Access

	test: TS_TEST
			-- Associated test

feature -- Status report

	passed: BOOLEAN is
			-- Has `test' passed?
		do
			-- Result := False
		end

	failed: BOOLEAN is
			-- Has `test' failed?
		do
			-- Result := False
		end

	aborted: BOOLEAN is
			-- Has `test' aborted?
		do
			-- Result := False
		end

feature -- Output

	print_result (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print result to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		deferred
		end

invariant

	test_not_void: test /= Void

end -- class TS_RESULT
