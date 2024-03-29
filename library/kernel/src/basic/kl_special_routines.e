﻿note

	description:

		"Routines that ought to be in class SPECIAL. %
		%A special object is a zero-based indexed sequence of values, %
		%equipped with features `put', `item' and `count'."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"

class KL_SPECIAL_ROUTINES [G]

feature -- Initialization

	make (n: INTEGER): SPECIAL [G]
			-- Create a new special object being able to contain `n' items.
		require
			non_negative_n: n >= 0
		do
			create Result.make_empty (n)
		ensure
			instance_free: class
			special_not_void: Result /= Void
			capacity_set: Result.capacity = n
		end

	make_filled (v: G; n: INTEGER): SPECIAL [G]
			-- Create a special object for `n' entries initialized with `v'.
		require
			non_negative_argument: n >= 0
		do
			create Result.make_filled (v, n)
		ensure
			instance_free: class
			special_not_void: Result /= Void
			capacity_set: Result.capacity = n
			count_set: Result.count = n
			filled: across 0 |..| (n - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), v) end
		end

	make_from_array (an_array: ARRAY [G]): SPECIAL [G]
			-- Create a new special object with items from `an_array'.
		require
			an_array_not_void: an_array /= Void
		local
			array_routines: KL_ARRAY_ROUTINES [G]
		do
			create array_routines
			Result := array_routines.make_from_array (an_array, 0).area
		ensure
			instance_free: class
			special_not_void: Result /= Void
			count_set: Result.count = an_array.count
			same_items: across 0 |..| (Result.count - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), an_array.item (an_array.lower + i.item)) end
		end

feature -- Conversion

	to_special (an_array: ARRAY [G]): SPECIAL [G]
			-- Fixed array filled with items from `an_array'.
			-- The fixed array and `an_array' may share
			-- internal data and/or `an_array' may be altered.
			-- Use `make_from_array' if this is a concern.
		require
			an_array_not_void: an_array /= Void
		do
			Result := an_array.area
		ensure
			instance_free: class
			special_not_void: Result /= Void
			count_set: Result.count >= an_array.count
			same_items: across 0 |..| (an_array.count - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), an_array.item (an_array.lower + i.item)) end
		end

feature -- Status report

	has (an_array: SPECIAL [G]; v: G): BOOLEAN
			-- Does `v' appear in `an_array'?
		require
			an_array_not_void: an_array /= Void
		local
			i: INTEGER
		do
			from
				i := an_array.count - 1
			until
				Result or i < 0
			loop
				Result := an_array.item (i) = v
				i := i - 1
			end
		ensure
			instance_free: class
		end

feature -- Element change

	force (a_array: SPECIAL [G]; v: G; i: INTEGER)
			-- If `i' is equal to `a_array.count' increase `a_array.count'
			-- by one and insert `v' at index `a_array.count',
			-- otherwise replace `i'-th item by `v'.
		require
			a_array_not_void: a_array /= Void
			i_large_enough: i >= 0
			i_small_enough: i < a_array.capacity
			not_full: i = a_array.count implies a_array.count < a_array.capacity
		do
			if i < a_array.count then
				a_array.put (v, i)
			else
				a_array.fill_with (v, a_array.count, i)
			end
		ensure
			instance_free: class
		end

	keep_head (an_array: SPECIAL [G]; n: INTEGER; a_old_count: INTEGER)
			-- Keep the first `n' entries of `an_array'.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= a_old_count
			valid_old_count: a_old_count <= an_array.capacity
		do
			an_array.keep_head (n)
		ensure
			instance_free: class
			kept: across 0 |..| (n - 1) as i all {KL_TYPE [G]}.same_objects (an_array.item (i.item), (old an_array.twin).item (i.item)) end
		end

feature -- Resizing

	resize (an_array: SPECIAL [G]; n: INTEGER): SPECIAL [G]
			-- Resize `an_array' so that it can contain `n' items.
			-- Do not lose any previously entered items.
			-- Note: the returned special object might be `an_array'
			-- or a newly created special object where items from
			-- `an_array' have been copied to.
		obsolete
			"Use `aliased_resized_area' instead. [2013-08-23]"
		require
			an_array_not_void: an_array /= Void
			n_large_enough: n >= an_array.capacity
		do
			Result := aliased_resized_area (an_array, n)
		ensure
			instance_free: class
			special_not_void: Result /= Void
			count_set: Result.capacity = n
			preserved: across 0 |..| (n.min (old an_array.count) - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), (old an_array.twin).item (i.item)) end
		end

	aliased_resized_area (an_array: SPECIAL [G]; n: INTEGER): SPECIAL [G]
			-- Try to resize `an_array' so that it can contain `n' items.
			-- Do not lose any previously entered items.
			-- Note: the returned special object might be `an_array'
			-- or a newly created special object where items from
			-- `an_array' have been copied to.
		require
			an_array_not_void: an_array /= Void
			n_large_enough: n >= an_array.capacity
		do
			if n > an_array.capacity then
				Result := an_array.aliased_resized_area (n)
			else
				Result := an_array
			end
		ensure
			instance_free: class
			special_not_void: Result /= Void
			count_set: Result.capacity = n
			preserved: across 0 |..| (n.min (old an_array.count) - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), (old an_array.twin).item (i.item)) end
		end

	aliased_resized_area_with_default (an_array: SPECIAL [G]; a_default_value: G; n: INTEGER): SPECIAL [G]
			-- Try to resize `an_array' with a count of `n', if not
			-- possible a new copy. Non yet initialized entries are set to `a_default_value'.
		require
			an_array_not_void: an_array /= Void
			n_large_enough: n >= an_array.capacity
		do
			if n > an_array.capacity then
				Result := an_array.aliased_resized_area_with_default (a_default_value, n)
			else
				Result := an_array
			end
		ensure
			instance_free: class
			special_not_void: Result /= Void
			new_count: Result.count = n
			new_capacity: Result.capacity = n
			preserved: across 0 |..| (n.min (old an_array.count) - 1) as i all {KL_TYPE [G]}.same_objects (Result.item (i.item), (old an_array.twin).item (i.item)) end
		end

end
