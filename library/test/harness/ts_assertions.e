indexing

	description:

		"Assertions"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_ASSERTIONS

inherit

	TS_ASSERTION_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new assertions.
		do
		ensure
			count_zero: count = 0
			not_failed: not failed
		end

feature -- Initialization

	reset is
			-- Reset assertions.
		do
			count := 0
			error_message := Void
		ensure
			count_zero: count = 0
			not_failed: not failed
		end

feature -- Status report

	failed: BOOLEAN is
			-- Has last assertion failed?
		do
			Result := error_message /= Void
		ensure
			error_message_not_void: Result implies error_message /= Void
		end

feature -- Access

	error_message: STRING
			-- Message of last failed assertion

feature -- Measurement

	count: INTEGER
			-- Number of assertions tested so far

feature -- Setting

	set_error_message (a_message: STRING) is
			-- Set `error_message' to `a_message'.
		do
			error_message := a_message
		ensure
			error_message_set: error_message = a_message
		end

feature -- Element change

	add_assertion is
			-- Add one assertion.
		do
			count := count + 1
		ensure
			one_more: count = old count + 1
		end

invariant

	count_positive: count >= 0

end -- class TS_ASSERTIONS
