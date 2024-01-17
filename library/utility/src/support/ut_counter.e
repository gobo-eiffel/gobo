note

	description:

		"Counters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"

class UT_COUNTER

inherit

	ANY -- Needed for SE 2.1b1.

create

	make

feature {NONE} -- Initialization

	make (v: INTEGER)
			-- Create a new counter.
		do
			item := v
		ensure
			item_set: item = v
		end

feature -- Initialization

	reset (v: INTEGER)
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

	increment
			-- Increment counter.
		do
			item := item + 1
		ensure
			incremented: item = old item + 1
		end

	decrement
			-- Decrement counter.
		do
			item := item - 1
		ensure
			decremented: item = old item - 1
		end

end
