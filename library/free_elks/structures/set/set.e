
indexing

	description:
		"Collection, where each element must be unique."
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: set;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class SET [G] inherit

	COLLECTION [G]
		redefine
			changeable_comparison_criterion
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items
		deferred
		end

feature -- Element change

	extend, put (v: G) is
			-- Ensure that set includes `v'.
		deferred
		ensure then
			in_set_already: old has (v) implies (count = old count)
			added_to_set: not old has (v) implies (count = old count + 1)
		end

feature -- Removal

	prune (v: G) is
			-- Remove `v' if present.
		deferred
		ensure then
			removed_count_change: old has (v) implies (count = old count - 1)
			not_removed_no_count_change: not old has (v) implies (count = old count)
			item_deleted: not has (v)
		end

	changeable_comparison_criterion: BOOLEAN is
			-- May `object_comparison' be changed?
			-- (Answer: only if set empty; otherwise insertions might
			-- introduce duplicates, destroying the set property.)
		do
			Result := is_empty
		ensure then
			only_on_empty: Result = is_empty
		end

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







end -- class SET



