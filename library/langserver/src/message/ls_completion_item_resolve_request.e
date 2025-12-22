note

	description:

		"LSP 'completionItem/resolve' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_RESOLVE_REQUEST

inherit

	LS_REQUEST

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_params: like params)
			-- Create a new 'completionItem/resolve' request.
		require
			a_id_not_void: a_id /= Void
			a_params_not_void: a_params /= Void
		do
			id := a_id
			params := a_params
		ensure
			id_set: id = a_id
			params_set: params = a_params
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "completionItem/resolve"
		ensure then
			instance_free: class
		end

	params: LS_COMPLETION_ITEM
			-- Completion item to be resolved

	handler (a_manager: LS_MESSAGE_MANAGER): LS_COMPLETION_ITEM_RESOLVE_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.completion_item_resolve_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_resolve_request (Current)
		end

invariant

	params_not_void: params /= Void

end
