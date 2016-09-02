note
	description: "External iteration cursor for {READABLE_INDEXABLE}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2016-04-13 06:29:38 -0700 (Wed, 13 Apr 2016) $"
	revision: "$Revision: 98619 $"

deferred class
	TYPED_INDEXABLE_ITERATION_CURSOR [G, H -> READABLE_INDEXABLE [G]]

inherit
	INDEXABLE_ITERATION_CURSOR [G]

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := target [target_index]
		end

	reversed alias "-": TYPED_INDEXABLE_ITERATION_CURSOR [G, READABLE_INDEXABLE [G]]
			-- Reversed cursor of the iteration.
		deferred
		ensure then
			same_target: Result.target = target
		end

	incremented alias "+" (n: like step): TYPED_INDEXABLE_ITERATION_CURSOR [G, READABLE_INDEXABLE [G]]
			-- Cursor for the iteration with step increased by `n'.
		deferred
		ensure then
			same_target: Result.target = target
		end

	decremented alias "-" (n: like step): TYPED_INDEXABLE_ITERATION_CURSOR [G, READABLE_INDEXABLE [G]]
			-- Cursor for the iteration with step decreased by `n'.
		deferred
		ensure then
			same_target: Result.target = target
		end

	with_step (n: like step): TYPED_INDEXABLE_ITERATION_CURSOR [G, READABLE_INDEXABLE [G]]
			-- Cursor for the iteration with step set to `n'.
		deferred
		ensure then
			same_target: Result.target = target
		end

feature {TYPED_INDEXABLE_ITERATION_CURSOR} -- Access

	target: H
			-- Associated structure used for iteration.
		deferred
		ensure
			target_attached: attached Result
		end

note
	copyright: "Copyright (c) 1984-2016, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
