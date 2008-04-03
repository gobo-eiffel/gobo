indexing

	description:

		"Counters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_COUNTER

inherit

	ANY -- Needed for SE 2.1b1.

create

	make

feature {NONE} -- Initialization

	make (v: INTEGER) is
			-- Create a new counter.
		do
			item := v
		ensure
			item_set: item = v
		end

feature -- Initialization

	reset (v: INTEGER) is
			-- Reset counter.
		do
			item := v
		ensure
			item_set: item = v
		end

feature -- Access

	item: INTEGER
			-- Value

feature -- Basic operations

	increment is
			-- Increment counter.
		do
			item := item + 1
		ensure
			incremented: item = old item + 1
		end

	decrement is
			-- Decrement counter.
		do
			item := item - 1
		ensure
			decremented: item = old item - 1
		end

end
