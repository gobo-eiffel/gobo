note
	description: "[
			Sequential, dynamically modifiable lists,
			without commitment to a particular representation
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dynamic_list, sequence
	access: index, cursor, membership
	contents: generic
	date: "$Date: 2021-02-22 14:28:59 +0000 (Mon, 22 Feb 2021) $"
	revision: "$Revision: 105199 $"

deferred class DYNAMIC_LIST [G] inherit

	LIST [G]
		undefine
			prune,
			remove, prune_all
		end

	DYNAMIC_CHAIN [G]
		undefine
			is_equal
		redefine
			put_right,
			remove_left,
			remove_right,
			wipe_out
		end

feature -- Element change

	put_left (v: like item)
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		local
			temp: like item
		do
			if is_empty then
				put_front (v)
			elseif after then
				back
				put_right (v)
				move (2)
			else
				temp := item
				replace (v)
				put_right (temp)
				forth
			end
		end

	put_right (v: like item)
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		deferred
		end

	merge_left (other: like Current)
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		do
			from
				other.start
			until
				other.is_empty
			loop
				put_left (other.item)
				other.remove
			end
		end

	merge_right (other: like Current)
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		do
			from
				other.finish
			until
				other.is_empty
			loop
				put_right (other.item)
				other.back
				other.remove_right
			end
		end

feature -- Removal

	remove
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		deferred
		ensure then
			after_when_empty: is_empty implies after
		end

	remove_left
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		deferred
		end

	remove_right
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		deferred
		end

	wipe_out
			-- Remove all items.
		do
			Precursor
			back
		ensure then
			is_before: before
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
