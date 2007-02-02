indexing

	description:

		"Objects that select a monotonically increasing integer sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RANGE_ITERATOR

inherit

	XM_XPATH_REALIZABLE_ITERATOR [XM_XPATH_ITEM]

create

	make

feature {NONE} -- Initialization

	make (a_min, a_max: INTEGER) is
			-- Establish invariant.
		require
			valid_maximum: a_max >= minimum
		do
			minimum := a_min
			maximum := a_max
		ensure
			minimum_set: minimum = a_min
			maximum_set: maximum = a_max
		end

feature -- Access

	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (index + minimum - 1)
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := not before and then index > maximum - minimum + 1
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		do
			create {XM_XPATH_INTEGER_RANGE} last_realized_value .make (minimum, maximum)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (minimum, maximum)
		end

feature {NONE} -- Implementation

	minimum, maximum: INTEGER

invariant

	valid_maximum: maximum >= minimum

end
