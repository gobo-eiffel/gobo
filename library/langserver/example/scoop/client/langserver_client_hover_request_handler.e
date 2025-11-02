note

	description:

		"Langserver client handlers for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LANGSERVER_CLIENT_HOVER_REQUEST_HANDLER

inherit

	LS_HOVER_REQUEST_HANDLER
		redefine
			build_client_capabilities
		end

create

	make

feature -- Setting

	build_client_capabilities
			-- Build `client_capabilities`.
		local
			l_capabilities: like client_capabilities
			l_content_format: LS_MARKUP_KIND_LIST
		do
			create l_content_format.make_with_capacity (2)
			l_content_format.put_last ({LS_MARKUP_KINDS}.markdown)
			l_content_format.put_last ({LS_MARKUP_KINDS}.plaintext)
			create l_capabilities.make (True, l_content_format)
			client_capabilities := l_capabilities
		end

end
