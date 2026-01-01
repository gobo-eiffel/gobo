note

	description:

		"LSP 'workspace/symbol' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_REQUEST

inherit

	LS_REQUEST

	LS_WORKSPACE_SYMBOL_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_query: like query; a_work_done_token: like work_done_token; a_partial_result_token: like partial_result_token)
			-- Create a new 'workspace/symbol' request.
		require
			a_id_not_void: a_id /= Void
			a_query_not_void: a_query /= Void
		do
			id := a_id
			query := a_query
			work_done_token := a_work_done_token
			partial_result_token := a_partial_result_token
		ensure
			id_set: id = a_id
			query_set: query = a_query
			work_done_token_set: work_done_token = a_work_done_token
			partial_result_token_set: partial_result_token = a_partial_result_token
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "workspace/symbol"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WORKSPACE_SYMBOL_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.workspace_symbol_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol_request (Current)
		end

end
