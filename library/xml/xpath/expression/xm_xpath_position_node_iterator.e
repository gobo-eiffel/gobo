note

	description:

		"Objects that select a sub-sequence of nodes."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_POSITION_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			before, start, is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_min, a_max: INTEGER) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			valid_minimum: a_min > 0
			valid_maximum: a_max >= minimum
		do
			base_iterator := a_base_iterator
			minimum := a_min
			maximum := a_max
		ensure
			base_iterator_set:base_iterator = a_base_iterator
			minimum_set: minimum = a_min
			maximum_set: maximum = a_max
		end

feature -- Access

	item: XM_XPATH_NODE is
			-- Node at the current position
		do
			Result := base_iterator.item
		end

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end

feature -- Status report

	before: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := index < minimum
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := index > maximum or else base_iterator.after
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			from
				base_iterator.start
				index :=  1
			until
				index = minimum or else base_iterator.is_error or else base_iterator.after
			loop
				index := index + 1
				if not base_iterator.after then base_iterator.forth end
				if base_iterator.is_error then set_last_error (base_iterator.error_value) end
			end
			if index < minimum then index := minimum end
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			if not base_iterator.after then base_iterator.forth end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, minimum, maximum)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Underlying sequence

	minimum, maximum: INTEGER

invariant

	base_iterator_not_void: base_iterator /= Void
	valid_minimum: minimum > 0
	valid_maximum: maximum >= minimum

end
