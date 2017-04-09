note
	description: "Hash tables, used to store items identified by hashable keys"
	library: "Free implementation of ELKS library"
	instructions: "See instructions at the end of the class."
	warning: "[
		Modifying an object used as a key by an item present in a table will
		cause incorrect behavior. If you will be modifying key objects,
		pass a clone, not the object itself, as key argument to
		`put' and `replace_key'.
	]"

class HASH_TABLE [G, K -> detachable HASHABLE] inherit

	UNBOUNDED [detachable G]
		rename
			has as has_item
		redefine
			has_item, copy, is_equal
		end

	TABLE [detachable G, K]
		rename
			has as has_item,
			extend as collection_extend
		export
			{NONE} prune_all
		redefine
			copy, is_equal, wipe_out, has_item
		end

	TABLE_ITERABLE [G, K]
		redefine
			copy, is_equal
		end

	READABLE_INDEXABLE [G]
		rename
			item as iteration_item,
			lower as iteration_lower,
			upper as iteration_upper,
			valid_index as valid_iteration_index
		redefine
			copy, is_equal, new_cursor
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
			{ANY} mismatch_information
		undefine
			copy, is_equal
		redefine
			correct_mismatch
		end

create
	make,
	make_equal

feature -- Initialization

	make (n: INTEGER)
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
		require
			n_non_negative: n >= 0
		local
			clever: PRIMES
			l_default_value: detachable G
			l_default_key: detachable K
			l_size: INTEGER
		do
			create clever
			l_size := n.Max (minimum_capacity)
			l_size := l_size + l_size // 2 + 1
			l_size := clever.higher_prime (l_size)
			capacity := l_size
					-- Position `capacity' ignored by hash sequences,
					-- used to store value for default key.
			create content.make_empty (n + 1)
			create keys.make_empty (n + 1)
			create deleted_marks.make_filled (False, n + 1)
			create indexes_map.make_filled (ht_impossible_position, l_size + 1)
			iteration_position := n + 1
			count := 0
			deleted_item_position := ht_impossible_position
			control := 0
			found_item := l_default_value
			has_default := False
			item_position := 0
			ht_lowest_deleted_position := ht_max_position
			ht_deleted_item := l_default_value
			ht_deleted_key := l_default_key
		ensure
			breathing_space: n < capacity
			more_than_minimum: capacity > minimum_capacity
			no_status: not special_status
		end

	make_equal (n: INTEGER)
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
			-- Use `~' to compare items.
		require
			n_non_negative: n >= 0
		do
			make (n)
			compare_objects
		ensure
			breathing_space: n < capacity
			more_than_minimum: capacity > minimum_capacity
			no_status: not special_status
			compare_objects: object_comparison
		end

	accommodate (n: INTEGER)
			-- Reallocate table with enough space for `n' items;
			-- keep all current items.
		require
			n >= 0
		local
			i, nb: INTEGER
			new_table: like Current
			l_content: like content
			l_keys: like keys
		do
			from
				new_table := empty_duplicate (keys.count.max (n))
				l_content := content
				l_keys := keys
				nb := l_keys.count
			until
				i = nb
			loop
				if occupied (i) then
					new_table.put (l_content.item (i), l_keys.item (i))
				end
				i := i + 1
			end
			if has_default then
				i := indexes_map.item (capacity)
				new_table.put (l_content.item (i), keys.item (i))
			end

			set_content (new_table.content)
			set_keys (new_table.keys)
			set_deleted_marks (new_table.deleted_marks)
			set_indexes_map (new_table.indexes_map)
			capacity := new_table.capacity
			iteration_position := new_table.iteration_position
		ensure
			count_not_changed: count = old count
			breathing_space: count < capacity
		end

feature -- Access

	found_item: detachable G
			-- Item, if any, yielded by last search operation

	item alias "[]", at alias "@" (key: K): detachable G assign force
			-- Item associated with `key', if present
			-- otherwise default value of type `G'.
		note
			option: stable
		local
			l_default_key: detachable K
			hash_value, increment, l_pos, l_item_pos, l_capacity: INTEGER
			l_first_deleted_position: INTEGER
			stop: INTEGER
			l_keys: like keys
			l_indexes: like indexes_map
			l_deleted_marks: like deleted_marks
			l_key: K
		do
			l_first_deleted_position := ht_impossible_position
			if key = l_default_key or key = Void then
				if has_default then
					Result := content.item (indexes_map.item (capacity))
				end
			else
				from
					l_keys := keys
					l_indexes := indexes_map
					l_deleted_marks := deleted_marks
					l_capacity := capacity
					stop := l_capacity
					hash_value := hash_code_of (key)
					increment := 1 + hash_value \\ (l_capacity - 1)
					l_item_pos := (hash_value \\ l_capacity) - increment
				until
					stop = 0
				loop
						-- Go to next increment.
					l_item_pos := (l_item_pos + increment) \\ l_capacity
					l_pos := l_indexes [l_item_pos]
					if l_pos >= 0 then
						l_key := l_keys.item (l_pos)
						debug ("detect_hash_table_catcall")
							check
								catcall_detected: l_key /= Void and then l_key.same_type (key)
							end
						end
						if same_keys (l_key, key) then
								-- We found our item
							stop := 1
							Result := content.item (l_pos)
						end
					elseif l_pos = ht_impossible_position then
						stop := 1
					elseif l_first_deleted_position = ht_impossible_position then
						l_pos := -l_pos + ht_deleted_position
						check l_pos_valid: l_pos < l_deleted_marks.count end
						if not l_deleted_marks [l_pos] then
							stop := 1
						else
							l_first_deleted_position := l_item_pos
						end
					end
					stop := stop - 1
				end
			end
		ensure then
			default_value_if_not_present:
				(not (has (key))) implies (Result = computed_default_value)
		end

	has (key: K): BOOLEAN
			-- Is there an item in the table with key `key'?
		local
			l_default_key: detachable K
			hash_value, increment, l_pos, l_item_pos, l_capacity: INTEGER
			l_first_deleted_position: INTEGER
			stop: INTEGER
			l_keys: like keys
			l_indexes: like indexes_map
			l_deleted_marks: like deleted_marks
			l_key: K
		do
			l_first_deleted_position := ht_impossible_position
			if key = l_default_key or key = Void then
				if has_default then
					Result := True
				end
			else
				from
					l_keys := keys
					l_indexes := indexes_map
					l_deleted_marks := deleted_marks
					l_capacity := capacity
					stop := l_capacity
					hash_value := hash_code_of (key)
					increment := 1 + hash_value \\ (l_capacity - 1)
					l_item_pos := (hash_value \\ l_capacity) - increment
				until
					stop = 0
				loop
						-- Go to next increment.
					l_item_pos := (l_item_pos + increment) \\ l_capacity
					l_pos := l_indexes [l_item_pos]
					if l_pos >= 0 then
						l_key := l_keys.item (l_pos)
						debug ("detect_hash_table_catcall")
							check
								catcall_detected: l_key /= Void and then l_key.same_type (key)
							end
						end
						if same_keys (l_key, key) then
								-- We found our item
							stop := 1
							Result := True
						end
					elseif l_pos = ht_impossible_position then
						stop := 1
					elseif l_first_deleted_position = ht_impossible_position then
						l_pos := -l_pos + ht_deleted_position
						check l_pos_valid: l_pos < l_deleted_marks.count end
						if not l_deleted_marks [l_pos] then
							stop := 1
						else
							l_first_deleted_position := l_item_pos
						end
					end
					stop := stop - 1
				end
			end
		ensure then
			default_case: (key = computed_default_key) implies (Result = has_default)
		end

	has_key (key: K): BOOLEAN
			-- Is there an item in the table with key `key'? Set `found_item' to the found item.
		local
			old_position: INTEGER
			l_default_value: detachable G
		do
			old_position := item_position
			internal_search (key)
			Result := found
			if Result then
				found_item := content.item (position)
			else
				found_item := l_default_value
			end
			item_position := old_position
		ensure then
			default_case: (key = computed_default_key) implies (Result = has_default)
			found: Result = found
			item_if_found: found implies (found_item = item (key))
		end

	has_item (v: detachable G): BOOLEAN
			-- Does structure include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, nb: INTEGER
			l_content: like content
		do
			if has_default then
				Result := v = content.item (indexes_map.item (capacity))
			end
			if not Result then
				l_content := content
				nb := l_content.count
				if object_comparison then
					from
					until
						i = nb or else Result
					loop
						Result := occupied (i) and then (v ~ l_content.item (i))
						i := i + 1
					end
				else
					from
					until
						i = nb or else Result
					loop
						Result := occupied (i) and then (v = l_content.item (i))
						i := i + 1
					end
				end
			end
		end

	current_keys: ARRAY [K]
			-- New array containing actually used keys, from 1 to `count'
		local
			j: INTEGER
			old_iteration_position: INTEGER
		do
			if is_empty then
				create Result.make_empty
			else
				old_iteration_position := iteration_position
				from
					start
					create Result.make_filled (key_for_iteration, 1, count)
					j := 1
					forth
				until
					off
				loop
					j := j + 1
					Result.put (key_for_iteration, j)
					forth
				end
				iteration_position := old_iteration_position
			end
		ensure
			good_count: Result.count = count
 		end

	item_for_iteration: G
			-- Element at current iteration position
		require
			not_off: not off
		do
			Result := content.item (iteration_position)
		end

	key_for_iteration: K
			-- Key at current iteration position
		require
			not_off: not off
		do
			Result := keys.item (iteration_position)
		end

	cursor: CURSOR
			-- Current cursor position
		do
			create {HASH_TABLE_CURSOR} Result.make (iteration_position)
		ensure
			cursor_not_void: Result /= Void
		end

	new_cursor: HASH_TABLE_ITERATION_CURSOR [G, K]
			-- <Precursor>
		do
			create Result.make (Current)
			Result.start
		end

	iteration_item (i: INTEGER): G
			-- <Precursor>
		do
			Result := content.item (i)
		end

	hash_code_of (a_key: attached K): INTEGER
			-- Hash_code value associated to `a_key'.
		do
				-- Default implementation uses `{HASHABLE}.hash_code'.
			Result := a_key.hash_code
		ensure
			non_negative: Result >= 0
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in table

	capacity: INTEGER
			-- Number of items that may be stored.

	occurrences (v: detachable G): INTEGER
			-- Number of table items equal to `v'.
		local
			old_iteration_position: INTEGER
		do
			old_iteration_position := iteration_position
			if object_comparison then
				from
					start
				until
					off
				loop
					if item_for_iteration ~ v then
						Result := Result + 1
					end
					forth
				end
			else
				from
					start
				until
					off
				loop
					if item_for_iteration = v then
						Result := Result + 1
					end
					forth
				end
			end
			iteration_position := old_iteration_position
		end

	iteration_lower: INTEGER
			-- <Precursor>
		do
			Result := next_iteration_position (-1)
		end

	iteration_upper: INTEGER
			-- <Precursor>
		do
			Result := previous_iteration_position (keys.count)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Does table contain the same information as `other'?
		do
			if
				count = other.count and then
				object_comparison = other.object_comparison and then
				has_default = other.has_default
			then
				Result := True
				across
					Current as l_c
				until
					not Result
				loop
					other.search (l_c.key)
					if other.found then
						if object_comparison then
							Result := l_c.item ~ other.found_item
						else
							Result := l_c.item = other.found_item
						end
					else
						Result := False
					end
				end
			end
		end

	same_keys (a_search_key, a_key: K): BOOLEAN
			-- Does `a_search_key' equal to `a_key'?
			--| Default implementation is using ~.
		require
			valid_search_key: valid_key (a_search_key)
			valid_key: valid_key (a_key)
		do
			Result := a_search_key ~ a_key
		end

	disjoint (other: HASH_TABLE [G, K]): BOOLEAN
			-- Is `Current' and `other' disjoint on their keys?
			-- Use `same_keys' for comparison.
		do
				-- If any of the tables are empty, it is clearly disjoint,
				-- otherwise we check that no elements of `other' appears in Current.
			Result := is_empty or else other.is_empty or else
				not across other as o some has (o.key) end
		end

