indexing

	description:

		"XSLT static contexts for use-when processing"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
		  a_default_namespace: like default_element_namespace; a_backwards: BOOLEAN; a_factory: like node_factory) is
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

	host_language: STRING is "XSLT"
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

	default_function_namespace_uri: STRING is
			-- Namespace for non-prefixed XPath functions
		do
			Result := Xpath_standard_functions_uri
		end

	default_collation_name: STRING
			-- URI naming the default collation

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		local
			l_function_library: XM_XPATH_FUNCTION_LIBRARY
			l_configuration: XM_XSLT_CONFIGURATION
		do
			if cached_function_manager = Void then
				l_configuration ?= configuration
				check
					l_configuration_not_void: l_configuration /= Void
					-- this is XSLT
				end
				create cached_function_manager.make
				create {XM_XSLT_SYSTEM_FUNCTION_LIBRARY} l_function_library.make
				cached_function_manager.add_function_library (l_function_library)
				create {XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY} l_function_library.make
				cached_function_manager.add_function_library (l_function_library)
				l_configuration.extension_functions.do_all (agent add_function_library (cached_function_manager, ?))
			end
			Result := cached_function_manager
		end

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a variable declared in the static context?
		do
			Result := False
		end

	is_data_type_valid (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a data-type in `Current'?
		do
			Result := True
		end

	uri_for_prefix (a_xml_prefix: STRING): STRING is
			-- URI for `a_xml_prefix'
		do
			Result := namespace_resolver.uri_for_defaulted_prefix (a_xml_prefix, False)
		end

	is_prefix_declared (a_xml_prefix: STRING): BOOLEAN is
			-- Is `a_xml_prefix' allocated to a namespace?
		do
			Result := (namespace_resolver.uri_for_defaulted_prefix (a_xml_prefix, False) /= Void)
		end

	is_element_available (a_qname: STRING): BOOLEAN is
			-- Is element name `a_qname' available?
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: STRING
		do
			create l_parser.make (a_qname)
			check
				valid_parse: l_parser.is_valid
				-- from pre-condition
			end
			if l_parser.optional_prefix.is_empty then
				l_uri := namespace_resolver.uri_for_defaulted_prefix (l_parser.optional_prefix, True)
			else
				l_uri := uri_for_prefix (l_parser.optional_prefix)
			end
			Result := node_factory.is_element_available (l_uri, l_parser.local_name)
		end

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory for extension instruction availability

feature -- Creation

	new_compile_time_context: XM_XPATH_CONTEXT is
			-- Restricted dynamic context
		local
			l_configuration: XM_XSLT_CONFIGURATION
		do
			l_configuration ?= configuration
			check
				xslt_configuration: l_configuration /= Void
				-- this is XSLT library
			end
			create {XM_XSLT_EVALUATION_CONTEXT} Result.make_restricted (Current, known_collations, l_configuration)
		end

feature -- Element change

	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		do
			-- pre-condition is never met
		end

feature -- Output

	issue_warning (a_warning: STRING) is
			-- Issue a warning message
		local
			l_configuration: XM_XSLT_CONFIGURATION
		do
			l_configuration ?= configuration
			check
				xslt_configuration: l_configuration /= Void
				-- this is XSLT library
			end
			l_configuration.error_listener.warning (a_warning, Current)
		end

feature {NONE} -- Implementation

	cached_function_manager: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library manager

	add_function_library (a_manager: XM_XPATH_FUNCTION_LIBRARY_MANAGER; a_library: XM_XPATH_FUNCTION_LIBRARY) is
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
