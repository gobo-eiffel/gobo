indexing

	description:

		"Assertions"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_ASSERTIONS

inherit

	ANY

	KL_SHARED_EXCEPTIONS

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new assertions.
		do
			exception_on_error := True
			create error_messages.make (2)
		ensure
			count_zero: count = 0
			not_error_reported: not error_reported
			exception_on_error: exception_on_error
			no_exception_raised: not exception_raised
		end

feature -- Initialization

	reset is
			-- Reset assertions.
		do
			count := 0
			error_messages.wipe_out
			exception_on_error := True
			exception_raised := False
		ensure
			count_zero: count = 0
			not_error_reported: not error_reported
			exception_on_error: exception_on_error
			no_exception_raised: not exception_raised
		end

feature -- Status report

	error_reported: BOOLEAN is
			-- Has an error been reported?
		do
			Result := not error_messages.is_empty
		ensure
			definition: Result = not error_messages.is_empty
		end

	exception_on_error: BOOLEAN
			-- Should an exception be raised when an error is reported?

	exception_raised: BOOLEAN
			-- Has an exception been raised using `raise_exception'
			-- and not caught with `catch_exception' yet?

feature -- Status setting

	set_exception_on_error (b: BOOLEAN) is
			-- Set `exception_on_error' to `b'.
		do
			exception_on_error := b
		ensure
			exception_on_error_set: exception_on_error = b
		end

feature -- Access

	error_messages: DS_ARRAYED_LIST [STRING]
			-- Message of last errors reported

feature -- Measurement

	count: INTEGER
			-- Number of assertions tested so far

feature -- Element change

	add_assertion is
			-- Add one assertion.
		do
			count := count + 1
		ensure
			one_more: count = old count + 1
		end

feature -- Error report

	report_error (a_message: STRING) is
			-- Report error with message `a_message'
			-- and raise an exception.
		require
			a_message_not_void: a_message /= Void
		do
			error_messages.force_last (a_message)
			if exception_on_error then
				raise_exception
			end
		ensure
			error_reported: error_reported
			error_message_set: error_messages.last = a_message
		end

feature -- Exceptions

	catch_exception is
			-- Catch exception raised by `raise_exception'.
		require
			exception_raised: exception_raised
		do
			exception_raised := False
		ensure
			exception_caught: not exception_raised
		end

feature {NONE} -- Exceptions

	raise_exception is
			-- Raise an exception.
		do
			exception_raised := True
			Exceptions.raise (Assertion_failure)
		ensure
			exception_raised: exception_raised
		end

feature {NONE} -- Constants

	Assertion_failure: STRING is "Gobo_assertion"
			-- Developer exception message

invariant

	error_messages_not_void: error_messages /= Void
	no_void_error_message: not error_messages.has (Void)
	count_positive: count >= 0

end
