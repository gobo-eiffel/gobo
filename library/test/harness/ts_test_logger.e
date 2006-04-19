indexing

	description:

		"Loggers of assertion checks"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_TEST_LOGGER

feature -- Log

	log_assertion (a_tag: STRING; a_passed: BOOLEAN) is
			-- Log whether assertion with tag `a_tag' passed or not.
		require
			a_tag_not_void: a_tag /= Void
		deferred
		end

end
