note

	description:
	"[
		LSP example with the client and the server running
		in two different SCOOP regions of the same process.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LANGSERVER

inherit

	ANY

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	execute

feature -- Basic operations

	execute
			-- Execute a client/server session.
		local
			l_client_connection: separate LS_SCOOP_CONNECTION
			l_server_connection: separate LS_SCOOP_CONNECTION
		do
			create l_client_connection.make
			create l_server_connection.make
			set_connections (l_client_connection, l_server_connection)
			create client.make (l_client_connection)
			create server.make (l_server_connection)
			start_message_manager (client)
			start_message_manager (server)
			run_events
		end

	run_events
			-- Run various events.
		local
			l_initialized: BOOLEAN
		do
			separate client as l_client do
				l_client.send_initialize_request
			end
			from until l_initialized loop
				Execution_environment.sleep (10_000_000)
				separate client as l_client do
					l_initialized := l_client.is_initialized
				end
			end
			Execution_environment.sleep (10_000_000)
			separate client as l_client do
				l_client.send_shutdown_request
			end
		end

feature -- Access

	client: separate LANGSERVER_SCOOP_CLIENT
			-- Client side

	server: separate LANGSERVER_SCOOP_SERVER
			-- Server side

feature {NONE} -- Implementation

	set_connections (a_client_connection, a_server_connection: separate LS_SCOOP_CONNECTION)
			-- Set other connections.
		require
			a_client_connection_not_void: a_client_connection /= Void
			a_server_connection_not_void: a_server_connection /= Void
		do
			a_client_connection.set_other_connection (a_server_connection)
			a_server_connection.set_other_connection (a_client_connection)
		end

	start_message_manager (a_manager: separate LS_MESSAGE_MANAGER)
			-- Start `a_manager`.
		require
			a_manager_not_void: a_manager /= Void
		do
			a_manager.set_debug_mode (True)
			a_manager.start
		end

end
