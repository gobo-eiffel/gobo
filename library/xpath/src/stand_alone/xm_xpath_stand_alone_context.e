note

	description:

		"Objects that provide a context for parsing an expression appearing in a context other than a stylesheet"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STAND_ALONE_CONTEXT

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_STATIC_CONTEXT

	XM_XPATH_CONFORMANCE

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_NAMESPACE_RESOLVER

	XM_XPATH_TYPE

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

create

	make, make_upon_node

feature {NONE} -- Initialization

	make (warnings: BOOLEAN; backwards: BOOLEAN; a_base_uri: UT_URI; a_function_library: XM_XPATH_FUNCTION_LIBRARY)
			-- Establish invariant.
		require
			warnings_implies_backwards_compatibility: warnings implies backwards
			absolute_base_uri: a_base_uri /= Void and then a_base_uri.is_absolute
			function_library_not_void: a_function_library /= Void
		local
			a_code_point_collator: ST_COLLATOR
		do
			create configuration.make_configuration
			create known_collations.make_with_equality_testers (10, Void, string_equality_tester)
			create variables.make (10)
			create a_code_point_collator
			declare_collation (a_code_point_collator, Unicode_codepoint_collation_uri)
			default_collation_name := Unicode_codepoint_collation_uri
			clear_namespaces
			warnings_to_std_error := warnings
			is_backwards_compatible_mode := backwards
			base_uri := a_base_uri
			system_id := ""
			line_number := -1
			available_functions := a_function_library
		ensure
			warnings_set: warnings_to_std_error = warnings
			backward_compatibility: is_backwards_compatible_mode = backwards
			base_uri_set: base_uri = a_base_uri
			function_library_set: available_functions = a_function_library
		end

	make_upon_node
			-- TODO
		do
			std.output.put_line ("{XM_XPATH_STAND_ALONE_CONTEXT}.make_upon_node not implemented!")
			check False then end
		end

feature -- Access

	host_language: STRING
			-- Name of host language
		do

			-- This routine MUST be redefined for a custom-host language

			if customized_host_language then
				Result := ""
			elseif basic_xslt_processor or else schema_aware_processor then
				Result := "Stand-alone XPath evaluator"
			else
				Result := ""
			end
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions

	base_uri: UT_URI
			-- Base URI

	system_id: STRING
			-- SYSTEM-id

	line_number: INTEGER
			-- Line number

	default_element_namespace: STRING
			-- Default XPath namespace uri
		do
			Result := ""
		end

	default_function_namespace_uri: STRING
			-- Namespace for non-prefixed XPath functions
		do
			Result := Xpath_standard_functions_uri
		end

	namespaces: DS_HASH_TABLE [STRING, STRING]
			-- Maps prefixes to URIs

	warnings_to_std_error: BOOLEAN
			-- should warning messages be sent to standard error stream?

	default_collation_name: STRING
			-- URI naming the default collation

	uri_for_prefix (an_xml_prefix: STRING): STRING
			-- URI for a namespace prefix;
			-- The default namespace is NOT used when the prefix is empty.
		do
			Result := namespaces.item (an_xml_prefix)
		end

	uri_for_defaulted_prefix (a_prefix: STRING; use_default_namespace: BOOLEAN): detachable STRING
			-- Namespace URI corresponding to a given prefix
		do
			if a_prefix.count = 0 and then not use_default_namespace then
				Result := ""
			elseif namespaces.has (a_prefix) then
				Result := namespaces.item (a_prefix)
			end
		end


	fingerprint (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER
			-- Fingerprint of `a_qname'
		do
			Result := qname_to_fingerprint (a_qname)

			-- N.B. effectively, `use_default_namespace' is ignored (assumed `False').
			-- But this routine is not called by the stand-alone evaluator anyway

		end

	is_backwards_compatible_mode: BOOLEAN
			-- Is Backwards Compatible Mode used?

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Resolver for lexical QNames
		do
			Result := Current
		end

feature -- Status report

	is_prefix_declared (an_xml_prefix: STRING): BOOLEAN
			-- Is `an_xml_prefix' allocated to a namespace?
		do
			Result := namespaces.has (an_xml_prefix)
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent a variable declared in the static context?
		do
			Result := variables.has (a_fingerprint)
		end

	is_qname_variable_declared (a_qname: STRING): BOOLEAN
			-- Does `a_qname' represent a variable declared in the static context?
		require
			valid_name: a_qname /= Void and then is_qname (a_qname)
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := qname_to_fingerprint (a_qname)
			if a_fingerprint = -1 then
				Result := False
			else
				Result := is_variable_declared (a_fingerprint)
			end
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
		do
			Result := False
		end