feature -- Status report

	full: BOOLEAN = False
			-- Is structure filled to capacity?

	extendible: BOOLEAN = False
			-- May new items be added?

	prunable: BOOLEAN
			-- May items be removed?
		do
			Result := True
		end

	conflict: BOOLEAN
			-- Did last operation cause a conflict?
		do
			Result := control = conflict_constant
		end

	inserted: BOOLEAN
			-- Did last operation insert an item?
		do
			Result := control = inserted_constant
		end

	replaced: BOOLEAN
			-- Did last operation replace an item?
		do
			Result := control = replaced_constant
		end

	removed: BOOLEAN
			-- Did last operation remove an item?
		do
			Result := control = removed_constant
		end

	found: BOOLEAN
			-- Did last operation find the item sought?
		do
			Result := control = found_constant
		end

	not_found: BOOLEAN
			-- Did last operation fail to find the item sought?
		do
			Result := control = not_found_constant
		end

	after, off: BOOLEAN
			-- Is cursor past last item?
		do
			Result := is_off_position (iteration_position)
		end

	valid_cursor (c: CURSOR): BOOLEAN
			-- Can cursor be moved to position `c'?
		require
			c_not_void: c /= Void
		local
			i: INTEGER
		do
			if attached {HASH_TABLE_CURSOR} c as ht_cursor then
				i := ht_cursor.position
				Result := is_off_position (i) or else truly_occupied (i)
			end
		end

	valid_key (k: K): BOOLEAN
			-- Is `k' a valid key?
		do
			Result := True
			debug ("prevent_hash_table_catcall")
					-- If `K' is expanded then there will be no catcall.
					-- If `K' is a reference, we make sure that the type of the object `k'
					-- is the detachable version of `K' as objects have the detachable type by default.
				if not ({K}).is_expanded and then attached k then
					Result := k.generating_type ~ {detachable K}
				end
			end
		end

	valid_iteration_index (i: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := truly_occupied (i)
		end

feature -- Cursor movement

	start
			-- Bring cursor to first position.
		do
				-- Get lower bound of iteration if any.
			iteration_position := next_iteration_position (-1)
		end

	forth
			-- Advance cursor to next occupied position,
			-- or `off' if no such position remains.
		require
			not_off: not off
		do
			iteration_position := next_iteration_position (iteration_position)
		end

	go_to (c: CURSOR)
			-- Move to position `c'.
		require
			c_not_void: c /= Void
			valid_cursor: valid_cursor (c)
		do
			if attached {HASH_TABLE_CURSOR} c as ht_cursor then
				iteration_position := ht_cursor.position
			end
		end

	search (key: K)
			-- Search for item of key `key'.
			-- If found, set `found' to true, and set
			-- `found_item' to item associated with `key'.
		local
			old_position: INTEGER
			l_default_value: detachable G
		do
			old_position := item_position
			internal_search (key)
			if found then
				found_item := content.item (position)
			else
				found_item := l_default_value
			end
			item_position := old_position
		ensure
			found_or_not_found: found or not_found
			item_if_found: found implies (found_item = item (key))
		end

	search_item: detachable G
		obsolete
			"Use `found_item` instead. [2017-05-31]"
		do
			Result := found_item
		end

