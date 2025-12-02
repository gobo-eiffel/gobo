note

	description:

		"LSP 'client/unregisterCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNREGISTER_CAPABILITY_REQUEST

inherit

	LS_REQUEST

	LS_UNREGISTRATION_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_unregistrations: like unregistrations)
			-- Create a new 'client/unregisterCapability' request.
		require
			a_id_not_void: a_id /= Void
			a_unregistrations_not_void: a_unregistrations /= Void
		do
			id := a_id
			unregistrations := a_unregistrations
		ensure
			id_set: id = a_id
			unregistrations_set: unregistrations = a_unregistrations
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "client/unregisterCapability"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_UNREGISTER_CAPABILITY_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.unregister_capability_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_unregister_capability_request (Current)
		end

end
