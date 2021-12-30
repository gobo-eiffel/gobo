note
	description: "[
			Sets whose items may be compared according to a total order relation;
			implemented as sorted two-way lists.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sorted_set, set, two_way_list
	representation: linked
	access: membership, min, max
	contents: generic
	date: "$Date: 2021-06-18 16:58:32 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105547 $"

class TWO_WAY_SORTED_SET [G -> COMPARABLE] inherit

	COMPARABLE_SET [G]
		rename
			symdif as subset_symdif
		export
			{NONE} subset_symdif
		undefine
			search, has, index, off,
			min, max, index_of,
			prune_all, occurrences,
			is_equal, fill, copy
		select
			 extend, put, prune
		end

	LINEAR_SUBSET [G]
		undefine
			is_equal, prune_all, fill, copy
		redefine
			merge, intersect, subtract
		select
			symdif
		end

	SORTED_TWO_WAY_LIST [G]
		rename
			extend as stwl_extend,
			has as has alias "∋",
			put as stwl_put,
			prune as stwl_prune,
			merge as stwl_merge
		export
			{NONE} stwl_extend, stwl_put, stwl_prune, stwl_merge
			{ANY}
				min, max, index,
				after, before,
				forth, finish, start,
				item, is_empty, empty, back,
				remove, search, off, go_i_th
		undefine
			changeable_comparison_criterion
		redefine
			duplicate,
			make_from_iterable
		end

create
	make,
	make_from_iterable

create {TWO_WAY_SORTED_SET}
	make_sublist

convert
	make_from_iterable ({ARRAY [G]})

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a stack with all items obtained from `other`.
		do
			make
			⟳ o: other ¦ extend (o) ⟲
		end

feature -- Element change

	extend, put (v: G)
			-- Ensure that structure includes `v'.
		local
			found: BOOLEAN
			b: BOOLEAN
		do
			search_after (v)
			b := after
			if not b then
				b := item /~ v
			end
			if b then
				put_left (v)
				back
			end
			if object_comparison then
				if after or else item /~ v then
					put_left (v)
					back
				end
			else
				from
				until
					found or after or else item /~ v
				loop
					found := item = v
					forth
				end
				if not found then
					put_left (v)
				end
				back
			end
		end

	merge (other: TRAVERSABLE_SUBSET [G])
			-- Add all items of `other'.
		local
			mode: BOOLEAN
			other_item: like item
			b: BOOLEAN
		do
			from
				mode := object_comparison
				start
				other.start
			until
				after or other.after
			loop
				other_item := other.item
				if item < other_item then
					search_after (other_item)
				end
				if not after then
					b := not mode and then item = other_item
					if not b and then mode then
						b := item ~ other_item
					end
					if b then
						forth
						other.forth
					else
						from
						until
							other.after or else other.item >= item
						loop
							put_left (other.item)
							other.forth
						end
					end
				end
			end
			from
			until
				other.after
			loop
				put_left (other.item)
				other.forth
			end
		end

feature -- Removal

	prune (v: like item)
		-- Remove `v' if present.
		do
			start
			stwl_prune (v)
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-set beginning at cursor position
			-- and having min (`n', `count' - `index' + 1) items
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
		local
			pos: CURSOR
			counter: INTEGER
		do
			pos := cursor
			Result := new_chain
			Result.finish
			Result.forth
			from
			until
				(counter = n) or else after
			loop
				Result.put_left (item)
				forth
				counter := counter + 1
			end
			go_to (pos)
		end

feature -- Basic operations

	intersect (other: like Current)
			-- Remove all items not in `other'.
		do
			from
				start
				other.start
			until
				after or other.after
			loop
				from
				until
					after or item >= other.item
				loop
					remove
				end
				if not after then
					from
					until
						other.after
						or else other.item >= item
					loop
						other.forth
					end
					if
						not other.after and then
						item ~ other.item
					then
						forth
						other.forth
					end
				end
			end
			if other.after then
				from
				until
					after
				loop
					remove
				end
			end
		end

	subtract (other: like Current)
			-- Remove all items also in `other'.
		local
			other_item: like item
		do
			from
				start
				other.start
			until
				after or other.after
			loop
				other_item := other.item
				if item < other_item then
					search_after (other_item)
				end
				if not after and then item ~ other_item then
					remove
				end
				other.forth
			end
		end

feature {NONE} -- Inapplicable

	subset_symdif (other: SUBSET [G])
			-- Inapplicable `symdif'.
		do
		end

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
