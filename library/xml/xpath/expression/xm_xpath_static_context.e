note

	description:

		"XPath static context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_STATIC_CONTEXT

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	-- A StaticContext contains the information needed while an expression or pattern is being parsed;
	-- The information is also sometimes needed at run-time.

feature -- Access

	configuration: XM_XPATH_CONFIGURATION
			-- System configuration

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

	system_id: STRING is
			-- SYSTEM-id;
			-- This may differ from `base_uri', as it reports
			--  the system-id of the containing entity, which
			--  tends to be more useful for diagnostics.
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

	line_number: INTEGER is
			-- Line number
		deferred
		end

	last_bound_variable: XM_XPATH_VARIABLE_DECLARATION is
			-- The last variable bound by `bind_variable'
		do
			Result := internal_last_bound_variable
		ensure
			variable_not_void: Result /= Void
		end
		
	default_element_namespace: STRING is
			-- Default XPath namespace URI
		deferred
		ensure
			default_element_namespace_not_void: Result /= Void
		end

	default_function_namespace_uri: STRING is
			-- Namespace for non-prefixed XPath functions
		deferred
		ensure
			default_function_namespace_uri_not_void: Result /= Void
			restricted_means_standard_function_namespace: is_restricted implies
				STRING_.same_string (Result, Xpath_standard_functions_uri)
		end
	
	default_collation_name: STRING is
			-- URI naming the default collation
		deferred
		ensure
			default_collation_name_not_void: Result /= Void
			known_collation: is_known_collation (Result)
			restricted_means_unicode_code_point_collation: is_restricted implies
			STRING_.same_string (Result, Unicode_codepoint_collation_uri)	
		end

	collator (a_collation_name: STRING): ST_COLLATOR is
			-- Collator named by `a_collation_name'
		require
			uri_form: a_collation_name /= Void  -- and then is a URI
			known_collation: is_known_collation (a_collation_name)
		do
			Result := known_collations.item (a_collation_name)
		ensure
			collator_not_void: Result /= Void
		end

	known_collations: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Statically known collations

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

	is_known_collation (a_collation_name: STRING): BOOLEAN is
			-- Is `a_collation_name' a statically know collation?
		require
			collation_name_not_void: a_collation_name /= Void
		do
			Result := known_collations.has (a_collation_name)
		end

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

	is_element_available (a_qname: STRING): BOOLEAN is
			-- Is element name `a_qname' available?
		require
			valid_qname: is_qname (a_qname)
		deferred
		end

feature -- Creation

	new_compile_time_context: XM_XPATH_CONTEXT is
			-- Restricted dynamic context
		deferred
		ensure
			new_compile_time_context_not_void: Result /= Void
			restricted_context: Result.is_restricted
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

	declare_collation (a_collator: ST_COLLATOR; a_collation_name: STRING) is
			-- Associate `a_collation_name' with `a_collator'.
		require
			collation_name_not_void: a_collation_name /= Void
			collator_not_void: a_collator /= Void
			collation_not_known: not is_known_collation (a_collation_name)
		do
			known_collations.force (a_collator, a_collation_name)
		ensure
			collation_known: is_known_collation (a_collation_name)
			correct_collation: collator (a_collation_name) = a_collator
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

invariant

	known_collations_not_void: known_collations /= Void
	configuration_not_void: configuration /= void

end
	
