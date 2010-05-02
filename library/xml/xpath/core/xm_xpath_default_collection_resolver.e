note

	description:

		"Objects that resolve URIs passed to the XPath fn:collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEFAULT_COLLECTION_RESOLVER

inherit

	XM_XPATH_COLLECTION_RESOLVER

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XPATH_CONFIGURATION)
			-- Establish invariant.
		require
			a_configuration_not_void: a_configuration /= Void
		local
			a_file_resolver: XM_XPATH_COLLECTION_FILE_SCHEME_RESOLVER
			a_default_resolver: XM_XPATH_DEFAULT_COLLECTION_SCHEME_RESOLVER
		do
			create schemes.make_with_equality_testers (5, Void, string_equality_tester)
			create a_default_resolver.make
			register_scheme (a_default_resolver)
			create a_file_resolver.make (a_configuration)
			register_scheme (a_file_resolver)
		end

feature -- Status report

	supports_registering_schemes: BOOLEAN
			-- Does `Current' support registering scheme resolvers?
		do
			Result := True
		end

	last_collection: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Last collection retrieved by `resolve'

	last_error: XM_XPATH_ERROR_VALUE
			-- Last error set by `resolve'

feature -- Element change

	resolve (a_uri: UT_URI; a_context: XM_XPATH_CONTEXT)
			-- Resolve `a_uri' to a sequence of nodes.
		local
			a_resolver: XM_XPATH_COLLECTION_SCHEME_RESOLVER
		do
			if a_context.available_documents.is_collection_mapped (a_uri.full_reference) then
				last_collection := a_context.available_documents.collection (a_uri.full_reference)
			elseif schemes.has (a_uri.scheme) then
				a_resolver := schemes.item (a_uri.scheme)
				a_resolver.resolve (a_uri, a_context)
				if a_resolver.was_error then
					last_error := a_resolver.last_error
				else
					last_collection := a_resolver.last_collection
				end
			else
				create last_error.make_from_string ("Unsupported collection URI scheme", Xpath_errors_uri, "FODC0004", Dynamic_error)
			end
		end

	register_scheme (a_scheme: XM_XPATH_COLLECTION_SCHEME_RESOLVER)
			-- Register scheme.
		do
			schemes.force (a_scheme, a_scheme.scheme)
		end

feature {NONE} -- Implementation

	schemes: DS_HASH_TABLE [XM_XPATH_COLLECTION_SCHEME_RESOLVER, STRING]
			-- Registered scheme resolvers.

invariant

	schemes_exist: schemes /= Void

end
