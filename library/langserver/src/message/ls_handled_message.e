note

	description:

		"LSP already handled messages"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HANDLED_MESSAGE

inherit

	LS_MESSAGE

create

	make

feature {NONE} -- Initialization

	make (a_response: like response)
			--
		require
			a_response_not_void: a_response /= Void
		do
			response := a_response
		ensure
			response_set: response = a_response
		end

feature -- Access

	response: LS_RESPONSE
			-- Response to be sent

	handler (a_manager: LS_MESSAGE_MANAGER): LS_HANDLED_MESSAGE_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.handled_message_handler
		end

feature -- Field names

	response_name: STRING_8 = "response"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_handled_message (Current)
		end

invariant

	response_not_void: response /= Void

end
