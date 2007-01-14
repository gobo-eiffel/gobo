indexing

	description: "[
		Sequential, dynamically modifiable lists,
		without commitment to a particular representation
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: dynamic_list, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DYNAMIC_LIST [G] inherit

	LIST [G]
		undefine
			prune,
			sequential_index_of, sequential_has,
			remove, prune_all
		end

	DYNAMIC_CHAIN [G]
		rename
			wipe_out as chain_wipe_out
		export
			{NONE} chain_wipe_out
		undefine
			is_equal
		redefine
			put_left, put_right,
			remove_left, remove_right
		end

	DYNAMIC_CHAIN [G]
		undefine
			is_equal
		redefine
			put_left, put_right,
			remove_left, remove_right, wipe_out
		select
			wipe_out
		end

feature -- Element change

	put_left (v: like item) is
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

	put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		deferred
		end

	merge_left (other: like Current) is
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

	merge_right (other: like Current) is
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

	remove is
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		deferred
		ensure then
			after_when_empty: is_empty implies after
		end

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		deferred
		end

	remove_right is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		deferred
		end

	wipe_out is
			-- Remove all items.
		do
			chain_wipe_out
			back
		ensure then
			is_before: before
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







end -- class DYNAMIC_LIST



