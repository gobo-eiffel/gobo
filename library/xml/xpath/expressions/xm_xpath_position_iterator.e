indexing

	description:

		"Objects that select a sub-sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_POSITION_ITERATOR [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

		-- TODO - if base is an XM_XPATH_ARRAY_ITERATOR, need a factory method

feature -- Access

	item: G is
			-- Value or node at the current position
		do
			-- TODO
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			-- TODO
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			-- TODO
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			-- TODOcreate Result.make (base_iterator, min, max)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [G]
			-- Underlying sequence

	minimum, maximum: INTEGER

invariant

	base_iterator_not_void: base_iterator /= Void
	
end
