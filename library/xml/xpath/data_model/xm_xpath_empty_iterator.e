indexing

	description:

		"Iterators over a sequence of zero items"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY_ITERATOR [G -> XM_XPATH_ITEM]

	-- This class has no state, and so a single
	-- instance can be used. This is available
	-- in XM_PATH_SHARED_EMPTY_ITERATOR

	-- The previous comment is wrong in every respect.
	-- TDOD: don't change the comment - make it be true
	
inherit

	XM_XPATH_REVERSIBLE_ITERATOR [G]

	XM_XPATH_LAST_POSITION_FINDER [G]

creation

	make

feature {NONE} -- Initialization

	make is
		do
			do_nothing
		end

feature -- Access

	item: G is
			-- Value or node at the current position
		do
				Result := Void
		end
	
		last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			Result := 0
		end

	reverse_iterator: like Current is
		do
			Result := Current
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := True
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
		ensure then
			after: after
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			Result := Current
		end

end
