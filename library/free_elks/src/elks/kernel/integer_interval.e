note
	description: "Contiguous integer intervals"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_INTERVAL

inherit
	RESIZABLE [INTEGER]
		undefine
			changeable_comparison_criterion
		redefine
			copy, is_equal
		end

	INDEXABLE [INTEGER, INTEGER]
		rename
			item as item alias "[]",
			put as indexable_put
		undefine
			changeable_comparison_criterion
		redefine
			copy,
			index_set,
			is_equal
		select
			bag_put
		end

	SET [INTEGER]
		redefine
			copy, is_equal
		end

create
	make

feature {NONE} -- Initialization

	make (min_index, max_index: INTEGER)
			-- Set up interval to have bounds `min_index' and
			-- `max_index' (empty if `min_index' > `max_index')
		do
			if min_index <= max_index then
				lower := min_index
				upper := max_index
			else
				lower := 1
				upper := 0
			end
		ensure
			lower_defined: lower_defined
			upper_defined: upper_defined
			set_if_non_empty:
				(min_index <= max_index) implies
					((lower = min_index) and
					(upper = max_index))
			empty_if_not_in_order:
				(min_index > max_index) implies is_empty
		end

feature -- Initialization

	adapt (other: INTEGER_INTERVAL)
			-- Reset to be the same interval as `other'.
		require
			other_not_void: other /= Void
		do
			lower := other.lower
			upper := other.upper
		ensure
			same_lower: lower = other.lower
			same_upper: upper = other.upper
			same_lower_defined: lower_defined = other.lower_defined
			same_upper_defined: upper_defined = other.upper_defined
		end

feature -- Access

	lower_defined: BOOLEAN = True
			-- Is there a lower bound?

	lower: INTEGER
			-- Smallest value in interval.

	upper_defined: BOOLEAN = True
			-- Is there an upper bound?

	upper: INTEGER
			-- Largest value in interval.

	item alias "[]", at alias "@" (i: INTEGER): INTEGER
			-- Entry at index `i', if in index interval
		do
			Result := i
		end

	has, valid_index (v: INTEGER): BOOLEAN
			-- Does `v' appear in interval?
		do
			Result :=
				(upper_defined implies v <= upper) and
				(lower_defined implies v >= lower)
		ensure then
			iff_within_bounds: Result =
				((upper_defined implies v <= upper) and
				(lower_defined implies v >= lower))
		end

feature -- Measurement

	occurrences (v: INTEGER): INTEGER
			-- Number of times `v' appears in structure
		do
			if has (v) then
				Result := 1
			end
		ensure then
			one_iff_in_bounds: Result = 1 implies has (v)
			zero_otherwise: Result /= 1 implies Result = 0
		end

	capacity: INTEGER
			-- Maximum number of items in interval
			-- (here the same thing as `count')
		do
			check
				terminal: upper_defined and lower_defined
			end
			Result := count
		end

	count: INTEGER
			-- Number of items in interval
		do
			check
				finite: upper_defined and lower_defined
			end
			if upper_defined and lower_defined then
				Result := upper - lower + 1
			end
		ensure then
			definition: Result = upper - lower + 1
		end

	index_set: INTEGER_INTERVAL
			-- <Precursor>
			-- (here: the interval itself)
		do
			Result := Current
		ensure then
			index_set_is_range: Result ~ Current
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is array made of the same items as `other'?
		do
			Result :=
				(lower_defined implies (other.lower_defined and lower = other.lower)) and
				(upper_defined implies (other.upper_defined and upper = other.upper))
		ensure then
			iff_same_bounds: Result =
				((lower_defined implies (other.lower_defined and lower = other.lower)) and
				(upper_defined implies (other.upper_defined and upper = other.upper)))
		end

feature -- Status report

	all_cleared: BOOLEAN
			-- Are all items set to default values?
		do
			Result := (lower = 0) and (upper = 0)
		ensure then
			iff_at_zero: Result = ((lower = 0) and (upper = 0))
		end

	extendible: BOOLEAN
			-- May new items be added?
			-- Answer: yes
		do
			Result := True
		end

	prunable: BOOLEAN
			-- May individual items be removed?
			-- Answer: no
		do
			Result := False
		end

feature -- Element change

	extend, put (v: INTEGER)
			-- Make sure that interval goes all the way
			-- to `v' (up or down).
		do
			if v < lower then
				lower := v
			elseif v > upper then
				upper := v
			end
		ensure then
			extended_down: lower = (old lower).min (v)
			extended_up: upper = (old upper).max (v)
		end

