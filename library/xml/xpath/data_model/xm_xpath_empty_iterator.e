indexing

	description:

		"Iterators over a sequence of zero items"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY_ITERATOR [G -> XM_XPATH_NODE]

inherit


	XM_XPATH_AXIS_ITERATOR [G]
		redefine
			is_node_iterator, as_node_iterator, is_empty_iterator, as_empty_iterator,
			is_invulnerable, after, item, is_last_position_finder, last_position,
			is_reversible_iterator, reverse_iterator
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	item: G is
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

	
	is_last_position_finder: BOOLEAN is
			-- Can `Current' find the last position?
		do
			Result := True
		end
	
	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	is_reversible_iterator: BOOLEAN is
			-- Does `Current' yield a reversible_sequence?
		do
			Result := True
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

feature -- Conversion

	as_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as an empty iterator
		local
			a: ANY
			r: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_TREE_NODE]
		do
				-- Note1: the assignment attempt is necessary to compile
				-- with ISE 5.6 (formal generic does not necessarily
				-- conform to its constraint, but its reference version
				-- conforms to the reference version of its constraint).
				-- This has been changed in ISE 5.7, so no assignment
				-- attempt will be necessary when we drop support for
				-- ISE 5.6.
				-- Note2: we need to use an ANY as source of the assignment
				-- attempt, otherwise SE complains.
				-- Note3: because of a bug in assignment attempt with
				-- generic types in VE, we have to do it in two steps.
			a := Current
			r ?= a
			if r /= Void then
				Result := r
			else
				Result ?= a
			end
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		local
			a: ANY
			r: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_TREE_NODE]
		do
				-- Note1: the assignment attempt is necessary to compile
				-- with ISE 5.6 (formal generic does not necessarily
				-- conform to its constraint, but its reference version
				-- conforms to the reference version of its constraint).
				-- This has been changed in ISE 5.7, so no assignment
				-- attempt will be necessary when we drop support for
				-- ISE 5.6.
				-- Note2: we need to use an ANY as source of the assignment
				-- attempt, otherwise SE complains.
				-- Note3: because of a bug in assignment attempt with
				-- generic types in VE, we have to do it in two steps.
			a := Current
			r ?= a
			if r /= Void then
				Result := r
			else
				Result ?= a
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make
		end

feature {NONE} -- Implementation

	advance is
			-- Move to the next position
		do

			-- not used

		end

end
