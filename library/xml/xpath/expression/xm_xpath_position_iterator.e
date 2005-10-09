indexing

	description:

		"Objects that select a sub-sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_POSITION_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		redefine
			before, start
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_min, a_max: INTEGER) is
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

	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			Result := base_iterator.item
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
			end
			if index < minimum then index := minimum end
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			if not base_iterator.after then base_iterator.forth end
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
		end

feature -- Duplication

	another: like Current is
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
