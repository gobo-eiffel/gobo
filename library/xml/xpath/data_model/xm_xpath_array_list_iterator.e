indexing

	description:

		"Objects that iterate over a DS_ARRAYED_LIST"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARRAY_LIST_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

creation

	make

feature {NONE} -- Initialization

	make (a_list: DS_ARRAYED_LIST [G]) is
		require
			list_not_void: a_list /= Void
		do
			list := a_list
		ensure
			list_set: list = a_list
		end
	
feature -- Access

	item_for_iteration: G is
			-- Value or node at the current position
		do
			Result := list.item_for_iteration
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := index > list.count
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (list)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			list.forth
		end

feature {NONE} -- Implementation

	list: DS_ARRAYED_LIST [G]
			-- The list
	
invariant
	positive_index: index >= 0
	list_not_void: list /= Void
	
end
	
