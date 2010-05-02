note

	description:

		"Objects that resolve URIs for the file scheme, when XPath fn:collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COLLECTION_FILE_SCHEME_RESOLVER

inherit

	XM_XPATH_COLLECTION_SCHEME_RESOLVER

	XM_XPATH_DIRECTORY_COLLECTION_ROUTINES

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XPATH_CONFIGURATION)
			-- Initialize `scheme' and register system property.
		require
			a_configuration_not_void: a_configuration /= Void
		local
			l_table: DS_HASH_TABLE [STRING, STRING]
		do
			scheme := "file"
			l_table := a_configuration.system_properties.item (Gexslt_eiffel_type_uri)
			l_table.force ("yes", a_configuration.Standard_file_collection)
		end

feature -- Status report

	last_error: XM_XPATH_ERROR_VALUE
			-- Last error set by `resolve'

feature -- Element change

	resolve (a_uri: UT_URI; a_context: XM_XPATH_CONTEXT)
			-- Resolve `a_uri' to a sequence of nodes.
		local
			l_directory_name: STRING
			l_directory: KL_DIRECTORY
			l_pathname: detachable KL_PATHNAME
		do
			if a_uri.has_fragment then
				create last_error.make_from_string ("Fragment identifiers are not allowed on file URIs for fn:collection()", Xpath_errors_uri, "FODC0004", Dynamic_error)
			elseif a_uri.has_query then
				create last_error.make_from_string ("Parameters are not allowed on file URIs", Xpath_errors_uri, "FODC0004", Dynamic_error)
			elseif not a_uri.has_path then
				create last_error.make_from_string ("File URI passed to fn:collection() must include a path", Xpath_errors_uri, "FODC0004", Dynamic_error)
			elseif a_uri.has_path_base then
				create last_error.make_from_string ("File URIs for fn:collection() must end in a /", Xpath_errors_uri, "FODC0004", Dynamic_error)
			else
				l_pathname := File_uri.uri_to_pathname(a_uri)
				if l_pathname /= Void then
					l_directory_name := file_system.pathname_to_string (l_pathname)
				end
				if l_directory_name = Void or else not file_system.directory_exists (l_directory_name) then
					create last_error.make_from_string ("Directory specified in file: argument to fn:collection() does not exist", Xpath_errors_uri, "FODC0004", Dynamic_error)
				else
					create l_directory.make (l_directory_name)
					resolve_directory (a_uri, a_uri, a_context, l_directory)
				end
			end
		end

invariant

	scheme_is_file: STRING_.same_string (scheme, "file")

end
