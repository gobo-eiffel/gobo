note

	description:

		"Objects that create emitters for gexslt:methods."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_EMITTER_FACTORY

inherit

	XM_XSLT_EXTENSION_EMITTER_FACTORY

	XM_XSLT_EMITTER_FACTORY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant..
		do
			namespace_uri := Gexslt_eiffel_type_uri
		end

feature -- Access

	namespace_uri: STRING
			-- Namespace for QNames using this factory

	is_valid_output_method (a_method_local_name: STRING): BOOLEAN
			-- Is `a_method_local_name' a valid output method?
		do
			Result := STRING_.same_string (a_method_local_name, "null")
		end

	new_receiver (a_method_local_name: STRING; a_serializer: XM_XSLT_SERIALIZER;
		a_result_stream: XM_OUTPUT; some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER
			-- New receiver chain including an emitter
		local
			a_null_emitter: XM_XSLT_GEXSLT_NULL_EMITTER
		do
			if STRING_.same_string (a_method_local_name, "null") then
				create a_null_emitter.make (a_serializer, some_properties)
				Result := a_null_emitter
			else
				check precondition_is_valid_output_method: False then end
			end
		end

feature -- Element change

	set_defaults (a_method_local_name: STRING; some_properties: XM_XSLT_OUTPUT_PROPERTIES; an_import_precedence: INTEGER)
			-- Set defaults for `a_method_local_name'.
		do
			some_properties.set_method (expanded_name_from_components (namespace_uri, a_method_local_name), an_import_precedence)
		end

invariant

	correct_namespace: STRING_.same_string (namespace_uri, Gexslt_eiffel_type_uri)

end

