indexing

	description:

		"Iterators over a sequence of zero or one items"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_REVERSIBLE_ITERATOR [G]

	XM_XPATH_LAST_POSITION_FINDER [G]

creation

	make

feature {NONE} -- Initialization

	make (a_value: G) is
		do
			value := a_value
			gone := (a_value = Void)
			index := 0
		ensure
			before: before
			value_set: value = a_value
			gone_implies_value_void: gone implies value = Void and then not gone implies value /= Void
		end

feature -- Access

	item_for_iteration: G is
			-- Value or node at the current position
		do
			if index = 1 then
				Result := value
				index := 2
				gone := True
			end
			
		end
	
	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			if value = Void then
				Result := 0
			else
				Result := 1
			end
		end

	reverse_iterator: like Current is
		do
			create Result.make (value)
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := gone
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			gone := True
			index := index + 1
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (value)
		end

feature {NONE} -- Implementation

	value: G
			-- Possibly void item

	gone: BOOLEAN
			-- No item available
end
