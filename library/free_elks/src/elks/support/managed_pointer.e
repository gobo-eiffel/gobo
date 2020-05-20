note
	description: "[
		To easily manage allocation and release of allocated C memory, and
		to perform insertion of basic elements. Byte order is by default
		platform specific.
		Although memory allocation routines do not accept a zero sized pointer
		MANAGED_POINTER does by allocating in fact a 1 byte sized pointer for
		this particular case.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MANAGED_POINTER

inherit
	DISPOSABLE
		redefine
			is_equal, copy
		end

	PLATFORM
		redefine
			is_equal, copy
		end

create
	make, make_from_array, make_from_pointer, share_from_pointer, own_from_pointer

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Allocate `item' with `n' bytes.
		require
			n_non_negative: n >= 0
		do
			increment_counter
			item := item.memory_calloc (n.max (1), 1)
			if item = default_pointer then
				(create {EXCEPTIONS}).raise ("No more memory")
			end
			count := n
			is_shared := False
		ensure
			item_set: item /= default_pointer
			count_set: count = n
			is_shared_set: not is_shared
		end

	make_from_array (data: ARRAY [NATURAL_8])
			-- Allocate `item' with `data.count' bytes and copy
			-- content of `data' into `item'.
		require
			data_not_void: data /= Void
		do
			increment_counter
			count := data.count
			item := item.memory_alloc (count.max (1))
			if item = default_pointer then
				(create {EXCEPTIONS}).raise ("No more memory")
			end
			put_array (data, 0)
			is_shared := False
		ensure
			item_set: item /= default_pointer
			count_set: count = data.count
			is_shared_set: not is_shared
		end

	make_from_pointer (a_ptr: POINTER; n: INTEGER)
			-- Copy `a_count' bytes from `a_ptr' into current.
		require
			a_ptr_not_null: a_ptr /= default_pointer
			n_non_negative: n >= 0
		do
			increment_counter
			item := item.memory_alloc (n.max (1))
			if item = default_pointer then
				(create {EXCEPTIONS}).raise ("No more memory")
			end
			item.memory_copy (a_ptr, n)
			count := n
			is_shared := False
		ensure
			item_set: item /= default_pointer
			count_set: count = n
			is_shared_set: not is_shared
		end

	share_from_pointer (a_ptr: POINTER; n: INTEGER)
			-- Use directly `a_ptr' with count `n' to hold current data.
		require
			a_ptr_valid: a_ptr = default_pointer implies n = 0
			n_non_negative: n >= 0
		do
			increment_counter
			item := a_ptr
			count := n
			is_shared := True
		ensure
			item_set: item = a_ptr
			count_set: count = n
			is_shared_set: is_shared
		end

	own_from_pointer (a_ptr: POINTER; n: INTEGER)
			-- Use directly `a_ptr' with count `n' to hold current data and free
			-- its associated C memory when Current is collected.
			-- It assumes that `a_ptr' was allocated using the C-`malloc' routine and thus
			-- will be freed by calling the C-`free' routine.
		require
			a_ptr_valid: a_ptr /= default_pointer
			n_non_negative: n >= 0
		do
			increment_counter
			item := a_ptr
			count := n
			is_shared := False
		ensure
			item_set: item = a_ptr
			count_set: count = n
			is_shared_set: not is_shared
		end

feature -- Settings

	set_from_pointer (a_ptr: POINTER; n: INTEGER)
			-- Use directly `a_ptr' with count `n' to hold current data.
		require
			is_shared: is_shared
			a_ptr_not_null: a_ptr = default_pointer implies n = 0
			n_non_negative: n >= 0
		do
			item := a_ptr
			count := n
		ensure
			item_set: item = a_ptr
			count_set: count = n
			is_shared_unchanged: is_shared
		end

