indexing

	description:

		"Objects that use OASIS XML Catalogs to resolve external entities and URI referencxes."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class  XM_CATALOG_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER
		redefine
			resolve_public, resolve_finish
		end

	XM_URI_REFERENCE_RESOLVER

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
		
	XM_SHARED_CATALOG_MANAGER

feature -- Actions

	resolve_uri (a_uri_reference: STRING) is
			-- Resolve `a_uri_reference' on behalf of an application.
		local
			a_resolved_uri: STRING
			a_uri: UT_URI
			a_string: STRING
			a_cwd: STRING
			a_pathname: KI_PATHNAME
			a_drive: STRING
		do
			a_resolved_uri := shared_catalog_manager.resolved_uri_reference (a_uri_reference)
			if STRING_.same_string (a_resolved_uri, a_uri_reference) then

				-- Failure - try making it an absolute URI

				create a_uri.make (a_uri_reference)
				if a_uri.is_relative then
					a_cwd := file_system.current_working_directory
					if file_system /= unix_file_system then
						a_pathname := file_system.string_to_pathname (a_cwd)
						a_cwd := unix_file_system.pathname_to_string (a_pathname)
						a_drive := a_pathname.drive
						if a_drive /= Void then
							a_cwd := STRING_.concat (a_drive, a_cwd)
							a_cwd := STRING_.concat ("/", a_cwd)
						end
					end
					a_string := STRING_.concat ("file://", a_cwd)
					create a_uri.make (STRING_.concat (a_string, "/"))
					create a_uri.make_resolve (a_uri, a_uri_reference)
					a_resolved_uri := shared_catalog_manager.resolved_uri_reference (a_uri.full_reference)
				end
			end
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve (a_resolved_uri)			
		end

	resolve (a_system: STRING) is
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		do
			resolve_public ("", a_system)
		end
		
	resolve_public (a_public: STRING; a_system: STRING) is
			-- Resolve a public/system identified pair to an input stream.
			-- (Default implementation: resolve using system ID only.)
		local
			a_resolved_uri: STRING
			a_uri: UT_URI
			a_string: STRING
			a_cwd: STRING
			a_pathname: KI_PATHNAME
			a_drive: STRING
		do
			a_resolved_uri := shared_catalog_manager.resolved_external_entity (a_public, a_system)
			if STRING_.same_string (a_resolved_uri, a_system) then
				
				-- Failure - try making it an absolute URI

				create a_uri.make (a_system)
				if a_uri.is_relative then
					a_cwd := file_system.current_working_directory
					if file_system /= unix_file_system then
						a_pathname := file_system.string_to_pathname (a_cwd)
						a_cwd := unix_file_system.pathname_to_string (a_pathname)
						a_drive := a_pathname.drive
						if a_drive /= Void then
							a_cwd := STRING_.concat (a_drive, a_cwd)
							a_cwd := STRING_.concat ("/", a_cwd)
						end
					end
					a_string := STRING_.concat ("file://", a_cwd)
					create a_uri.make (STRING_.concat (a_string, "/"))
					create a_uri.make_resolve (a_uri, a_system)
					a_resolved_uri := shared_catalog_manager.resolved_external_entity (a_public, a_uri.full_reference)
				end
			end
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve (a_resolved_uri)	
		end
		
	resolve_finish is
			-- The parser has finished with the last resolved entity.
		do
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve_finish
		end
		
feature -- Result

	last_uri_reference_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from URI reference.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_stream
		end
		
	has_uri_reference_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.has_error
		end
		
	last_uri_reference_error: STRING is
			-- Last error message.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_error
		end
		
	last_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from external entity.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_stream
		end
	
	has_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.has_error
		end
		
	last_error: STRING is
			-- Last error message.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_error
		end

end
	
