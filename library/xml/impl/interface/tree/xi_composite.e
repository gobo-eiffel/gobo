indexing

	description:

		"Objects that represent xml nodes that can contain other xml nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_COMPOSITE

inherit

	XI_NODE

	DS_BILINEAR [XM_NODE]
		export
			{XM_COMPOSITE} internal_cursor;
			{XM_COMPOSITE, DS_CURSOR} cursor_item, cursor_same_position, cursor_go_to, cursor_is_first, cursor_after, cursor_start, cursor_forth, cursor_search_forth, cursor_go_after, cursor_is_last, cursor_before, cursor_finish, cursor_back, cursor_search_back, cursor_go_before, cursor_off
		end

feature {ANY} -- Status report

feature {ANY} -- Element change

	put_first, force_first (v: XM_NODE) is
			-- Add `v' to beginning of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		deferred
		end

	put_last, force_last (v: XM_NODE) is
			-- Add `v' to end of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		deferred
		end

	put_left_cursor, force_left_cursor (v: XM_NODE; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
			-- (Performance: O(1).)
		deferred
		end

	put_right_cursor, force_right_cursor (v: XM_NODE; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_right (v)'.)
			-- (Performance: O(1).)
		deferred
		end

	extend_first, append_first (other: DS_LINEAR [XM_NODE]) is
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		deferred
		end

	extend_last, append_last (other: DS_LINEAR [XM_NODE]) is
			-- Add items of `other' to end of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		deferred
		end

	extend_left_cursor, append_left_cursor (other: DS_LINEAR [XM_NODE]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_left (other)'.)
			-- (Performance: O(other.count).)
		deferred
		end

	extend_right_cursor, append_right_cursor (other: DS_LINEAR [XM_NODE]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_right (other)'.)
			-- (Performance: O(other.count).)
		deferred
		end

feature -- Removal

	remove_first is
			-- Remove item at beginning of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(1).)
		deferred
		end

	remove_last is
			-- Remove item at end of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count).)
		deferred
		end

	remove_at_cursor (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
			-- (Performance: O(1).)
		deferred
		end

	remove_left_cursor (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cusor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
			-- (Performance: O(a_cursor.index).)
		deferred
		end

	remove_right_cursor (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_right'.)
			-- (Performance: O(1).)
		deferred
		end

	prune_first (n: INTEGER) is
			-- Remove `n' first items from list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		deferred
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		deferred
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
			-- (Performance: O(2*a_cursor.index-n).)
		deferred
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_right (n)'.)
			-- (Performance: O(n).)
		deferred
		end

	keep_first (n: INTEGER) is
			-- Keep `n' first items in list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		deferred
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		deferred
		end

	delete (v: XM_NODE) is
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
			-- (Performance: O(count).)
		deferred
		end

end -- class XI_COMPOSITE


