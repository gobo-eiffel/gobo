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

	XM_STRING_MODE

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
		do
			create content_emitter.make (a_receiver, a_name_pool)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create start.set_next (attributes)
			create entity_resolver.make
			create entity_resolver.make
			create parser.make
			parser.set_resolver (entity_resolver)
			parser.copy_string_mode (Current)
			parser.set_callbacks (start)
			parser.set_dtd_callbacks (content_emitter)
			parser.parse_from_system (system_id)
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation
		
	parser: XM_EIFFEL_PARSER
			-- Eiffel parse
	
	entity_resolver: XM_FILE_EXTERNAL_RESOLVER
			-- Entity resolver

	content_emitter :XM_XPATH_CONTENT_EMITTER
			-- Content emitter

	start: XM_UNICODE_VALIDATION_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	namespace_resolver: XM_NAMESPACE_RESOLVER
			-- Namespace resolver

	attributes: XM_ATTRIBUTE_DEFAULT_FILTER
			-- Set attribute defaults from the DTD

end
	