feature {HASH_TABLE_ITERATION_CURSOR} -- Cursor movement

	next_iteration_position (a_position: like iteration_position): like iteration_position
			-- Given an iteration position, advanced to the next one taking into account deleted
			-- slots in the `content' and `keys' structures.
		require
			a_position_big_enough: a_position >= -1
			a_position_small_enough: a_position < keys.count
		local
			l_deleted_marks: like deleted_marks
			l_table_size: INTEGER
		do
			l_deleted_marks := deleted_marks
			l_table_size := content.count
			from
				Result := a_position + 1
			until
				Result >= l_table_size or else not l_deleted_marks.item (Result)
			loop
				Result := Result + 1
			end
		ensure
			is_increased: Result > a_position
			is_below_upper_bound: Result <= keys.count
		end

	previous_iteration_position (a_position: like iteration_position): like iteration_position
			-- Given an iteration position, go to the previous one taking into account deleted
			-- slots in the `content' and `keys' structures.
		require
			a_position_big_enough: a_position >= 0
			a_position_small_enough: a_position <= keys.count
		local
			l_deleted_marks: like deleted_marks
		do
			l_deleted_marks := deleted_marks
			from
				Result := a_position - 1
			until
				Result <= -1 or else not l_deleted_marks.item (Result)
			loop
				Result := Result - 1
			end
		ensure
			is_decreased: Result < a_position
			is_above_lower_bound: Result >= -1
		end

