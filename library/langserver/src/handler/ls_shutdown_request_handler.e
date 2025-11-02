note

	description:

		"LSP handlers for 'shutdown' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SHUTDOWN_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER

create

	make

feature -- Status report

	is_shutdown: BOOLEAN
			-- Has the client/server communication been shutdown?

feature -- Status setting

	set_shutdown (b: BOOLEAN)
			-- Set `is_shutdown` to `b`.
		do
			is_shutdown := b
		ensure
			shutdown_set: is_shutdown = b
		end

feature {NONE} -- Implementation

	request: LS_SHUTDOWN_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: LS_NULL
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
