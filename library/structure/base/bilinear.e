indexing

	description:

		"EiffelBase BILINEAR class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class BILINEAR [G]

inherit

	LINEAR [G]
		rename
			ds_count as count
		undefine
			count
		redefine
			search, off
		end

feature -- Status report

	before: BOOLEAN is
			-- Is there no valid position to the left of current one?
		deferred
		end

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := before or after
		end

feature -- Cursor movement

	back is
			-- Move to previous position.
		require
			not_before: not before
		deferred
		ensure
			moved_back: index = old index - 1
		end

	search (v: G) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- If structure does not include `v' ensure that
			-- `exhausted' will be true.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if before and not empty then
				forth
			end
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
		end

invariant

	not_both: not (after and before)
	empty_property: empty implies (after or before)
	before_constraint: before implies off

end -- class BILINEAR
