indexing

	description:

		"Objects that iterate over an XPath node axis"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_AXIS_ITERATOR [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

feature -- Access

	item_for_iteration: G is
			-- Value or node at the current position
		do
			Result := current_item
		end

feature {NONE} -- Implementation

	current_item: G
			-- The item that the iterator is currently pointing to

end
	
