indexing

	description:

		"Eiffel feature seed lists (first declarations of a feature)"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_SEEDS

inherit

	ANY
		redefine
			copy, is_equal
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_seed: INTEGER) is
			-- Create a new feature seed list with
			-- `a_seed' as first seed.
		do
			!! seeds.make (1, 1)
			put (a_seed)
		ensure
			count_set: count = 1
			first_set: first = a_seed
		end

	make_with_capacity (a_seed: INTEGER; nb: INTEGER) is
			-- Create a new feature seed list with
			-- `a_seed' as first seed.
		require
			nb_large_enough: nb > 1
		do
			!! seeds.make (1, nb)
			put (a_seed)
		ensure
			count_set: count = 1
			first_set: first = a_seed
		end

feature -- Access

	item (i: INTEGER): INTEGER is
			-- `i'-th feature seed
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := seeds.item (i)
		end

	first: INTEGER is
			-- First seed
		do
			Result := item (1)
		ensure
			definition: Result = item (1)
		end

feature -- Measurement

	count: INTEGER
			-- Number of seeds

feature -- Status report

	has (a_seed: INTEGER): BOOLEAN is
			-- Is `a_seed' included in the list of seeds?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if seeds.item (i) = a_seed then
					Result := True
					i := nb + 1  -- Jump out of loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put (a_seed: INTEGER) is
			-- Add `a_seed' to the list of seeds.
		require
			not_has: not has (a_seed)
		do
			count := count + 1
			if seeds.upper < count then
				seeds.resize (1, count)
			end
			seeds.put (a_seed, count)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = a_seed
		end

	replace (old_seed, new_seed: INTEGER) is
			-- Replace `old_seed' by `new_seed'.
		require
			old_seed_not_void: old_seed /= Void
			has_old_seed: has (old_seed)
			new_seed_not_void: new_seed /= Void
			not_has_new_seed: not has (new_seed)
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if seeds.item (i) = old_seed then
					seeds.put (new_seed, i)
					i := nb + 1  -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			same_count: count = old count
			not_has_old_seed: not has (old_seed)
			has_new_seed: has (new_seed)
		end

feature -- Removal

	remove (a_seed: INTEGER) is
			-- Remove `a_seed' from the list of seeds.
		require
			a_seed_not_void: a_seed /= Void
			has_seed: has (a_seed)
			count_large_enough: count > 1
		local
			i, j, nb: INTEGER
			old_seed: INTEGER
		do
			j := 1
			nb := count
			from i := 1 until i > nb loop
				old_seed := seeds.item (i)
				if old_seed /= a_seed then
					seeds.put (old_seed, j)
					j := j + 1
				end
				i := i + 1
			end
			count := count - 1
		ensure
			one_less: count = old count - 1
			not_has_seed: not has (a_seed)
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to `Current'.
		do
			standard_copy (other)
			seeds := clone (seeds)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		local
			i, nb: INTEGER
		do
			if same_type (other) and then count = other.count then
				nb := count
				Result := True
				from i := 1 until i > nb loop
					if item (i) /= other.item (i) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	seeds: ARRAY [INTEGER]
			-- List of seeds

invariant

	not_empty: count > 0
	seeds_not_void: seeds /= Void
	seeds_lower: seeds.lower = 1
	seeds_upper: seeds.upper >= count

end -- class ET_FEATURE_SEEDS
