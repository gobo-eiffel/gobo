indexing

	description:

		"XPath controllers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTROLLER

creation

	make

feature {NONE} -- Initialization

	make (a_context_node: XM_XPATH_NODE) is
			-- Create and set context node
		require
			context_node_not_void: a_context_node /= Void
		do
			make_context (a_context_node)
		ensure
			context_item_set: current_iterator /= Void and then current_iterator.item /= Void
		end

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

	local_variable_frame: ARRAY [XM_XPATH_VALUE] -- This might need shifting elsewhere
			-- Local variables in scope

	
feature 	-- Element change

	set_current_iterator (an_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iter
		ensure
			set: current_iterator = an_iter
		end

	make_context (an_item: XM_XPATH_ITEM) is
			-- Create a new context with `an_item' as the context item
			--  and the only item in the current item list.
		require
			item_not_void: an_item /= Void
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} current_iterator.make (an_item)
			current_iterator.start
		ensure
			context_item_not_void: current_iterator.item /= Void
			context_item_set: current_iterator.item = an_item
		end

invariant

	current_iterator_not_void: current_iterator /= void

end
	
