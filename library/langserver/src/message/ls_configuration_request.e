note

	description:

		"LSP 'workspace/configuration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CONFIGURATION_REQUEST

inherit

	LS_REQUEST

	LS_CONFIGURATION_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_items: like items)
			-- Create a new 'workspace/configuration' request.
		require
			a_id_not_void: a_id /= Void
			a_items_not_void: a_items /= Void
		do
			id := a_id
			items := a_items
		ensure
			id_set: id = a_id
			items_set: items = a_items
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "workspace/configuration"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CONFIGURATION_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.configuration_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_configuration_request (Current)
		end

end
