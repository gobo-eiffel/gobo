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

	XM_SHARED_CATALOG_MANAGER

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_system_id: STRING) is
			-- Set `system_id'.
		require
			system_id_not_void: a_system_id /= Void
		do
			system_id := a_system_id
		ensure
			system_id_set: STRING_.same_string (system_id, a_system_id)
		end

feature -- Access

	system_id: STRING
			-- System-id of source

feature -- Events

	send (a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		local
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			shared_catalog_manager.reset_pi_catalogs
			create content_emitter.make (a_receiver)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create oasis_xml_catalog_filter.set_next (content, content_emitter)
			create start.set_next (oasis_xml_catalog_filter)
			create a_locator.make (a_parser)
			a_receiver.set_document_locator (a_locator)
			a_parser.set_callbacks (start)
			a_parser.set_dtd_callbacks (oasis_xml_catalog_filter)
			a_parser.parse_from_system (system_id)
		end

	send_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; a_system_id: UT_URI; a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		require
			stream_is_open_read: a_stream /= Void and then a_stream.is_open_read
			system_id_is_absolute: a_system_id /= Void and then a_system_id.is_absolute and then STRING_.same_string (system_id, a_system_id.full_reference)
			parser_uses_uri_resolver: a_parser /= Void -- and then parser with an XM_URI_EXTERNAL_RESOLVER for it's entity resolver
			receiver_not_void: a_receiver /= Void
		local
			an_entity_resolver: XM_URI_EXTERNAL_RESOLVER
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			shared_catalog_manager.reset_pi_catalogs
			create content_emitter.make (a_receiver)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create oasis_xml_catalog_filter.set_next (content, content_emitter)
			create start.set_next (oasis_xml_catalog_filter)
			create a_locator.make (a_parser)
			a_receiver.set_document_locator (a_locator)
			a_parser.set_callbacks (start)
			a_parser.set_dtd_callbacks (oasis_xml_catalog_filter)
			an_entity_resolver ?= a_parser.entity_resolver
			check
				uri_entity_resolver: an_entity_resolver /= Void
				-- from the pre-condition comment
			end
			an_entity_resolver.push_uri (a_system_id)
			a_parser.parse_from_stream (a_stream)
			a_parser.entity_resolver.resolve_finish
			a_stream.close
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	oasis_xml_catalog_filter: XM_OASIS_XML_CATALOG_FILTER
			-- Filter for oasis-xml-catalog PIs

	content_emitter :XM_XPATH_CONTENT_EMITTER
			-- Content emitter

	start: XM_UNICODE_VALIDATION_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	namespace_resolver: XM_NAMESPACE_RESOLVER
			-- Namespace resolver

	attributes: XM_ATTRIBUTE_DEFAULT_FILTER
			-- Set attribute defaults from the DTD

	content: XM_CONTENT_CONCATENATOR
			-- Content concatenator

end
	
