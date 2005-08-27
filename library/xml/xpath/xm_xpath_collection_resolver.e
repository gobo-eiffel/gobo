indexing

	description:

		"Objects that resolve URIs passed to the XPath fn:collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COLLECTION_RESOLVER

inherit

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

feature -- Status report

	supports_registering_schemes: BOOLEAN is
			-- Does `Current' support registering scheme resolvers?
		deferred
		end
	
	was_error: BOOLEAN is
			-- Was last call to `resolve' in error?
		do
			Result := last_error /= Void
		ensure
			error: Result implies last_error /= Void
		end
	
	last_collection: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Last collection retrieved by `resolve'
		require
			no_error: not was_error
		deferred
		ensure
			collection_exists: Result /= Void and then Result.before
		end

	last_error: XM_XPATH_ERROR_VALUE is
			-- Last error set by `resolve'
		deferred
		ensure
			limited_error_codes: Result /= Void implies
				(STRING_.same_string (Result.namespace_uri, Xpath_errors_uri) and then
				 (STRING_.same_string (Result.code, "FODC0002") or else (STRING_.same_string (Result.code, "FODC0004"))))
		end

feature -- Element change
	
	resolve (a_uri: UT_URI; a_context: XM_XPATH_CONTEXT) is
			-- Resolve `a_uri' to a sequence of nodes.
		require
			absolute_uri_exists: a_uri /= Void and then a_uri.is_absolute
			dynamic_context_exists: a_context /= Void
			collection_not_known_yet: not a_context.available_documents.is_collection_mapped (a_uri.full_reference)
		deferred
		ensure
			error_or_collection: not was_error implies last_collection /= Void
		end

	register_scheme (a_scheme: XM_XPATH_COLLECTION_SCHEME_RESOLVER) is
			-- Register scheme.
		require
			a_scheme_not_void: a_scheme /= Void
			registering_schemes_supported: supports_registering_schemes
		deferred
		end

end
