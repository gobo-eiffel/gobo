note

	description:

		"LSP factories for 'exit' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_EXIT_NOTIFICATION_FACTORY

inherit

	LS_MESSAGE_FACTORY

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		do
			create {LS_EXIT_NOTIFICATION} Result.make
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_EXIT_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_EXIT_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
