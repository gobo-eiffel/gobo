indexing

	description:

		"EiffelBase LINEAR class"

	library:    "Gobo Eiffel Structure Library interface"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LINEAR [G]

inherit

	CONTAINER [G]
		rename
			count as ds_count
		end

feature -- Access

	item: G is
			-- Item at current position
		require
			not_off: not off
		deferred
		end

	index_of (v: G; i: INTEGER): INTEGER is
			-- Index of `i'-th occurrence of `v'.
			-- 0 if none.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			positive_occurrences: i > 0
		local
			occur, pos: INTEGER
		do
			if object_comparison and v /= Void then
				from
					start
					pos := 1
				until
					off or (occur = i)
				loop
					if item /= Void and then v.is_equal (item) then
						occur := occur + 1
					end
					forth
					pos := pos + 1
				end
			else
				from
					start
					pos := 1
				until
					off or (occur = i)
				loop
					if item = v then
						occur := occur + 1
					end
					forth
					pos := pos + 1
				end
			end
			if occur = i then
				Result := pos - 1
			end

		ensure
			non_negative_result: Result >= 0
		end

	search (v: G) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			-- If no such position ensure that `exhausted' will be true.
		do
			if object_comparison and v /= Void then
				from
				until
					exhausted or else (item /= Void and then v.is_equal (item))
				loop
					forth
				end
			else
				from
				until
					exhausted or else v = item
				loop
					forth
				end
			end
		ensure
			object_found: (not exhausted and object_comparison)
				 implies equal (v, item)
			item_found: (not exhausted and not object_comparison)
				 implies v = item
		end

	index: INTEGER is
			-- Index of current position
		deferred
		end

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			from
				start
				search (v)
			until
				exhausted
			loop
				Result := Result + 1
				forth
				search (v)
			end
		end

feature -- Measurement

	ds_count: INTEGER is
			-- Number of items
		do
				-- Give a dummy value.
				-- (Needs to be greater than 0 in order to 
				-- preserve "empty_definition" invariant in
				-- ISE's COUNTABLE_SEQUENCE class.)
			Result := 1
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does structure include an occurrence of `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			start
			if not off then
				search (v)
			end
			Result := not exhausted
		end

	exhausted: BOOLEAN is
			-- Has structure been completely explored?
		do
			Result := off
		ensure
			exhausted_when_off: off implies Result
		end

	after: BOOLEAN is
			-- Is there no valid position to the right of current one?
		deferred
		end

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := empty or after
		end

feature -- Cursor movement

	start is
			-- Move to first position if any.
		deferred
		end

	finish is
			-- Move to last position.
		deferred
		end

	forth is
			-- Move to next position; if no next position,
			-- ensure that `exhausted' will be true.
		require
			not_after: not after
		deferred
		ensure
			-- moved_forth_before_end: (not after) implies index = old index + 1
		end

feature -- Conversion

	linear_representation: LINEAR [G] is
			-- Representation as a linear structure
		do
			Result := Current
		end

invariant

	empty_constraint: empty implies off
	after_constraint: after implies off

end -- class LINEAR
