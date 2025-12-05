note

	description:
	"[
		LSP connections when the client and the server are running
		in two different SCOOP regions of the same process.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SCOOP_CONNECTION

inherit

	LS_SERVER_CONNECTION

	LS_CLIENT_CONNECTION

create

	make

feature -- Access

	other_connection: detachable separate LS_SCOOP_CONNECTION
			-- Connection of the other participant

feature -- Setting

	set_other_connection (a_connection: like other_connection)
			-- Set `other_connection` to `a_connection`.
		do
			other_connection := a_connection
		ensure
			other_connection_set: other_connection = a_connection
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
		end

	receive_message
			-- In single-threaded mode, receive one message
			-- and make it available at the end of `messages`.
			-- Do nothing in multi-threaded or SCOOP modes
			-- (see `start`).
		do
		end

	send_message (a_message: separate STRING_8)
			-- Send `a_message`.
		local
			l_full_message: separate STRING_8
			i, nb: INTEGER
		do
			nb := a_message.count
			create <NONE> l_full_message.make (nb + content_length.count + 4)
			separate l_full_message as ls_full_message do
				nb := content_length.count
				from i := 1 until i > nb loop
					ls_full_message.append_character (content_length.item (i))
					i := i + 1
				end
				nb := a_message.count
				ls_full_message.append_integer (nb)
				ls_full_message.append_character ('%R')
				ls_full_message.append_character ('%N')
				ls_full_message.append_character ('%R')
				ls_full_message.append_character ('%N')
				from i := 1 until i > nb loop
					ls_full_message.append_character (a_message.item (i))
					i := i + 1
				end
			end
			separate other_connection as l_other_connection do
				if l_other_connection /= Void then
					l_other_connection.on_message_received (l_full_message)
				end
			end
		end

	keep_alive
			-- Keep the connection alive.
		do
		end

feature {LS_SCOOP_CONNECTION} -- Implementation

	on_message_received (a_message: separate STRING_8)
			-- Receive `a_message`.
		require
			a_message_not_void: a_message /= Void
		local
			l_message: STRING_8
			l_line: STRING_8
			l_has_content_length: BOOLEAN
			l_content_length: INTEGER
			l_header_end: BOOLEAN
			i: INTEGER
		do
			create l_message.make_from_separate (a_message)
			from
			until
				l_header_end and l_has_content_length
			loop
				i := l_message.index_of ('%N', 1)
				if i > 1 then
					l_line := l_message.substring (1, i - 2)
					l_message.remove_head (i)
				else
					l_line := l_message
					l_message := ""
				end
				if l_line.is_empty then
					l_header_end := True
				elseif l_line.starts_with ({LS_CONNECTION}.content_length) then
					l_line := l_line.substring ({LS_CONNECTION}.content_length.count + 1, l_line.count)
					l_line.adjust
					if l_line.is_integer then
						l_content_length := l_line.to_integer
						if l_content_length > 0 then
							l_has_content_length := True
						end
					end
				elseif l_line.starts_with ({LS_CONNECTION}.content_type) then
					-- The content part is encoded using the charset provided in the
					-- Content-Type field. It defaults to utf-8, which is the only
					-- encoding supported right now. If a server or client receives
					-- a header with a different encoding than utf-8 it should
					-- respond with an error.
					--
					-- (Prior versions of the protocol used the string constant utf8
					-- which is not a correct encoding constant according to specification.)
					-- For backwards compatibility it is highly recommended that a client
					-- and a server treat the string utf8 as utf-8.
					--
					-- The current implementation ignore this header, even if it
					-- wrongly specifies a charset different from utf-8.
				else
						-- Unexpected or malformed header.
						-- Skip this message and try to read next one.
					l_has_content_length := False
				end
			end
			if l_content_length = l_message.count then
				lock_messages_mutex
				messages.force_last (l_message)
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
		end

end
