note

	description:

		"LSP 'shutdown' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SHUTDOWN_REQUEST

inherit

	LS_REQUEST

create

	make

feature {NONE} -- Initialization

	make (a_id: like id)
			-- Create a new 'shutdown' request.
		require
			a_id_not_void: a_id /= Void
		do
			id := a_id
		ensure
			id_set: id = a_id
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "shutdown"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_SHUTDOWN_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.shutdown_request_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_shutdown_request (Current)
		end

end
