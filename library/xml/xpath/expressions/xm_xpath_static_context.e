indexing

	description:

		"XPath static context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
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
	
end
	
