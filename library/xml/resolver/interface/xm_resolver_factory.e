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
	
	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		
feature -- Access

	new_file_resolver: XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme
		local
			a_file: XM_FILE_URI_RESOLVER
			a_simple_uri_resolver: XM_SIMPLE_URI_EXTERNAL_RESOLVER
		do
			create a_simple_uri_resolver.make
			create a_file.make
			a_simple_uri_resolver.register_scheme (a_file)
			Result := a_simple_uri_resolver
		ensure
			result_not_void: Result /= Void
		end
		
	new_file_resolver_with_uri (a_uri: UT_URI): XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme with default URI
		require
			a_uri_not_void: a_uri /= Void
		local
			a_file: XM_FILE_URI_RESOLVER
			a_simple_uri_resolver: XM_SIMPLE_URI_EXTERNAL_RESOLVER
		do
			create a_simple_uri_resolver.make_with_base (a_uri)
			create a_file.make
			a_simple_uri_resolver.register_scheme (a_file)
			Result := a_simple_uri_resolver
		ensure
			result_not_void: Result /= Void
		end
	
	new_file_resolver_current_directory: XM_URI_EXTERNAL_RESOLVER is
			-- Resolver for "file:" scheme with default set
			-- to the current directory
		local
			a_cwd: KI_PATHNAME
		do
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := new_file_resolver_with_uri (File_uri.pathname_to_uri (a_cwd))
		ensure
			result_not_void: Result /= Void
		end

end
