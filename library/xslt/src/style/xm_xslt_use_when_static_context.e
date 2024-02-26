note

	description:

		"XSLT static contexts for use-when processing"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_USE_WHEN_STATIC_CONTEXT

inherit

	XM_XPATH_STATIC_CONTEXT

	XM_XPATH_LOCATOR

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION; a_namespace_context: XM_XPATH_NAMESPACE_RESOLVER;
		a_base_uri: like base_uri; a_system_id: like system_id; a_line_number: like line_number;
		a_default_namespace: like default_element_namespace; a_backwards: BOOLEAN; a_factory: like node_factory)
			-- Initialize `Current'.
		require
			a_configuration_not_void: a_configuration /= Void
			a_namespace_context_not_void: a_namespace_context /= Void
			a_base_uri_not_void: a_base_uri /= Void
			a_base_uri_absolute: a_base_uri.is_absolute
			a_system_id_not_void: a_system_id /= Void
			a_factory_not_void: a_factory /= Void
		do
			is_restricted := True
			node_factory := a_factory
			configuration := a_configuration
			namespace_resolver := a_namespace_context
			base_uri := a_base_uri
			system_id := a_system_id
			line_number := a_line_number
			is_backwards_compatible_mode := a_backwards
			default_element_namespace := a_default_namespace
			default_collation_name := Unicode_codepoint_collation_uri
			create known_collations.make_with_equality_testers (1, Void, string_equality_tester)
			declare_collation (create {ST_COLLATOR}, default_collation_name)
		ensure
			node_factory_set: node_factory = a_factory
			configuration_set: configuration = a_configuration
			namespace_resolver_set: namespace_resolver = a_namespace_context
			base_uri_set: a_base_uri = base_uri
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			is_backwards_compatible_mode_set: is_backwards_compatible_mode = a_backwards
			default_element_namespace_set: default_element_namespace = a_default_namespace
		end

feature -- Access

	host_language: STRING = "XSLT"
			-- Name of host language

	base_uri: UT_URI
			-- Base URI

	system_id: STRING
			-- SYSTEM-id;
			-- This may differ from `base_uri', as it reports
			--  the system-id of the containing entity, which
			--  tends to be more useful for diagnostics.

	line_number: INTEGER
			-- Line number

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Resolver for lexical QNames

	default_element_namespace: STRING
			-- Default XPath namespace uri

	default_function_namespace_uri: STRING
			-- Namespace for non-prefixed XPath functions
		do
			Result := Xpath_standard_functions_uri
		end

	default_collation_name: STRING
			-- URI naming the default collation

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions
		local
			l_function_library: XM_XPATH_FUNCTION_LIBRARY
			l_cached_function_manager: like cached_function_manager
		do
			l_cached_function_manager := cached_function_manager
			if l_cached_function_manager = Void then
				check
					l_configuration_not_void: attached {XM_XSLT_CONFIGURATION} configuration as l_configuration
					-- this is XSLT
				then
					create l_cached_function_manager.make
					cached_function_manager := l_cached_function_manager
					create {XM_XSLT_SYSTEM_FUNCTION_LIBRARY} l_function_library.make
					l_cached_function_manager.add_function_library (l_function_library)
					create {XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY} l_function_library.make
					l_cached_function_manager.add_function_library (l_function_library)
					l_configuration.extension_functions.do_all (agent add_function_library (l_cached_function_manager, ?))
				end
			end
			Result := l_cached_function_manager
		end

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a variable declared in the static context?
		do
			Result := False
		end

	is_data_type_valid (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a data-type in `Current'?
		do
			Result := True
		end

	uri_for_prefix (a_xml_prefix: STRING): STRING
			-- URI for `a_xml_prefix'
		do
			check precondition_prefix_declared: attached namespace_resolver.uri_for_defaulted_prefix (a_xml_prefix, False) as l_uri_for_defaulted_prefix then
				Result := l_uri_for_defaulted_prefix
			end
		end

	is_prefix_declared (a_xml_prefix: STRING): BOOLEAN
			-- Is `a_xml_prefix' allocated to a namespace?
		do
			Result := (namespace_resolver.uri_for_defaulted_prefix (a_xml_prefix, False) /= Void)
		end

	is_element_available (a_qname: STRING): BOOLEAN
			-- Is element name `a_qname' available?
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: detachable STRING
		do
			create l_parser.make (a_qname)
			check
				valid_parse: l_parser.is_valid
				-- from pre-condition
			end
			check attached l_parser.optional_prefix as l_optional_prefix then
				if l_optional_prefix.is_empty then
					l_uri := namespace_resolver.uri_for_defaulted_prefix (l_optional_prefix, True)
				else
					l_uri := uri_for_prefix (l_optional_prefix)
				end
				check attached l_parser.local_name as l_local_name then
					Result := node_factory.is_element_available (l_uri, l_local_name)
				end
			end
		end

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory for extension instruction availability

feature -- Creation

	new_compile_time_context: XM_XPATH_CONTEXT
			-- Restricted dynamic context
		do
			check
				xslt_configuration: attached {XM_XSLT_CONFIGURATION} configuration as l_configuration
				-- this is XSLT library
			then
				create {XM_XSLT_EVALUATION_CONTEXT} Result.make_restricted (Current, known_collations, l_configuration)
			end
		end

feature -- Element change

	bind_variable (a_fingerprint: INTEGER)
			-- Bind variable to it's declaration.
		do
			check False then end
			-- pre-condition is never met
		end

feature -- Output

	issue_warning (a_warning: STRING)
			-- Issue a warning message
		do
			check
					-- this is XSLT library
				xslt_configuration: attached {XM_XSLT_CONFIGURATION} configuration as l_configuration
			then
				l_configuration.error_listener.warning (a_warning, Current)
			end
		end

feature {NONE} -- Implementation

	cached_function_manager: detachable XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library manager

	add_function_library (a_manager: XM_XPATH_FUNCTION_LIBRARY_MANAGER; a_library: XM_XPATH_FUNCTION_LIBRARY)
			-- Add `a_library' to `a_manager'.
		require
			a_manager_not_void: a_manager /= Void
			a_library_not_void: a_library /= Void
		do
			a_manager.add_function_library (a_library)
		end

invariant

	namespace_resolver_not_void: namespace_resolver /= Void
	node_factory_not_void: node_factory /= Void

end
