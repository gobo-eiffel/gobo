indexing

	description:

		"Objects that represent an XML document by it's URI"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_URI_SOURCE

inherit

	XM_XSLT_SOURCE

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_uri: UT_URI) is
			-- Set `system_id'.
		require
			uri_not_void: a_uri /= Void
			temporarily_only_supports_file: a_uri.has_valid_scheme implies STRING_.same_string (a_uri.scheme, "file")
		do

			-- temporary bodge

			set_system_id (a_uri.path)
		ensure
			-- system_id_set: STRING_.same_string (system_id, a_uri.full_reference)
			system_id_set: STRING_.same_string (system_id, a_uri.path)
		end

feature -- Access

	system_id: STRING
			-- System-id of source

feature -- Events

	send (a_configuration: XM_XSLT_CONFIGURATION; a_receiver: XM_XPATH_RECEIVER; a_name_pool: XM_XPATH_NAME_POOL; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		local
			an_input_stream: KL_TEXT_INPUT_FILE
		do
			is_error := False
			create content_emitter.make (a_receiver, a_name_pool)
			create error.set_next (content_emitter)
			create namespace_resolver.set_next (error)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create start.set_next (attributes)
			create entity_resolver.make
			create parser.make
			parser.set_resolver (entity_resolver)
			parser.set_callbacks (start)
			parser.set_dtd_callbacks (content_emitter)
			create an_input_stream.make (system_id)
			an_input_stream.open_read
			if an_input_stream.is_open_read then
				parser.parse_from_stream (an_input_stream)
				if error.has_error then
					is_error := True
					internal_error_message := error.last_error
				end
			else
				is_error := True
				internal_error_message := "Unable to open " + system_id
			end
		end

feature -- Status report

	is_error: BOOLEAN
			-- Is `Current' in an error state?

	error_message: STRING is
			-- Last error message
		do
			Result := internal_error_message
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	make_parser is
		local
			
		do
			-- TODO
		end
		
	internal_error_message: like error_message
			-- Text of last error

	parser: XM_EIFFEL_PARSER
			-- Eiffel parse
	
	entity_resolver: XM_FILE_EXTERNAL_RESOLVER
			-- Entity resolver

	content_emitter :XM_XPATH_CONTENT_EMITTER
			-- Content emitter

	start: XM_UNICODE_VALIDATION_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	error: XM_STOP_ON_ERROR_FILTER
		-- Error collector

	namespace_resolver: XM_NAMESPACE_RESOLVER
			-- Namespace resolver

	attributes: XM_ATTRIBUTE_DEFAULT_FILTER
			-- Set attribute defaults from the DTD

end
	
