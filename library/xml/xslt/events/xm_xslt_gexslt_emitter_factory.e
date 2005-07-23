indexing

	description:

		"Objects that create emitters for gexslt:methods."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_EMITTER_FACTORY

inherit

	XM_XSLT_EXTENSION_EMITTER_FACTORY

	XM_XSLT_EMITTER_FACTORY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant..
		do
			namespace_uri := Gexslt_eiffel_type_uri
		end

feature -- Access

	namespace_uri: STRING
			-- Namespace for QNames using this factory

	is_valid_output_method (a_method_local_name: STRING): BOOLEAN is
			-- Is `a_method_local_name' a valid output method?
		do
			Result := STRING_.same_string (a_method_local_name, "null")
		end

	new_receiver (a_method_local_name: STRING; a_transformer: XM_XSLT_TRANSFORMER;
		a_result_stream: XM_OUTPUT; some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER is
			-- New receiver chain including an emitter
		local
			a_null_emitter: XM_XSLT_GEXSLT_NULL_EMITTER
		do
			if STRING_.same_string (a_method_local_name, "null") then
				create a_null_emitter.make (a_transformer, some_properties)
				Result := a_null_emitter
			end
		end

feature -- Element change

	set_defaults (a_method_local_name: STRING; some_properties: XM_XSLT_OUTPUT_PROPERTIES; an_import_precedence: INTEGER) is
			-- Set defaults for `a_method_local_name'.
		local
			an_expanded_name: STRING
		do
			an_expanded_name := STRING_.concat ("{", namespace_uri)
			an_expanded_name := STRING_.appended_string (an_expanded_name, "}")
			an_expanded_name := STRING_.appended_string (an_expanded_name, a_method_local_name)
			some_properties.set_method (an_expanded_name, an_import_precedence)
		end

invariant

	correct_namespace: STRING_.same_string (namespace_uri, Gexslt_eiffel_type_uri)

end
	
