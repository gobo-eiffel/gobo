note

	description:

		"LSP handlers for 'textDocument/completion' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER
		redefine
			client_capabilities,
			server_options,
			build_server_options,
			registration_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_COMPLETION_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_COMPLETION_OPTIONS
			-- Server options

feature -- Status report

	is_markdown_supported: BOOLEAN
			-- Does client support markdown documentation format?
		local
			i, nb: INTEGER
		do
			if
				attached client_capabilities as l_capabilities and then
				attached l_capabilities.completion_item as l_completion_item and then
				attached l_completion_item.documentation_format as l_documentation_format
			then
				nb := l_documentation_format.count
				from i := 1 until i > nb loop
					if l_documentation_format.value (i) ~ {LS_MARKUP_KINDS}.markdown then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_plaintext_supported: BOOLEAN
			-- Does client support plaintext documentation format?
		local
			i, nb: INTEGER
		do
			if
				attached client_capabilities as l_capabilities and then
				attached l_capabilities.completion_item as l_completion_item and then
				attached l_completion_item.documentation_format as l_documentation_format
			then
				nb := l_documentation_format.count
				from i := 1 until i > nb loop
					if l_documentation_format.value (i) ~ {LS_MARKUP_KINDS}.plaintext then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if server_options /= Void then
				-- Keep `server_options` if already built.
			elseif not generating_type.same_type ({detachable LS_COMPLETION_REQUEST_HANDLER}) then
				create server_options.make (Void, Void, Void, Void, Void)
			end
		end

feature {NONE} -- Implementation

	request: LS_COMPLETION_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_COMPLETION_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

	response_result: LS_OPTIONAL_COMPLETION_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
