indexing

	description:
		"Packed boolean strings"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	names: packed_booleans;
	access: index;
	representation: array;
	size: fixed;
	date: "$Date$"
	revision: "$Revision$"

class BOOL_STRING inherit

	TO_SPECIAL [BOOLEAN]
		export
			{NONE} all
			{BOOL_STRING} area
		redefine
			item, infix "@", put, valid_index
		end
		
	ANY

create

	make

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate area of `n' booleans.
		require
			non_negative_size: n >= 0
		do
			make_area (n)
		ensure
			correct_allocation: count = n
		end

feature -- Access

	item alias "[]", infix "@" (i: INTEGER): BOOLEAN assign put is
			-- Boolean at `i'-th position,
			-- beginning at left, 1 origin
		do
			Result := area.item (i - 1)
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of Current?
		do
			Result := (1 <= i) and then (i <= count)
		end

feature -- Measurement

	count: INTEGER is
			-- Number of boolean in the area.
		do
			Result := area.count
		end

feature -- Element change

	put (v: like item; i: INTEGER) is
			-- Put boolean `v' at `i'-th position
			-- beginning at left, 1 origin.
		do
			area.put (v, i - 1)
		end

	all_true is
			-- Set all booleans to true.
		do
			area.fill_with (True, 0, count - 1)
		end

	all_false is
			-- Set all booleans to false.
		do
			area.fill_with (False, 0, count - 1)
		end

feature -- Basic operations

	infix "and" (other: like Current): like Current is
		-- Logical and of 'Current' and `other'
		require
			other_not_void: other /= Void
			same_size: other.count = count
		local
			other_area, result_area: like area
			i: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			other_area := other.area
			from i := count - 1 until i < 0 loop
				result_area.put (area.item (i) and other_area.item (i), i)
				i := i - 1
			end
		end

	infix "or" (other: like Current): like Current is
			-- Logical or of 'Current' and `other'
		require
			other_not_void: other /= Void
			same_size: other.count = count
		local
			other_area, result_area: like area
			i: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			other_area := other.area
			from i := count - 1 until i < 0 loop
				result_area.put (area.item (i) or other_area.item (i), i)
				i := i - 1
			end
		end

	infix "xor" (other: like Current): like Current is
		-- Logical exclusive or of 'Current' and `other'
		require
			other_not_void: other /= Void
			same_size: other.count = count
		local
			other_area, result_area: like area
			i: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			other_area := other.area
			from i := count - 1 until i < 0 loop
				result_area.put (area.item (i) xor other_area.item (i), i)
				i := i - 1
			end
		end

	prefix "not": like Current is
			-- Negation of 'Current'
		local
			result_area: like area
			i: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			from i := count - 1 until i < 0 loop
				result_area.put (not area.item (i), i)
				i := i - 1
			end
		end

	right_shifted (n: INTEGER): like Current is
			-- Right shifted 'Current' set, by `n' positions
		require
			non_negative_shift: n >= 0
		local
			result_area: like area
			shift_count: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			shift_count := count - n
			if shift_count > 0 then
				result_area.copy_data (area, 0, n, shift_count)
			end
		end

	left_shifted (n: INTEGER): like Current is
			-- Left shifted 'Current' set, by `n' positions
		require
			non_negative_shift: n >= 0
		local
			result_area: like area
			shift_count: INTEGER
		do
			create Result.make (count)
			result_area := Result.area
			shift_count := count - n
			if shift_count > 0 then
				result_area.copy_data (area, n, 0, shift_count)
			end
		end

end
