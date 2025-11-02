note

	description:

		"LSP handlers for 'exit' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_EXIT_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER

create

	make

feature {NONE} -- Implementation

	notification: LS_EXIT_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
