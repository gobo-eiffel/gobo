note

	description:

		"LSP message receivers using stdin"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_STDIN_MESSAGE_RECEIVER

inherit

	LS_ABSTRACT_STDIN_MESSAGE_RECEIVER
		redefine
			receive_messages,
			keep_alive
		end

create

	make

feature -- Basic operations

	receive_messages
			-- Receive messages from stdin.
			-- Make them available in `connection` (call to
			-- LS_STDIO_SERVER_CONNECTION.receive_message).
		local
			l_thread: WORKER_THREAD
		do
			if {PLATFORM}.is_thread_capable then
				create l_thread.make (agent
					do
						from
						until
							False
						loop
							receive_message
						end
					end)
				thread := l_thread
				l_thread.launch
			else
				precursor
			end
		end

	keep_alive
			-- Keep the message receiver on alive.
		do
			if {PLATFORM}.is_thread_capable then
				{THREAD_CONTROL}.join_all
			end
		end

feature {NONE} -- Implementation

	thread: detachable WORKER_THREAD

end