feature -- Resizing

	resize (min_index, max_index: INTEGER)
			-- Rearrange interval to go from at most
			-- `min_index' to at least `max_index',
			-- encompassing previous bounds.
		do
			lower := min_index.min (lower)
			upper := max_index.max (upper)
		end

	resize_exactly (min_index, max_index: INTEGER)
			-- Rearrange interval to go from
			-- `min_index' to `max_index'.
		do
			lower := min_index
			upper := max_index
		end

	grow (i: INTEGER)
			-- Ensure that capacity is at least `i'.
		do
			if capacity < i then
				resize (lower, lower + i - 1)
			end
		ensure then
			no_loss_from_bottom: lower <= old lower
			no_loss_from_top: upper >= old upper
		end

	trim
			-- <Precursor>
		do
			check
				minimal_capacity: capacity = count
			end
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		do
			lower := 1
			upper := 0
		end

feature -- Conversion

	as_array: ARRAY [INTEGER]
			-- Plain array containing interval's items
		require
			finite: upper_defined and lower_defined
		local
			i, nb: INTEGER
		do
			from
				i := lower
				nb := upper
				create Result.make_filled (0, i, nb)
			until
				i > nb
			loop
				Result.put (i, i)
				i := i + 1
			end
		ensure
			same_lower: Result.lower = lower
			same_upper: Result.upper = upper
		end

	to_c: ANY
			-- Address of actual sequence of values,
			-- for passing to external (non-Eiffel) routines.
		obsolete
			"No replacement. [2017-05-31]"
		do
			Result := Current
			check
				False
			end
		end

	linear_representation: LINEAR [INTEGER]
			-- Representation as a linear structure
		do
			check
				terminal: upper_defined and lower_defined
			end
			Result := as_array.linear_representation
		end

feature -- Duplication

	copy (other: like Current)
			-- Reset to be the same interval as `other'.
		do
			if other /= Current then
				standard_copy (other)
			end
		end

	subinterval (start_pos, end_pos: INTEGER): like Current
			-- Interval made of items of current array within
			-- bounds `start_pos' and `end_pos'.
		do
			create Result.make (start_pos, end_pos)
		end

feature -- Iteration

	do_all (action: PROCEDURE [INTEGER])
			-- Apply `action' to every item of current interval.
		require
			action_exists: action /= Void
			finite: upper_defined and lower_defined
		local
			i, nb: INTEGER
		do
			from
				i := lower
				nb := upper
			until
				i > nb
			loop
				action.call ([i])
				i := i + 1
			end
		end

	for_all (condition:
				FUNCTION [INTEGER, BOOLEAN]):
			BOOLEAN
			-- Do all interval's values satisfy `condition'?
		require
			finite: upper_defined and lower_defined
			condition_not_void: condition /= Void
		local
			i: INTEGER
		do
			from
				Result := True; i := lower
			until
				(i > upper) or else (not condition.item ([i]))
			loop
				i := i + 1
			end
			Result := i > upper
		ensure
			consistent_with_count:
				Result = (hold_count (condition) = count)
		end

	exists (condition:
				FUNCTION [INTEGER, BOOLEAN]):
			BOOLEAN
			-- Does at least one of  interval's values
			-- satisfy `condition'?
		require
			finite: upper_defined and lower_defined
			condition_not_void: condition /= Void
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper or else condition.item ([i])
			loop
				i := i + 1
			end
			Result := i <= upper
		ensure
			consistent_with_count:
				Result = (hold_count (condition) > 0)
		end

	exists1 (condition:
				FUNCTION [INTEGER, BOOLEAN]):
			BOOLEAN
			-- Does exactly one of  interval's values
			-- satisfy `condition'?
		require
			finite: upper_defined and lower_defined
			condition_not_void: condition /= Void
		do
			Result := hold_count (condition) = 1
		ensure
			consistent_with_count:
				Result = (hold_count (condition) = 1)
		end

	hold_count (condition:
				FUNCTION [INTEGER, BOOLEAN]):
			INTEGER
			-- Number of  interval's values that
			-- satisfy `condition'
		require
			finite: upper_defined and lower_defined
			condition_not_void: condition /= Void
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				if condition.item ([i]) then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure
			non_negative: Result >= 0
		end

feature {NONE} -- Inapplicable

	prune (v: INTEGER)
			-- Remove one occurrence of `v' if any.
			-- Not applicable here.
		do
		end

	indexable_put (v: INTEGER; k: INTEGER)
			-- Associate value `v' with key `k'.
			-- Not applicable here.
		do
		end

invariant
	count_definition: upper_defined and lower_defined implies count = upper - lower + 1
	not_infinite: upper_defined and lower_defined

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
