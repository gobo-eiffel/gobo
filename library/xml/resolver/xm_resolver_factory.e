indexing

	description:
	
		"Convenience class to setup common versions of resolvers"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
		
class XM_RESOLVER_FACTORY

inherit
	
	ANY
	
	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		
feature -- Access

	new_file_resolver: XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme
		local
			a_file: XM_FILE_URI_RESOLVER
		do
			create a_file.make
			Result.register_scheme (a_file)
		ensure
			result_not_void: Result /= Void
		end
		
	new_file_resolver_with_uri (a_uri: UT_URI): XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme with default URI
		require
			a_uri_not_void: a_uri /= Void
		local
			a_file: XM_FILE_URI_RESOLVER
		do
			create Result.make_with_base (a_uri)
			create a_file.make
			Result.register_scheme (a_file)
		ensure
			result_not_void: Result /= Void
		end
	
	new_file_resolver_current_directory: XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme with default set
			-- to the current directory
		local
			a_string: STRING
			a_uri: UT_URI
		do
			a_string := STRING_.concat ("file://", file_system.current_working_directory)
			create a_uri.make (STRING_.concat (a_string, "/"))
			Result := new_file_resolver_with_uri (a_uri)
		ensure
			result_not_void: Result /= Void
		end

end
