note

	description:

		"Loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/07/19 $"
	revision: "$Revision: #7 $"

deferred class TS_TEST_LOGGER

feature -- Log

	report_success (a_tag: STRING)
			-- Report that assertion with tag `a_tag' passed.
		require
			a_tag_not_void: a_tag /= Void
		deferred
		end

	report_failure (a_tag: STRING; a_reason: STRING)
			-- Report that assertion with tag `a_tag' failed for `a_reason'.
		require
			a_tag_not_void: a_tag /= Void
			a_reason_not_void: a_reason /= Void
		deferred
		end

	report_abort (a_reason: STRING)
			-- Report that current test has been aborted.
		require
			a_reason_not_void: a_reason /= Void
		deferred
		end

end
