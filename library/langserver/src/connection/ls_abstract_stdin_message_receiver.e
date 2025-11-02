note

	description:

		"LSP message receivers using stdin"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_ABSTRACT_STDIN_MESSAGE_RECEIVER

inherit

	ANY

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_connection: like connection)
			-- Create a new stdin message receiver.
		require
			a_connection_not_void: a_connection /= Void
		do
			connection := a_connection
		ensure
			connection_set: connection = a_connection
		end

feature -- Access

	connection: separate LS_STDIO_SERVER_CONNECTION
			-- Stdio connection

feature -- Basic operations

	receive_messages
			-- Receive messages from stdin.
			-- Make them available in `connection` (call to
			-- LS_STDIO_SERVER_CONNECTION.on_message_received).
		do
			from
			until
				False
			loop
				receive_message
			end
		end

	receive_message
			-- Read message from stdin.
			-- Make them available in `connection` (call to
			-- LS_STDIO_SERVER_CONNECTION.on_message_received).
		local
			l_line: STRING_8
			l_has_content_length: BOOLEAN
			l_content_length: INTEGER
			l_header_end: BOOLEAN
			l_message: STRING_8
		do
			from
			until
				l_header_end and l_has_content_length
			loop
				std.input.read_line
				l_line := std.input.last_string
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
			std.input.read_string (l_content_length)
			l_message := std.input.last_string
			separate connection as l_connection do
				l_connection.on_message_received (l_message)
			end
		end

	keep_alive
			-- Keep the message receiver on alive.
		do
		end

invariant

	connection_not_void: connection /= Void

end
