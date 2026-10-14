note

	description:

		"LSP format views"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW

inherit

	LS_CUSTOM_PARAMS

	LS_CUSTOM_RESULT
		undefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_text: like text)
			-- Create new format view.
		require
			a_uri_not_void: a_uri /= Void
			a_text_not_void: a_text /= Void
		do
			uri := a_uri
			text := a_text
		ensure
			uri_set: uri = a_uri
			text_set: text = a_text
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- URI of format view

	text: LS_STRING
			-- Text of format view

feature -- Field names

	uri_name: STRING_8 = "uri"
	text_name: STRING_8 = "text"
			-- Field names

feature {LS_PROCESSOR} -- Processing

	process_custom_fields (a_processor: LS_PROCESSOR)
			-- Process all custom fields.
		do
			a_processor.process_custom_field (uri_name, uri)
			a_processor.process_custom_field (text_name, text)
		end

invariant

	uri_not_void: uri /= Void
	text_not_void: text /= Void

end
