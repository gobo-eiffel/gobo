note

	description:

		"LSP reponse errors"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_RESPONSE_ERROR

inherit

	LS_ANY

create

	make,
	make_with_data

feature {NONE} -- Initialization

	make (a_code: LS_INTEGER; a_message: LS_STRING)
			-- Create a new response error.
		require
			a_code_not_void: a_code /= Void
			a_message_not_void: a_message /= Void
		do
			code := a_code
			message := a_message
		ensure
			code_set: code = a_code
			message_set: message = a_message
		end

	make_with_data (a_code: LS_INTEGER; a_message: LS_STRING; a_data: detachable LS_ANY)
			-- Create a new response error.
		require
			a_code_not_void: a_code /= Void
			a_message_not_void: a_message /= Void
		do
			code := a_code
			message := a_message
			data := a_data
		ensure
			code_set: code = a_code
			message_set: message = a_message
			data_set: data = a_data
		end

feature -- Access

	code: LS_INTEGER
			-- A number indicating the error type that occurred.
			-- (See class LS_ERROR_CODES.)

	message: LS_STRING
			-- A string providing a short description of the error.

	data: detachable LS_ANY
			-- A primitive or structured value that contains additional
			-- information about the error. Can be omitted.

feature -- Field names

	code_name: STRING_8 = "code"
	message_name: STRING_8 = "message"
	data_name: STRING_8 = "data"
				-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_response_error (Current)
		end

invariant

	code_not_void: code /= Void
	message_not_void: message /= Void

end
