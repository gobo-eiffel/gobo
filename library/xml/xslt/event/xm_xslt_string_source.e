indexing

	description:

		"Objects that represent an XML document as an Eiffel STRING"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_STRING_SOURCE

inherit

	XM_XSLT_SOURCE

	XM_SHARED_CATALOG_MANAGER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

		-- This class is NOT intended to be used for system-ids of the string: protocol
		--  (for that, use an XM_XSLT_URI_SOURCE). Rather it is designed for creating
		--  composite stylesheets (see XM_XSLT_TRANSFORMER_FACTORY)

create

	make

feature {NONE} -- Initialization

	make (a_system_id, a_source_text: STRING) is
			-- Establish invariant.
		require
			system_id_not_void: a_system_id /= Void
			source_text_not_void: a_source_text /= Void
		local
			a_uri: UT_URI
		do
			create default_media_type.make ("application", "xslt+xml")
			create a_uri.make (a_system_id)
			system_id := a_uri.full_uri
			if a_uri.has_fragment then
				fragment_identifier := a_uri.fragment_item.decoded_utf8
			end
			source_text := a_source_text
		ensure
			system_id_set: fragment_identifier = Void implies STRING_.same_string (system_id, a_system_id)
			source_text_set: source_text = a_source_text
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

	send (a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; a_uri: UT_URI; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		local
			l_locator: XM_XPATH_RESOLVER_LOCATOR
			l_resolver: XM_URI_EXTERNAL_RESOLVER
			l_uri: UT_URI
		do
			shared_catalog_manager.reset_pi_catalogs
			error := a_parser.new_stop_on_error_filter
			create content_emitter.make (a_receiver, error)
			create namespace_resolver.set_next (content_emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			attributes.set_next_dtd (content_emitter)
			create content.set_next (attributes)
			create oasis_xml_catalog_filter.set_next (content, content_emitter)
			l_resolver ?= a_parser.entity_resolver
			create xpointer_filter.make (" ", default_media_type, l_resolver, oasis_xml_catalog_filter, oasis_xml_catalog_filter)
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
			create l_locator.make (a_parser)
			a_receiver.set_document_locator (l_locator)
			a_parser.set_callbacks (start)
			a_parser.set_dtd_callbacks (xpointer_filter)
			if l_resolver /= Void then
				create l_uri.make (system_id)
				l_resolver.push_uri (l_uri)
			end
			a_parser.parse_from_string (source_text)
			media_type := xpointer_filter.media_type
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		do
			system_id := a_system_id
		end

feature {NONE} -- Implementation

	source_text: STRING
			-- Text of XML document

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
	source_text_not_void: source_text /= Void
	default_media_type_not_void: default_media_type /= Void

end
	
