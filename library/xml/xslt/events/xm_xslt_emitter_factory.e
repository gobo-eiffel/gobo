indexing

	description:

		"Objects that create emitters from xsl:output parameters."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make is
			-- Establish invariant.
		do
			create extension_emitter_factories.make_with_equality_testers (1, Void, string_equality_tester)
		end

feature -- Access

	is_valid_output_method (a_method_uri, a_method_local_name: STRING): BOOLEAN is
			-- Is `a_method_local_name' a valid output method within `a_method_uri'?
		require
			method_uri_not_void: a_method_uri /= Void
			method_local_name_not_void: a_method_local_name /= Void
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

	is_extension_emitter_factory_registered (a_uri: STRING): BOOLEAN is
			-- Is an extension emitter factory registered for `a_uri'?
		require
			uri_not_null: a_uri /= Void and then a_uri.count > 0
		do
			Result := extension_emitter_factories.has (a_uri)
		end

feature -- Element change

	register_extension_emitter_factory (an_extension_emitter_factory: XM_XSLT_EXTENSION_EMITTER_FACTORY) is
			-- Register `an_extension_emitter_factory' as the emitter factory for methods in `a_uri'.
		require
			extension_emitter_factory_not_void: an_extension_emitter_factory /= Void
			extension_emitter_factory_not_already_registered: not is_extension_emitter_factory_registered (an_extension_emitter_factory.namespace_uri)
		do
			extension_emitter_factories.force (an_extension_emitter_factory, an_extension_emitter_factory.namespace_uri)
		ensure
			extension_emitter_factory_registered: is_extension_emitter_factory_registered (an_extension_emitter_factory.namespace_uri)
		end

	set_defaults (a_method_uri, a_method_local_name: STRING; some_properties: XM_XSLT_OUTPUT_PROPERTIES; an_import_precedence: INTEGER) is
			-- Set defaults for `a_method_local_name' within `a_method_uri'.
		require
			valid_method_uri: a_method_uri /= Void and then  a_method_uri.count > 0
			method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_uri, a_method_local_name)
			properties_not_void: some_properties /= Void
		do
			extension_emitter_factories.item (a_method_uri).set_defaults (a_method_local_name, some_properties, an_import_precedence)
		end

feature {XM_XSLT_TRANSFORMER} -- Creation

	new_receiver (a_method_uri, a_method_local_name: STRING; a_transformer: XM_XSLT_TRANSFORMER;
		a_result_stream: XM_OUTPUT; some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an emitter
		require
			method_uri_not_void: a_method_uri /= Void
			method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_uri, a_method_local_name)
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		do
			if a_method_uri.count = 0 then
				if a_method_local_name.count = 0 then
					Result := new_uncommitted_emitter (a_transformer, a_result_stream, some_properties, a_character_map_index)
				elseif STRING_.same_string (a_method_local_name, "xml") then
					Result := new_xml_emitter (a_transformer, a_result_stream, some_properties, a_character_map_index)
				elseif STRING_.same_string (a_method_local_name, "xhtml") then
					Result := new_xhtml_emitter (a_transformer, a_result_stream, some_properties, a_character_map_index)
				elseif STRING_.same_string (a_method_local_name, "html") then
					Result := new_html_emitter (a_transformer, a_result_stream, some_properties, a_character_map_index)
				elseif STRING_.same_string (a_method_local_name, "text") then
					Result := new_text_emitter (a_transformer, a_result_stream, some_properties, a_character_map_index)
				end
			else
				Result := extension_emitter_factories.item (a_method_uri).new_receiver (a_method_local_name, a_transformer, a_result_stream, some_properties, a_character_map_index)
			end
		ensure
			new_receiver_not_void: Result /= Void
		end


feature {NONE} -- Implementation

	extension_emitter_factories: DS_HASH_TABLE [XM_XSLT_EXTENSION_EMITTER_FACTORY, STRING]
			-- Extension emitter factories keyed on namespace URI

	new_xml_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_result_stream: XM_OUTPUT;
		some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an xml emitter
		require
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			an_xml_emitter: XM_XSLT_XML_EMITTER
			an_xml_indenter: XM_XSLT_XML_INDENTER
			a_cdata_filter: XM_XSLT_CDATA_FILTER
		do
			create an_xml_emitter.make (a_transformer, a_result_stream, some_properties,
												 character_map_expander (some_properties, a_character_map_index, True))
			Result := an_xml_emitter
			if some_properties.indent then
				create an_xml_indenter.make (a_transformer, an_xml_emitter, some_properties)
				Result := an_xml_indenter
			end
			if some_properties.cdata_section_elements.count > 0 then
				create a_cdata_filter.make (Result, an_xml_emitter, some_properties)
				Result := a_cdata_filter
			end
		end

	new_xhtml_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_result_stream: XM_OUTPUT;
		some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an xhtml emitter
		require
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			an_xhtml_emitter: XM_XSLT_XHTML_EMITTER
			an_html_indenter: XM_XSLT_HTML_INDENTER
			a_cdata_filter: XM_XSLT_CDATA_FILTER
		do
			create an_xhtml_emitter.make (a_transformer, a_result_stream, some_properties,
												 character_map_expander (some_properties, a_character_map_index, True))
			Result := an_xhtml_emitter
			if some_properties.indent then
				create an_html_indenter.make (a_transformer, an_xhtml_emitter, some_properties)
				Result := an_html_indenter
			end
			if some_properties.cdata_section_elements.count > 0 then
				create a_cdata_filter.make (Result, an_xhtml_emitter, some_properties)
				Result := a_cdata_filter
			end
		end

	new_html_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_result_stream: XM_OUTPUT;
		some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an html emitter
		require
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			an_html_emitter: XM_XSLT_HTML_EMITTER
			an_html_indenter: XM_XSLT_HTML_INDENTER
		do
			create an_html_emitter.make (a_transformer, a_result_stream, some_properties,
												 character_map_expander (some_properties, a_character_map_index, True))
			Result := an_html_emitter
			if some_properties.indent then
				create an_html_indenter.make (a_transformer, an_html_emitter, some_properties)
				Result := an_html_indenter
			end
		end

	new_text_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_result_stream: XM_OUTPUT;
		some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including a text emitter
		require
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		do
			create {XM_XSLT_TEXT_EMITTER} Result.make (a_transformer, a_result_stream, some_properties,
												 character_map_expander (some_properties, a_character_map_index, False))
		end


	new_uncommitted_emitter (a_transformer: XM_XSLT_TRANSFORMER; a_result_stream: XM_OUTPUT;
		some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an uncommitted emitter
		require
			transformer_not_void: a_transformer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		do
			create {XM_XSLT_UNCOMMITTED_EMITTER} Result.make (a_transformer, a_result_stream, some_properties,
												 character_map_expander (some_properties, a_character_map_index, False))
		end

invariant

	extension_emitter_factories_not_void: extension_emitter_factories /= Void

end
	
