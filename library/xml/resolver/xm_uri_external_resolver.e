indexing
	
	description:

		"URI resolver: handles relative URI resolution, delegates scheme specific URL resolution"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_URI_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER
		redefine
			resolve_finish
		end

creation

	make,
	make_with_base
	
feature {NONE} -- Creation

	make is
			-- Create `uris'.
			-- (Useful to descendant to establish invariant.)
		do
			create {DS_LINKED_STACK [UT_URI]} uris.make	
			create schemes.make_default
		end
		
	make_with_base (a_uri: XM_URI) is
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
	
	uri: UT_URI is
			-- Current URI.
		require
			has_stack: not uris.is_empty
		do
			Result := uris.item
		ensure
			result_not_void: Result /= Void
			
		end

	schemes: DS_HASH_TABLE [XM_URI_RESOLVER, STRING]
			-- Registered scheme resolvers.
			
feature -- Setting

	register_scheme (a_scheme: XM_URI_RESOLVER) is
			-- Register scheme.
		require
			a_scheme_not_void: a_scheme /= Void
		do
			schemes.force (a_scheme, a_scheme.scheme)
		end
					
feature -- Operation(s)

	resolve (a_string_uri: STRING) is
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
			resolve_uri (uri)
		end
	
	resolve_finish is
			-- Get out of current URI scope.
		do
			check balanced: not uris.is_empty end
			uris.remove
		end
		
feature -- URI

	resolve_uri (an_uri: UT_URI) is
			-- Resolve an absolute URI.
		require
			an_uri_not_void: an_uri /= Void
		do
			last_resolver := Void
			if schemes.has (an_uri.scheme) then
				last_resolver := schemes.item (an_uri.scheme)
				last_resolver.resolve (an_uri)
			end
		end

feature {NONE} -- Implementation

	last_resolver: XM_URI_RESOLVER
			-- Last resolver used.

feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from external entity.
		do
			Result := last_resolver.last_stream
		end

	has_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			if last_resolver /= Void then
				Result := last_resolver.has_error
			else
				Result := True
			end
		end
	
	last_error: STRING is
			-- Last error message.
		do
			if last_resolver /= Void then
				Result := last_resolver.last_error
			else
				Result := Unknown_scheme_error
			end
		end
		
feature {NONE} -- Errors

	Unknown_scheme_error: STRING is "No handler for URL scheme"

invariant

	uris_not_void: uris /= Void
	
end
