indexing
	
	description:

		"External URI resolver interface, actual resolving left to descendant"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_URI_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER
		redefine
			resolve_finish
		end
	
feature -- Status report

	uris: DS_STACK [UT_URI]
			-- Base URI stack.
			-- (A client or descendant may be entitled to put in and remove 
			-- intermediate values directly.)
	
	make_uris is
			-- Create `uris'.
			-- (Useful to descendant to establish invariant.)
		do
			create {DS_LINKED_STACK [UT_URI]} uris.make	
		end

feature -- Base

	uri: UT_URI is
			-- Current URI.
		require
			has_stack: uris.count > 0
		do
			Result := uris.item
		ensure
			result_not_void: Result /= Void
			
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
		deferred
		end
		
invariant

	uris_not_void: uris /= Void
	
end
