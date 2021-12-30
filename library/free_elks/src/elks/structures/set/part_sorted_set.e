note
	description: "[
		Sets whose items may be compared according to a partial order relation
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

class PART_SORTED_SET [G -> PART_COMPARABLE] inherit

	LINEAR_SUBSET [G]
		undefine
			prune_all, changeable_comparison_criterion, copy, is_equal, fill
		redefine
			merge
		select
			extend, prune, put
		end

	PART_SORTED_TWO_WAY_LIST [G]
		rename
			extend as pstwl_extend,
			has as has alias "∋",
			prune as pstwl_prune,
			put as pstwl_put,
			merge as pstwl_merge
		export
			{ANY}
				duplicate, forth, item, after, start,
				put_left, finish, readable, writable, valid_cursor_index
			{PART_SORTED_SET} cursor, go_to, first_element, last_element, valid_cursor
			{NONE} all
		redefine
			duplicate,
			make_from_iterable
		end

create
	make,
	make_from_iterable

create {PART_SORTED_SET}
	make_sublist

convert
	make_from_iterable ({ARRAY [G]})

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a set with all items obtained from `other`.
		do
			make
			⟳ o: other ¦ extend (o) ⟲
		end

feature -- Element change

	extend, put (v: G)
			-- Ensure that structure includes `v'.
		do
			search_after (v)
			if after or else v /~ item then
				put_left (v)
			end
		end

	merge (other: TRAVERSABLE_SUBSET [G])
			-- Add all items of `other'.
		local
			i: like item
			o: like item
		do
			from
				start
				other.start
			until
				other.after or else after
			loop
				i := item
				o := other.item
				if i /= Void and then o /= Void then
					if i < o then
						forth
					elseif i ~ o then
						forth
						other.forth
					else -- i > o
						put_left (o)
						other.forth
					end
				end
			end
			if after then
				from
				until
					other.after
				loop
					put_left (other.item)
					other.forth
				end
			end
		end

feature -- Removal

	prune (v: like item)
		-- Remove `v' if present.
		do
			start
			pstwl_prune (v)
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