feature -- Element change

	put (new: G; key: K)
			-- Insert `new' with `key' if there is no other item
			-- associated with the same key.
			-- Set `inserted' if and only if an insertion has
			-- been made (i.e. `key' was not present).
			-- If so, set `position' to the insertion position.
			-- If not, set `conflict'.
			-- In either case, set `found_item' to the item
			-- now associated with `key' (previous item if
			-- there was one, `new' otherwise).
			--
			-- To choose between various insert/replace procedures,
			-- see `instructions' in the Indexing clause.
		local
			l_default_key: detachable K
			l_new_pos, l_new_index_pos: like position
		do
			internal_search (key)
			if found then
				set_conflict
				found_item := content.item (position)
			else
				if soon_full then
					add_space
					internal_search (key)
					check
							-- The key didn't magically insert itself.
						not_present: not found
					end
				end
				if deleted_item_position = ht_impossible_position then
					l_new_pos := keys.count
					l_new_index_pos := item_position
				else
					l_new_pos := deleted_position (deleted_item_position)
					l_new_index_pos := deleted_item_position
					deleted_marks.force (False, l_new_pos)
				end
				indexes_map.put (l_new_pos, l_new_index_pos)
				content.force (new, l_new_pos)
				keys.force (key, l_new_pos)
				if key = l_default_key then
					has_default := True
				end
				count := count + 1
				found_item := new
				control := inserted_constant
			end
		ensure then
			conflict_or_inserted: conflict or inserted
			insertion_done: inserted implies item (key) = new
			now_present: inserted implies has (key)
			one_more_if_inserted: inserted implies (count = old count + 1)
			unchanged_if_conflict: conflict implies (count = old count)
			same_item_if_conflict: conflict implies (item (key) = old (item (key)))
			found_item_associated_with_key: found_item = item (key)
			new_item_if_inserted: inserted implies (found_item = new)
			old_item_if_conflict: conflict implies (found_item = old (item (key)))
			default_property:
				has_default =
					((inserted and (key = computed_default_key)) or
						((conflict or (key /= computed_default_key))
							and (old has_default)))
		end

	force (new: G; key: K)
			-- Update table so that `new' will be the item associated
			-- with `key'.
			-- If there was an item for that key, set `found'
			-- and set `found_item' to that item.
			-- If there was none, set `not_found' and set
			-- `found_item' to the default value.
			--
			-- To choose between various insert/replace procedures,
			-- see `instructions' in the Indexing clause.
		local
			l_default_key: detachable K
			l_default_value: detachable G
			l_new_pos, l_new_index_pos: like position
		do
			internal_search (key)
			if not_found then
				if soon_full then
					add_space
					internal_search (key)
				end
				if deleted_item_position = ht_impossible_position then
					l_new_pos := keys.count
					l_new_index_pos := item_position
				else
					l_new_pos := deleted_position (deleted_item_position)
					l_new_index_pos := deleted_item_position
					deleted_marks.force (False, l_new_pos)
				end
				indexes_map.put (l_new_pos, l_new_index_pos)
				keys.force (key, l_new_pos)
				if key = l_default_key then
					has_default := True
				end
				count := count + 1
				found_item := l_default_value
			else
				l_new_pos := position
				found_item := content.item (l_new_pos)
			end
			content.force (new, l_new_pos)
		ensure then
			insertion_done: item (key) = new
			now_present: has (key)
			found_or_not_found: found or not_found
			not_found_if_was_not_present: not_found = not (old has (key))
			same_count_or_one_more: (count = old count) or (count = old count + 1)
			found_item_is_old_item: found implies (found_item = old (item (key)))
			default_value_if_not_found:
				not_found implies (found_item = computed_default_value)
					-- The reverse is not true, as we can always insert
					-- an item with the default value, for any key.

			default_property:
				has_default =
					((key = computed_default_key) or
						((key /= computed_default_key) and (old has_default)))
		end

	extend (new: G; key: K)
			-- Assuming there is no item of key `key',
			-- insert `new' with `key'.
			-- Set `inserted'.
			--
			-- To choose between various insert/replace procedures,
			-- see `instructions' in the Indexing clause.
		require
			not_present: not has (key)
		local
			l_default_key: detachable K
			l_new_pos, l_new_index_pos: like position
		do
			search_for_insertion (key)
			if soon_full then
				add_space
				search_for_insertion (key)
			end
			if deleted_item_position = ht_impossible_position then
				l_new_pos := keys.count
				l_new_index_pos := item_position
			else
				l_new_pos := deleted_position (deleted_item_position)
				l_new_index_pos := deleted_item_position
				deleted_marks.force (False, l_new_pos)
			end
			indexes_map.put (l_new_pos, l_new_index_pos)
			content.force (new, l_new_pos)
			keys.force (key, l_new_pos)
			if key = l_default_key then
				has_default := True
			end
			count := count + 1
			control := inserted_constant
		ensure
			inserted: inserted
			insertion_done: item (key) = new
			one_more: count = old count + 1
			default_property:
				has_default =
					((key = computed_default_key) or (old has_default))
		end

	replace (new: G; key: K)
			-- Replace item at `key', if present,
			-- with `new'; do not change associated key.
			-- Set `replaced' if and only if a replacement has been made
			-- (i.e. `key' was present); otherwise set `not_found'.
			-- Set `found_item' to the item previously associated
			-- with `key' (default value if there was none).
			--
			-- To choose between various insert/replace procedures,
			-- see `instructions' in the Indexing clause.
		local
			l_default_item: detachable G
		do
			internal_search (key)
			if found then
				found_item := content.item (position)
				content.put (new, position)
				control := replaced_constant
			else
				found_item := l_default_item
			end
		ensure
			replaced_or_not_found: replaced or not_found
			insertion_done: replaced implies item (key) = new
			no_change_if_not_found: not_found implies
						item (key) = old item (key)
			found_item_is_old_item: found_item = old item (key)
		end

	replace_key (new_key: K; old_key: K)
			-- If there is an item of key `old_key' and no item of key
			-- `new_key', replace the former's key by `new_key',
			-- set `replaced', and set `found_item' to the item
			-- previously associated with `old_key'.
			-- Otherwise set `not_found' or `conflict' respectively.
			-- If `conflict', set `found_item' to the item previously
			-- associated with `new_key'.
			--
			-- To choose between various insert/replace procedures,
			-- see `instructions' in the Indexing clause.
		local
			l_item: G
		do
			internal_search (new_key)
			if not found then
				internal_search (old_key)
				if found then
					l_item := content.item (position)
					remove (old_key)
					put (l_item, new_key)
					control := replaced_constant
				end
			else
				set_conflict
				found_item := content.item (position)
			end
		ensure
			same_count: count = old count
			replaced_or_conflict_or_not_found: replaced or conflict or not_found
			old_absent: (replaced and not same_keys (new_key, old_key)) implies (not has (old_key))
			new_present: (replaced or conflict) = has (new_key)
			new_item: replaced implies (item (new_key) = old (item (old_key)))
			not_found_implies_no_old_key: not_found implies old (not has (old_key))
			conflict_iff_already_present: conflict = old has (new_key)
			not_inserted_if_conflict: conflict implies
						(item (new_key) = old item (new_key))
		end

	merge (other: HASH_TABLE [G, K])
			-- Merge `other' into Current. If `other' has some elements
			-- with same key as in `Current', replace them by one from
			-- `other'.
		require
			other_not_void: other /= Void
		do
			from
				other.start
			until
				other.after
			loop
				force (other.item_for_iteration, other.key_for_iteration)
				other.forth
			end
		ensure
			inserted: other.current_keys.linear_representation.for_all (agent has)
		end

