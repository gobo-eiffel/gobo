indexing

	description:

		"Objects that represent a textual XML document by it's URI"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_URI_SOURCE

inherit

	XM_XSLT_SOURCE

	XM_SHARED_CATALOG_MANAGER
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		
	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_id: STRING) is
			-- Establish invariant.
		require
			system_id_not_void: a_system_id /= Void
		local
			a_uri: UT_URI
			a_cwd: KI_PATHNAME
		do
			create default_media_type.make ("application", "xslt+xml")
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			a_uri := File_uri.pathname_to_uri (a_cwd)
			create a_uri.make_resolve (a_uri, a_system_id)
			system_id := a_uri.full_uri
			if a_uri.has_fragment then
				fragment_identifier := a_uri.fragment_item.decoded_utf8
			end
		end

feature -- Access

	system_id: STRING
			-- System-id of source

	fragment_identifier: STRING
			-- Possible decoded fragment identifier

	default_media_type: UT_MEDIA_TYPE
			-- Default media type for stylesheet processing

	media_type: UT_MEDIA_TYPE
			-- Media type of document entity

feature -- Events

	send (a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		local
			a_locator: XM_XPATH_RESOLVER_LOCATOR
			an_entity_resolver: XM_URI_EXTERNAL_RESOLVER
			a_media_type: UT_MEDIA_TYPE
		do
			shared_catalog_manager.reset_pi_catalogs
			error := a_parser.new_stop_on_error_filter
			create content_emitter.make (a_receiver, error)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create oasis_xml_catalog_filter.set_next (content, content_emitter)
			an_entity_resolver ?= a_parser.entity_resolver
			if is_stylesheet then
				a_media_type := default_media_type
			else
				a_media_type := Void
			end
			create xpointer_filter.make (" ", a_media_type, an_entity_resolver, oasis_xml_catalog_filter, oasis_xml_catalog_filter)
			if fragment_identifier = Void or else not is_stylesheet then
				xpointer_filter.set_no_filtering
			else
				xpointer_filter.set_xpointer (fragment_identifier)
				if are_media_type_ignored then
					xpointer_filter.ignore_media_types
				else
					xpointer_filter.allow_generic_xml_types (True)
					xpointer_filter.add_standard_media_types
				end
			end
			create start.set_next (xpointer_filter)
			create a_locator.make (a_parser)
			a_receiver.set_document_locator (a_locator)
			a_receiver.set_system_id (uri_reference)
			a_parser.set_callbacks (start)
			a_parser.set_dtd_callbacks (xpointer_filter)
			a_parser.parse_from_system (system_id)
			media_type := xpointer_filter.media_type
		end

	send_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM; a_system_id: UT_URI; a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		require
			stream_is_open_read: a_stream /= Void and then a_stream.is_open_read
			system_id_is_absolute: a_system_id /= Void and then a_system_id.is_absolute and then STRING_.same_string (system_id, a_system_id.full_uri)
			parser_uses_uri_resolver: a_parser /= Void -- and then parser with an XM_URI_EXTERNAL_RESOLVER for it's entity resolver
			receiver_not_void: a_receiver /= Void
		local
			an_entity_resolver: XM_URI_EXTERNAL_RESOLVER
			a_locator: XM_XPATH_RESOLVER_LOCATOR
			a_uri: UT_URI
			a_media_type: UT_MEDIA_TYPE
		do
			shared_catalog_manager.reset_pi_catalogs
			error := a_parser.new_stop_on_error_filter
			create content_emitter.make (a_receiver, error)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create oasis_xml_catalog_filter.set_next (content, content_emitter)
			an_entity_resolver ?= a_parser.entity_resolver
			check
				uri_entity_resolver: an_entity_resolver /= Void
				-- from the pre-condition comment
			end
			if is_stylesheet then
				a_media_type := default_media_type
			else
				a_media_type := Void
			end
			create xpointer_filter.make (" ", a_media_type, an_entity_resolver, oasis_xml_catalog_filter, oasis_xml_catalog_filter)
			if fragment_identifier = Void or else not is_stylesheet then
				xpointer_filter.set_no_filtering
			else
				xpointer_filter.set_xpointer (fragment_identifier)
				if are_media_type_ignored then
					xpointer_filter.ignore_media_types
				else
					xpointer_filter.allow_generic_xml_types (True)
					xpointer_filter.add_standard_media_types
				end				
			end
			create start.set_next (xpointer_filter)
			create a_locator.make (a_parser)
			a_receiver.set_document_locator (a_locator)
			a_receiver.set_system_id (uri_reference)
			a_parser.set_callbacks (start)
			a_parser.set_dtd_callbacks (oasis_xml_catalog_filter)
			create a_uri.make (system_id)
			an_entity_resolver.push_uri (a_uri)
			a_parser.parse_from_stream (a_stream)
			a_parser.entity_resolver.resolve_finish
			if a_stream.is_closable then a_stream.close end
			media_type := xpointer_filter.media_type
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	xpointer_filter: XM_XPOINTER_EVENT_FILTER
			-- Filter for fragment identifiers

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
		
	error: XM_PARSER_STOP_ON_ERROR_FILTER
			-- Error collector

invariant

	system_id_not_void: system_id /= Void
	default_media_type_not_void: default_media_type /= Void

end
	
