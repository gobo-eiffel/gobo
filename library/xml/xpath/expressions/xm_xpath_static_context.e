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

	XM_UNICODE_CHARACTERS_1_1

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	-- A StaticContext contains the information needed while an expression or pattern is being parsed;
	-- The information is also sometimes needed at run-time.

feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool used for compiling expressions

	last_bound_variable: XM_XPATH_VARIABLE_DECLARATION is
			-- The last variable bound by `bind_variable'
		do
			Result := internal_last_bound_variable
		ensure
			variable_not_void: Result /= Void
		end

	last_bound_function: XM_XPATH_EXPRESSION is
			-- The last function bound by `bind_function'
		require
			bind_function_suceeeded: was_last_function_bound
		do
			Result := internal_last_bound_function
		ensure
			function_not_void: Result /= Void
		end

	last_function_binding_failure_message: STRING is
			-- Error message from `bind_function'
		require
			function_not_bound: not was_last_function_bound
		do
			Result := internal_last_function_binding_failure_message
		ensure
			last_function_binding_failure_message_not_void: Result /= Void
		end
		
	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		deferred
		ensure
			positive_namespace_code: Result >= 0
		end

	default_collation_name: STRING is
			-- URI naming the default collation
		deferred
		ensure
			default_collation_name_not_void: Result /= Void
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

	bound_variables_count: INTEGER
			-- Number of variables bound in this context

feature -- Status report

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
		end

	was_last_function_bound: BOOLEAN
			-- Did last call to `bind_function' succeed?

	is_backwards_compatible_mode: BOOLEAN is
			-- Is Backwards Compatible Mode used?
		deferred
		end

feature -- Status setting

	set_bind_function_failure_message (a_message: STRING) is
			-- Set failure message from `bind_function'.
		require
			message_not_void: a_message /= Void
			function_not_bound: not was_last_function_bound
		do
			internal_last_function_binding_failure_message := a_message
		ensure
			message_set: STRING_.same_string (last_function_binding_failure_message, a_message)
		end

	set_last_bound_function (an_expression: XM_XPATH_EXPRESSION) is
			-- Set `last_bound_function'.
		require
			expression_not_void: an_expression /= Void
		do
			internal_last_bound_function := an_expression
		ensure
			set: last_bound_function = an_expression
		end
		
feature -- Element change
	
	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		require
			variable_declared: is_variable_declared (a_fingerprint)
		deferred
		ensure
			variable_bound: last_bound_variable /= Void
		end

	bind_function (a_qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
			arguments_not_void: arguments /= Void
		deferred
		ensure
			function_bound: was_last_function_bound implies last_bound_function /= Void
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

	internal_last_bound_function: XM_XPATH_EXPRESSION
			-- Result of last sucessfull call to  `bind_function'

	internal_last_function_binding_failure_message: STRING
			-- Failure message from `bind_function'

invariant

	name_pool_not_void: name_pool /= Void

end
	
