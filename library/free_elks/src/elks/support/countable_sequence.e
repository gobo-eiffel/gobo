note
	description: "Infinite sequences, indexed by integers"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	names: countable_sequence, infinite_sequence;
	access: cursor, membership;
	contents: generic;
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

deferred class COUNTABLE_SEQUENCE [G]

inherit

	COUNTABLE [G]
		rename
			item as i_th
		end

	ACTIVE [G]
		export
			{NONE}
					fill, prune_all, put,
					prune,
					wipe_out, replace, remove
		redefine
			replaceable
		end

	LINEAR [G]
		redefine
			linear_representation
		end

feature -- Access

	index: INTEGER
			-- Index of current position

	item: G
			-- Item at current position
		do
			Result := i_th (index)
		end

feature -- Status report

	after: BOOLEAN = False
			-- Is current position past last item? (Answer: no.)

	extendible: BOOLEAN = False
			-- May items be added? (Answer: no.)

	prunable: BOOLEAN = False
			-- May items be removed? (Answer: no.)

	readable: BOOLEAN = True
			-- Is there a current item that may be read?
			-- (Answer: yes.)

	writable: BOOLEAN = False
			-- Is there a current item that may be written?
			-- (Answer: no.)

	replaceable: BOOLEAN = False
			-- <Precursor>

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			index := index + 1
		end

	start
			-- Move to first position.
		do
			index := 1
		end

feature {NONE} -- Inapplicable

	extend (v: G)
			-- Add `v' at end.
		do
		end

	finish
			-- Move to last position.
		do
		ensure then
			failure: False
		end

	linear_representation: LINEAR [G]
			-- Representation as a linear structure
		do
				-- Make sure Result is attached.
			create {LINKED_LIST [G]} Result.make
		end

	prune (v: G)
			-- Remove first occurrence of `v', if any.
		do
		end

	put (v: G)
			-- Add `v' to the right of current position.
		do
		end

	remove
			-- Remove item to the right of current position.
		do
		end

	replace (v: G)
			-- Replace by `v' item at current position.
		do
		end

	wipe_out
			-- Remove all items.
		do
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
