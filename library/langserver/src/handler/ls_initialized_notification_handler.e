note

	description:

		"LSP handlers for 'initialized' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZED_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER

create

	make

feature -- Status report

	is_initialized: BOOLEAN
			-- Has the client/server communication been initialized?

feature -- Status setting

	set_initialized (b: BOOLEAN)
			-- Set `is_initialized` to `b`.
		do
			is_initialized := b
		ensure
			initialized_set: is_initialized = b
		end

feature {NONE} -- Implementation

	notification: LS_INITIALIZED_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
