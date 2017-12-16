note
	description: "[
		Stacks (last-in, first-out dispensers), without commitment
		to a particular representation
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: stack, dispenser;
	access: fixed, lifo, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class STACK [G] inherit

	DISPENSER [G]
		export
			{NONE} prune, prune_all
		redefine
			extend, force, put, fill
		end

feature -- Element change

	extend, force, put (v: like item)
			-- Push `v' onto top.
		deferred
		ensure then
			item_pushed: item = v
		end

	replace (v: like item)
			-- Replace top item by `v'.
		do
			remove
			extend (v)
		end

	fill (other: LINEAR [G])
			-- Fill with as many items of `other' as possible.
			-- Fill items with greatest index from `other' first.
			-- Items inserted with lowest index (from `other') will
			-- always be on the top of stack.
			-- The representations of `other' and current structure
			-- need not be the same.
		local
			temp: ARRAYED_STACK [G]
		do
			create temp.make (0)
			from
				other.start
			until
				other.off
			loop
				temp.extend (other.item)
				other.forth
			end
			from
			until
				temp.is_empty or else not extendible
			loop
				extend (temp.item)
				temp.remove
			end
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
