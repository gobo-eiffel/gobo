﻿note

	description:

		"XSLT expression contexts"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_EXPRESSION_CONTEXT

inherit

	XM_XPATH_STATIC_CONTEXT
		export {XM_XSLT_STYLE_ELEMENT}
			internal_last_bound_variable
		end

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_TYPE

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_ERROR_TYPES

	XM_XPATH_DEBUGGING_ROUTINES

create

	make, make_restricted

feature {NONE} -- Initialization

	make (a_style_element: XM_XSLT_STYLE_ELEMENT; a_configuration: XM_XSLT_CONFIGURATION)
			-- Establish invariant.
		require
			style_element_not_void:	a_style_element /= Void
			configuration_not_void: a_configuration /= Void
			known_collation: attached a_style_element.principal_stylesheet as l_principal_stylesheet and then l_principal_stylesheet.collation_map.has (a_style_element.default_collation_name)
		do
			configuration := a_configuration
			style_element := a_style_element
			check attached a_style_element.principal_stylesheet as l_principal_stylesheet then
				known_collations := l_principal_stylesheet.collation_map
			end
			default_collation_name := a_style_element.default_collation_name
			check attached style_element.base_uri as l_base_uri then
				create base_uri.make (l_base_uri)
			end
		ensure
			configuration_set: configuration = a_configuration
			style_element_set: style_element = a_style_element
			not_restricted: not is_restricted
		end

	make_restricted (a_style_element: XM_XSLT_STYLE_ELEMENT; a_configuration: XM_XSLT_CONFIGURATION)
			-- Create a restricted context for [xsl:]use-when processing..
		require
			style_element_not_void:	a_style_element /= Void
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			style_element := a_style_element
			create known_collations.make_with_equality_testers (1, Void, string_equality_tester)
			default_collation_name := Unicode_codepoint_collation_uri
			declare_collation (create {ST_COLLATOR}, default_collation_name)
			check attached style_element.base_uri as l_base_uri then
				create base_uri.make (l_base_uri)
			end
			is_restricted := True
		ensure
			configuration_set: configuration = a_configuration
			style_element_set: style_element = a_style_element
			restricted: is_restricted
		end

