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

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_style_element: XM_XSLT_STYLE_ELEMENT) is
			-- Establish invariant.
		require
			style_element_not_void:	a_style_element /= Void
		do
			style_element := a_style_element
			default_collation_name := "http://www.w3.org/2003/11/xpath-functions/collation/codepoint"
		ensure
			style_element_set: style_element = a_style_element
		end

feature -- Access

	style_element: XM_XSLT_STYLE_ELEMENT
			-- Style element that provides the context

	style_sheet: XM_XSLT_STYLESHEET is
			-- Principal style sheet
		do
			Result := style_element.principal_stylesheet
		ensure
			style_sheet_not_void: Result /= Void
		end

	host_language: STRING is
			-- Name of host language
		do
			Result := "XSLT"
		end
	
	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		do
			Result := style_element.default_xpath_namespace_code
		end

	default_collation_name: STRING
			-- URI naming the default collation

	collator (a_collation_name: STRING): ST_COLLATOR is
			-- Collation named `a_collation_name'
		do
			-- TODO - need a proper implementation
			if STRING_.same_string (a_collation_name, default_collation_name) then
				Result := code_point_collator
			end
		end

	uri_for_prefix (an_xml_prefix: STRING): STRING is
			-- URI for a namespace prefix
		do
			Result := style_element.uri_for_prefix (an_xml_prefix, False)
		end

	is_backwards_compatible_mode: BOOLEAN
			-- Is Backwards Compatible Mode used?

	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER is
			-- Fingerprint for `a_qname', using this as the context for namespace resolution
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_xml_prefix, a_uri, a_local_name: STRING
			a_uri_code: INTEGER			
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
		ensure
			nearly_positive_result: Result > -2
		end

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT is
			-- Namespace context
		do
			Result := style_element.namespace_context
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
			Result := style_element.is_variable_declared (a_fingerprint)
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

	bind_function (a_qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
			-- Following XSLT rules, this routine doesn't throw a static error
			--  if no function with the given name exists, unless the name is unprefixed.
			-- Rather, it returns an error expression that will fail at run-time if
			--  the function is actually called.
		local
			an_xml_prefix, a_uri, a_local_name: STRING
			a_splitter: ST_SPLITTER
			name_parts: DS_LIST [STRING]
		do
			create a_splitter.make
			a_splitter.set_separators (":")
			name_parts := a_splitter.split (a_qname)
			if name_parts.count = 2 then
				an_xml_prefix := name_parts.item (1)
				a_local_name := name_parts.item (2)
			else
				an_xml_prefix := ""
				a_local_name := name_parts.item (1)
			end
			if STRING_.same_string (an_xml_prefix, "") then
				a_uri :=  Xpath_functions_uri
			else
				a_uri := uri_for_prefix (an_xml_prefix)
			end
			if STRING_.same_string (a_uri, Xpath_functions_uri) then
				bind_system_function (a_local_name, arguments)
			else
				internal_last_function_binding_failure_message := "Non-system functions not yet supported"
				todo ("bind-function (prefixed funtion name)", True)
			end
		end

feature -- Output

	issue_warning (a_warning: STRING) is
			-- Issue a warning message
		do
			style_element.report_compile_warning (a_warning)
		end

feature {NONE} -- Implementation
	
	code_point_collator: ST_COLLATOR is
			-- Unicode code-point collator
		once
			create Result
		end

	bind_system_function (a_name: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a system function appearing in an expression.
		require
			valid_local_name: a_name /= Void and then is_ncname (a_name)
			arguments_not_void: arguments /= Void
		local
			a_function_call: XM_XPATH_FUNCTION_CALL
		do
			a_function_call := function_factory.make_system_function (a_name)
			if a_function_call = Void then
				was_last_function_bound := False
				set_bind_function_failure_message (STRING_.appended_string ("Unknown system function: ", a_name))
			else
				was_last_function_bound := True
				a_function_call.set_arguments (arguments)
				set_last_bound_function (a_function_call)
			end
		ensure
			function_bound: was_last_function_bound implies last_bound_function /= Void
		end

invariant

	style_element_not_void:	style_element /= Void

end

