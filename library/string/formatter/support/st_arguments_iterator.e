indexing

	description: "Iterator over ARRAY"

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class ST_ARGUMENTS_ITERATOR

inherit

	ANY -- Needed for SE 2.1b1.

creation

	make

feature -- Initialization

	make (a: ARRAY [ANY]) is
			-- Initialize iterator.
		do
			arg := a
			if arg = Void then
				cur := 0
			else
				cur := arg.lower
			end
		end

feature -- Iteration

	go_forth is
			-- Make `current_item' equal to next item.
		require
			not_after: not is_after
		do
			cur := cur + 1
		end

feature -- Access

	arg: ARRAY [ANY]
			-- The iterated array

	current_item: ANY is
			-- Item at current iterator position
		require
			not_after: not is_after
		do
			Result := arg.item (cur)
		end

feature -- Status

	is_after: BOOLEAN is
			-- Is iterater past last item?
		do
			Result := (arg = Void) or else (cur > arg.upper)
		end

feature {NONE} -- Implementation

	cur: INTEGER
			-- Index variable into `arg'

invariant

	cur_remains_valid:
		(arg = Void implies cur = 0) and
		(arg /= Void implies (cur >= arg.lower and cur <= arg.upper + 1))

end