feature -- Access

	item: POINTER note option: transient attribute end
			-- Access to allocated memory.

	count: INTEGER
			-- Number of elements that Current can hold.

	is_shared: BOOLEAN
			-- Is `item' shared with another memory area?

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered equal to current object?
		do
			if count = other.count then
				Result := (item = other.item) or else item.memory_compare (other.item, count)
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects. If `is_shared'
			-- and current is not large enough to hold `other' create
			-- a new pointer area and `is_shared' is set to `False'.
		do
			if other /= Current then
				if item = other.item or is_shared then
						-- Copy was most likely called via `twin' but even
						-- if it is not, it makes sense to duplicate the memory.
						-- Or before `item' was shared, so we simply allocate
						-- a new memory area from `other' and reset
						-- the `is_shared' flag.
					make_from_pointer (other.item, other.count)
				else
						-- Simply resize Current and copy data.
					resize (other.count)
					item.memory_copy (other.item, other.count)
				end
			end
		ensure then
			sharing_status_not_preserved: (other /= Current) implies (old is_shared implies not is_shared)
			count_preserved: count = other.count
		end

feature -- Access: Platform specific

	read_natural_8 (pos: INTEGER): NATURAL_8
			-- Read NATURAL_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_8_bytes)
		end

	read_natural_16 (pos: INTEGER): NATURAL_16
			-- Read NATURAL_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_16_bytes)
		end

	read_natural_32 (pos: INTEGER): NATURAL_32
			-- Read NATURAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_32_bytes)
		end

	read_natural_64 (pos: INTEGER): NATURAL_64
			-- Read NATURAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_64_bytes)
		end

	read_integer_8 (pos: INTEGER): INTEGER_8
			-- Read INTEGER_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			Result := read_natural_8 (pos).as_integer_8
		end

	read_integer_16 (pos: INTEGER): INTEGER_16
			-- Read INTEGER_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			Result := read_natural_16 (pos).as_integer_16
		end

	read_integer_32 (pos: INTEGER): INTEGER
			-- Read INTEGER at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			Result := read_natural_32 (pos).as_integer_32
		end

	read_integer_64 (pos: INTEGER): INTEGER_64
			-- Read INTEGER_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			Result := read_natural_64 (pos).as_integer_64
		end

	read_pointer (pos: INTEGER): POINTER
			-- Read POINTER at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Pointer_bytes) <= count
		do
			($Result).memory_copy (item + pos, Pointer_bytes)
		end

	read_boolean (pos: INTEGER): BOOLEAN
			-- Read BOOLEAN at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Boolean_bytes) <= count
		do
			($Result).memory_copy (item + pos, Boolean_bytes)
		end

	read_character (pos: INTEGER): CHARACTER_8
			-- Read CHARACTER at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Character_8_bytes) <= count
		do
			($Result).memory_copy (item + pos, Character_8_bytes)
		end

	read_real (pos: INTEGER): REAL_32
			-- Read REAL_32 at position `pos'.
		obsolete "Use read_real_32 instead. [2017-05-31]"
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_32_bytes) <= count
		do
			($Result).memory_copy (item + pos, Real_32_bytes)
		end

	read_real_32 (pos: INTEGER): REAL_32
			-- Read REAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_32_bytes) <= count
		do
			($Result).memory_copy (item + pos, Real_32_bytes)
		end

	read_double (pos: INTEGER): REAL_64
			-- Read REAL_64 at position `pos'.
		obsolete "Use read_real_64 instead. [2017-05-31]"
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_64_bytes) <= count
		do
			($Result).memory_copy (item + pos, Real_64_bytes)
		end

	read_real_64 (pos: INTEGER): REAL_64
			-- Read REAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_64_bytes) <= count
		do
			($Result).memory_copy (item + pos, Real_64_bytes)
		end

	read_array (pos, a_count: INTEGER): ARRAY [NATURAL_8]
			-- Read `count' bytes at position `pos'.
		require
			pos_nonnegative: pos >= 0
			count_positive: a_count > 0
			valid_position: (pos + a_count) <= count
		local
			l_area: SPECIAL [NATURAL_8]
		do
			create l_area.make_filled (0, a_count)
			read_into_special_natural_8 (l_area, pos, 0, a_count)
			create Result.make_from_special (l_area)
		ensure
			read_array_not_void: Result /= Void
			read_array_valid_count: Result.count = a_count
		end

	read_special_natural_8 (source_index, n: INTEGER): SPECIAL [NATURAL_8]
			-- Read `n' bytes of Current from position `source_index'.
		require
			source_index_non_negative: source_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
		do
			create Result.make_filled (0, n)
			read_into_special_natural_8 (Result, source_index, 0, n)
		end

	read_special_character_8 (source_index, n: INTEGER): SPECIAL [CHARACTER_8]
			-- Read `n' bytes of Current from position `source_index'.
		require
			source_index_non_negative: source_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
		do
			create Result.make_filled ('%U', n)
			read_into_special_character_8 (Result, source_index, 0, n)
		end

	read_into_special_natural_8 (a_spec: SPECIAL [NATURAL_8]; source_index, destination_index, n: INTEGER)
			-- Read `n' bytes of Current from position `source_index' and store them in `a_spec' at `destination_index'.
		require
			a_spec_not_void: a_spec /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= a_spec.count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= a_spec.count
		do
			a_spec.item_address (destination_index).memory_copy (item + source_index, n)
		end

	read_into_special_character_8 (a_spec: SPECIAL [CHARACTER_8]; source_index, destination_index, n: INTEGER)
			-- Read `n' bytes of Current from position `source_index' and store them in `a_spec' at `destination_index'.
		require
			a_spec_not_void: a_spec /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= a_spec.count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= a_spec.count
		do
			a_spec.item_address (destination_index).memory_copy (item + source_index, n)
		end

