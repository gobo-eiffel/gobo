note

	description:

		"Iterators over a sequence of zero or one items"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			is_reversible_iterator, reverse_iterator,
			is_singleton_iterator, as_singleton_iterator,
			is_last_position_finder, is_invulnerable, last_position,
			is_realizable_iterator, realize
		end

create

	make

feature {NONE} -- Initialization

	make (a_value: detachable G)
		do
			value := a_value
			gone := (a_value = Void)
			index := 0
		ensure
			before: before
			value_set: value = a_value
		end

feature -- Access

	item: G
			-- Value or node at the current position
		do
			check precondition_not_off: index = 1 and attached value as l_value then
				Result := l_value
			end
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			if value = Void then
				Result := 0
			else
				Result := 1
			end
		end

	reverse_iterator: like Current
		do
			create Result.make (value)
		end

feature -- Status report

	is_singleton_iterator: BOOLEAN
			-- Is `Current' a singleton iterator?
		do
			Result := True
		end

	is_realizable_iterator: BOOLEAN
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end

	is_reversible_iterator: BOOLEAN
			-- Does `Current' yield a reversible_sequence?
		do
			Result := True
		end

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := True
		end

	is_invulnerable: BOOLEAN
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := gone
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			if index > 1 then
				gone := True
			end
		end

feature -- Evaluation

	realize
			-- Realize the sequence as a value.
		do
			check attached value as l_value then
				if l_value.is_atomic_value then
					last_realized_value := l_value.as_atomic_value
				else
					check
						node: item.is_node
					end
					create {XM_XPATH_SINGLETON_NODE} last_realized_value.make (item.as_node)
				end
			end
		end

feature -- Conversion

	as_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [G]
			-- `Current' seen as a singleton iterator
		do
			Result := Current
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (value)
		end

feature {NONE} -- Implementation

	value: detachable like item
			-- Possibly void item

	gone: BOOLEAN
			-- No item available

invariant

	gone_implies_value_void: gone implies value = Void and then not gone implies value /= Void

end
