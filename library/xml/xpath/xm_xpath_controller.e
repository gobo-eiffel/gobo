indexing

	description:

		"XPath controllers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTROLLER

feature -- Access

	new_xpath_context: XM_XPATH_CONTEXT is
			-- Create a new XPath context for expression evaluation
		do
			create Result.make (Current)
		ensure
			new_context_not_void: Result /= Void
		end

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator
	
feature 	-- Element change

	set_current_iterator (it: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := it
		ensure
			set: current_iterator = it
		end

end
	