feature -- Element change: Platform specific

	put_natural_8 (i: NATURAL_8; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_8_bytes)
		ensure
			inserted: i = read_natural_8 (pos)
		end

	put_natural_16 (i: NATURAL_16; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_16_bytes)
		ensure
			inserted: i = read_natural_16 (pos)
		end

	put_natural_32 (i: NATURAL_32; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_32_bytes)
		ensure
			inserted: i = read_natural_32 (pos)
		end

	put_natural_64 (i: NATURAL_64; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_64_bytes)
		ensure
			inserted: i = read_natural_64 (pos)
		end

	put_integer_8 (i: INTEGER_8; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			put_natural_8 (i.as_natural_8, pos)
		ensure
			inserted: i = read_integer_8 (pos)
		end

	put_integer_16 (i: INTEGER_16; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			put_natural_16 (i.as_natural_16, pos)
		ensure
			inserted: i = read_integer_16 (pos)
		end

	put_integer_32 (i: INTEGER; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			put_natural_32 (i.as_natural_32, pos)
		ensure
			inserted: i = read_integer_32 (pos)
		end

	put_integer_64 (i: INTEGER_64; pos: INTEGER)
			-- Insert `i' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			put_natural_64 (i.as_natural_64, pos)
		ensure
			inserted: i = read_integer_64 (pos)
		end

	put_pointer (p: POINTER; pos: INTEGER)
			-- Insert `p' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Pointer_bytes) <= count
		do
			(item + pos).memory_copy ($p, Pointer_bytes)
		ensure
			inserted: p = read_pointer (pos)
		end

	put_boolean (b: BOOLEAN; pos: INTEGER)
			-- Insert `b' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Boolean_bytes) <= count
		do
			(item + pos).memory_copy ($b, Boolean_bytes)
		ensure
			inserted: b = read_boolean (pos)
		end

	put_character (c: CHARACTER; pos: INTEGER)
			-- Insert `c' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Character_8_bytes) <= count
		do
			(item + pos).memory_copy ($c, Character_8_bytes)
		ensure
			inserted: c = read_character (pos)
		end

	put_real (r: REAL_32; pos: INTEGER)
			-- Insert `r' at position `pos'.
		obsolete "Use put_real_32 instead. [2017-05-31]"
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_32_bytes) <= count
		do
			(item + pos).memory_copy ($r, Real_32_bytes)
		ensure
			inserted: r = read_real_32 (pos)
		end

	put_real_32 (r: REAL_32; pos: INTEGER)
			-- Insert `r' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_32_bytes) <= count
		do
			(item + pos).memory_copy ($r, Real_32_bytes)
		ensure
			inserted: r = read_real_32 (pos)
		end

	put_double (d: REAL_64; pos: INTEGER)
			-- Insert `d' at position `pos'.
		obsolete "Use put_real_64 instead. [2017-05-31]"
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_64_bytes) <= count
		do
			(item + pos).memory_copy ($d, Real_64_bytes)
		ensure
			inserted: d = read_real_64 (pos)
		end

	put_real_64 (d: REAL_64; pos: INTEGER)
			-- Insert `d' at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + Real_64_bytes) <= count
		do
			(item + pos).memory_copy ($d, Real_64_bytes)
		ensure
			inserted: d = read_real_64 (pos)
		end

	put_array (data: ARRAY [NATURAL_8]; pos: INTEGER)
			-- Copy content of `data' into `item' at position `pos'.
		require
			data_not_void: data /= Void
			pos_nonnegative: pos >= 0
			valid_position: (pos + data.count) <= count
		local
			l_sp: SPECIAL [NATURAL_8]
		do
			l_sp := data.area;
			(item + pos).memory_copy ($l_sp, data.count)
		ensure
			inserted: read_array (pos, data.count) ~ data
		end

	put_special_natural_8 (a_spec: SPECIAL [NATURAL_8]; source_index, destination_index, n: INTEGER)
			-- Write `n' bytes of `a_spec' from position `source_index' to Current at position `destination_index'.
		require
			a_spec_not_void: a_spec /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= a_spec.count
			n_is_small_enough_for_destination: destination_index + n <= count
		do
			(item + destination_index).memory_copy (a_spec.item_address (source_index), n)
		ensure
			inserted: a_spec.same_items (read_special_natural_8 (destination_index, n), 0, source_index, n)
		end

	put_special_character_8 (a_spec: SPECIAL [CHARACTER_8]; source_index, destination_index, n: INTEGER)
			-- Write `n' bytes of `a_spec' from position `source_index' to Current at position `destination_index'.
		require
			a_spec_not_void: a_spec /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= a_spec.count
			n_is_small_enough_for_destination: destination_index + n <= count
		do
			(item + destination_index).memory_copy (a_spec.item_address (source_index), n)
		ensure
			inserted: a_spec.same_items (read_special_character_8 (destination_index, n), 0, source_index, n)
		end

feature -- Access: Little-endian format

	read_natural_8_le (pos: INTEGER): NATURAL_8
			-- Read NATURAL_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_8_bytes)
		end

	read_natural_16_le (pos: INTEGER): NATURAL_16
			-- Read NATURAL_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		local
			l_low: NATURAL_16
		do
			if is_little_endian then
				Result := read_natural_16 (pos)
			else
				l_low := {NATURAL_16} 0x00FF & read_natural_8 (pos)
				Result := (read_natural_8 (pos + natural_8_bytes).to_natural_16 |<< 8) | l_low
			end
		end

	read_natural_32_le (pos: INTEGER): NATURAL_32
			-- Read NATURAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		local
			l_high, l_low: NATURAL_32
		do
			if is_little_endian then
				Result := read_natural_32 (pos)
			else
				l_low := {NATURAL_32} 0x0000FFFF & read_natural_16_le (pos)
				l_high := read_natural_16_le (pos + natural_16_bytes)
				Result := (l_high.to_natural_32 |<< 16) | l_low
			end
		end

	read_natural_64_le (pos: INTEGER): NATURAL_64
			-- Read NATURAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		local
			l_high, l_low: NATURAL_64
		do
			if is_little_endian then
				Result := read_natural_64 (pos)
			else
				l_low := {NATURAL_64} 0x00000000FFFFFFFF & read_natural_32_le (pos)
				l_high := read_natural_32_le (pos + natural_32_bytes)
				Result := (l_high.to_natural_64 |<< 32) | l_low
			end
		end

	read_integer_8_le (pos: INTEGER): INTEGER_8
			-- Read INTEGER_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			Result := read_natural_8_le (pos).as_integer_8
		end

	read_integer_16_le (pos: INTEGER): INTEGER_16
			-- Read INTEGER_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			Result := read_natural_16_le (pos).as_integer_16
		end

	read_integer_32_le (pos: INTEGER): INTEGER
			-- Read INTEGER at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			Result := read_natural_32_le (pos).as_integer_32
		end

	read_integer_64_le (pos: INTEGER): INTEGER_64
			-- Read INTEGER_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			Result := read_natural_64_le (pos).as_integer_64
		end

	read_real_32_le (pos: INTEGER): REAL_32
			-- Read REAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_32_bytes) <= count
		local
			l_nat32: NATURAL_32
		do
			check
				correct_size: real_32_bytes = natural_32_bytes
			end
			l_nat32 := read_natural_32_le (pos)
			($Result).memory_copy ($l_nat32, natural_32_bytes)
		end

	read_real_64_le (pos: INTEGER): REAL_64
			-- Read REAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_64_bytes) <= count
		local
			l_nat64: NATURAL_64
		do
			check
				correct_size: real_64_bytes = natural_64_bytes
			end
			l_nat64 := read_natural_64_le (pos)
			($Result).memory_copy ($l_nat64, natural_64_bytes)
		end

feature -- Element change: Little-endian format

	put_natural_8_le (i: NATURAL_8; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_8_bytes)
		ensure
			inserted: i = read_natural_8_le (pos)
		end

	put_natural_16_le (i: NATURAL_16; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		do
			if is_little_endian then
				put_natural_16 (i, pos)
			else
				put_natural_8 ((i & 0x00FF).to_natural_8, pos)
				put_natural_8 ((((i & 0xFF00) |>> 8) & 0x00FF).to_natural_8, pos + natural_8_bytes)
			end
		ensure
			inserted: i = read_natural_16_le (pos)
		end

	put_natural_32_le (i: NATURAL_32; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		do
			if is_little_endian then
				put_natural_32 (i, pos)
			else
				put_natural_16_le ((i & 0x0000FFFF).to_natural_16, pos)
				put_natural_16_le ((((i & 0xFFFF0000) |>> 16) & 0x0000FFFF).to_natural_16, pos + natural_16_bytes)
			end
		ensure
			inserted: i = read_natural_32_le (pos)
		end

	put_natural_64_le (i: NATURAL_64; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		do
			if is_little_endian then
				put_natural_64 (i, pos)
			else
				put_natural_32_le ((i & 0x00000000FFFFFFFF).to_natural_32, pos)
				put_natural_32_le (
					(((i & 0xFFFFFFFF00000000) |>> 32) & 0x00000000FFFFFFFF).to_natural_32,
					pos+ natural_32_bytes)
			end
		ensure
			inserted: i = read_natural_64_le (pos)
		end

	put_integer_8_le (i: INTEGER_8; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			put_natural_8_le (i.as_natural_8, pos)
		ensure
			inserted: i = read_integer_8_le (pos)
		end

	put_integer_16_le (i: INTEGER_16; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			put_natural_16_le (i.as_natural_16, pos)
		ensure
			inserted: i = read_integer_16_le (pos)
		end

	put_integer_32_le (i: INTEGER; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			put_natural_32_le (i.as_natural_32, pos)
		ensure
			inserted: i = read_integer_32_le (pos)
		end

	put_integer_64_le (i: INTEGER_64; pos: INTEGER)
			-- Insert `i' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			put_natural_64_le (i.as_natural_64, pos)
		ensure
			inserted: i = read_integer_64_le (pos)
		end

	put_real_32_le (v: REAL_32; pos: INTEGER_32)
			-- Insert `v' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_32_bytes) <= count
		local
			l_nat32: NATURAL_32
		do
			check
				correct_size: real_32_bytes = natural_32_bytes
			end
			($l_nat32).memory_copy ($v, natural_32_bytes)
			put_natural_32_le (l_nat32, pos)
		ensure
			inserted: v = read_real_32_le (pos)
		end

	put_real_64_le (v: REAL_64; pos: INTEGER_32)
			-- Insert `v' at position `pos' in little-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_64_bytes) <= count
		local
			l_nat64: NATURAL_64
		do
			check
				correct_size: real_64_bytes = natural_64_bytes
			end
			($l_nat64).memory_copy ($v, natural_64_bytes)
			put_natural_64_le (l_nat64, pos)
		ensure
			inserted: v = read_real_64_le (pos)
		end

