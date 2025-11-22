note

	description:

		"LSP reponses"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_RESPONSE

inherit

	LS_MESSAGE

create

	make_success,
	make_error

feature {NONE} -- Initialization

	make_success (a_id: LS_RESPONSE_ID; a_result: attached like result_)
			-- Create a new response in case of success.
		require
			a_id_not_void: a_id /= Void
			a_result_not_void: a_result /= Void
		do
			id := a_id
			result_ := a_result
		ensure
			id_set: id = a_id
			result_set: result_ = a_result
		end

	make_error (a_id: LS_RESPONSE_ID; a_error: LS_RESPONSE_ERROR)
			-- Create a new response in case of error.
		require
			a_id_not_void: a_id /= Void
			a_error_not_void: a_error /= Void
		do
			id := a_id
			error := a_error
		ensure
			id_set: id = a_id
			error_set: error = a_error
		end

feature -- Access

	id: LS_RESPONSE_ID
			-- Request id

	result_: detachable LS_ANY
			-- The result of a request. This member is REQUIRED on success.
			-- This member MUST NOT exist if there was an error invoking the method.

	error: detachable LS_RESPONSE_ERROR
			-- The error object in case a request fails.

	handler (a_manager: LS_MESSAGE_MANAGER): LS_RESPONSE_HANDLER
			-- Message handler for current response
		do
			Result := a_manager.response_handler
		ensure then
			instance_free: class
		end

feature -- Setting

	set_error (a_error: LS_RESPONSE_ERROR)
			-- Set `error` to `a_error`.
		require
			a_error_not_void: a_error /= Void
		do
			error := a_error
			result_ := Void
		ensure
			error_set: error = a_error
		end

feature -- Field names

	id_name: STRING_8 = "id"
	result_name: STRING_8 = "result"
	error_name: STRING_8 = "error"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_response (Current)
		end

invariant

	id_not_void: id /= Void
	error_or_success: error /= Void xor result_ /= Void

end
