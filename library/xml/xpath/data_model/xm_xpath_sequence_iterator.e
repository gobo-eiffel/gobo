indexing

	description:

		"Objects that iterate over an XPath sequence (of values or nodes)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SEQUENCE_ITERATOR [G -> XM_XPATH_ITEM]

feature -- Access

	item: G is
			-- Value or node at the current position
		require
			not_off: not off
		deferred
		end

	index: INTEGER
			-- The position of the current item;
			-- This will be zero after creation of the iterator

feature -- Status report

	before: BOOLEAN is
			-- Has `forth' been called yet on this sequence?
		do
			Result := index = 0
		ensure
			before_first_position: Result = True implies index = 0
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		deferred
		end

	off: BOOLEAN is
			-- Is there an `item' to be retrieved?
		do
			Result := before or else after
		end

feature -- Cursor movement

	start is
			-- Move to first position
		require
			before: before
		do
			forth
		ensure
			not_before: not before
		end
			
	forth is
			-- Move to next position
		require
			not_after: before or else not after
		deferred
		ensure
			one_more: index = old index + 1
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		deferred
		end

invariant
	positive_index: index >= 0
	off_or_valid_item: not off implies item /= Void

end
	
