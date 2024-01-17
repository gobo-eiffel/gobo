note

	description:

		"Null loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006-2010, Eric Bezault and others"
	license: "MIT License"

class TS_NULL_TEST_LOGGER

inherit

	TS_TEST_LOGGER

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new null logger.
		do
		end

feature -- Log

	report_success (a_tag: STRING)
			-- Report that assertion with tag `a_tag' passed.
		do
		end

	report_failure (a_tag: STRING; a_reason: STRING)
			-- Report that assertion with tag `a_tag' failed for `a_reason'.
		do
		end

	report_abort (a_reason: STRING)
			-- Report that current test has been aborted.
		do
		end

end
