note

	description:

		"Objects that create emitters for gexslt-examples:methods."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_EXAMPLES_EMITTER_FACTORY

inherit

	XM_XSLT_EXTENSION_EMITTER_FACTORY

	XM_XSLT_EMITTER_FACTORY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant..
		do
			namespace_uri := Gexslt_examples_uri
		end

feature -- Access

	namespace_uri: STRING
			-- Namespace for QNames using this factory

	is_valid_output_method (a_method_local_name: STRING): BOOLEAN
			-- Is `a_method_local_name' a valid output method?
		do
			Result := STRING_.same_string (a_method_local_name, "xml")
		end

	new_receiver (a_method_local_name: STRING; a_serializer: XM_XSLT_SERIALIZER;
		a_result_stream: XM_OUTPUT; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER
			-- New receiver chain including an emitter
		local
			l_receiver: XM_XPATH_RECEIVER
			l_xml_emitter: XM_XSLT_XML_EMITTER
		do
			if STRING_.same_string (a_method_local_name, "xml") then
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
					l_receiver := character_map_expander (l_receiver, a_properties, a_character_map_index, True)
				end
				-- Phase three (b) of serialization
				if a_properties.cdata_section_elements.count > 0 then
					create {XM_XSLT_CDATA_FILTER} l_receiver.make (l_receiver, l_xml_emitter, a_serializer, a_properties)
				end
				Result := l_receiver
			end
		end

feature -- Element change

	set_defaults (a_method_local_name: STRING; a_properties: XM_XSLT_OUTPUT_PROPERTIES; a_import_precedence: INTEGER)
			-- Set defaults for `a_method_local_name'.
		do

			-- Setting ALL of the defaults is shown here as an example of what can be set.
			-- Most of these are the default defaults anyway, so you do not need to set them.

			a_properties.set_method (expanded_name_from_components (namespace_uri, a_method_local_name), a_import_precedence)
			a_properties.set_default_indent_spaces (3)
			a_properties.set_default_encoding ("UTF-8")
			a_properties.set_default_byte_order_mark (False)
			a_properties.set_default_escape_uri_attributes (True)
			a_properties.set_default_include_content_type (True)
			a_properties.set_default_indent (False)
			a_properties.set_default_version ("1.0")
			a_properties.set_default_media_type ("text/xml")
			a_properties.set_default_character_representation ("hex")

			-- You could also set defaults for extension attributes. Note that these
			--  do not honour the import precedence rules.

			-- E.g. a_properties.extension_attributes.force ("BUG - invalid dtd internal subset", "{http://www.gobosoft.com/eiffel/gobo/gexslt/extension/examples}internal-subset")
		end

invariant

	correct_namespace: STRING_.same_string (namespace_uri, Gexslt_examples_uri)

end

