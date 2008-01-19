indexing

	description:

		"Objects that resolve URIs to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFAULT_OUTPUT_URI_RESOLVER

inherit

	XM_XSLT_OUTPUT_URI_RESOLVER

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_security_manager: like security_manager) is
			-- Establish invariant.
		require
			security_manager_not_void: a_security_manager /= Void
		local
			a_stdout_resolver: XM_XSLT_OUTPUT_URI_STDOUT_SCHEME_RESOLVER
			a_file_resolver: XM_XSLT_OUTPUT_URI_FILE_SCHEME_RESOLVER
			a_string_resolver: XM_XSLT_OUTPUT_URI_STRING_SCHEME_RESOLVER
		do
			security_manager := a_security_manager
			create scheme_resolvers.make_with_equality_testers (2, Void, string_equality_tester)
			create a_stdout_resolver.make
			register_scheme (a_stdout_resolver, "stdout")
			create a_file_resolver.make
			register_scheme (a_file_resolver, "file")
			create a_string_resolver.make
			register_scheme (a_string_resolver, "string")			
			create output_destinations.make_with_equality_testers (10, Void, string_equality_tester)
		ensure
			security_manager_set: security_manager = a_security_manager
		end

feature -- Status report

	is_scheme_registered (a_scheme: STRING): BOOLEAN is
			-- Is a resolver registered for `a_scheme'?
		require
			scheme_not_void: a_scheme /= Void and then a_scheme.count > 0
		do
			Result := scheme_resolvers.has (a_scheme)
		end

feature -- Action

	resolve (a_uri: UT_URI) is
			-- Resolve `a_uri' relative to `a_base_uri'.
		local
			l_scheme, l_uri_to_use: STRING
			l_resolver: XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER
		do
			last_result := Void
			error_message := Void
			l_uri_to_use := a_uri.full_reference
			if security_manager.is_output_uri_permitted (a_uri) then
				l_scheme := a_uri.scheme
				if scheme_resolvers.has (l_scheme) then
					l_resolver := scheme_resolvers.item (l_scheme)
					l_resolver.set_http_method (http_method)
					l_resolver.resolve (a_uri)
					last_result := l_resolver.last_result
					error_message := l_resolver.error_message
					if last_result /= Void then
						output_destinations.put (last_result, l_uri_to_use)
					end
				else
					error_message := STRING_.concat ("Writing output to URI scheme ", l_scheme)
					error_message := STRING_.appended_string (error_message, " is not supported.")
				end
			else
				error_message := STRING_.concat ("Security manager refused permission to write to ", l_uri_to_use)
			end
		end

	close (a_result: XM_XSLT_TRANSFORMATION_RESULT; some_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Close output destination.
		do
			if a_result.is_stream then
				a_result.close (some_properties)
			end
		end

	register_scheme (a_resolver: XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER; a_scheme: STRING) is
			-- Register `a_resolver' as the handler for `a_scheme'.
		require
			scheme_not_void: a_scheme /= Void and then a_scheme.count > 0
			scheme_not_already_registered: not is_scheme_registered (a_scheme)
			resolver_not_void: a_resolver /= Void
		do
			scheme_resolvers.force (a_resolver, a_scheme)
		ensure
			scheme_registered: is_scheme_registered (a_scheme)
			correct_resolver: scheme_resolvers.item (a_scheme) = a_resolver
		end
		
feature -- Result

	last_result: XM_XSLT_TRANSFORMATION_RESULT
			-- Result object from last call to `resolve'

feature {NONE} -- Implementation

	scheme_resolvers: DS_HASH_TABLE [XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER, STRING]
			-- Map of URI schemes to resolvers

invariant

	scheme_resolvers /= Void

end
	
