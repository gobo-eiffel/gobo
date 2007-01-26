indexing

	description:

		"Improved HASH_TABLE not using `is_equal' to compare keys. %
		%Use a GE_EQUALITY_TESTER instead to avoid CAT-calls."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GE_HASH_TABLE [G, H -> HASHABLE]

inherit

	HASH_TABLE [G, H]
		rename
			make as make_map
		redefine
			make_map,
			accommodate,
			internal_search
		end

create

	make, make_map

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
			-- Use `is_equal' to compare keys.
		do
			make_map (n)
			create key_equality_tester
		end

	make_map (n: INTEGER) is
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
			-- Use `=' to compare keys.
		do
			Precursor (n)
		end

	accommodate (n: INTEGER) is
			-- Reallocate table with enough space for `n' items;
			-- keep all current items.
		local
			i: INTEGER
			new_table: GE_HASH_TABLE [G, H]
			default_key: H
			l_content: like content
			l_keys: like keys
		do
				-- (Could also use iteration facilities.)
			from
				create new_table.make_map (count.max (n))
				new_table.set_key_equality_tester (key_equality_tester)
				l_content := content
				l_keys := keys
			until
				i = capacity
			loop
				if occupied (i) then
					check
						not new_table.soon_full
							-- See invariant clause `sized_generously_enough'
					end
					new_table.put (l_content.item (i), l_keys.item (i))
				end
				i := i + 1
			end

			if has_default then
				new_table.put (l_content.item (capacity), default_key)
			end

			set_content (new_table.content)
			set_keys (new_table.keys)
			set_deleted_marks (new_table.deleted_marks)

			capacity := new_table.capacity
			used_slot_count := count
			iteration_position := new_table.iteration_position
		end

feature -- Access

	key_equality_tester: GE_EQUALITY_TESTER [H]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

feature -- Status report

	key_equality_tester_settable (a_tester: like key_equality_tester): BOOLEAN is
			-- Can `set_key_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
		do
			Result := is_empty
		end

feature -- Setting

	set_key_equality_tester (a_tester: like key_equality_tester) is
			-- Set `key_equality_tester' to `a_tester'.
			-- A void key equality tester means that `='
			-- will be used as comparison criterion.
		require
			key_equality_tester_settable: key_equality_tester_settable (a_tester)
		do
			key_equality_tester := a_tester
		ensure
			key_equality_tester_set: key_equality_tester = a_tester
		end

feature {NONE} -- Implementation

	internal_search (key: H) is
			-- Search for item of key `key'.
			-- If successful, set `position' to index
			-- of item with this key (the same index as the key's index).
			-- If not, set `position' to possible position for insertion,
			-- and set status to `found' or `not_found'.
		local
			default_key: H
			hash_value, increment, l_pos, l_capacity: INTEGER
			first_deleted_position: INTEGER
			stop: BOOLEAN
			l_keys: like keys
			l_deleted_marks: like deleted_marks
			l_test: BOOLEAN
		do
			first_deleted_position := Impossible_position
			if key = default_key then
				position := capacity
				if has_default then
					control := Found_constant
				else
					control := Not_found_constant
				end
			else
				from
					l_keys := keys
					l_deleted_marks := deleted_marks
					l_capacity := capacity
					hash_value := key.hash_code
					increment := 1 + hash_value \\ (l_capacity - 1)
					l_pos := (hash_value \\ l_capacity)
				until
					stop
				loop
					if l_deleted_marks.item (l_pos) then
						if first_deleted_position = Impossible_position then
							first_deleted_position := l_pos
						end
							-- Go to next increment.
						l_pos := (l_pos + increment) \\ l_capacity
					elseif l_keys.item (l_pos) = default_key then
						stop := True
						control := Not_found_constant
					else
						if key_equality_tester /= Void then
							l_test := key_equality_tester.test (l_keys.item (l_pos), key)
						else
							l_test := l_keys.item (l_pos) = key
						end
						if l_test then
							stop := True
							control := Found_constant
						else
								-- Go to next increment.
							l_pos := (l_pos + increment) \\ l_capacity
						end
					end
				end
				position := l_pos
			end
			deleted_position := first_deleted_position
		end

end
