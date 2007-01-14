indexing
	description:
		"Subsets that are traversable sequentially"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: traversable_subset, set, subset;
	access: sequential;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class TRAVERSABLE_SUBSET [G] inherit

	SUBSET [G]
		undefine
			disjoint, symdif
		end

feature -- Access

	item: G is
			-- Current item
		require
			not_off: not off
		deferred
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items
		deferred
		end
	 
feature -- Comparison

	disjoint (other: TRAVERSABLE_SUBSET [G]): BOOLEAN is
			-- Do current set and `other' have no
			-- items in common?
		local
			s: SUBSET_STRATEGY [G]
		do
			if not is_empty and not other.is_empty then
				s := subset_strategy (other)
				Result := s.disjoint (Current, other)
			else
				Result := True
			end
		end
		
	is_subset (other: TRAVERSABLE_SUBSET [G]): BOOLEAN is
			-- Is current set a subset of `other'?
		do
			if not other.is_empty and then count <= other.count then
				from
					start
				until
					off or else not other.has (item)
				loop
					forth
				end
				if off then Result := True end
			elseif is_empty then
				Result := True
			end
		end

feature -- Status report

	after: BOOLEAN is
			-- Is cursor behind last item?
		deferred
		end

	off: BOOLEAN is
			-- Is cursor off the active items?
		deferred
		end
	 
	is_empty: BOOLEAN is
			-- Is container empty?
		deferred
		end
	 
feature -- Cursor movement

	start is
			-- Move cursor to first item.
		deferred
		end

	forth is
			-- Move cursor to next element.
		require
			not_after: not after
		deferred
		end
		
feature -- Element change

	merge (other: CONTAINER [G]) is
			-- Add all items of `other'.
		local
			lin_rep: LINEAR [G]
		do 
			lin_rep ?= other
			if lin_rep = Void then
					-- `other' is not a descendant of LINEAR, therefore  we
					-- must convert its contents into a linear representation.
				lin_rep := other.linear_representation
			end
			from
				lin_rep.start
			until
				lin_rep.off
			loop
				extend (lin_rep.item)
				lin_rep.forth
			end
		end

feature -- Removal

	remove is
			-- Remove current item.
		require
			not_off: not off
		deferred
		end
	 
feature -- Basic operations

	symdif (other: TRAVERSABLE_SUBSET [G]) is
			-- Remove all items also in `other', and add all
			-- items of `other' not already present.
		local
			s: SUBSET_STRATEGY [G]
		do
			if not other.is_empty then
				if is_empty then
					from
						other.start
					until
						other.after
					loop
						extend (other.item)
					end
				else
					s := subset_strategy (other)
					s.symdif (Current, other)
				end
			end
		end

	intersect (other: TRAVERSABLE_SUBSET [G]) is
			-- Remove all items not in `other'.
			-- No effect if `other' `is_empty'.
		do
			if not other.is_empty then
				from
					start
					other.start
				until
					off
				loop
					if other.has (item) then
						forth
					else
						remove
					end
				end
			else
				wipe_out
			end
		end

	subtract (other: TRAVERSABLE_SUBSET [G]) is
			-- Remove all items also in `other'.
		do
			if not (other.is_empty or is_empty) then
				from
					start
					other.start
				until
					off
				loop
					if other.has (item) then
						remove
					else
						forth
					end
				end
			end
		end

feature {NONE} -- Implementation

	subset_strategy_selection (v: G; other: TRAVERSABLE_SUBSET [G]): 
							SUBSET_STRATEGY [G] is
			-- Strategy to calculate several subset features selected depending
			-- on the dynamic type of `v' and `other'
		require
			item_exists: v /= Void
			other_exists: other /= Void
		deferred
		ensure
			strategy_set: Result /= Void
		end

	subset_strategy (other: TRAVERSABLE_SUBSET [G]): SUBSET_STRATEGY [G] is
			-- Subset strategy suitable for the type of the contained elements.
		require
			not_empty: not is_empty
		do
			start
			check
				not_off: not off
					-- Because we are at the first element of structure and the
					-- structure is not empty.
			end
			Result := subset_strategy_selection (item, other)
		end

invariant

	empty_definition: is_empty = (count = 0)
	count_range: count >= 0

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







end -- class TRAVERSABLE_SUBSET
