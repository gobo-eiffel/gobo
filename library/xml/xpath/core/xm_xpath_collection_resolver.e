note

	description:

		"Objects that resolve URIs passed to the XPath fn:collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COLLECTION_RESOLVER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

feature -- Status report

	supports_registering_schemes: BOOLEAN
			-- Does `Current' support registering scheme resolvers?
		deferred
		end

	was_error: BOOLEAN
			-- Was last call to `resolve' in error?
		do
			Result := last_error /= Void
		ensure
			error: Result implies last_error /= Void
		end

	last_collection: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Last collection retrieved by `resolve'
		require
			no_error: not was_error
		deferred
		ensure
			iterator_at_start: Result /= Void and then Result.before
		end

	last_error: detachable XM_XPATH_ERROR_VALUE
			-- Last error set by `resolve'
		deferred
		ensure
			limited_error_codes: Result /= Void implies
				(STRING_.same_string (Result.namespace_uri, Xpath_errors_uri) and then
				 (STRING_.same_string (Result.code, "FODC0002") or else (STRING_.same_string (Result.code, "FODC0004"))))
		end

feature -- Element change

	resolve (a_uri: UT_URI; a_context: XM_XPATH_CONTEXT)
			-- Resolve `a_uri' to a sequence of nodes.
		require
			absolute_base_uri_not_void: a_uri /= Void and then a_uri.is_absolute
			dynamic_context_not_void: a_context /= Void
			collection_not_known_yet: attached a_context.available_documents as l_available_documents and then not l_available_documents.is_collection_mapped (a_uri.full_reference)
		deferred
		ensure
			error_or_collection: not was_error implies last_collection /= Void
		end

	register_scheme (a_scheme: XM_XPATH_COLLECTION_SCHEME_RESOLVER)
			-- Register scheme.
		require
			a_scheme_not_void: a_scheme /= Void
			registering_schemes_supported: supports_registering_schemes
		deferred
		end

end
