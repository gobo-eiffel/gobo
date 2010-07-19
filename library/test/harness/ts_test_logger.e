note

	description:

		"Loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #6 $"

deferred class TS_TEST_LOGGER

feature -- Log

	report_assertion (a_tag: STRING; a_passed: BOOLEAN)
			-- Report whether assertion with tag `a_tag' passed or not.
		require
			a_tag_not_void: a_tag /= Void
		deferred
		end

	report_abort (a_reason: STRING)
			-- Report that current test has been aborted.
		require
			a_reason_not_void: a_reason /= Void
		deferred
		end

end
