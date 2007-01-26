indexing

	description:

		"Objects that iterate over a DS_ARRAYED_LIST in reverse order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REVERSE_ARRAY_LIST_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			start
		end

create

	make

feature {NONE} -- Initialization

	make (a_list: DS_ARRAYED_LIST [G]) is
		require
			list_not_void: a_list /= Void
		do
			list := a_list
			cursor := list.new_cursor
		ensure
			list_set: list = a_list
		end
	
feature -- Access

	item: G is
			-- Value or node at the current position
		do
			Result := cursor.item
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := cursor.before
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			index := 1
			cursor.finish
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			cursor.back
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (list)
		end

feature {NONE} -- Implementation

	list: DS_ARRAYED_LIST [G]
			-- The list

	cursor: DS_ARRAYED_LIST_CURSOR [G]
			-- Cursor for `list'

invariant
	positive_index: index >= 0
	list_not_void: list /= Void
	
end
	
