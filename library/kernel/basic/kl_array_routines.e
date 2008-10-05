indexing

	description:

		"Routines that ought to be in class ARRAY"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_ARRAY_ROUTINES [G]

inherit

	KL_IMPORTED_ANY_ROUTINES

feature -- Initialization

	make_from_array (an_array: ARRAY [G]; min_index: INTEGER): ARRAY [G] is
			-- Create a new array and initialize it
			-- with items from `an_array'.
		require
			an_array_not_void: an_array /= Void
		do
			Result := subarray (an_array, an_array.lower, an_array.upper, min_index)
		ensure
			array_not_void: Result /= Void
			lower_set: Result.lower = min_index
			count_set: Result.count = an_array.count
--			same_items: forall i in Result.lower .. Result.upper, Result.item (i) = an_array.item (i + an_array.lower - min_index)
		end

feature -- Status report

	has (an_array: ARRAY [G]; v: G): BOOLEAN is
			-- Does `v' appear in `an_array' (use '=' for item comparison).
			-- Reasons why we don't use ARRAY.has directly:
			-- * `has' is not in ELKS ARRAY 2000.
			-- * ISE may change this behavior with `compare_objects'.
		require
			an_array_not_void: an_array /= Void
		local
			i, nb: INTEGER
		do
			from
				i := an_array.lower
				nb := an_array.upper
			until
				i > nb
			loop
				if an_array.item (i) = v then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

feature -- Access

	subarray (an_array: ARRAY [G]; start_pos, end_pos, min_index: INTEGER): ARRAY [G] is
			-- Array made up of items from `an_array' within
			-- bounds `start_pos' and `end_pos'
			-- Reasons why we don't use ARRAY.subarray directly:
			-- * ELKS ARRAY 2000 returns an 'ARRAY [G]'
			--   whereas ISE 5.4/5.5 return a 'like Current'.
			-- * ISE 5.4/5.5 does not allow subarrays of empty array,
			--   and does not work with empty subarrays.
			-- * This routine has an extra argument `min_index' compared
			--   to the one provided by ELKS and the various compilers.
		require
			an_array_not_void: an_array /= Void
			start_pos_large_enough: start_pos >= an_array.lower
			end_pos_small_enough: end_pos <= an_array.upper
			valid_bounds: start_pos <= end_pos + 1
		do
			create Result.make (min_index, min_index + end_pos - start_pos)
			subcopy (Result, an_array, start_pos, end_pos, min_index)
		ensure
			array_not_void: Result /= Void
			lower_set: Result.lower = min_index
			count_set: Result.count = end_pos - start_pos + 1
--			same_items: forall i in Result.lower .. Result.upper, Result.item (i) = an_array.item (i + start_pos - min_index)
		end

feature -- Duplication

	cloned_array (an_array: ARRAY [G]): ARRAY [G] is
			-- Clone of `an_array'
		require
			an_array_not_void: an_array /= Void
		do
			Result := an_array.twin
		ensure
			cloned_not_void: Result /= Void
			same_type: ANY_.same_types (Result, an_array)
			is_equal: Result.is_equal (an_array)
		end

feature -- Element change

	subcopy (an_array: ARRAY [G]; other: ARRAY [G]; start_pos, end_pos, index_pos: INTEGER) is
			-- Copy items of `other' within bounds `start_pos' and `end_pos'
			-- to `an_array' starting at index `index_pos'.
			-- Reasons why we don't use ARRAY.subcopy directly:
			-- * `subcopy' is not in ELKS ARRAY 2000.
		require
			an_array_not_void: an_array /= Void
			other_not_void: other /= Void
			not_same: an_array /= other
			start_pos_large_enough: start_pos >= other.lower
			end_pos_small_enough: end_pos <= other.upper
			valid_bounds: start_pos <= end_pos + 1
			index_pos_large_enough: index_pos >= an_array.lower
			enough_space: (an_array.upper - index_pos) >= (end_pos - start_pos)
		do
			if start_pos <= end_pos then
				an_array.subcopy (other, start_pos, end_pos, index_pos)
			end
		ensure
			-- copied: forall i in 0 .. (end_pos - start_pos), an_array.item (index_pos + i) = other.item (start_pos + i)
		end

feature -- Removal

	clear_all (an_array: ARRAY [G]) is
			-- Reset all items to default values.
		obsolete
			"[040929] Use `an_array.clear_all' instead."
		require
			an_array_not_void: an_array /= Void
		do
			an_array.clear_all
		ensure
			-- all_cleared: forall i in an_array.lower .. an_array.upper, an_array.item (i) = Void or else an_array.item (i) = an_array.item (i).default
		end

feature -- Resizing

	resize (an_array: ARRAY [G]; min_index, max_index: INTEGER) is
			-- Rearrange array so that it can accommodate
			-- indices down to `min_index' and up to `max_index'.
			-- Do not lose any previously entered item.
		require
			an_array_not_void: an_array /= Void
			valid_min_index: min_index <= an_array.lower
			valid_max_index: max_index >= an_array.upper
		do
				-- If "`min_index' = `max_index' + 1", this means that the
				-- array was already empty. No need to resize in that case.
			if min_index <= max_index then
				an_array.conservative_resize (min_index, max_index)
			end
		ensure
			lower_set: an_array.lower = min_index
			upper_set: an_array.upper = max_index
		end

end
