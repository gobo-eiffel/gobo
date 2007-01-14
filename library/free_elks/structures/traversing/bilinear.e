indexing

	description:
		"Structures that may be traversed forward and backward"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: bidirectional, traversing;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class BILINEAR [G] inherit

	LINEAR [G]
		rename
			search as sequential_search
		export
			{NONE}
				sequential_search
		redefine
			off
		end

	LINEAR [G]
		redefine
			search, off
		select
			search
		end

feature -- Access

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := before or after
		end

feature -- Cursor movement

	before: BOOLEAN is
			-- Is there no valid position to the left of current one?
		deferred
		end

	back is
			-- Move to previous position.
		require
			not_before: not before
		deferred
		ensure then
			-- moved_forth_after_start: (not before) implies index = old index - 1
		end

	search (v: like item) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- If structure does not include `v' ensure that
			-- `exhausted' will be true.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if before and not is_empty then
				forth
			end
			sequential_search (v)
		end

invariant

	not_both: not (after and before)
	before_constraint: before implies off

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class BILINEAR



