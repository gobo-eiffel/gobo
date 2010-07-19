note

	description:

		"Null loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #5 $"

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

	report_assertion (a_tag: STRING; a_passed: BOOLEAN)
			-- Report whether assertion with tag `a_tag' passed or not.
		do
		end

	report_abort (a_reason: STRING)
			-- Report that current test has been aborted.
		do
		end

end
