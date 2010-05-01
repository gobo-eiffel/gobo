note

	description:

		"Test case results"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_RESULT

feature -- Access

	test: TS_TEST
			-- Associated test

feature -- Status report

	passed: BOOLEAN is
			-- Has `test' passed?
		do
			Result := False
		end

	failed: BOOLEAN is
			-- Has `test' failed?
		do
			Result := False
		end

	aborted: BOOLEAN is
			-- Has `test' aborted?
		do
			Result := False
		end

feature -- Output

	print_result (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print result to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

invariant

	test_not_void: test /= Void

end
