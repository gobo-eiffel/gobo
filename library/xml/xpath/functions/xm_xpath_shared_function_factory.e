indexing

	description:

		"Objects that provide a shared function factory"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_FUNCTION_FACTORY

feature -- Access

	function_factory: XM_XPATH_FUNCTION_FACTORY is
			-- Function factory
		once
			create Result
		ensure
			function_factory_not_void: Result /= Void
		end
	
end
