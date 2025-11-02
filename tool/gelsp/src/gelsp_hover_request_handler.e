note

	description:

		"LSP handlers for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_HOVER_REQUEST_HANDLER

inherit

	LS_HOVER_REQUEST_HANDLER
		redefine
			build_server_options,
			handle
		end

create

	make

feature -- Access

	build_server_options
			-- Build `server_options`.
		do
		end

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_contents: LS_MARKUP_CONTENT
			l_response: LS_RESPONSE
			l_result: LS_HOVER_RESULT
			l_uri: UT_URI
		do
			create l_uri.make (a_request.text_document.uri.to_string.utf8_value)
			if attached {UT_FILE_URI_ROUTINES}.uri_to_filename (l_uri) as l_filename then
				create l_contents.make ({LS_MARKUP_KINDS}.markdown, l_filename)
			else
				create l_contents.make ({LS_MARKUP_KINDS}.markdown, "**gobo**%N* first%N* second")
			end
			create l_result.make (l_contents)
			create l_response.make_success (a_request.id, l_result)
			a_manager.send_message (l_response)
		end

end
