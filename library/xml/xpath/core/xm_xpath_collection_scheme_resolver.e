note

	description:

		"Objects that resolve URIs of a particular scheme, when XPath fn:collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COLLECTION_SCHEME_RESOLVER

inherit

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

feature -- Access

	scheme: STRING
			-- URI scheme supported by `Current'

feature -- Status report

	was_error: BOOLEAN
			-- Was last call to `resolve' in error?
		do
			Result := last_error /= Void
		ensure
			error: Result implies last_error /= Void
		end

	last_collection: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Last collection retrieved by `resolve'
		require
			no_error: not was_error
		deferred
		ensure
			collection_at_start: Result /= Void and then Result.before
		end

	last_error: XM_XPATH_ERROR_VALUE
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
			absolute_uri_not_void: a_uri /= Void and then a_uri.is_absolute
			dynamic_context_not_void: a_context /= Void
			correct_scheme: a_uri.has_valid_scheme and then STRING_.same_string (scheme, a_uri.scheme)
		deferred
		ensure
			error_or_collection: not was_error implies last_collection /= Void
		end

invariant

	scheme_not_empty: scheme /= Void and then not scheme.is_empty

end
