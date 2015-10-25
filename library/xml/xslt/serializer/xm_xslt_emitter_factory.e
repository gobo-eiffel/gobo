note

	description:

		"Objects that create emitters from xsl:output parameters."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EMITTER_FACTORY

inherit

	XM_XSLT_EMITTER_FACTORY_ROUTINES

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			create extension_emitter_factories.make_with_equality_testers (1, Void, string_equality_tester)
			create normalizer_factory.make
		end

feature -- Access

	is_valid_output_method (a_method_uri, a_method_local_name: STRING): BOOLEAN
			-- Is `a_method_local_name' a valid output method within `a_method_uri'?
		require
			a_method_uri_not_void: a_method_uri /= Void
			a_method_local_name_not_void: a_method_local_name /= Void
		do
			if a_method_uri.count = 0 then
				if a_method_local_name.count = 0 then
					Result := True
				elseif STRING_.same_string (a_method_local_name, "xml") then
					Result := True
				elseif STRING_.same_string (a_method_local_name, "xhtml") then
					Result := True
				elseif STRING_.same_string (a_method_local_name, "html") then
					Result := True
				elseif STRING_.same_string (a_method_local_name, "text") then
					Result := True
				end
			else
				if extension_emitter_factories.has (a_method_uri) then
					Result := extension_emitter_factories.item (a_method_uri).is_valid_output_method (a_method_local_name)
				end
			end
		end

feature -- Status report

	is_extension_emitter_factory_registered (a_uri: STRING): BOOLEAN
			-- Is an extension emitter factory registered for `a_uri'?
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
		do
			Result := extension_emitter_factories.has (a_uri)
		end

feature -- Element change

	register_extension_emitter_factory (a_extension_emitter_factory: XM_XSLT_EXTENSION_EMITTER_FACTORY)
			-- Register `a_extension_emitter_factory' as the emitter factory for methods in `a_uri'.
		require
			a_extension_emitter_factory_not_void: a_extension_emitter_factory /= Void
			a_extension_emitter_factory_not_already_registered: not is_extension_emitter_factory_registered (a_extension_emitter_factory.namespace_uri)
		do
			extension_emitter_factories.force (a_extension_emitter_factory, a_extension_emitter_factory.namespace_uri)
		ensure
			extension_emitter_factory_registered: is_extension_emitter_factory_registered (a_extension_emitter_factory.namespace_uri)
		end

	set_defaults (a_method_uri, a_method_local_name: STRING; a_properties: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set defaults for `a_method_local_name' within `a_method_uri'.
		require
			a_method_uri_not_void: a_method_uri /= Void
			a_method_uri_not_empty: not a_method_uri.is_empty
			a_method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_uri, a_method_local_name)
			a_properties_not_void: a_properties /= Void
		do
			extension_emitter_factories.item (a_method_uri).set_defaults (a_method_local_name, a_properties, a_import_precedence)
		end

feature {XM_XSLT_SERIALIZER} -- Creation

	new_receiver (a_method_uri, a_method_local_name: STRING; a_serializer: XM_XSLT_SERIALIZER;
		a_result_stream: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: detachable DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER
			-- New receiver chain including an emitter
		require
			a_method_uri_not_void: a_method_uri /= Void
			a_method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_uri, a_method_local_name)
			a_serializer_not_void: a_serializer /= Void
			a_result_stream_not_void: a_result_stream /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: a_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		do
			if a_method_uri.count = 0 then
				if a_method_local_name.count = 0 then
					create {XM_XSLT_UNCOMMITTED_EMITTER} Result.make (a_serializer, a_result_stream, a_properties, a_character_map_index, Current)
				elseif STRING_.same_string (a_method_local_name, "xml") then
					Result := new_xml_emitter (a_serializer, a_result_stream, a_properties, a_character_map_index).first
				elseif STRING_.same_string (a_method_local_name, "xhtml") then
					Result := new_xhtml_emitter (a_serializer, a_result_stream, a_properties, a_character_map_index).first
				elseif STRING_.same_string (a_method_local_name, "html") then
					Result := new_html_emitter (a_serializer, a_result_stream, a_properties, a_character_map_index).first
				elseif STRING_.same_string (a_method_local_name, "text") then
					Result := new_text_emitter (a_serializer, a_result_stream, a_properties, a_character_map_index)
				else
					check precondition_valid_output_method: False then end
				end
			else
				Result := extension_emitter_factories.item (a_method_uri).new_receiver (a_method_local_name, a_serializer, a_result_stream, a_properties, a_character_map_index)
			end
		ensure
			new_receiver_not_void: Result /= Void
		end

