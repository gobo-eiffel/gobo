note

	description:

		"System clock example"

	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class CLOCK

inherit

	DT_SHARED_SYSTEM_CLOCK
	KL_SHARED_STANDARD_FILES

create

	execute

feature -- Execution

	execute
			-- Print current date and time.
		do
			std.output.put_string ("Time Now: ")
			std.output.put_line (system_clock.time_now.precise_out)
			std.output.put_string ("Date Now: ")
			std.output.put_line (system_clock.date_now.out)
			std.output.put_string ("DateTime Now: ")
			std.output.put_line (system_clock.date_time_now.precise_out)
			std.output.put_string ("UTC Time Now: ")
			std.output.put_line (utc_system_clock.time_now.precise_out)
			std.output.put_string ("UTC Date Now: ")
			std.output.put_line (utc_system_clock.date_now.out)
			std.output.put_string ("UTC DateTime Now: ")
			std.output.put_line (utc_system_clock.date_time_now.precise_out)
		end

end
