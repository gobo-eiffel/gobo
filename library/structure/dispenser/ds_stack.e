indexing

	description:

		"Stacks (Last-In, First-Out)"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1997, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_STACK [G]

inherit

	DS_SEARCHABLE [G]

feature -- Status report

	extendible (n: INTEGER): BOOLEAN is
			-- May stack be extended with `n' items?
		require
			positive_n: n >= 0
		deferred
		end

feature -- Access

	item: G is
			-- Item at top of stack
		require
			not_empty: not is_empty
		deferred
		end

feature -- Element change

	put (v: G) is
			-- Push `v' on stack.
		require
			extendible: extendible (1)
		deferred
		ensure
			one_more: count = old count + 1
			pushed: item = v
		end

	force (v: G) is
			-- Push `v' on stack.
		deferred
		ensure
			one_more: count = old count + 1
			pushed: item = v
		end

	replace (v: G) is
			-- Replace top item by `v'.
		require
			not_empty: not is_empty
		deferred
		ensure
			same_count: count = old count
			replaced: item = v
		end

	extend (other: DS_LINEAR [G]) is
			-- Add items of `other' to stack.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
		deferred
		ensure
			new_count: count = old count + other.count
		end

	append (other: DS_LINEAR [G]) is
			-- Add items of `other' to stack.
		require
			other_not_void: other /= Void
		deferred
		ensure
			new_count: count = old count + other.count
		end

feature -- Removal

	remove is
			-- Remove top item from stack.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune (n: INTEGER) is
			-- Remove `n' items from stack.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	keep (n: INTEGER) is
			-- Keep `n' items in stack.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

end -- class DS_STACK
