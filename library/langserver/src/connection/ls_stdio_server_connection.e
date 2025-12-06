note

	description:

		"LSP server connections with communication channel using stdio"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_STDIO_SERVER_CONNECTION

inherit

	LS_SERVER_CONNECTION
		redefine
			make
		end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Inialization

	make
			-- Create a new server connection.
		do
			precursor
			create message_receiver.make (Current)
		end

feature -- Basic operations

	start
			-- Start connection.
			-- In multi-threaded and SCOOP modes, automatically
			-- receive messages and make them available at the
			-- end of `messages`.
			-- In single-threaded mode, call `receive_message`
			-- explicitly to receive messages after the connection
			-- has been started.
		do
			if {PLATFORM}.is_thread_capable or {PLATFORM}.is_scoop_capable then
				separate message_receiver as l_message_receiver do
					l_message_receiver.receive_messages
				end
			end
		end

	receive_message
			-- In single-threaded mode, receive one message
			-- and make it available at the end of `messages`.
			-- Do nothing in multi-threaded or SCOOP modes
			-- (see `start`).
		do
			if not {PLATFORM}.is_thread_capable and not {PLATFORM}.is_scoop_capable then
				separate message_receiver as l_message_receiver do
					l_message_receiver.receive_message
				end
			end
		end

	send_message (a_message: separate STRING_8)
			-- Send `a_message`.
		local
			i, nb: INTEGER
		do
			std.output.put_string (content_length)
			std.output.put_character (' ')
			nb := a_message.count
			std.output.put_integer (nb)
			if operating_system.is_windows then
					-- The '%R' are already included.
				std.output.put_character ('%N')
				std.output.put_character ('%N')
			else
				std.output.put_character ('%R')
				std.output.put_character ('%N')
				std.output.put_character ('%R')
				std.output.put_character ('%N')
			end
			if attached {STRING_8} a_message as l_message then
				std.output.put_string (l_message)
			else
				from i := 1 until i > nb loop
					std.output.put_character (a_message.item (i))
					i := i + 1
				end
			end
			std.output.flush
		end

	keep_alive
			-- Keep the connection alive.
		do
			separate message_receiver as l_message_receiver do
				l_message_receiver.keep_alive
			end
		end

feature {LS_ABSTRACT_STDIN_MESSAGE_RECEIVER} -- Implementation

	on_message_received (a_message: separate STRING_8)
			-- Receive `a_message`.
		require
			a_message_not_void: a_message /= Void
		local
		do
			lock_messages_mutex
			messages.force_last (create {STRING_8}.make_from_separate (a_message))
			unlock_messages_mutex
			if {PLATFORM}.is_thread_capable or {PLATFORM}.is_scoop_capable then
				lock_message_manager_mutex
				separate message_manager as l_message_manager do
					if l_message_manager /= Void then
						l_message_manager.on_message_received
					end
				end
				unlock_message_manager_mutex
			end
		end

feature {NONE} -- Implementation

	message_receiver: separate LS_STDIN_MESSAGE_RECEIVER
				-- Message receiver

invariant

	message_receiver_not_void: message_receiver /= Void

end
