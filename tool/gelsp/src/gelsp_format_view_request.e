note

	description:

		"LSP '$/goboEiffel/formatView' requests"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW_REQUEST

inherit

	LS_CUSTOM_REQUEST
		rename	
			make as make_custom_request,
			method as custom_request_method
		redefine
			params,
			handler
		end

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_params: like params)
			-- Create a new custom request.
		require
			a_id_not_void: a_id /= Void
			a_params_not_void: a_params /= Void
		do
			make_custom_request (method, a_id, a_params)
		ensure
			id_set: id = a_id
			params_set: params = a_params
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "$/goboEiffel/formatView"
		ensure
			method_not_void: Result /= Void
			instance_free: class
		end

	params: GELSP_FORMAT_VIEW_PARAMS
			-- Request parameters

	handler (a_manager: LS_MESSAGE_MANAGER): GELSP_FORMAT_VIEW_REQUEST_HANDLER
			-- Message handler for current request
		do
			check attached {GELSP} a_manager as l_gelsp then
				Result := l_gelsp.format_view_request_handler
			end
		ensure then
			instance_free: class
		end

invariant

	params_not_void: params /= Void

end