feature -- Access

	style_element: XM_XSLT_STYLE_ELEMENT
			-- Style element that provides the context

	system_id: STRING
		do
			Result := style_element.system_id
		end

	line_number: INTEGER
			-- Line number
		do
			Result := style_element.line_number
		end

	style_sheet: XM_XSLT_STYLESHEET
			-- Principal style sheet
		do
			check attached style_element.principal_stylesheet as l_principal_stylesheet then
				Result := l_principal_stylesheet
			end
		ensure
			style_sheet_not_void: Result /= Void
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions
		local
			l_function_library: XM_XPATH_FUNCTION_LIBRARY
			l_cached_function_manager: like cached_function_manager
		do
			if is_restricted then
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
			else
				Result := style_sheet.function_library
			end
		end

	host_language: STRING
			-- Name of host language
		do
			Result := "XSLT"
		end

	base_uri: UT_URI
			-- Base URI

	default_element_namespace: STRING
			-- Default XPath namespace uri
		do
			Result := style_element.default_xpath_namespace
		end


	default_function_namespace_uri: STRING
			-- Namespace for non-prefixed XPath functions
		do
			Result := Xpath_standard_functions_uri
		end

	default_collation_name: STRING
			-- URI naming the default collation

	uri_for_prefix (an_xml_prefix: STRING): STRING
			-- URI for a namespace prefix
		do
			check attached style_element.uri_for_prefix (an_xml_prefix, False) as l_uri_for_prefix then
				Result := l_uri_for_prefix
			end
		end

	is_backwards_compatible_mode: BOOLEAN
			-- Is Backwards Compatible Mode used?
		do
			if not is_restricted then
				Result := style_element.is_backwards_compatible_processing_enabled
			end
		end

	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER
			-- Fingerprint for `a_qname', using this as the context for namespace resolution
		local
			a_parser: XM_XPATH_QNAME_PARSER
			a_uri: STRING
		do
			create a_parser.make (a_qname)
			if not a_parser.is_valid then
				Result := -1
			else
				check
					invariant_of_XM_XPATH_QNAME_PARSER_prefix_not_void: attached a_parser.optional_prefix as l_optional_prefix
					invariant_of_XM_XPATH_QNAME_PARSER_local_name_not_void: attached a_parser.local_name as l_local_name
				then
					if not a_parser.is_prefix_present then
						if use_default_namespace then
							check attached style_element.uri_for_prefix (l_optional_prefix, True) as l_uri_for_prefix then
								a_uri := l_uri_for_prefix
							end
						else
							a_uri := ""
						end
					elseif is_prefix_declared (l_optional_prefix) then
						a_uri := uri_for_prefix (l_optional_prefix)
					else
						Result := -1
						a_uri := ""
					end
					if Result /= -1 then
						Result := shared_name_pool.fingerprint (a_uri, l_local_name)
					end
				end
			end
		end

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Namespace context
		do
			Result := style_element.namespace_context
		end

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Resolver for lexical QNames
		do
			Result := namespace_context
		end

feature -- Status report

	is_prefix_declared (an_xml_prefix: STRING): BOOLEAN
			-- Is `an_xml_prefix' allocated to a namespace?
		do
			Result := style_element.uri_code_for_prefix (an_xml_prefix) /=  -1
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a variable declared in the static context?
		do
			Result := style_element.is_variable_declared (a_fingerprint)
		end

	is_data_type_valid (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a data-type in `Current'?
		do
			Result := False

			-- Customized host languages must redefine this routine.
			-- It is not called for host languages supported directly
			--  by this library.

		end

	is_element_available (a_qname: STRING): BOOLEAN
			-- Is element name `a_qname' available?
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: detachable STRING
			l_node_factory: XM_XSLT_NODE_FACTORY
			l_stylesheet_compiler: detachable XM_XSLT_STYLESHEET_COMPILER
		do
			create l_parser.make (a_qname)
			check
				valid_parse: l_parser.is_valid
				-- from pre-condition
				invariant_of_XM_XPATH_QNAME_PARSER_prefix_not_void: attached l_parser.optional_prefix as l_optional_prefix
				invariant_of_XM_XPATH_QNAME_PARSER_local_name_not_void: attached l_parser.local_name as l_local_name
			then
				if l_optional_prefix.is_empty then
					l_uri := style_element.uri_for_prefix (l_optional_prefix, True)
				else
					l_uri := uri_for_prefix (l_optional_prefix)
				end
				l_stylesheet_compiler := style_element.stylesheet_compiler
				if l_stylesheet_compiler /= Void then
					l_node_factory := l_stylesheet_compiler.node_factory
				else
					check attached {XM_XSLT_CONFIGURATION} configuration as l_configuration then
						create l_node_factory.make (l_configuration.error_listener, l_configuration)
					end
				end
				Result := l_node_factory.is_element_available (l_uri, l_local_name)
			end
		end

feature -- Creation

	new_compile_time_context: XM_XPATH_CONTEXT
			-- Restricted dynamic context
		do
			check
				attached {XM_XSLT_CONFIGURATION} configuration as l_configuration
				-- this is XSLT
			then
				create {XM_XSLT_EVALUATION_CONTEXT} Result.make_restricted (Current, known_collations, l_configuration)
			end
		end


feature -- Element change

	set_last_bound_variable (a_variable: XM_XSLT_VARIABLE_DECLARATION)
			-- Set `last_bound_variable'.
		require
			variable_not_void: a_variable /= Void
		do
			internal_last_bound_variable := a_variable
		ensure
			last_bound_variable_set: last_bound_variable = a_variable
		end

	bind_variable (a_fingerprint: INTEGER)
			-- Bind variable to it's declaration.
		do
			style_element.bind_variable (a_fingerprint)
		end

feature -- Output

	issue_warning (a_warning: STRING)
			-- Issue a warning message
		do
			style_element.report_compile_warning (a_warning)
		end

feature {NONE} -- Implementation

	internal_default_function_namespace_uri: detachable STRING
			-- Namespace for non-prefixed XPath functions

	cached_function_manager: detachable XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library manager for use-when processing

	code_point_collator: ST_COLLATOR
			-- Unicode code-point collator
		once
			create Result
		end

	displayed_argument_count (a_count: INTEGER): STRING
			-- Number of arguments, as error text
		require
			positive_count: a_count >= 0
		do
			inspect
				a_count
			when 0 then
				Result := "no arguments"
			when 1 then
				Result := "one argument"
			else
				Result := a_count.out + " arguments"
			end
		ensure
			displayed_argument_count_not_void: Result /= Void
		end

	add_function_library (a_manager: XM_XPATH_FUNCTION_LIBRARY_MANAGER; a_library: XM_XPATH_FUNCTION_LIBRARY)
			-- Add `a_library' to `a_manager'.
		require
			a_manager_not_void: a_manager /= Void
			a_library_not_void: a_library /= Void
		do
			a_manager.add_function_library (a_library)
		end

invariant

	style_element_not_void:	style_element /= Void

end

