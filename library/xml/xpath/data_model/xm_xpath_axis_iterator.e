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

	item: G is
			-- Value or node at the current position
		do
			Result := current_item
		end

feature -- Status report
	
	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := not before and then current_item = Void
		end

feature {NONE} -- Implementation

	current_item: like item
			-- The item that the iterator is currently pointing to

	advance is
			-- Move to the next position
		deferred
		end

end
	
