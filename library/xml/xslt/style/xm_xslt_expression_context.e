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

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_ERROR_TYPES

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
			an_xml_prefix, a_uri, a_local_name, a_message: STRING
			a_splitter: ST_SPLITTER
			name_parts: DS_LIST [STRING]
			is_debugging: BOOLEAN
			a_stylesheet_function: XM_XSLT_FUNCTION
			a_fingerprint: INTEGER
			an_error_expression: XM_XPATH_INVALID_VALUE
			an_error_value: XM_XPATH_ERROR_VALUE
			a_user_function: XM_XSLT_USER_FUNCTION_CALL
			an_atomic_type: XM_XPATH_ATOMIC_TYPE
		do
			was_last_function_bound := False
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
				is_debugging := style_element.prepared_stylesheet.configuration.is_trace_external_functions
				if is_debugging then
					std.error.put_string ("Resolving external function call to " + a_qname + "%N")
				end
				if not shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
					shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
					a_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
				else
					a_fingerprint := fingerprint_from_name_code (shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name))
				end

				-- First see if there is a stylesheet function with override=yes

				a_stylesheet_function := style_element.stylesheet_function (a_fingerprint, arguments.count)
				if a_stylesheet_function /= Void and then a_stylesheet_function.is_overriding then
					if is_debugging then
						std.error.put_string ("Found a stylesheet function with override='yes'%N")
					end
					create a_user_function.make (a_fingerprint, arguments)
					set_last_bound_function (a_user_function)
					a_stylesheet_function.register_reference (a_user_function)
				else

					-- Look for a constructor function for a built-in type

					if STRING_.same_string (a_uri, Xml_schema_uri) or else
						STRING_.same_string (a_uri, Xml_schema_datatypes_uri) or else
						STRING_.same_string (a_uri, Xpath_defined_datatypes_uri) then
						
						-- it's a constructor function: treat it as shorthand for a cast expression

						if arguments.count /= 1 then
							set_bind_function_failure_message ("A constructor function must have exactly one argument")
						else
							an_atomic_type ?= built_in_item_type (a_uri, a_local_name)
							if an_atomic_type = Void then
								a_message := STRING_.concat ("Unknown constructor function: ", a_qname)
								create an_error_value.make_from_string (a_message, 1410, Dynamic_error)
								create an_error_expression.make (an_error_value)
								set_last_bound_function (an_error_expression)
							else
								todo ("bind_function", True)
							end
						end
					end

					if not was_last_function_bound then

						-- maybe it's a linked-in extension function

						if function_factory.is_extension_function (a_uri, a_local_name, arguments.count) then
							set_last_bound_function (function_factory.extension_function (a_uri, a_local_name, arguments.count))
						end
					end
					if not  was_last_function_bound then
						
						-- Finally, see if there is a stylesheet function with override=no

						if a_stylesheet_function /= Void then
							if is_debugging then
								std.error.put_string ("Found a stylesheet function with override='no'%N")
							end
							create a_user_function.make (a_fingerprint, arguments)
							set_last_bound_function (a_user_function)
							a_stylesheet_function.register_reference (a_user_function)
						else
							a_message := STRING_.concat ("No function found matching ", a_qname)
							a_message := STRING_.appended_string (a_message, " with ")
							a_message := STRING_.appended_string (a_message, displayed_argument_count (arguments.count))
							create an_error_value.make_from_string (a_message, 1410, Dynamic_error)
							create an_error_expression.make (an_error_value)
							set_last_bound_function (an_error_expression)
						end
					end
				end
				was_last_function_bound := True
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

