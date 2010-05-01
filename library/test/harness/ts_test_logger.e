note

	description:

		"Loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_TEST_LOGGER

feature -- Log

	report_assertion (a_tag: STRING; a_passed: BOOLEAN) is
			-- Report whether assertion with tag `a_tag' passed or not.
		require
			a_tag_not_void: a_tag /= Void
		deferred
		end

	report_abort is
			-- Report that current test has been aborted.
		deferred
		end

end
