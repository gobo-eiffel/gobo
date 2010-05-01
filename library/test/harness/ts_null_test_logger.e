note

	description:

		"Null loggers for tests and assertion checkings"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_NULL_TEST_LOGGER

inherit

	TS_TEST_LOGGER

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new null logger.
		do
		end

feature -- Log

	report_assertion (a_tag: STRING; a_passed: BOOLEAN) is
			-- Report whether assertion with tag `a_tag' passed or not.
		do
		end

	report_abort is
			-- Report that current test has been aborted.
		do
		end

end
