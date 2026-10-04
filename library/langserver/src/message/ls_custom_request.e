note

	description:

		"LSP custom requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_CUSTOM_REQUEST

inherit

	LS_REQUEST

create

	make

feature {NONE} -- Initialization

	make (a_method: like method; a_id: like id; a_params: like params)
			-- Create a new custom request.
		require
			a_method_not_void: a_method /= Void
			a_id_not_void: a_id /= Void
		do
			method := a_method
			id := a_id
			params := a_params
		ensure
			method_set: method = a_method
			id_set: id = a_id
			params_set: params = a_params

		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked

	params: detachable LS_ANY
			-- Request parameters

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CUSTOM_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.custom_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_custom_request (Current)
		end

end
