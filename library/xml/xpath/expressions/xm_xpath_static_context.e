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

	-- A StaticContext contains the information needed while an expression or pattern is being parsed;
	-- The information is also sometimes needed at run-time.

feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool used for compiling expressions

	last_bound_variable: XM_XPATH_VARIABLE_DECLARATION is
			-- The last variable bound by `bind_variable'
		require
			bind_variable_suceeeded: was_last_variable_bound
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

	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		deferred
		ensure
			positive_namespace_code: Result >= 0
		end

	uri_for_prefix (xml_prefix: STRING): STRING is
			-- URI for a namespace prefix;
			-- The default namespace is NOT used when the prefix is empty.
		require
			valid_prefix: 	xml_prefix /= Void and then is_ncname (xml_prefix) and then is_declared_prefix (xml_prefix)
		deferred
		ensure
			uri_not_void: Result /= Void
		end

feature -- Status report

	is_declared_prefix (xml_prefix: STRING): BOOLEAN is
			-- Is `xml_prefix' allocated to a namespace?
		require
			valid_prefix: xml_prefix /= Void and then is_ncname (xml_prefix)
		deferred
		end

	was_last_variable_bound: BOOLEAN
			-- Did last call to `bind_variable' succeed?

	was_last_function_bound: BOOLEAN
			-- Did last call to `bind_function' succeed?

feature -- Element change
	
	bind_variable (fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		deferred
		ensure
			variable_bound: was_last_variable_bound implies last_bound_variable /= Void
		end

	bind_function (qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
		require
			valid_qname: qname /= Void and then is_qname (qname)
			arguments_not_void: arguments /= Void
		deferred
		ensure
			function_bound: was_last_function_bound implies last_bound_function /= Void
		end
			
feature {NONE} -- Implementation

	internal_last_bound_variable: XM_XPATH_VARIABLE_DECLARATION
			-- Result of last sucessfull call to  `bind_variable'

	internal_last_bound_function: XM_XPATH_EXPRESSION
			-- Result of last sucessfull call to  `bind_function'

invariant

	name_pool_not_void: name_pool /= Void

end
	
