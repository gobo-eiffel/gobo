note

	description:

		"LSP handlers for '$/cancelRequest' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CANCEL_REQUEST_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			handle
		end

create

	make

feature -- Basic operations

	handle (a_notification: LS_CANCEL_REQUEST_NOTIFICATION; a_manager: like message_manager)
			-- Handle `a_notification`.
		local
			l_cursor: DS_LINKED_LIST_CURSOR [LS_MESSAGE]
			l_message: LS_HANDLED_MESSAGE
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
		do
			a_manager.lock_messages_mutex
			l_cursor := a_manager.messages.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {LS_REQUEST} l_cursor.item as l_request and then l_request.id ~ a_notification.id then
					create l_error.make ({LS_ERROR_CODES}.request_cancelled, "request cancelled")
					create l_response.make_error (l_request.id, l_error)
					create l_message.make (l_response)
					l_cursor.replace (l_message)
					l_cursor.go_after
				else
					l_cursor.forth
				end
			end
			a_manager.unlock_messages_mutex
		end

feature {NONE} -- Implementation

	notification: LS_CANCEL_REQUEST_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
