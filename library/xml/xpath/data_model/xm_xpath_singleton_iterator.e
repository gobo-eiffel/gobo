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
		undefine
			is_last_position_finder, as_last_position_finder,
			is_singleton_iterator, as_singleton_iterator,
			is_realizable_iterator, as_realizable_iterator,
			is_invulnerable
		end

	XM_XPATH_LAST_POSITION_FINDER [G]
		undefine
			is_reversible_iterator, as_reversible_iterator,
			is_realizable_iterator, as_realizable_iterator,
			is_invulnerable
		redefine
			is_singleton_iterator, as_singleton_iterator
		end

	XM_XPATH_REALIZABLE_ITERATOR [G]
		undefine
			is_reversible_iterator, as_reversible_iterator,
			is_singleton_iterator, as_singleton_iterator,
			is_last_position_finder, as_last_position_finder,
			is_invulnerable
		end

create

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
		end

feature -- Access

	is_singleton_iterator: BOOLEAN is
			-- Is `Current' a singleton iterator?
		do
			Result := True
		end

	as_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [G] is
			-- `Current' seen as a singleton iterator
		do
			Result := Current
		end

	item: G is
			-- Value or node at the current position
		do
			if index = 1 then
				Result := value
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
	
	is_invulnerable: BOOLEAN is
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := gone
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if index > 1 then
				gone := True
			end
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		do
			if value.is_atomic_value then
				last_realized_value := value.as_atomic_value
			else
				check
					node: item.is_node
				end
				create {XM_XPATH_SINGLETON_NODE} last_realized_value.make (item.as_node)
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (value)
		end

feature {NONE} -- Implementation

	value: like item
			-- Possibly void item

	gone: BOOLEAN
			-- No item available

invariant

	gone_implies_value_void: gone implies value = Void and then not gone implies value /= Void

end
