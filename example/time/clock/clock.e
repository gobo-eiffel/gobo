indexing

	description:

		"System clock example"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class CLOCK

inherit

	DT_SHARED_SYSTEM_CLOCK
	KL_SHARED_STANDARD_FILES

creation

	execute

feature -- Execution

	execute is
			-- Print current date and time.
		do
			std.output.put_string ("Time Now: ")
			std.output.put_string (system_clock.time_now.out)
			std.output.put_string ("%NDate Now: ")
			std.output.put_string (system_clock.date_now.out)
			std.output.put_string ("%NDateTime Now: ")
			std.output.put_string (system_clock.date_time_now.out)
			std.output.put_string ("%N")
		end

end -- class CLOCK
