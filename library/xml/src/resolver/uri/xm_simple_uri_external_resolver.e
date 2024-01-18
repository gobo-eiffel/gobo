note

	description:

		"URI resolver:handles relative URI resolution, delegates scheme specific URL resolution"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"

class XM_SIMPLE_URI_EXTERNAL_RESOLVER

inherit

	XM_URI_REFERENCE_RESOLVER

	XM_URI_EXTERNAL_RESOLVER
		redefine
			resolve_finish
		end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make,
	make_with_base

feature {NONE} -- Creation

	make
			-- Create `uris'.
			-- (Useful to descendant to establish invariant.)
		do
			create {DS_LINKED_STACK [UT_URI]} uris.make
			create schemes.make_map_default
			schemes.set_key_equality_tester (string_equality_tester)
		end

	make_with_base (a_uri: UT_URI)
			-- Create resolver with specified base URI.
		require
			a_uri_not_void: a_uri /= Void
		do
			make
			uris.put (a_uri)
		end

feature -- Status report

	uris: DS_STACK [UT_URI]
			-- Base URI stack.
			-- (A client or descendant may be entitled to put in and remove
			-- intermediate values directly.)

	supports_registering_schemes: BOOLEAN
			-- Does `Current' support registering scheme resolvers?
		do
			Result := True
		end

	is_stack_empty: BOOLEAN
			-- Is URI stack empty?
		do
			Result := uris.is_empty
		end

	uri: UT_URI
			-- Current URI.
		do
			Result := uris.item
		end

	schemes: DS_HASH_TABLE [XM_URI_RESOLVER, STRING]
			-- Registered scheme resolvers.

feature -- Setting

	register_scheme (a_scheme: XM_URI_RESOLVER)
			-- Register scheme.
		do
			schemes.force (a_scheme, a_scheme.scheme)
		end

feature -- Element change

	push_uri (a_uri: UT_URI )
			-- Push `a_uri' onto the stack.
		do
			uris.put (a_uri)
		end

	clear_uri_stack
			-- Empty the URI stack.
		do
			uris.wipe_out
		end

feature -- Operation(s)

	resolve (a_string_uri: STRING)
			-- Resolve a URI into the context of the base URI.
		local
			a_uri: UT_URI
		do
				-- Set current URI, resolving relative URI if needed.
			if uris.is_empty then
				create a_uri.make (a_string_uri)
			else
				create a_uri.make_resolve (uri, a_string_uri)
			end
			uris.put (a_uri)
				-- Apply current URI.
			resolve_absolute_uri (uri)

				-- Don't stack uri if failed resolution.
			if has_error then
				uris.remove
			end

			debug ("xml_resolver")
				io.put_string ("resolve ")
				io.put_string (a_string_uri)
				if has_error then
					io.put_string (" failed")
				else
					io.put_string (" ok")
				end
				io.put_new_line
			end
		end

	resolve_uri (a_uri_reference: STRING)
			-- Resolve `a_uri_reference' on behalf of an application.
		do
			resolve (a_uri_reference)
		end

	resolve_finish
			-- Get out of current URI scope.
		do
			check balanced: not uris.is_empty end
			uris.remove

			debug ("xml_resolver")
				io.put_string ("resolve_finish ")
				io.put_string (uris.item.full_reference)
				io.put_new_line
			end
		end

feature -- URI

	resolve_absolute_uri (an_uri: UT_URI)
			-- Resolve an absolute URI.
		require
			an_uri_not_void: an_uri /= Void
		local
			l_last_resolver: XM_URI_RESOLVER
		do
			last_resolver := Void
			if attached an_uri.scheme as l_scheme and then schemes.has (l_scheme) then
				l_last_resolver := schemes.item (l_scheme)
				l_last_resolver.resolve (an_uri)
				last_resolver := l_last_resolver
			end
		end

feature {NONE} -- Implementation

	last_resolver: detachable XM_URI_RESOLVER
			-- Last resolver used.

feature -- Result

	last_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from external entity.
		do
			check not_has_error: attached last_resolver as l_last_resolver then
				Result := l_last_resolver.last_stream
			end
		end

	has_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		do
			if attached last_resolver as l_last_resolver then
				Result := l_last_resolver.has_error
			else
				Result := True
			end
		end

	last_error: detachable STRING
			-- Last error message.
		do
			if attached last_resolver as l_last_resolver then
				Result := l_last_resolver.last_error
			else
				Result := Unknown_scheme_error
			end
		end

	last_uri_reference_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from URI reference.
		do
			Result := last_stream
		end

	last_system_id: detachable UT_URI
			-- System id used to actually open `last_uri_reference_stream'
		do
			Result := uri
		end

	has_uri_reference_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		do
			Result := has_error
		end

	last_uri_reference_error: detachable STRING
			-- Last error message.
		do
			Result := last_error
		end

	has_media_type: BOOLEAN
			-- Is the media type available.
		do
			Result := attached last_resolver as l_last_resolver and then l_last_resolver.has_media_type
		end

	last_media_type: detachable UT_MEDIA_TYPE
			-- Media type, if available.
		do
			check has_media_type: attached last_resolver as l_last_resolver and then attached l_last_resolver.last_media_type as l_last_media_type then
				Result := l_last_media_type
			end
		end

feature {NONE} -- Errors

	Unknown_scheme_error: STRING = "No handler for URL scheme"

invariant

	uris_not_void: uris /= Void

end