feature -- Removal

	remove (key: K)
			-- Remove item associated with `key', if present.
			-- Set `removed' if and only if an item has been
			-- removed (i.e. `key' was present);
			-- if so, set `position' to index of removed element.
			-- If not, set `not_found'.
			-- Reset `found_item' to its default value if `removed'.
		local
			l_default_key: detachable K
			l_default_value: detachable G
			l_pos: like position
			l_nb_removed_items: INTEGER
		do
			internal_search (key)
			if found then
				l_pos := position
				if key = l_default_key then
					has_default := False
				end
				deleted_marks.put (True, l_pos)
				indexes_map.put (-l_pos + ht_deleted_position, item_position)
				if iteration_position = l_pos then
					forth
				end
				count := count - 1
					-- For void-safety concerns and to avoid leaking too many objects,
					-- we set all deleted positions to the same item and key when removing
					-- on the inside of the SPECIALs, otherwise we simply shrink the SPECIALs.
				ht_lowest_deleted_position := l_pos.min (ht_lowest_deleted_position)
				if ht_lowest_deleted_position = count then
						-- We have removed all elements above `ht_lowest_deleted_position', we can
						-- shrink our SPECIALs.
					l_nb_removed_items := content.count - ht_lowest_deleted_position
					content.remove_tail (l_nb_removed_items)
					keys.remove_tail (l_nb_removed_items)
						-- All elements above `ht_lowest_deleted_position' of `deleted_marks' are reset
						-- to False. To be correct, we should also reset their corresponding indexes
						-- in `indexes_map' to `ht_impossible_position' however that would be too
						-- expensive to traverse the structure. Instead we leave items as they are but
						-- we cope with them in `internal_search'.
					deleted_marks.fill_with (False, ht_lowest_deleted_position, deleted_marks.count - 1)
					ht_deleted_item := l_default_value
					ht_deleted_key := l_default_key
					ht_lowest_deleted_position := ht_max_position
				elseif attached ht_deleted_item as l_item and attached ht_deleted_key as l_key then
					content.put (l_item, l_pos)
					keys.put (l_key, l_pos)
				else
						-- First time we actually remove an item from the table.
					ht_deleted_item := content.item (l_pos)
					ht_deleted_key := keys.item (l_pos)
				end
				control := removed_constant
				found_item := l_default_value
			end
		ensure
			removed_or_not_found: removed or not_found
			not_present: not has (key)
			one_less: found implies (count = old count - 1)
			default_case:
				(key = computed_default_key) implies (not has_default)
			non_default_case:
				(key /= computed_default_key) implies
					(has_default = old has_default)
		end

	prune (v: detachable G)
			-- Remove first occurrence of `v', if any,
			-- after cursor position.
			-- Move cursor to right neighbor.
			-- (or after if no right neighbor or `v' does not occur)
		do
				-- No need to check if we are before because `iteration_position' is either
				-- a valid position or `off' (see invariant `valid_iteration_position').
				-- Thus we can start iterating right away.
			if object_comparison then
				from
				until
					after or else item_for_iteration ~ v
				loop
					forth
				end
			else
				from
				until
					after or else item_for_iteration = v
				loop
					forth
				end
			end
			if not after then
				remove (key_for_iteration)
			end
		end

	wipe_out
			-- Reset all items to default values; reset status.
		local
			l_default_value: detachable G
		do
			content.wipe_out
			keys.wipe_out
			deleted_marks.fill_with (False, 0, deleted_marks.upper)
			indexes_map.fill_with (ht_impossible_position, 0, capacity)
			found_item := l_default_value
			count := 0
			item_position := 0
			iteration_position := keys.count
			control := 0
			has_default := False
		ensure then
			position_equal_to_zero: item_position = 0
			count_equal_to_zero: count = 0
			has_default_set: not has_default
			no_status: not special_status
		end

	clear_all
		obsolete
			"Use `wipe_out' instead. [2017-05-31]"
		do
			wipe_out
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
		local
			old_iteration_position: INTEGER
		do
			old_iteration_position := iteration_position
			from
				create Result.make (count)
				start
			until
				off
			loop
				Result.extend (item_for_iteration)
				forth
			end
			iteration_position := old_iteration_position
		ensure then
			Result_exists: Result /= Void
			good_count: Result.count = count
		end

feature -- Duplication

	copy (other: like Current)
			-- Re-initialize from `other'.
		do
			if other /= Current then
				standard_copy (other)
				set_content (other.content.twin)
				set_keys (other.keys.twin)
				set_deleted_marks (other.deleted_marks.twin)
				set_indexes_map (other.indexes_map.twin)
			end
		end

feature {NONE} -- Duplication

	empty_duplicate (n: INTEGER): like Current
			-- Create an empty copy of Current that can accommodate `n' items
		require
			n_non_negative: n >= 0
		do
			create Result.make (n)
			if object_comparison then
				Result.compare_objects
			end
		ensure
			empty_duplicate_attached: Result /= Void
		end

feature {NONE} -- Transformation

	correct_mismatch
			-- Attempt to correct object mismatch during retrieve using `mismatch_information'.
		local
			l_old_deleted_marks: detachable SPECIAL [BOOLEAN]
			i, l_capacity, l_count: INTEGER
			l_new_table: like Current
			l_default_item: like ht_deleted_item
			l_default_key: like ht_deleted_key
		do
			if not mismatch_information.has ("hash_table_version_64") then
					-- In version 5.1 and earlier, `content', `keys' and `deleted_marks'
					-- where of base class ARRAY. In 5.2 we changed it to be a SPECIAL for
					-- efficiency reasons. In order to retrieve an old HASH_TABLE we
					-- need to convert those ARRAY instances into SPECIAL instances.

					-- Convert `content' from ARRAY to SPECIAL
				if attached {ARRAY [G]} mismatch_information.item ("content") as array_content then
					content := array_content.area
				end

					-- Convert `keys' from ARRAY to SPECIAL
				if attached {ARRAY [K]} mismatch_information.item ("keys") as array_keys then
					keys := array_keys.area
				end

					-- Convert `deleted_marks' from ARRAY to SPECIAL
				if attached {ARRAY [BOOLEAN]} mismatch_information.item ("deleted_marks") as array_marks then
					deleted_marks := array_marks.area
				end

					-- In version 5.5 and later, `deleted_marks' had its size increased by 1 to take
					-- into account removal of default key, and therefore if we hit a 5.4 or earlier
					-- version, we need to resize `deleted_marks' to the new expected size.
				if
					deleted_marks /= Void and
					keys /= Void and then
					not mismatch_information.has ("hash_table_version_57") and then
						-- Unfortunately this handling of the mismatch was added in 5.7 and
						-- therefore we might have stored a valid HASH_TABLE using 5.5 or 5.6.
						-- Fortunately enough we can simply compare the counts of
						-- `deleted_marks' and `keys'. If they are the same it is 5.5 or 5.6,
						-- otherwise it is 5.4 or older.
					deleted_marks.count /= keys.count
				then
					l_old_deleted_marks := deleted_marks
					create deleted_marks.make_empty (keys.count)
					deleted_marks.copy_data (l_old_deleted_marks, 0, 0, l_old_deleted_marks.count)
				end

				if attached {INTEGER} mismatch_information.item ("count") as l_retrieved_count then
					l_count := l_retrieved_count
				end

				if content = Void or keys = Void or deleted_marks = Void then
						-- Could not retrieve old version of HASH_TABLE. We throw an exception.
					Precursor {MISMATCH_CORRECTOR}
				else
						-- Now we build the new HASH_TABLE from the old one.
					from
						l_capacity := keys.count
						l_new_table := empty_duplicate (l_count)
					until
						i = l_capacity
					loop
						if attached keys.item (i) as l_key_item and then l_key_item /= l_default_key then
							l_new_table.put (content.item (i), l_key_item)
						end
						i := i + 1
					end
					if attached {BOOLEAN} mismatch_information.item ("has_default") as l_bool and then l_bool then
						l_new_table.put (content.item (content.capacity - 1), keys.item (l_capacity - 1))
					end

					set_content (l_new_table.content)
					set_keys (l_new_table.keys)
					set_deleted_marks (l_new_table.deleted_marks)
					set_indexes_map (l_new_table.indexes_map)
					capacity := l_new_table.capacity
					iteration_position := l_new_table.iteration_position
					deleted_item_position := l_new_table.deleted_item_position
					item_position := l_new_table.item_position
						-- We reset the following attributes to their default value
					ht_lowest_deleted_position := ht_max_position
					ht_deleted_item := l_default_item
					ht_deleted_key := l_default_key
						-- We don't change `object_comparison' from the value it was retrieved from.
				end

					-- Reset `control' to an acceptable value.
				control := 0
			end
		end

	hash_table_version_64: BOOLEAN
			-- Fake attribute for versioning purposes. Used in `correct_mismatch'.

feature {HASH_TABLE, HASH_TABLE_ITERATION_CURSOR} -- Implementation: content attributes and preservation

	content: SPECIAL [G]
			-- Array of contents

	keys: SPECIAL [K]
			-- Array of keys

feature {HASH_TABLE} -- Implementation: content attributes and preservation

	indexes_map: SPECIAL [INTEGER]
			-- Indexes of items in `content', and `keys'.
			-- If item is not present, then it has `ht_impossible_position'.
			-- If item is deleted, then it has `ht_deleted_position'.

	deleted_marks: SPECIAL [BOOLEAN]
			-- Indexes of deleted positions in `content' and `keys'.

	item_position: INTEGER
			-- Position in `indexes_map' for item at position `position'. Set by `internal_search'.

	has_default: BOOLEAN
			-- Is the default key present?

feature {HASH_TABLE} -- Implementation: search attributes

	iteration_position: INTEGER
			-- Cursor for iteration primitives

	position: INTEGER
			-- Hash table cursor, updated after each operation:
			-- put, remove, has, replace, force, change_key...
		do
			Result := indexes_map.item (item_position)
		end

	soon_full: BOOLEAN
			-- Is table close to being filled to current capacity?
		do
			Result := keys.count = keys.capacity
		ensure
			Result = (keys.count = keys.capacity)
		end

	control: INTEGER
			-- Control code set by operations that may produce
			-- several possible conditions.

	deleted_item_position: INTEGER
			-- Place where a deleted element was found during a search

feature {NONE} -- Implementation

	ht_max_position: INTEGER = 0x7FFFFFFD
			-- Maximum possible position

	ht_impossible_position: INTEGER = -1
			-- Position outside the array indices.

	ht_deleted_position: INTEGER = -2
			-- Marked a deleted position.

	ht_lowest_deleted_position: INTEGER
			-- Index of the lowest deleted position thus far.

	ht_deleted_item: detachable G
	ht_deleted_key: detachable K
			-- Store the item and key that will be used to replace an element of the HASH_TABLE
			-- that will be removed. If elements being removed are at the end of `content' or `keys'
			-- then they are both Void. It is only used when removing an element at a position strictly
			-- less than `count'.

	deleted_position (a_pos: INTEGER): INTEGER
			-- Given the position of a deleted item at `a_pos' gives the associated position
			-- in `content/keys'.
		require
			deleted: deleted (a_pos)
		do
			Result := -indexes_map.item (a_pos) + ht_deleted_position
				-- Sometime we shrink `keys' and `content' while removing items, as a result, some
				-- stored deleted position in `indexes_map' are beyond `keys' and `content'. In those
				-- cases, we simply return the location for the next insertion instead.
			Result := Result.min (keys.count)
		ensure
			deleted_position_non_negative: Result >= 0
			deleted_position_valid: Result <= keys.count and Result <= content.count
		end

	occupied (i: INTEGER): BOOLEAN
			-- Is position `i' occupied by a non-default key and a value?
		require
			in_bounds: deleted_marks.valid_index (i)
		do
			if has_default then
				Result := i /= indexes_map.item (capacity) and then not deleted_marks.item (i)
			else
				Result := not deleted_marks.item (i)
			end
		end

	truly_occupied (i: INTEGER): BOOLEAN
			-- Is position `i' occupied by a key and a value?
		do
			if i >= 0 and i < keys.count then
				Result := (has_default and i = indexes_map.item (capacity)) or else occupied (i)
			end
		ensure
			normal_key: (i >= 0 and i < keys.count and i /= indexes_map.item (capacity)) implies (occupied (i) implies Result)
			default_key: (i = indexes_map.item (capacity)) implies (Result = has_default)
		end

	is_off_position (pos: INTEGER): BOOLEAN
			-- Is `pos' a cursor position outside the authorized range?
		do
			Result := pos < 0 or pos >= keys.count
		end

	set_content (c: like content)
			-- Assign `c' to `content'.
		require
			c_attached: c /= Void
		do
			content := c
		ensure
			content_set: content = c
		end

	deleted (i: INTEGER): BOOLEAN
			-- Is position `i' that of a deleted item?
		require
			in_bounds: i >= 0 and i <= capacity
		do
			Result := indexes_map.item (i) <= ht_deleted_position
		end

	set_keys (c: like keys)
			-- Assign `c' to `keys'.
		require
			c_attached: c /= Void
		do
			keys := c
		ensure
			keys_set: keys = c
		end

	set_deleted_marks (d: like deleted_marks)
			-- Assign `c' to `content'.
		require
			d_attached: d /= Void
		do
			deleted_marks := d
		ensure
			deleted_marks_set: deleted_marks = d
		end

	set_indexes_map (v: like indexes_map )
			-- Assign `v' to `indexes_map'.
		do
			indexes_map := v
		ensure
			indexes_map_set: indexes_map = v
		end

	default_key_value: G
			-- Value associated with the default key, if any
		require
			has_default: has_default
		do
			Result := content [indexes_map [capacity]]
		end

	computed_default_key: detachable K
			-- Default key
			-- (For performance reasons, used only in assertions;
			-- elsewhere, see use of local entity `l_default_key'.)
		do
			-- No instructions necessary (returns default value of type K)
		end

	computed_default_value: detachable G
			-- Default value of type G
			-- (For performance reasons, used only in assertions;
			-- elsewhere, see use of local entity `l_default_value'.)
		do
			-- No instructions necessary (returns default value of type G)
		end

	internal_search (key: K)
			-- Search for item of key `key'.
			-- If successful, set `position' to index
			-- of item with this key (the same index as the key's index).
			-- If not, set `position' to possible position for insertion,
			-- and set status to `found' or `not_found'.
		local
			l_default_key: detachable K
			hash_value, increment, l_pos, l_item_pos, l_capacity: INTEGER
			l_first_deleted_position: INTEGER
			stop: INTEGER
			l_keys: like keys
			l_indexes: like indexes_map
			l_deleted_marks: like deleted_marks
			l_key: K
		do
			l_first_deleted_position := ht_impossible_position
			if key = l_default_key or key = Void then
				item_position := capacity
				if has_default then
					control := found_constant
				else
					control := not_found_constant
				end
			else
				from
					l_keys := keys
					l_indexes := indexes_map
					l_deleted_marks := deleted_marks
					l_capacity := capacity
					stop := l_capacity
					hash_value := hash_code_of (key)
					increment := 1 + hash_value \\ (l_capacity - 1)
					l_item_pos := (hash_value \\ l_capacity) - increment
					control := not_found_constant
				until
					stop = 0
				loop
						-- Go to next increment.
					l_item_pos := (l_item_pos + increment) \\ l_capacity
					l_pos := l_indexes [l_item_pos]
					if l_pos >= 0 then
						l_key := l_keys.item (l_pos)
						debug ("detect_hash_table_catcall")
							check
								catcall_detected: l_key /= Void and then l_key.same_type (key)
							end
						end
						if same_keys (l_key, key) then
							stop := 1
							control := found_constant
						end
					elseif l_pos = ht_impossible_position then
						stop := 1
					elseif l_first_deleted_position = ht_impossible_position then
						l_pos := -l_pos + ht_deleted_position
						check l_pos_valid: l_pos < l_deleted_marks.count end
						if not l_deleted_marks [l_pos] then
							stop := 1
						else
							l_first_deleted_position := l_item_pos
						end
					end
					stop := stop - 1
				end
				item_position := l_item_pos
			end
			deleted_item_position := l_first_deleted_position
		ensure
			found_or_not_found: found or not_found
			deleted_item_at_deleted_position:
				(deleted_item_position /= ht_impossible_position) implies deleted (deleted_item_position)
			default_iff_at_capacity: (item_position = capacity) = (key = computed_default_key)
		end

	search_for_insertion (key: K)
			-- Assuming there is no item of key `key', compute
			-- `position' at which to insert such an item.
		require
			not_present: not has (key)
		local
			l_default_key: detachable K
			hash_value, increment, l_pos, l_item_pos, l_capacity: INTEGER
			l_first_deleted_position: INTEGER
			stop: INTEGER
			l_indexes: like indexes_map
			l_deleted_marks: like deleted_marks
		do
			l_first_deleted_position := ht_impossible_position
			if key = l_default_key or key = Void then
				check
						-- Because of the precondition
					not has_default
				end
				item_position := capacity
			else
				from
					l_indexes := indexes_map
					l_deleted_marks := deleted_marks
					l_capacity := capacity
					stop := l_capacity
					hash_value := hash_code_of (key)
					increment := 1 + hash_value \\ (l_capacity - 1)
					l_item_pos := (hash_value \\ l_capacity) - increment
				until
					stop = 0
				loop
						-- Go to next increment.
					l_item_pos := (l_item_pos + increment) \\ l_capacity
					l_pos := l_indexes [l_item_pos]
					if l_pos >= 0 then
							-- Because of precondition, we are sure there is no key corresponding to `key'.
					elseif l_pos = ht_impossible_position then
						stop := 1
					elseif l_first_deleted_position = ht_impossible_position then
						l_pos := -l_pos + ht_deleted_position
						check l_pos_valid: l_pos < l_deleted_marks.count end
						if not l_deleted_marks [l_pos] then
							stop := 1
						else
							l_first_deleted_position := l_item_pos
						end
					end
					stop := stop - 1
				end
				item_position := l_item_pos
			end
			deleted_item_position := l_first_deleted_position
		ensure
			deleted_item_at_deleted_position:
				(deleted_item_position /= ht_impossible_position) implies deleted (deleted_item_position)
			default_iff_at_capacity: (item_position = capacity) = (key = computed_default_key)
		end

	key_at (n: INTEGER): detachable K
			-- Key at position `n'
		do
			if keys.valid_index (n) then
				Result := keys.item (n)
			end
		end

	initial_position (hash_value: INTEGER): INTEGER
			-- Initial position for an item of hash code `hash_value'
		do
			Result := hash_value \\ capacity
		end

	position_increment (hash_value: INTEGER): INTEGER
			-- Distance between successive positions for hash code
			-- `hash_value' (computed for no cycle: `capacity' is prime)
		do
			Result := 1 + hash_value \\ (capacity - 1)
		end

	conflict_constant: INTEGER = 1
			-- Could not insert an already existing key

	set_conflict
			-- Set status to conflict.
		do
			control := conflict_constant
		ensure
			conflict: conflict
		end

	found_constant: INTEGER = 2
			-- Key found

	set_found
			-- Set status to found.
		do
			control := found_constant
		ensure
			found: found
		end

	inserted_constant: INTEGER = 4
			-- Insertion successful

	set_inserted
			-- Set status to inserted.
		do
			control := inserted_constant
		ensure
			inserted: inserted
		end

	not_found_constant: INTEGER = 8
			-- Key not found

	set_not_found
			-- Set status to not found.
		do
			control := not_found_constant
		ensure
			not_found: not_found
		end

	set_no_status
			-- Set status to normal.
		do
			control := 0
		ensure
			default_status: not special_status
		end

	removed_constant: INTEGER = 16
			-- Remove successful

	set_removed
			-- Set status to removed.
		do
			control := removed_constant
		ensure
			removed: removed
		end

	replaced_constant: INTEGER = 32
			-- Replaced value

	set_replaced
			-- Set status to replaced.
		do
			control := replaced_constant
		ensure
			replaced: replaced
		end

	special_status: BOOLEAN
			-- Has status been set to some non-default value?
		do
			Result := control > 0
		ensure
			Result = (control > 0)
		end

	add_space
			-- Increase capacity.
		do
				-- Be pessimistic: plan for more growth by allocating 1.5 more than before
			accommodate (count + count // 2)
		ensure
			count_not_changed: count = old count
			breathing_space: count < capacity
		end

	minimum_capacity: INTEGER = 2

feature {NONE} -- Inapplicable

	collection_extend (v: detachable G)
			-- Insert a new occurrence of `v'.
		do
		end

invariant

	keys_not_void: keys /= Void
	content_not_void: content /= Void
	keys_enough_capacity: keys.count <= capacity + 1
	content_enough_capacity: content.count <= capacity + 1
	valid_iteration_position: off or truly_occupied (iteration_position)
	control_non_negative: control >= 0
	special_status: special_status =
		(conflict or inserted or replaced or removed or found or not_found)

	count_big_enough: 0 <= count
	count_small_enough: count <= capacity
	slot_count_big_enough: 0 <= count

note
	instruction: "[
		Several procedures are provided for inserting an item
		with a given key.

		Here is how to choose between them:

			- Use `put' if you want to do an insertion only if
			  there was no item with the given key, doing nothing
			  otherwise. (You can find out on return if there was one,
			  and what it was.)

			- Use `force' if you always want to insert the item;
			  if there was one for the given key it will be removed,
			  (and you can find out on return what it was).

			- Use `extend' if you are sure there is no item with
			  the given key, enabling faster insertion (but
			  unpredictable behavior if this assumption is not true).

			- Use `replace' if you want to replace an already present
			  item with the given key, and do nothing if there is none.

		In addition you can use `replace_key' to change the key of an
		already present item, identified by its previous key, or
		do nothing if there is nothing for that previous key.
		You can find out on return.

		To find out whether a key appears in the table, use `has'.
		To find out the item, if any, associated with a certain key,
		use `item'.

		Both of these routines perform a search. If you need
		both pieces of information (does a key appear? And, if so,
		what is the associated item?), you can avoid performing
		two redundant traversals by using instead the combination
		of `search', `found' and `found_item' as follows:

			your_table.search (your_key)
			if your_table.found then
				what_you_where_looking_for := your_table.found_item
				... Do whatever is needed to `what_you_were_looking_for' ...
			else
				... No item was present for `your_key' ...
			end
		]"
	date: "$Date$"
	revision: "$Revision$"
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
