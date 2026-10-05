note

	description:

		"LSP handlers for '$/goboEiffel/formatView' requests"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW_REQUEST_HANDLER

inherit

	LS_CUSTOM_REQUEST_HANDLER
		redefine
			handle,
			request,
			response_result
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_response: GELSP_FORMAT_VIEW_RESPONSE
		do
			create l_response.make (a_request.id)
			check attached {GELSP} a_manager as l_gelsp then
				l_gelsp.on_format_view_request (a_request, l_response)
			end
			a_manager.send_message (l_response)
		end

feature {NONE} -- Implementation

	request: GELSP_FORMAT_VIEW_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: GELSP_FORMAT_VIEW
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
