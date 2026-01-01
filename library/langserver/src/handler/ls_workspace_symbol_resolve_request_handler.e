note

	description:

		"LSP handlers for 'workspaceSymbol/resolve' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_RESOLVE_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER
		redefine
			server_options,
			build_server_options
		end

create

	make

feature -- Access

	server_options: detachable LS_BOOLEAN
			-- Server options

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if server_options /= Void then
				-- Keep `server_options` if already built.
			elseif not generating_type.same_type ({detachable LS_WORKSPACE_SYMBOL_RESOLVE_REQUEST_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	request: LS_WORKSPACE_SYMBOL_RESOLVE_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: LS_WORKSPACE_SYMBOL
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
