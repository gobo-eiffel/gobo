indexing

	description:

		"XSLT controller"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONTROLLER

feature -- Access

	new_xpath_context: XM_XPATH_CONTEXT is
			-- Create a new XPath context for expression evaluation
		do
			create Result.make (Current)
		ensure
			new_context_not_void: Result /= Void
		end

end
	
