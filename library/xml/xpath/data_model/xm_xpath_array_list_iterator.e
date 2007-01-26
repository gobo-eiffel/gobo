indexing

	description:

		"Objects that iterate over a DS_ARRAYED_LIST"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARRAY_LIST_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_REALIZABLE_ITERATOR [G]
		redefine
			start, is_invulnerable
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

	is_invulnerable: BOOLEAN is
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := cursor.after
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			index := 1
			cursor.start
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			cursor.forth
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			an_index: INTEGER
		do
			-- temporary is to get round expanded/reference generics problem
			create a_list.make (list.count)
			from
				an_index := 1
			until
				an_index > list.count
			loop
				a_list.put_last (list.item (an_index))
				an_index := an_index + 1
			end			
			create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (a_list)
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
	
