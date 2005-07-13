indexing

	description:

		"Iterators over a sequence of zero items"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY_ITERATOR
	
inherit

	XM_XPATH_REVERSIBLE_ITERATOR [XM_XPATH_NODE]
		undefine
			is_last_position_finder, as_last_position_finder
		redefine
			is_node_iterator, as_node_iterator, is_empty_iterator, as_empty_iterator,
			is_invulnerable
		end

	XM_XPATH_LAST_POSITION_FINDER [XM_XPATH_NODE]
		undefine
			is_reversible_iterator, as_reversible_iterator
		redefine
			is_node_iterator, as_node_iterator, is_empty_iterator, as_empty_iterator,
			is_invulnerable
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	item: XM_XPATH_NODE is
			-- Value or node at the current position
		do
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

	is_empty_iterator: BOOLEAN is
			-- Is `Current' an iterator over a guarenteed empty sequence?
		do
			Result := True
		end

	as_empty_iterator: XM_XPATH_EMPTY_ITERATOR is
			-- `Current' seen as an empty iterator
		do
			Result := Current
		end

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

	is_invulnerable: BOOLEAN is
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

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
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			Result := Current
		end

end
