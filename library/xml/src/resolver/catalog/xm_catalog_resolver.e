note

	description:

		"Objects that use OASIS XML Catalogs to resolve external entities and URI referencxes."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class  XM_CATALOG_RESOLVER

inherit

	XM_URI_EXTERNAL_RESOLVER
		redefine
			resolve_public, resolve_finish
		end

	XM_URI_REFERENCE_RESOLVER

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	XM_SHARED_CATALOG_MANAGER

create

	make

feature {NONE} -- Initialization

	make
		-- Nothing to do
		do
		end

feature -- Status report

	supports_registering_schemes: BOOLEAN
			-- Does `Current' support resgitering scheme resolvers?
		do
			Result := True
		end

	is_stack_empty: BOOLEAN
			-- Is URI stack empty?
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.is_stack_empty
		end

	uri: UT_URI
			-- Current URI.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.uri
		end

feature -- Element change

	push_uri (a_uri: UT_URI )
			-- Push `a_uri' onto the stack.
		do
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.push_uri (a_uri)
		end

	clear_uri_stack
			-- Empty the stack.
		do
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.clear_uri_stack
		end

	register_scheme (a_scheme: XM_URI_RESOLVER)
			-- Register scheme.
		do
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.register_scheme (a_scheme)
		end

feature -- Actions

	resolve_uri (a_uri_reference: STRING)
			-- Resolve `a_uri_reference' on behalf of an application.
		local
			a_resolved_uri: STRING
			a_uri: UT_URI
		do
			if shared_catalog_manager.are_catalogs_disabled then
				shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve (a_uri_reference)
				create last_system_id.make (a_uri_reference)
			else
				a_resolved_uri := shared_catalog_manager.resolved_uri_reference (a_uri_reference)
				if STRING_.same_string (a_resolved_uri, a_uri_reference) then

					-- Failure - try making it an absolute URI

					create a_uri.make (a_uri_reference)
					if a_uri.is_relative then
						create a_uri.make_resolve (shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.uri, a_uri_reference)
						a_resolved_uri := shared_catalog_manager.resolved_uri_reference (a_uri.full_reference)
					end
				end
				shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve (a_resolved_uri)
				last_system_id := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.uri
			end
		end

	resolve (a_system: STRING)
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		do
			resolve_public ("", a_system)
		end

	resolve_public (a_public: STRING; a_system: STRING)
			-- Resolve a public/system identified pair to an input stream.
			-- (Default implementation: resolve using system ID only.)
		local
			a_resolved_uri: STRING
			a_uri: UT_URI
		do
			if shared_catalog_manager.are_catalogs_disabled then
				shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve_public (a_public, a_system)
			else
				a_resolved_uri := shared_catalog_manager.resolved_external_entity (a_public, a_system)
				if STRING_.same_string (a_resolved_uri, a_system) then

					-- Failure - try making it an absolute URI

					create a_uri.make (a_system)
					if a_uri.is_relative then
						create a_uri.make_resolve (shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.uri, a_system)
						a_resolved_uri := shared_catalog_manager.resolved_external_entity (a_public, a_uri.full_reference)
					end
				end
				shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve (a_resolved_uri)
			end
		end

	resolve_finish
			-- The parser has finished with the last resolved entity.
		do
			shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.resolve_finish
		end

feature -- Result

	last_uri_reference_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from URI reference.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_stream
		end

	last_system_id: detachable UT_URI
			-- System id used to actually open `last_uri_reference_stream'

	has_uri_reference_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.has_error
		end

	last_uri_reference_error: detachable STRING
			-- Last error message.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_error
		end

	last_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from external entity.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_stream
		end

	has_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.has_error
		end

	last_error: detachable STRING
			-- Last error message.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_error
		end

	has_media_type: BOOLEAN
			-- Is the media type available.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.has_media_type
		end

	last_media_type: detachable UT_MEDIA_TYPE
			-- Media type, if available.
		do
			Result := shared_catalog_manager.bootstrap_resolver.uri_scheme_resolver.last_media_type
		end

end

