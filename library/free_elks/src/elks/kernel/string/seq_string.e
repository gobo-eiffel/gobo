note
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2015-12-17 05:34:17 -0800 (Thu, 17 Dec 2015) $"
	revision: "$Revision: 98279 $"

class SEQ_STRING inherit

	STRING
		rename
			precede as string_precede,
			prepend as string_prepend,
			mirrored as string_mirrored,
			mirror as string_mirror,
			share as string_share,
			wipe_out as string_wipe_out
		export
			{ANY}
				linear_representation
		undefine
			linear_representation
		redefine
			has, prune
		end

	SEQUENCE [CHARACTER]
		rename
			append as seq_append,
			item as current_item,
			index_of as index_of_occurrence,
			put as sequence_put,
			remove as remove_current_item
		export
			{NONE}
				sequence_put, seq_append
		undefine
			occurrences, out, copy, is_equal, prune_all,
			changeable_comparison_criterion, do_all, do_if,
			there_exists, for_all
		redefine
			has, index_of_occurrence, prune
		select
			wipe_out, sequence_put
		end

create

	make

feature -- Access

	search_after (c: CHARACTER)
			-- Move cursor to first position
			-- (at or after current cursor position)
			-- where `current_item' and `c' are identical.
		do
			if not off then
				index := index_of (c, index)
				if index = 0 then
					index := count + 1
				end
			end
		end

	search_before (c: CHARACTER)
			-- Move cursor to greatest position at or before cursor
			-- where `current_item' and `c' are identical;
			-- go before if unsuccessful.
		local
			str: like Current
		do
			str := mirrored
			if not str.off then
				index := count + 1 - str.index_of (c, str.index)
				if index = count + 1 then
					index := 0
				end
			end
		end

	search_string_after (s: STRING; fuzzy: INTEGER)
			-- Move cursor to first position
			-- (at or after cursor position) where `substring
			-- (index, index + s.count)' and `s' are identical.
			-- Go after if unsuccessful.
			-- The 'fuzzy' parameter is the maximum allowed number
			-- of mismatches within the pattern. A 0 means an exact match.
		do
			if not off then
				index := fuzzy_index (s, index, fuzzy)
				if index = 0 then
					index := count + 1
				end
			end
		end

	search_string_before (s: STRING; fuzzy: INTEGER)
			-- Move cursor to first position
			-- (at or before cursor position) where `substring
			-- (index, index + s.count)' and `s' are identical.
			-- Go before if unsuccessful.
			-- The 'fuzzy' parameter is the maximum allowed number
			-- of mismatches within the pattern. A 0 means an exact match.
		do
			if not off then
				index := count - mirrored.fuzzy_index (s.mirrored, count - index, fuzzy) + 1
				if index = count + 1 then
					index := 0
				else
					index := index - s.count + 1
				end
			end
		end

	current_item: CHARACTER
			-- Current item
		do
			Result := item (index)
		end

	index: INTEGER
			-- Index of `current_item', if valid
			-- Valid values are between 1 and `count' (if `count' > 0).

	index_of_occurrence (c: CHARACTER; i: INTEGER): INTEGER
			-- Index of `i'-th occurrence of `c'.
			-- 0 if none.
		local
			occur: INTEGER
		do
			if not is_empty then
				from
					Result := index_of (c, 1)
					if Result /= 0 then
						occur := 1
					end
				until
					Result = 0 or else occur = i
				loop
					if Result = count then
						Result := 0
					else
						Result := index_of (c, Result + 1)
						if Result /= 0 then
							occur := occur + 1
						end
					end
				end
			end
		ensure then
			Index_value: (Result = 0) or item (Result) = c
		end



	has (c: CHARACTER): BOOLEAN
			-- Does string include `c'?
		do
			if not is_empty then
				Result := index_of (c, 1) /= 0
			end
		end

feature -- Status report

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?
		do
			Result := index < 1
		end

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := index > count
		end

feature -- Cursor movement

	start
			-- Move to first position.
		do
			index := 1
		end

	finish
			-- Move to last position.
		do
			index := count
		end

	back
			-- Move to previous position.
		do
			index := index - 1
		end

	forth
			-- Move to next position.
		do
			index := index + 1
		end

feature -- Element change

	replace (c: CHARACTER)
			-- Replace current item by `c'.
		do
			put (c, index)
		end

	share (other: like Current)
			-- Make string share the text of `other'.
		require
			argument_not_void: other /= Void
		do
			string_share (other)
			index := other.index
		ensure
			shared_index: other.index = index
		end

	precede (c: CHARACTER)
			-- Add `c' at front.
		do
			string_precede (c)
			index := index + 1
		ensure
			new_index: index = old index + 1
		end

	prepend (s: STRING)
			-- Prepend a copy of `s' at front.
		require
			argument_not_void: s /= Void
		do
			string_prepend (s)
			index := index + s.count
		ensure
			new_index: index = old index + s.count
		end

feature -- Removal

	prune (c: CHARACTER)
			-- Remove first occurrence of `c'.
		local
			i: INTEGER
		do
			if count /= 0 then
				i := index_of (c, 1)
				if i /= 0 then
					remove (i)
				end
			end
		end

	remove_current_item
			-- Remove current item.
		do
			remove (index)
		end

	wipe_out
			-- Clear out all characters.
		do
			string_wipe_out
			index := 0
		end

feature -- Iteration

	do_all (action: PROCEDURE [CHARACTER])
			-- Apply `action' to every item, from first to last.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		do
			area.do_all_in_bounds (action, 0, area.count - 1)
		end

	do_if (action: PROCEDURE [CHARACTER]; test: FUNCTION [CHARACTER, BOOLEAN])
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		do
			area.do_if_in_bounds (action, test, 0, area.count - 1)
		end

	there_exists (test: FUNCTION [CHARACTER, BOOLEAN]): BOOLEAN
			-- Is `test' true for at least one item?
		do
			Result := area.there_exists_in_bounds (test, 0, area.count - 1)
		end

	for_all (test: FUNCTION [CHARACTER, BOOLEAN]): BOOLEAN
			-- Is `test' true for all items?
		do
			Result := area.for_all_in_bounds (test, 0, area.count - 1)
		end

feature -- Duplication

	mirrored: like Current
			-- Current string read from right to left.
			-- The result string has the same `capacity' and the
			-- same current position (i.e. the cursor is pointing
			-- at the same item)
		do
			Result := string_mirrored
			if not after then
				from
					Result.start
				until
					Result.index = count - index + 1
				loop
					Result.forth
				end
			end
		ensure
			mirrored_index: Result.index = count - index + 1
			same_count: Result.count = count
		--	reverse_entries:
		--	for all `i: 1..count, Result.item (i) = item (count + 1 - i)'
		end

	mirror
			-- Reverse the characters order.
			-- "Hello world" -> "dlrow olleH".
			-- The current position will be on the same item
			-- as before.
		do
			string_mirror
			index := count + 1 - index
		ensure
			same_count: count = old count
			mirrored_index: index = count - old index + 1
		--	reverse_entries:
		--	for all `i: 1..count, item (i) = old item (count + 1 - i)'
		end

feature {NONE} -- Inapplicable

	go_to (r: CURSOR)
			-- Go to position marked `r'.
		do
		end

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
