note

	description:

		"LSP error codes"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_ERROR_CODES

feature -- Access

	parse_error: LS_INTEGER once Result := -32700 ensure instance_free: class end
	invalid_request: LS_INTEGER once Result := -32600 ensure instance_free: class end
	method_not_found: LS_INTEGER once Result := -32601 ensure instance_free: class end
	invalid_params: LS_INTEGER once Result := -32602 ensure instance_free: class end
	internal_error: LS_INTEGER once Result := -32603 ensure instance_free: class end
			-- Defined by JSON-RPC.

	jsonrpc_reserved_error_range_start: LS_INTEGER once Result := -32099 ensure instance_free: class end
			-- This is the start range of JSON-RPC reserved error codes.
			-- It doesn't denote a real error code. No LSP error codes should
			-- be defined between the start and end range. For backwards
			-- compatibility the `server_not_initialized` and the `unknown_error_code`
			-- are left in the range.

	server_not_initialized: LS_INTEGER once Result := -32002 ensure instance_free: class end
			-- Error code indicating that a server received a notification or
			-- request before the server received the `initialize` request.

	unknown_error_code: LS_INTEGER once Result := -32001 ensure instance_free: class end

	jsonrpc_reserved_error_range_end: LS_INTEGER once Result := -32000 ensure instance_free: class end
			-- This is the end range of JSON-RPC reserved error codes.
			-- It doesn't denote a real error code.

	lsp_reserved_error_range_start: LS_INTEGER once Result := -32899 ensure instance_free: class end
			-- This is the start range of LSP reserved error codes.
			-- It doesn't denote a real error code.

	request_failed: LS_INTEGER once Result := -32803 ensure instance_free: class end
			-- A request failed but it was syntactically correct, e.g the
			-- method name was known and the parameters were valid. The error
			-- message should contain human readable information about why
			-- the request failed.

	server_cancelled: LS_INTEGER once Result := -32802 ensure instance_free: class end
			-- The server cancelled the request. This error code should
			-- only be used for requests that explicitly support being
			-- server cancellable.

	content_modified: LS_INTEGER once Result := -32801 ensure instance_free: class end
			-- The server detected that the content of a document got
			-- modified outside normal conditions. A server should
			-- NOT send this error code if it detects a content change
			-- in its unprocessed messages. The result even computed
			-- on an older state might still be useful for the client.
			--
			-- If a client decides that a result is not of any use anymore
			-- the client should cancel the request.

	request_cancelled: LS_INTEGER once Result := -32800 ensure instance_free: class end
			-- The client has canceled a request and a server has detected
			-- the cancel.

	lsp_reserved_error_range_end: LS_INTEGER once Result := -32800 ensure instance_free: class end
			-- This is the end range of LSP reserved error codes.
			-- It doesn't denote a real error code.

end
