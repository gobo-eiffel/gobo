note

	description:

		"LSP message handlers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MESSAGE_HANDLER

feature {NONE} -- Initialization

	make
			-- Create a new message handler.
		do
		end

feature -- Access

	client_capabilities: detachable LS_CLIENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_SERVER_OPTIONS
			-- Server options

	other_server_options: detachable DS_HASH_TABLE [like registration_options, LS_STRING]
			-- Server options used through dynamic registration, indexed by ids

Feature -- Access

	is_dynamically_registrable: BOOLEAN
			-- Does the client support dynamic registration
			-- for this kind of message?
		do
			Result := attached {LS_DYNAMIC_REGISTRATION_CAPABILITIES} client_capabilities as l_client_capabilities and then
				attached l_client_capabilities.dynamic_registration as l_dynamic_registration and then
				l_dynamic_registration.value
		end

	has_server_options_with_id (a_id: LS_STRING): BOOLEAN
			-- has a server options been registered with the id `a_id`?
		require
			a_id_not_void: a_id /= Void
		do
			Result :=
				(attached other_server_options as l_other_server_options and then l_other_server_options.has (a_id)) or else
				(attached {LS_STATIC_REGISTRATION_OPTIONS} server_options as l_server_options and then l_server_options.id ~ a_id)
		end

	is_server_option_valid (a_register_options: like registration_options): BOOLEAN
			-- Does the scope of `a_register_options` not overlap with other
			-- server options already registered?
		require
			a_register_options_not_void: a_register_options /= Void
		do
			Result := True
		end

feature -- Setting

	set_client_capabilities (a_client_capabilities: like client_capabilities)
			-- Set `client_capabilities` to `a_client_capabilities`.
		do
			client_capabilities := a_client_capabilities
		ensure
			client_capabilities_set: client_capabilities = a_client_capabilities
		end

	set_server_options (a_server_options: like server_options)
			-- Set `server_options` to `a_server_options`.
		do
			server_options := a_server_options
		ensure
			server_options_set: server_options = a_server_options
		end

	build_client_capabilities
			-- Build `client_capabilities`.
			--
			-- (To be redefined in clients.)
		do
		end

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
		end

	register_server_options (a_id: LS_STRING; a_register_options: like registration_options)
			-- Register `a_register_options` with id `a_id`.
		require
			a_id_not_void: a_id /= Void
			a_register_options_not_void: a_register_options /= Void
			is_dynamically_registrable: is_dynamically_registrable
			not_registered: not has_server_options_with_id (a_id)
			valid_options: is_server_option_valid (a_register_options)
		local
			l_other_server_options: like other_server_options
		do
			l_other_server_options := other_server_options
			if l_other_server_options = Void then
				create l_other_server_options.make (10)
				other_server_options := l_other_server_options
			end
			l_other_server_options.force (a_register_options, a_id)
		ensure
			registered: has_server_options_with_id (a_id)
		end

	unregister_server_options (a_id: LS_STRING)
			-- Unregister server options with id `a_id`.
		require
			a_id_not_void: a_id /= Void
			is_dynamically_registrable: is_dynamically_registrable
			registered: has_server_options_with_id (a_id)
		do
			if (attached {LS_STATIC_REGISTRATION_OPTIONS} server_options as l_server_options and then l_server_options.id ~ a_id) then
				server_options := Void
			elseif attached other_server_options as l_other_server_options then
				l_other_server_options.remove (a_id)
			end
		ensure
			not_registered: not has_server_options_with_id (a_id)
		end

feature -- Basic operations

	handle (a_message: like message; a_manager: like message_manager)
			-- Handle `a_message`.
		require
			a_message_not_void: a_message /= Void
			a_manager_not_void: a_manager /= Void
		deferred
		end

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_message: like message; a_manager: like message_manager)
			-- Handle `a_message`.
			-- Check the soundness of the client/server communication.
		require
			a_message_not_void: a_message /= Void
			a_manager_not_void: a_manager /= Void
		do
			handle (a_message, a_manager)
		end

feature {NONE} -- Implementation

	message: LS_MESSAGE
			-- Type of message to be handled by current handler
		deferred
		end

	message_manager: LS_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

	registration_options: LS_SERVER_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
