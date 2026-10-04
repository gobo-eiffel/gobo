note

	description:

		"LSP '$/goboEiffel/formatView' parameters"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW_PARAMS

inherit

	LS_CUSTOM_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri)
			-- Create new params for '$/goboEiffel/formatView' requests.
		require
			a_uri_not_void: a_uri /= Void
		do
			uri := a_uri
		ensure
			uri_set: uri = a_uri
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- URI of the requested format view

feature -- Field names

	uri_name: STRING_8 = "uri"
			-- Field names

feature {LS_PROCESSOR} -- Processing

	process_custom_fields (a_processor: LS_PROCESSOR)
			-- Process all custom fields.
		do
			a_processor.process_custom_field (uri_name, uri)
		end

invariant

	uri_not_void: uri /= Void

end
