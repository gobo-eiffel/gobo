note

	description:

		"LSP connections"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CONNECTION

feature {NONE} -- Inialization

	make
			-- Create a new connection.
		do
			create messages.make (50)
			if {PLATFORM}.is_thread_capable then
				create messages_mutex.make
				create message_manager_mutex.make
			end
		end

feature -- Access

	messages: DS_ARRAYED_LIST [STRING_8]
			-- Messages received

	message_manager: detachable separate LS_MESSAGE_MANAGER
			-- Message manager

feature -- Setting

	set_message_manager (a_manager: like message_manager)
			-- Set `message_manager` to `a_manager`.
		do
			lock_message_manager_mutex
			message_manager := a_manager
			unlock_message_manager_mutex
		ensure
			message_manager_set: message_manager = a_manager
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
		deferred
		end

	receive_message
			-- In single-threaded mode, receive one message
			-- and make it available at the end of `messages`.
			-- Do nothing in multi-threaded or SCOOP modes
			-- (see `start`).
		deferred
		end

	send_message (a_message: separate STRING_8)
			-- Send `a_message`.
		require
			a_message_not_void: a_message /= Void
		deferred
		end

	keep_alive
			-- Keep the connection alive.
		deferred
		end

feature {LS_MESSAGE_MANAGER} -- Multithreading

	messages_mutex: detachable MUTEX
			-- Lock to access `messages` in multithreading mode

	lock_messages_mutex
			-- Get exclusing access to `messages`.
		do
			if attached messages_mutex as l_mutex then
				l_mutex.lock
			end
		end

	unlock_messages_mutex
			-- Rlease exclusing access to `messages`.
		do
			if attached messages_mutex as l_mutex then
				l_mutex.unlock
			end
		end

	message_manager_mutex: detachable MUTEX
			-- Lock to access `message_manager` in multithreading mode

	lock_message_manager_mutex
			-- Get exclusing access to `message_manager`.
		do
			if attached message_manager_mutex as l_mutex then
				l_mutex.lock
			end
		end

	unlock_message_manager_mutex
			-- Rlease exclusing access to `message_manager`.
		do
			if attached message_manager_mutex as l_mutex then
				l_mutex.unlock
			end
		end

feature -- Constants

	content_length: STRING = "Content-Length:"
			-- "Content-Length:" field name

	content_type: STRING = "Content-Type:"
			-- "Content-Type:" field name

end
