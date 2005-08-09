indexing

	description:

		"XSLT expression contexts"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_style_element: XM_XSLT_STYLE_ELEMENT; a_configuration: XM_XPATH_CONFIGURATION) is
			-- Establish invariant.
		require
			style_element_not_void:	a_style_element /= Void
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			style_element := a_style_element
			known_collations := a_style_element.principal_stylesheet.collation_map
			default_collation_name := a_style_element.default_collation_name
			create base_uri.make (style_element.base_uri)
		ensure
			configuration_set: configuration = a_configuration
			style_element_set: style_element = a_style_element
			not_restricted: not is_restricted
		end

	make_restricted (a_style_element: XM_XSLT_STYLE_ELEMENT; a_configuration: XM_XPATH_CONFIGURATION) is
			-- Create a restricted context for [xsl:]use-when processing..
		require
			style_element_not_void:	a_style_element /= Void
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			style_element := a_style_element
			known_collations := a_style_element.principal_stylesheet.collation_map
			default_collation_name := a_style_element.default_collation_name
			create base_uri.make (style_element.base_uri)
			is_restricted := True
		ensure
			configuration_set: configuration = a_configuration
			style_element_set: style_element = a_style_element
			restricted: is_restricted
		end

feature -- Access

	style_element: XM_XSLT_STYLE_ELEMENT
			-- Style element that provides the context

	system_id: STRING is
		do
			Result := style_element.system_id
		end

	line_number: INTEGER is
			-- Line number
		do
			Result := style_element.line_number
		end

	style_sheet: XM_XSLT_STYLESHEET is
			-- Principal style sheet
		do
			Result := style_element.principal_stylesheet
		ensure
			style_sheet_not_void: Result /= Void
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		do
			Result := style_sheet.function_library
		end

	host_language: STRING is
			-- Name of host language
		do
			Result := "XSLT"
		end

	base_uri: UT_URI
			-- Base URI
	
	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		do
			Result := style_element.default_xpath_namespace_code
		end

	
	default_function_namespace_uri: STRING is
			-- Namespace for non-prefixed XPath functions
		do
			Result := Xpath_standard_functions_uri
		end
	
	default_collation_name: STRING
			-- URI naming the default collation

	uri_for_prefix (an_xml_prefix: STRING): STRING is
			-- URI for a namespace prefix
		do
			Result := style_element.uri_for_prefix (an_xml_prefix, False)
		end

	is_backwards_compatible_mode: BOOLEAN is
			-- Is Backwards Compatible Mode used?
		do
			if not is_restricted then
				Result := style_element.is_backwards_compatible_processing_enabled
			end
		end
		
	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER is
			-- Fingerprint for `a_qname', using this as the context for namespace resolution
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_xml_prefix, a_uri, a_local_name: STRING
		do
			create a_string_splitter.make
			a_string_splitter.set_separators (":")
			qname_parts := a_string_splitter.split (a_qname)
			if qname_parts.count = 1 then
				an_xml_prefix := ""
				a_local_name := qname_parts.item (1)
				if use_default_namespace then
					a_uri := uri_for_prefix (an_xml_prefix)
				else
					a_uri := ""
				end
			else
				a_local_name := qname_parts.item (2)
				an_xml_prefix := qname_parts.item (1)
				a_uri := uri_for_prefix (an_xml_prefix)
			end
			Result := shared_name_pool.fingerprint (a_uri, a_local_name)
		end

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT is
			-- Namespace context
		do
			Result := style_element.namespace_context
		end

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER is
			-- Resolver for lexical QNames
		do
			Result := namespace_context
		end

feature -- Status report

	is_prefix_declared (an_xml_prefix: STRING): BOOLEAN is
			-- Is `an_xml_prefix' allocated to a namespace?
		do
			Result := style_element.uri_code_for_prefix (an_xml_prefix) /=  -1
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a variable declared in the static context?
		do
			if not style_element.is_excluded then
				Result := style_element.is_variable_declared (a_fingerprint)
			end
		end
	
	is_data_type_valid (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a data-type in `Current'?
		do
			Result := False

			-- Customized host languages must redefine this routine.
			-- It is not called for host languages supported directly
			--  by this library.
			
		end

feature -- Element change

	set_last_bound_variable (a_variable: XM_XSLT_VARIABLE_DECLARATION) is
			-- Set `last_bound_variable'.
		require
			variable_not_void: a_variable /= Void
		do
			internal_last_bound_variable := a_variable
		ensure
			last_bound_variable_set: last_bound_variable = a_variable
		end

	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		do
			style_element.bind_variable (a_fingerprint)
		end

feature -- Output

	issue_warning (a_warning: STRING) is
			-- Issue a warning message
		do
			style_element.report_compile_warning (a_warning)
		end

feature {NONE} -- Implementation

	internal_default_function_namespace_uri: STRING
			-- Namespace for non-prefixed XPath functions

	code_point_collator: ST_COLLATOR is
			-- Unicode code-point collator
		once
			create Result
		end

	displayed_argument_count (a_count: INTEGER): STRING is
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

invariant

	style_element_not_void:	style_element /= Void

end

