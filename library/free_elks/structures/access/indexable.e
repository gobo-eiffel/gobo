indexing

	description:
		"Tables whose keys are integers in a contiguous interval"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: indexable, access;
	access: index, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class INDEXABLE [G, H -> INTEGER] inherit

	TABLE [G, H]
		rename
			valid_key as valid_index
		redefine
			put, valid_index
		end

feature -- Measurement

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		deferred
		ensure
			not_void: Result /= Void
		end

feature -- Status report

	valid_index (i: H): BOOLEAN is
			-- Is `i' a valid index?
		deferred
		ensure then
			only_if_in_index_set:
				Result implies
					((i >= index_set.lower) and
					(i <= index_set.upper))
		end

feature -- Element change

	put (v: G; k: H) is
			-- Associate value `v' with key `k'.
		deferred
		ensure then
			insertion_done: item (k) = v
		end

invariant

	index_set_not_void: index_set /= Void

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







end -- class INDEXABLE



