indexing

	description:

		"XPath static context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_STATIC_CONTEXT

inherit

	XM_XPATH_SHARED_NAME_POOL

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	-- A StaticContext contains the information needed while an expression or pattern is being parsed;
	-- The information is also sometimes needed at run-time.

feature -- Access

	host_language: STRING is
			-- Name of host language
		deferred
		ensure
			host_language_not_void: Result /= Void and then Result.count > 0
		end

	base_uri: UT_URI is
			-- Base URI
		deferred
		ensure
			absolute_uri: Result /= Void and then Result.is_absolute
		end

	last_bound_variable: XM_XPATH_VARIABLE_DECLARATION is
			-- The last variable bound by `bind_variable'
		do
			Result := internal_last_bound_variable
		ensure
			variable_not_void: Result /= Void
		end
		
	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `shared_name_pool'
		deferred
		ensure
			positive_namespace_code: Result >= 0
		end

	default_function_namespace_uri: STRING is
			-- Namespace for non-prefixed XPath functions
		deferred
		ensure
			default_function_namespace_uri_not_void: Result /= Void
			restricted_means_standard_function_namespace: is_restricted implies
				String_.same_string (Result, Xpath_standard_functions_uri)
		end
	
	default_collation_name: STRING is
			-- URI naming the default collation
		deferred
		ensure
			default_collation_name_not_void: Result /= Void
			restricted_means_unicode_code_point_collation: is_restricted implies
			String_.same_string (Result, Unicode_codepoint_collation_uri)	
		end

	collator (a_collation_name: STRING): ST_COLLATOR is
			-- Collator named by `a_collation_name'
		require
			uri_form: a_collation_name /= Void  -- and then is a URI
		deferred
		end

	uri_for_prefix (an_xml_prefix: STRING): STRING is
			-- URI for a namespace prefix;
			-- The default namespace is NOT used when the prefix is empty.
		require
			valid_prefix: 	an_xml_prefix /= Void and then is_ncname (an_xml_prefix) and then is_prefix_declared (an_xml_prefix)
		deferred
		ensure
			uri_not_void: Result /= Void
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		deferred
		ensure
				available_functions_not_void: Result /= Void
		end
	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER is
			-- Resolver for lexical QNames
		deferred
		ensure
			namespace_resolver_not_void: Result /= Void
		end

	bound_variables_count: INTEGER
			-- Number of variables bound in this context

feature -- Status report

	is_restricted: BOOLEAN
			-- Is this a restricted context (for use with xsl:use-when)?
	
	is_prefix_declared (an_xml_prefix: STRING): BOOLEAN is
			-- Is `an_xml_prefix' allocated to a namespace?
		require
			valid_prefix: an_xml_prefix /= Void and then is_ncname (an_xml_prefix)
		deferred
		end

	is_variable_declared (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a variable declared in the static context?
		require
			positive_fingerprint: a_fingerprint >= 0
		deferred
		ensure
			not_when_restricted: is_restricted implies Result = False 
		end

	is_backwards_compatible_mode: BOOLEAN is
			-- Is XPath 1.0 Backwards Compatible Mode used?
		deferred
		ensure
			not_when_restricted: is_restricted implies Result = False 
		end

	is_data_type_valid (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a data-type in `Current'?
		deferred
		ensure
			no_schema_types_when_restricted: is_restricted implies True -- TODO for schema-awareness
		end
		
feature -- Element change
	
	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		require
			variable_declared: is_variable_declared (a_fingerprint)
			not_restricted: not is_restricted
		deferred
		ensure
			variable_bound: last_bound_variable /= Void
		end

feature -- Output

	issue_warning (a_warning: STRING) is
			-- Issue a warning message
		require
			warning_not_void: a_warning /= Void
		deferred
		end

feature {NONE} -- Implementation

	internal_last_bound_variable: XM_XPATH_VARIABLE_DECLARATION
			-- Result of last sucessfull call to  `bind_variable'


end
	