feature -- Creation

	new_compile_time_context: XM_XPATH_CONTEXT
			-- Restricted dynamic context
		do
			create {XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT} Result.make_restricted (available_functions)
		end

feature -- Element change

	declare_namespace (an_xml_prefix, a_uri: STRING)
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			not_declared: not namespaces.has (an_xml_prefix)
		do
			namespaces.put_new (a_uri, an_xml_prefix)
		ensure
			set: namespaces.has (an_xml_prefix) and then STRING_.same_string (a_uri, namespaces.item (an_xml_prefix))
		end

	declare_variable (a_qname: STRING; an_initial_value: XM_XPATH_VALUE)
			-- Declare `a_qname' as a variable.
		require
			valid_name: a_qname /= Void and then is_qname (a_qname)
			variable_not_declared: not is_qname_variable_declared (a_qname)
			-- N.B. if `a_qname' is a qualified name, then the prefix
			--  must have been declared using `declare_namespace'.
		local
			a_variable: XM_XPATH_VARIABLE
			a_fingerprint: INTEGER
		do
			a_fingerprint := qname_to_fingerprint (a_qname)
			if a_fingerprint = -1 then
				-- do nothing

				-- TODO - how to get allocation faliure message, and raise a dynamic error?
				--  We will get a post-condition failed exception. Not good enough

			else
				create a_variable.make (a_qname, an_initial_value)
				variables.put (a_variable, a_fingerprint)
			end
		ensure
			variable_declared: is_qname_variable_declared (a_qname)
		end

	clear_namespaces
			-- Clear all the declared namespaces, except for the standard ones.
		do
			clear_all_namespaces
			declare_namespace ("xml", Xml_uri)
			declare_namespace ("xsl", Xslt_uri)
			declare_namespace ("xs", Xml_schema_uri)
			declare_namespace ("", Null_uri)
		end

	clear_all_namespaces
			-- Clear all the declared namespaces.
		do
			create namespaces.make_with_equality_testers (10, string_equality_tester, string_equality_tester)
		end

	bind_variable (a_fingerprint: INTEGER)
			-- Bind variable to it's declaration.
		local
			var: XM_XPATH_VARIABLE
		do
			var := variables.item (a_fingerprint)
			internal_last_bound_variable := var
			-- An option to return boolean false value if not found can be provided by re-defining this routine
			--  along with `is_variable_declared' in a descendant class.
		end

feature -- Output

	issue_warning (a_warning: STRING)
			-- Issue a warning message
		do
			if warnings_to_std_error then
				std.error.put_string (a_warning)
				std.error.put_new_line
			end
		end

feature {NONE} -- Implementation

	variables:  DS_HASH_TABLE [XM_XPATH_VARIABLE, INTEGER]
			-- Variable-bindings

	qname_to_fingerprint (a_qname: STRING): INTEGER
		require
			valid_name: a_qname /= Void and then is_qname (a_qname)
		local
			an_xml_prefix, a_local_name, a_uri: STRING
			a_splitter: ST_SPLITTER
			parts: DS_LIST [STRING]
			a_name_code: INTEGER
		do
			create a_splitter.make
			a_splitter.set_separators (":")
			parts := a_splitter.split (a_qname)
			if parts.count = 1 then
				an_xml_prefix := ""
				a_uri := ""
				a_local_name := parts.item (1)
			else
				an_xml_prefix := parts.item (1)
				a_local_name := parts.item (2)
				a_uri := uri_for_prefix (an_xml_prefix)
			end
			if shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
				a_name_code := shared_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
			else
				if not shared_name_pool.is_name_pool_full (a_uri, a_local_name) then
					shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
					a_name_code := shared_name_pool.last_name_code
				else
					Result := -1
				end
			end
			Result := a_name_code \\ bits_20
		ensure
			nearly_positive_fingerprint: Result >= -1
		end

invariant

	namespaces_not_void: namespaces /= Void
	default_collation_name: default_collation_name /= Void
	variables: variables /= Void
	warnings_implies_backwards_compatibility: warnings_to_std_error implies is_backwards_compatible_mode
	not_restricted: not is_restricted

end
