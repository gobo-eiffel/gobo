note

	description:

		"Lists of pairs implemented with arrays"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class DS_ARRAYED_LIST_2 [G, H]

inherit

	ANY
		redefine
			copy,
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		export
			{NONE} all
		redefine
			copy,
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			create special_routines_1
			storage_1 := special_routines_1.make (n)
			create special_routines_2
			storage_2 := special_routines_2.make (n)
			capacity := n
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

feature -- Access

	item_1 (i: INTEGER): G
			-- First item of the pair at index `i'
			-- (Performance: O(1).)
		require
			valid_index: 1 <= i and i <= count
		do
			Result := storage_1.item (i - 1)
		end

	item_2 (i: INTEGER): H
			-- Second item of the pair at index `i'
			-- (Performance: O(1).)
		require
			valid_index: 1 <= i and i <= count
		do
			Result := storage_2.item (i - 1)
		end

feature -- Measurement

	count: INTEGER
			-- Number of pairs in list
			-- (Performance: O(1).)

	capacity: INTEGER
			-- Maximum number of pairs in list

feature -- Status report

	is_empty: BOOLEAN
			-- Is list empty?
		do
			Result := count = 0
		ensure
			definition: Result = (count = 0)
		end

	has_void_1: BOOLEAN
			-- Does list include a pair whose first item is Void?
		local
			v: detachable G
			i: INTEGER
		do
			if not ({G}).is_attached and then v = Void then
				from i := count - 1 until i < 0 loop
					if storage_1.item (i) = v then
						Result := True
						i := -1
					end
					i := i - 1
				end
			end
		ensure
			not_empty: Result implies not is_empty
		end

	has_void_2: BOOLEAN
			-- Does list include a pair whose second item is Void?
		local
			v: detachable H
			i: INTEGER
		do
			if not ({H}).is_attached and then v = Void then
				from i := count - 1 until i < 0 loop
					if storage_2.item (i) = v then
						Result := True
						i := -1
					end
					i := i - 1
				end
			end
		ensure
			not_empty: Result implies not is_empty
		end

	extendible (n: INTEGER): BOOLEAN
			-- May list be extended with `n' pairs?
		do
			Result := capacity >= count + n
		ensure
			enough_space: Result implies (capacity >= count + n)
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current list.
			-- (Performance: O(other.count).)
		do
			if other /= Current then
				standard_copy (other)
					-- Note: do not use `storage.twin' because SPECIAL.copy may
					-- shrink the 'capacity' down to 'count'.
				storage_1 := storage_1.resized_area (storage_1.capacity)
				storage_2 := storage_2.resized_area (storage_2.capacity)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is list equal to `other'?
			-- Do not take capacity into account.
			-- (Performance: O(count).)
		local
			i, nb: INTEGER
			other_storage_1: like storage_1
			other_storage_2: like storage_2
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and other.count = count then
				other_storage_1 := other.storage_1
				other_storage_2 := other.storage_2
				from
					i := 0
					nb := count - 1
					Result := True
				until
					not Result or i > nb
				loop
					Result := storage_1.item (i) = other_storage_1.item (i) and storage_2.item (i) = other_storage_2.item (i)
					i := i + 1
				end
			end
		end

feature -- Element change

	force_last (v1: G; v2: H)
			-- Add `v1' and `v2' to end of list.
			-- Resize container if needed.
			-- (Performance: O(1)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			special_routines_1.force (storage_1, v1, count)
			special_routines_2.force (storage_2, v2, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted_1: {KL_TYPE [G]}.same_objects (item_1 (count), v1)
			inserted_2: {KL_TYPE [H]}.same_objects (item_2 (count), v2)
		end

feature -- removal

	wipe_out
			-- Remove all pairs from list.
			-- (Performance: O(1).)
		do
			count := 0
			storage_1.keep_head (0)
			storage_2.keep_head (0)
		ensure
			wiped_out: is_empty
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize list so that it can contain
			-- at least `n' pairs. Do not lose any item.
		require
			n_large_enough: n >= capacity
		do
			storage_1 := special_routines_1.aliased_resized_area (storage_1, n)
			storage_2 := special_routines_2.aliased_resized_area (storage_2, n)
			capacity := n
		ensure
			capacity_set: capacity = n
		end

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER
			-- New capacity which could accommodate at least
			-- `n' pairs (Used as argument of `resize'.)
		require
			n_large_enough: n >= capacity
		do
			Result := (n + 1) * 3 // 2
		ensure
			definition: Result >= n
		end

feature {DS_ARRAYED_LIST_2} -- Implementation

	storage_1: SPECIAL [G]
			-- Storage for first items of pairs of the list

	storage_2: SPECIAL [H]
			-- Storage for second items of pairs of the list

feature {NONE} -- Implementation

	special_routines_1: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

	special_routines_2: KL_SPECIAL_ROUTINES [H]
			-- Routines that ought to be in SPECIAL

invariant

	storage_1_not_void: storage_1 /= Void
	storage_2_not_void: storage_2 /= Void
	capacity_definition_1: capacity = storage_1.capacity
	capacity_definition_2: capacity = storage_2.capacity
	special_routines_1_not_void: special_routines_1 /= Void
	special_routines_2_not_void: special_routines_2 /= Void

end
