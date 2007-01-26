indexing

	description:

		"Test case aborted results"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_ABORTED_RESULT

inherit

	TS_RESULT
		redefine
			aborted
		end

create

	make

feature {NONE} -- Initialization

	make (a_test: like test; a_reason: like reason) is
			-- Create a new aborted result associated with `a_test'.
		require
			a_test_not_void: a_test /= Void
			a_reason_not_void: a_reason /= Void
		do
			test := a_test
			reason := a_reason
		ensure
			test_set: test = a_test
			reason_set: reason = a_reason
		end

feature -- Access

	reason: STRING
			-- Abort reason

feature -- Status report

	aborted: BOOLEAN is True
			-- Has `test' aborted?

feature -- Output

	print_result (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print result to `a_file'.
		do
			a_file.put_string ("ABORT:  [")
			a_file.put_string (test.name)
			a_file.put_string ("] ")
			a_file.put_string (reason)
		end

invariant

	reason_not_void: reason /= Void

end
