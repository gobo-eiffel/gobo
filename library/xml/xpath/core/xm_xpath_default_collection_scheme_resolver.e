indexing

	description:

		"Objects that resolve the default collection"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEFAULT_COLLECTION_SCHEME_RESOLVER

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

	make is
			-- Establish invariant.
		do
			scheme := Default_collection_scheme
		end

feature -- Status report
	
	last_error: XM_XPATH_ERROR_VALUE
			-- Last error set by `resolve'

feature -- Element change
	
	resolve (a_uri: UT_URI; a_context: XM_XPATH_CONTEXT) is
			-- Resolve `a_uri' to a sequence of nodes.
		local
			a_directory_name: STRING
			a_directory: KL_DIRECTORY
		do
			a_directory_name := file_system.current_working_directory
			create a_directory.make (a_directory_name)
			resolve_directory (a_uri, current_directory_base, a_context, a_directory)
		end

feature {NONE} -- Implementation

	current_directory_base: UT_URI is
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
		end

invariant

	scheme_is_file: STRING_.same_string (scheme, Default_collection_scheme)

end
