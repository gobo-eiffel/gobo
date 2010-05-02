note

	description:

		"Objects that select a sub-sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_POSITION_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		redefine
			before, start, is_last_position_finder, last_position
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_min, a_max: INTEGER)
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			valid_minimum: a_min > 0
			valid_maximum: a_max >= a_min
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

	item: XM_XPATH_ITEM
			-- Value or node at the current position
		do
			Result := base_iterator.item
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			Result := base_iterator.last_position.min (maximum)
			Result := (Result - minimum + 1).max (0)
		end

feature -- Status report

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := base_iterator.is_last_position_finder
		end

	before: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := index < minimum
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := index > maximum or else base_iterator.after
		end

feature -- Cursor movement

	start
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
			end
			if index < minimum then index := minimum end
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
		end

	forth
			-- Move to next position
		do
			index := index + 1
			if not base_iterator.after then base_iterator.forth end
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, minimum, maximum)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Underlying sequence

	minimum, maximum: INTEGER

invariant

	base_iterator_not_void: base_iterator /= Void
	valid_minimum: minimum > 0
	valid_maximum: maximum >= minimum

end