feature -- Access: Big-endian format

	read_natural_8_be (pos: INTEGER): NATURAL_8
			-- Read NATURAL_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			($Result).memory_copy (item + pos, natural_8_bytes)
		end

	read_natural_16_be (pos: INTEGER): NATURAL_16
			-- Read NATURAL_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		local
			l_high, l_low: NATURAL_16
		do
			if is_little_endian then
				l_high := read_natural_8 (pos)
				l_low := (0x00FF).to_natural_16 & read_natural_8 (pos + natural_8_bytes)
				Result := (l_high.to_natural_16 |<< 8) | l_low
			else
				Result := read_natural_16 (pos)
			end
		end

	read_natural_32_be (pos: INTEGER): NATURAL_32
			-- Read NATURAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		local
			l_high, l_low: NATURAL_32
		do
			if is_little_endian then
				l_high := read_natural_16_be (pos)
				l_low := (0x0000FFFF).to_natural_32 & read_natural_16_be (pos + natural_16_bytes)
				Result := (l_high.to_natural_32 |<< 16) | l_low
			else
				Result := read_natural_32 (pos)
			end
		end

	read_natural_64_be (pos: INTEGER): NATURAL_64
			-- Read NATURAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		local
			l_high, l_low: NATURAL_64
		do
			if is_little_endian then
				l_high := read_natural_32_be (pos)
				l_low := {NATURAL_64} 0x00000000FFFFFFFF & read_natural_32_be (pos + natural_32_bytes)
				Result := (l_high.to_natural_64 |<< 32) | l_low
			else
				Result := read_natural_64 (pos)
			end
		end

	read_integer_8_be (pos: INTEGER): INTEGER_8
			-- Read INTEGER_8 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			Result := read_natural_8_be (pos).as_integer_8
		end

	read_integer_16_be (pos: INTEGER): INTEGER_16
			-- Read INTEGER_16 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			Result := read_natural_16_be (pos).as_integer_16
		end

	read_integer_32_be (pos: INTEGER): INTEGER
			-- Read INTEGER at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			Result := read_natural_32_be (pos).as_integer_32
		end

	read_integer_64_be (pos: INTEGER): INTEGER_64
			-- Read INTEGER_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			Result := read_natural_64_be (pos).as_integer_64
		end

	read_real_32_be (pos: INTEGER): REAL_32
			-- Read REAL_32 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_32_bytes) <= count
		local
			l_nat32: NATURAL_32
		do
			check
				correct_size: real_32_bytes = natural_32_bytes
			end
			l_nat32 := read_natural_32_be (pos)
			($Result).memory_copy ($l_nat32, natural_32_bytes)
		end

	read_real_64_be (pos: INTEGER): REAL_64
			-- Read REAL_64 at position `pos'.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_64_bytes) <= count
		local
			l_nat64: NATURAL_64
		do
			check
				correct_size: real_64_bytes = natural_64_bytes
			end
			l_nat64 := read_natural_64_be (pos)
			($Result).memory_copy ($l_nat64, natural_64_bytes)
		end

feature -- Element change: Big-endian format

	put_natural_8_be (i: NATURAL_8; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_8_bytes) <= count
		do
			(item + pos).memory_copy ($i, natural_8_bytes)
		ensure
			inserted: i = read_natural_8_be (pos)
		end

	put_natural_16_be (i: NATURAL_16; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_16_bytes) <= count
		do
			if is_little_endian then
				put_natural_8 ((((i & 0xFF00) |>> 8) & 0x00FF).to_natural_8, pos)
				put_natural_8 ((i & 0x00FF).to_natural_8, pos + natural_8_bytes)
			else
				put_natural_16 (i, pos)
			end
		ensure
			inserted: i = read_natural_16_be (pos)
		end

	put_natural_32_be (i: NATURAL_32; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_32_bytes) <= count
		do
			if is_little_endian then
				put_natural_16_be ((((i & 0xFFFF0000) |>> 16) & 0x0000FFFF).to_natural_16, pos)
				put_natural_16_be ((i & 0x0000FFFF).to_natural_16, pos + natural_16_bytes)
			else
				put_natural_32 (i, pos)
			end
		ensure
			inserted: i = read_natural_32_be (pos)
		end

	put_natural_64_be (i: NATURAL_64; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + natural_64_bytes) <= count
		do
			if is_little_endian then
				put_natural_32_be (
					(((i & 0xFFFFFFFF00000000) |>> 32) & 0x00000000FFFFFFFF).to_natural_32, pos)
				put_natural_32_be ((i & 0x00000000FFFFFFFF).to_natural_32,
					pos + natural_32_bytes)
			else
				put_natural_64 (i, pos)
			end
		ensure
			inserted: i = read_natural_64_be (pos)
		end

	put_integer_8_be (i: INTEGER_8; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_8_bytes) <= count
		do
			put_natural_8_be (i.as_natural_8, pos)
		ensure
			inserted: i = read_integer_8_be (pos)
		end

	put_integer_16_be (i: INTEGER_16; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_16_bytes) <= count
		do
			put_natural_16_be (i.as_natural_16, pos)
		ensure
			inserted: i = read_integer_16_be (pos)
		end

	put_integer_32_be (i: INTEGER; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_32_bytes) <= count
		do
			put_natural_32_be (i.as_natural_32, pos)
		ensure
			inserted: i = read_integer_32_be (pos)
		end

	put_integer_64_be (i: INTEGER_64; pos: INTEGER)
			-- Insert `i' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + integer_64_bytes) <= count
		do
			put_natural_64_be (i.as_natural_64, pos)
		ensure
			inserted: i = read_integer_64_be (pos)
		end

	put_real_32_be (v: REAL_32; pos: INTEGER_32)
			-- Insert `v' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_32_bytes) <= count
		local
			l_nat32: NATURAL_32
		do
			check
				correct_size: real_32_bytes = natural_32_bytes
			end
			($l_nat32).memory_copy ($v, natural_32_bytes)
			put_natural_32_be (l_nat32, pos)
		ensure
			inserted: v = read_real_32_be (pos)
		end

	put_real_64_be (v: REAL_64; pos: INTEGER_32)
			-- Insert `v' at position `pos' in big-endian format.
		require
			pos_nonnegative: pos >= 0
			valid_position: (pos + real_64_bytes) <= count
		local
			l_nat64: NATURAL_64
		do
			check
				correct_size: real_64_bytes = natural_64_bytes
			end
			($l_nat64).memory_copy ($v, natural_64_bytes)
			put_natural_64_be (l_nat64, pos)
		ensure
			inserted: v = read_real_64_be (pos)
		end