feature {XM_XSLT_UNCOMMITTED_EMITTER} -- Creation

	new_xml_emitter (a_serializer: XM_XSLT_SERIALIZER; a_result_stream: XM_OUTPUT;	a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: detachable DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
			-- New receiver chain including an xml emitter
		require
			a_serializer_not_void: a_serializer /= Void
			a_result_stream_not_void: a_result_stream /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: not a_properties.used_character_maps.is_empty implies a_character_map_index /= Void
		local
			l_receiver: XM_XPATH_RECEIVER
			l_xml_emitter: XM_XSLT_XML_EMITTER
		do
			-- Phases two, three (e) and five of serialization
			create l_xml_emitter.make (a_serializer, a_result_stream, a_properties)
			l_receiver := l_xml_emitter
			-- Phase four of serialization
			if a_properties.indent then
				create {XM_XSLT_XML_INDENTER} l_receiver.make (a_serializer, l_xml_emitter, a_properties)
			end
			-- Phase three (d) of serialization
			create {XM_XSLT_NORMALIZING_FILTER} l_receiver.make (l_receiver, a_serializer, a_properties)
			-- Phase three (c) of serialization
			if not a_properties.used_character_maps.is_empty then
				check precondition_a_character_map_index: a_character_map_index /= Void then
					l_receiver := character_map_expander (l_receiver, a_properties, a_character_map_index, True)
				end
			end
			-- Phase three (b) of serialization
			if not a_properties.cdata_section_elements.is_empty then
				create {XM_XSLT_CDATA_FILTER} l_receiver.make (l_receiver, l_xml_emitter, a_serializer, a_properties)
			end
			create Result.make (l_receiver, l_xml_emitter)
		ensure
			new_xml_emitter_not_void: Result /= Void
			receiver_not_void: Result.first /= Void
			emitter_not_void: Result.second /= Void
		end

	new_xhtml_emitter (a_serializer: XM_XSLT_SERIALIZER; a_result_stream: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: detachable DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
			-- New receiver chain including an xhtml emitter
		require
			a_serializer_not_void: a_serializer /= Void
			a_result_stream_not_void: a_result_stream /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: a_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			l_receiver: XM_XPATH_RECEIVER
			l_xhtml_emitter: XM_XSLT_XHTML_EMITTER
		do
			-- Phases two, three (e) and five of serialization
			create l_xhtml_emitter.make (a_serializer, a_result_stream, a_properties)
			l_receiver := l_xhtml_emitter
			-- Phase four of serialization
			if a_properties.indent then
				create {XM_XSLT_XHTML_INDENTER} l_receiver.make (a_serializer, l_xhtml_emitter, a_properties)
			end
			-- Phase three (d) of serialization
			create {XM_XSLT_NORMALIZING_FILTER} l_receiver.make (l_receiver, a_serializer, a_properties)
			-- Phase three (c) of serialization
			if not a_properties.used_character_maps.is_empty then
				check precondition_a_character_map_index: a_character_map_index /= Void then
					l_receiver := character_map_expander (l_receiver, a_properties, a_character_map_index, True)
				end
			end
			-- Phase three (b) of serialization
			if not a_properties.cdata_section_elements.is_empty then
				create {XM_XSLT_CDATA_FILTER} l_receiver.make (l_receiver, l_xhtml_emitter, a_serializer, a_properties)
			end
			-- Phase three (a) of serialization
			if a_properties.escape_uri_attributes then
				create {XM_XSLT_URI_ESCAPER} l_receiver.make (l_receiver, True)
			end
			-- Phase one of serialization
			if a_properties.include_content_type then
				create {XM_XSLT_META_TAG_INSERTER} l_receiver.make (l_receiver, a_properties, True)
			end
			create Result.make (l_receiver, l_xhtml_emitter)
		ensure
			new_xhtml_emitter_not_void: Result /= Void
			receiver_not_void: Result.first /= Void
			emitter_not_void: Result.second /= Void
		end

	new_html_emitter (a_serializer: XM_XSLT_SERIALIZER; a_result_stream: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: detachable DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
			-- New receiver chain including an html emitter
		require
			a_serializer_not_void: a_serializer /= Void
			a_result_stream_not_void: a_result_stream /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: a_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			l_receiver: XM_XPATH_RECEIVER
			l_html_emitter: XM_XSLT_HTML_EMITTER
		do
			-- Phases two, three (e) and five of serialization
			create l_html_emitter.make (a_serializer, a_result_stream, a_properties)
			l_receiver := l_html_emitter
			-- Phase four of serialization
			if a_properties.indent then
				create {XM_XSLT_HTML_INDENTER} l_receiver.make (a_serializer, l_html_emitter, a_properties)
			end
			-- Phase three (d) of serialization
			create {XM_XSLT_NORMALIZING_FILTER} l_receiver.make (l_receiver, a_serializer, a_properties)
			-- Phase three (c) of serialization
			if not a_properties.used_character_maps.is_empty then
				check precondition_a_character_map_index: a_character_map_index /= Void then
					l_receiver := character_map_expander (l_receiver, a_properties, a_character_map_index, True)
				end
			end
			-- Phase three (a) of serialization
			if a_properties.escape_uri_attributes then
				create {XM_XSLT_URI_ESCAPER} l_receiver.make (l_receiver, False)
			end
			-- Phase one of serialization
			if a_properties.include_content_type then
				create {XM_XSLT_META_TAG_INSERTER} l_receiver.make (l_receiver, a_properties, False)
			end
			create Result.make (l_receiver, l_html_emitter)
		ensure
			new_html_emitter_not_void: Result /= Void
			receiver_not_void: Result.first /= Void
			emitter_not_void: Result.second /= Void
		end

	new_text_emitter (a_serializer: XM_XSLT_SERIALIZER; a_result_stream: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: detachable DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER
			-- New receiver chain including a text emitter
		require
			a_serializer_not_void: a_serializer /= Void
			a_result_stream_not_void: a_result_stream /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: a_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		do
			-- Phases two, three (e) and five of serialization
			create {XM_XSLT_TEXT_EMITTER} Result.make (a_serializer, a_result_stream, a_properties)
			-- Phase three (d) of serialization
			create {XM_XSLT_NORMALIZING_FILTER} Result.make (Result, a_serializer, a_properties)
			-- Phase three (c) of serialization
			if not a_properties.used_character_maps.is_empty then
				check precondition_a_character_map_index: a_character_map_index /= Void then
					Result := character_map_expander (Result, a_properties, a_character_map_index, False)
				end
			end
		end

feature {NONE} -- Implementation

	normalizer_factory: XM_XSLT_NORMALIZER_FACTORY
			-- Factory for Unicode normalizers

	extension_emitter_factories: DS_HASH_TABLE [XM_XSLT_EXTENSION_EMITTER_FACTORY, STRING]
			-- Extension emitter factories keyed on namespace URI

invariant

	extension_emitter_factories_not_void: extension_emitter_factories /= Void
	normalizer_factory_not_void: normalizer_factory /= Void

end

