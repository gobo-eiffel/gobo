note

	description:

		"Lists of Eiffel types used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TYPE_LIST

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty list.
		do
			make_with_capacity (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty list with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			count := 0
			create storage.make_empty (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): SB_TYPE
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i - 1)
		ensure
			item_not_void: Result /= Void
		end

	first: like item
			-- First item
		require
			not_empty: not is_empty
		do
			Result := item (1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: like item
			-- Last item
		require
			not_empty: not is_empty
		do
			Result := item (count)
		ensure
			last_not_void: Result /= Void
			definition: Result = item (count)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list

	capacity: INTEGER
			-- Maximum number of items in list
		do
			Result := storage.capacity
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no item in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has_unknown: BOOLEAN
			-- Is there some classes describing the current
			-- types which are not known by the schema?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).has_unknown then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put_last (an_item: like item)
			-- Put `an_item' at last position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			storage.force (an_item, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	force_last (an_item: like item)
			-- Put `an_item' at last position in list.
		require
			an_item_not_void: an_item /= Void
		local
			nb: INTEGER
		do
			nb := count + 1
			if nb > capacity then
				storage := storage.aliased_resized_area ((nb + 1) * 3 // 2)
			end
			storage.force (an_item, count)
			count := nb
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			storage.put (an_item, i - 1)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

feature -- Removal

	wipe_out
			-- Remove all types.
		do
			count := 0
			storage.keep_head (0)
		ensure
			wiped_out: is_empty
		end

feature -- Output

	names: STRING
			-- Type names
		local
			i, nb: INTEGER
		do
			create Result.make (128)
			Result.append_character ('[')
			nb := count
			from i := 1 until i > nb loop
				if i /= 1 then
					Result.append_character (',')
					Result.append_character (' ')
				end
				Result.append_string (item (i).name)
				i := i + 1
			end
			Result.append_character (']')
		ensure
			names_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	storage: SPECIAL [like item]
			-- Internal storage

invariant

	count_positive: count >= 0
	consistent_count: count <= capacity
	storage_not_void: storage /= Void

end
