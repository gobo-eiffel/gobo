indexing

	description:

		"Objects that create emitters for gexslt-examples:methods."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_EXAMPLES_EMITTER_FACTORY

inherit

	XM_XSLT_EXTENSION_EMITTER_FACTORY

	XM_XSLT_EMITTER_FACTORY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant..
		do
			namespace_uri := Gexslt_examples_uri
		end

feature -- Access

	namespace_uri: STRING
			-- Namespace for QNames using this factory

	is_valid_output_method (a_method_local_name: STRING): BOOLEAN is
			-- Is `a_method_local_name' a valid output method?
		do
			Result := STRING_.same_string (a_method_local_name, "xml")
		end

	new_receiver (a_method_local_name: STRING; a_transformer: XM_XSLT_TRANSFORMER;
		a_result_stream: XM_OUTPUT; some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an emitter
		local
			an_xml_emitter: XM_XSLT_GEXSLT_EXAMPLES_XML_EMITTER
			an_xml_indenter: XM_XSLT_XML_INDENTER
			a_cdata_filter: XM_XSLT_CDATA_FILTER
		do
			if STRING_.same_string (a_method_local_name, "xml") then
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
		end

feature -- Element change

	set_defaults (a_method_local_name: STRING; some_properties: XM_XSLT_OUTPUT_PROPERTIES; an_import_precedence: INTEGER) is
			-- Set defaults for `a_method_local_name'.
		local
			an_expanded_name: STRING
		do

			-- Setting ALL of the defaults is shown here as an example of what can be set.
			-- Most of these are the default defaults anyway, so you do not need to set them.

			an_expanded_name := STRING_.concat ("{", namespace_uri)
			an_expanded_name := STRING_.appended_string (an_expanded_name, "}")
			an_expanded_name := STRING_.appended_string (an_expanded_name, a_method_local_name)
			some_properties.set_method (an_expanded_name, an_import_precedence)
			some_properties.set_default_indent_spaces (3)
			some_properties.set_default_encoding ("UTF-8")
			some_properties.set_default_byte_order_mark (False)
			some_properties.set_default_escape_uri_attributes (True)
			some_properties.set_default_include_content_type (True)
			some_properties.set_default_indent (False)
			some_properties.set_default_version ("1.0")
			some_properties.set_default_media_type ("text/xml")
			some_properties.set_default_character_representation ("hex")

			-- You could also set defaults for extension attributes. Note that these
			--  do not honour the import precedence rules.

			-- E.g. some_properties.extension_attributes.force ("BUG - invalid dtd internal subset", "{http://www.gobosoft.com/eiffel/gobo/gexslt/extension/examples}internal-subset")
		end

invariant

	correct_namespace: STRING_.same_string (namespace_uri, Gexslt_examples_uri)

end
	