feature -- Concatenation

	append (other: like Current)
			-- Append `other' at the end of Current.
		require
			not_shared: not is_shared
			other_not_void: other /= Void
		local
			new_count: INTEGER
		do
			new_count := count + other.count
			item := item.memory_realloc (new_count.max (1))
			if item = default_pointer then
				(create {EXCEPTIONS}).raise ("No more memory")
			end
			(item + count).memory_copy (other.item, other.count)
			count := new_count
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Reallocate `item' to hold `n' bytes.
		require
			n_non_negative: n >= 0
			not_shared: not is_shared
		do
				-- Reallocate.
			if n /= count then
				item := item.memory_realloc (n.max (1))
				if item = default_pointer then
					(create {EXCEPTIONS}).raise ("No more memory")
				end
			end

			if n > count then
					-- Reset newly allocated memory to `0'.
				(item + count).memory_set (0, n - count)
			end
			count := n
		end

feature {NONE} -- Disposal

	dispose
			-- Release memory pointed by `item'.
		local
			null: POINTER
		do
			if not is_shared then
				item.memory_free
			end
			item := null
			is_shared := False
		ensure then
			shared_reset: not is_shared
		end

feature {NONE} -- Debugging

	allocation_counter: CELL [NATURAL_64]
			-- Store current number of allocation being made.
		once
			create Result.put (0)
		end

	counter: NATURAL_64 note option: transient attribute end
			-- Allocation number associated to Current.

	increment_counter
			-- Set `counter' with a new allocation number.
		do
			debug ("MANAGED_POINTER_allocation")
				counter := allocation_counter.item + 1
				allocation_counter.put (counter)
			end
		end


invariant
	item_not_null: item = default_pointer implies (count = 0 and is_shared)
	valid_count: count >= 0

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
