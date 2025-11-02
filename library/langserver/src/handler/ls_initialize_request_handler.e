note

	description:

		"LSP handlers for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZE_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER

create

	make

feature -- Status report

	is_initializing: BOOLEAN
			-- Has the client/server communication being initialized?

feature -- Status setting

	set_initializing (b: BOOLEAN)
			-- Set `is_initializing` to `b`.
		do
			is_initializing := b
		ensure
			initializing_set: is_initializing = b
		end

feature {NONE} -- Implementation

	request: LS_INITIALIZE_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: LS_INITIALIZE_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
