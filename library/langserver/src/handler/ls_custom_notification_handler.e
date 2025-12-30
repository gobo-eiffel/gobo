note

	description:

		"LSP handlers for custom notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CUSTOM_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER

create

	make

feature {NONE} -- Implementation

	notification: LS_CUSTOM_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
