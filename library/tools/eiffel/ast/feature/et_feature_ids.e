note

	description:

		"Eiffel feature id lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_IDS

inherit

	ANY
		redefine
			copy, is_equal
		end

	KL_CLONABLE
		undefine
			copy, is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			copy, is_equal
		end

	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			copy, is_equal
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_id: INTEGER) is
			-- Create a new feature id list with
			-- `an_id' as first id.
		require
			an_id_positive: an_id > 0
		do
			create feature_ids.make (1, 1)
			put (an_id)
		ensure
			count_set: count = 1
			first_set: first = an_id
		end

	make_with_capacity (an_id: INTEGER; nb: INTEGER) is
			-- Create a new feature id list with
			-- `an_id' as first id.
		require
			an_id_positive: an_id > 0
			nb_large_enough: nb > 1
		do
			create feature_ids.make (1, nb)
			put (an_id)
		ensure
			count_set: count = 1
			first_set: first = an_id
		end

feature -- Access

	item (i: INTEGER): INTEGER is
			-- `i'-th feature id
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := feature_ids.item (i)
		ensure
			item_positive: Result > 0
		end

	first: INTEGER is
			-- First id
		do
			Result := item (1)
		ensure
			definition: Result = item (1)
		end

feature -- Measurement

	count: INTEGER
			-- Number of ids

feature -- Status report

	has (an_id: INTEGER): BOOLEAN is
			-- Is `an_id' included in the list of featire ids?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if feature_ids.item (i) = an_id then
					Result := True
					i := nb + 1  -- Jump out of loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put (an_id: INTEGER) is
			-- Add `an_id' to the list of feature ids.
		require
			an_id_positive: an_id > 0
			not_has: not has (an_id)
		do
			count := count + 1
			if feature_ids.upper < count then
				INTEGER_ARRAY_.resize (feature_ids, 1, count)
			end
			feature_ids.put (an_id, count)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = an_id
		end

	replace (old_id, new_id: INTEGER) is
			-- Replace `old_id' by `new_id'.
		require
			has_old_id: has (old_id)
			new_id_positive: new_id > 0
			not_has_new_id: not has (new_id)
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if feature_ids.item (i) = old_id then
					feature_ids.put (new_id, i)
					i := nb + 1  -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			same_count: count = old count
			not_has_old_id: not has (old_id)
			has_new_id: has (new_id)
		end

feature -- Removal

	remove (an_id: INTEGER) is
			-- Remove `an_id' from the list of feature ids.
		require
			has_id: has (an_id)
			count_large_enough: count > 1
		local
			i, j, nb: INTEGER
			old_id: INTEGER
		do
			j := 1
			nb := count
			from i := 1 until i > nb loop
				old_id := feature_ids.item (i)
				if old_id /= an_id then
					feature_ids.put (old_id, j)
					j := j + 1
				end
				i := i + 1
			end
			count := count - 1
		ensure
			one_less: count = old count - 1
			not_has_id: not has (an_id)
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to `Current'.
		do
			standard_copy (other)
			feature_ids := INTEGER_ARRAY_.cloned_array (feature_ids)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		local
			i, nb: INTEGER
		do
			if other = Current then
				Result := True
			elseif ANY_.same_types (Current, other) and then count = other.count then
				nb := count
				Result := True
				from i := 1 until i > nb loop
					if not other.has (item (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	feature_ids: ARRAY [INTEGER]
			-- List of feature ids

invariant

	not_empty: count > 0
	feature_ids_not_void: feature_ids /= Void
	feature_ids_lower: feature_ids.lower = 1
	feature_ids_upper: feature_ids.upper >= count
	--ids_positive: forall i in 1..count, feature_ids.item (i) > 0

end
