note

	description:

		"LSP 'client/registerCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_REGISTER_CAPABILITY_REQUEST

inherit

	LS_REQUEST

	LS_REGISTRATION_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_registrations: like registrations)
			-- Create a new 'client/registerCapability' request.
		require
			a_id_not_void: a_id /= Void
			a_registrations_not_void: a_registrations /= Void
		do
			id := a_id
			registrations := a_registrations
		ensure
			id_set: id = a_id
			registrations_set: registrations = a_registrations
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "client/registerCapability"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_REGISTER_CAPABILITY_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.register_capability_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_register_capability_request (Current)
		end

end
