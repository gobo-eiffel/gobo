indexing

	description:

		"XPath static context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_STATIC_CONTEXT

	-- A StaticContext contains the information needed while an expression or pattern is being parsed;
	-- The information is also sometimes needed at run-time.

feature -- Access

	name_pool: XM_XPATH_NAME_POOL is
			-- The name pool used for compiling expressions
		deferred
		ensure
			name_pool_not_void: Result /= Void
		end

	last_bound_variable: XM_XPATH_VARIABLE_DECLARATION
			-- The last variablew bound by `bind_variable'

	bind_variable (fingerprint: INTEGER) is
			-- Bind variable in this element to the XM_XSLT_XSL_VARIABLE in which it is declared.#
		deferred
		ensure
			variable_bound: last_bound_variable /= Void
			-- TODO - require that fingerprint is valid, I think
		end

end
	
