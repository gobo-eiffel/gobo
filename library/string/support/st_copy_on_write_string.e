indexing

	description:

		"STRINGs with copy-on-write semantics "

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_COPY_ON_WRITE_STRING

inherit

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Inisitalization

	make (a_string: STRING) is
			-- Establish invariant.
		require
			string_not_void: a_string /= Void
		do
			item := a_string
		ensure
			item_set: item = a_string
			unsafe_to_edit: not changed
		end

feature -- Access

	item: STRING
			-- String

	safe_item: STRING is
			-- Version of `item' that is safe for editting
		do
			clone_if_unchanged
			Result := item
		ensure
			safe_to_edit: changed
			same_as_item: Result /= Void and then Result = item
		end

feature -- Element change
	
	put (c: CHARACTER; i: INTEGER) is
			-- Replace character at index `i' by `c'
		require
			valid_index: item.valid_index (i)
		do
			clone_if_unchanged
			item.put (c, i)
		ensure
			stable_count: item.count = old item.count
			replaced: item.item (i) = c
			safe_to_edit: changed
		end

	append_character (c: CHARACTER) is
			-- Append `c' at end.
		do
			clone_if_unchanged
			item.append_character (c)
		ensure
			new_count: item.count = old item.count + 1
			appended: item.item (item.count) = c
			safe_to_edit: changed
		end

	append_string (s: STRING) is
			-- Append a copy of `s' at end.
		require
			s_not_void: s /= Void
		do
			if changed then
				item := STRING_.appended_string (item, s)
			else
				item := STRING_.concat (item, s)
				changed := True
			end
		ensure
			safe_to_edit: changed
		end

	fill_with (c: CHARACTER) is
			-- Replace every character with `c'.
		do
			clone_if_unchanged
			item.fill_with (c)
		ensure
			same_count: old item.count = item.count
			filled: item.occurrences (c) = item.count
			safe_to_edit: changed
		end

	insert_character (c: CHARACTER; i: INTEGER) is
			-- Insert `c' at index `i', shifting characters between
			-- ranks `i' and `count' rightwards.
		require
			valid_insertion_index: 1 <= i and i <= item.count + 1
		do
			clone_if_unchanged
			item.insert_character (c, i)
		ensure
			one_more_character: item.count = old item.count + 1
			inserted: item.item (i) = c
			safe_to_edit: changed
		end
	
feature {NONE} -- Implementation

	changed: BOOLEAN
			-- Has `item' been changed since creation of `Current'?

	clone_if_unchanged is
			-- Clone `item' if unchanged.
		do
			if not changed then
				item := STRING_.cloned_string (item)
				changed := True
			end
		ensure
			same_item_if_previously_changed: old changed implies item = old item
			cloned_if_not_previously_changed: not old changed implies item /= old item
			safe_to_edit: changed
		end

invariant

	item_not_void: item /= Void

end
	
