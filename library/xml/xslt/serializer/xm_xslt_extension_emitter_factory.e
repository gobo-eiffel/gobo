note

	description:

		"Objects that create emitters for a QName method."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_EXTENSION_EMITTER_FACTORY

inherit

	ANY -- For SE 2.x, so that `is_equal' is exported

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

feature -- Access

	namespace_uri: STRING
			-- Namespace for QNames using this factory
		deferred
		ensure
			valid_namespace_uri: Result /= Void and then Result.count > 0
				and then not STRING_.same_string (Result, Xslt_uri)
				-- removed to allow in-built extension emitter factory - 23/07/2005: and then not STRING_.same_string (Result, Gexslt_eiffel_type_uri)
		end

	is_valid_output_method (a_method_local_name: STRING): BOOLEAN
		-- Is `a_method_local_name' a valid output method?
		require
			method_local_name_not_void: a_method_local_name /= Void
		deferred
		end

	new_receiver (a_method_local_name: STRING; a_serializer: XM_XSLT_SERIALIZER;
		a_result_stream: XM_OUTPUT; some_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]): XM_XPATH_RECEIVER
			-- New receiver chain including an emitter
		require
			method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_local_name)
			serializer_not_void: a_serializer /= Void
			result_stream_not_void: a_result_stream /= Void
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		deferred
		ensure
			new_receiver_not_void: Result /= Void
		end

feature -- Element change

	set_defaults (a_method_local_name: STRING; some_properties: XM_XSLT_OUTPUT_PROPERTIES; an_import_precedence: INTEGER)
			-- Set defaults for `a_method_local_name'.
		require
			method_local_name_not_void: a_method_local_name /= Void
			valid_output_method: is_valid_output_method (a_method_local_name)
			properties_not_void: some_properties /= Void
		deferred
		end

end

