note
	description: "Implementation of TUPLE"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	TUPLE

inherit
	HASHABLE
		redefine
			is_equal
		end

	MISMATCH_CORRECTOR
		redefine
			correct_mismatch, is_equal
		end

create
	default_create, make

feature -- Creation

	make
		obsolete
			"Use no creation procedure to create a TUPLE instance"
		do
		end

feature -- Access

	item alias "[]", at alias "@" (index: INTEGER): ANY assign put
			-- Entry of key `index'.
		require
			valid_index: valid_index (index)
		do
			inspect item_code (index)
			when boolean_code then Result := boolean_item (index)
			when character_8_code then Result := character_8_item (index)
			when character_32_code then Result := character_32_item (index)
			when real_64_code then Result := real_64_item (index)
			when real_32_code then Result := real_32_item (index)
			when pointer_code then Result := pointer_item (index)
			when natural_8_code then Result := natural_8_item (index)
			when natural_16_code then Result := natural_16_item (index)
			when natural_32_code then Result := natural_32_item (index)
			when natural_64_code then Result := natural_64_item (index)
			when integer_8_code then Result := integer_8_item (index)
			when integer_16_code then Result := integer_16_item (index)
			when integer_32_code then Result := integer_32_item (index)
			when integer_64_code then Result := integer_64_item (index)
			when Reference_code then Result := reference_item (index)
			end
		end

	reference_item (index: INTEGER): ANY
			-- Reference item at `index'.
		require
			valid_index: valid_index (index)
			is_reference: is_reference_item (index)
		external
			"built_in"
		end

	boolean_item (index: INTEGER): BOOLEAN
			-- Boolean item at `index'.
		require
			valid_index: valid_index (index)
			is_boolean: is_boolean_item (index)
		external
			"built_in"
		end

	character_8_item (index: INTEGER): CHARACTER_8
			-- Character item at `index'.
		require
			valid_index: valid_index (index)
			is_character_8: is_character_8_item (index)
		external
			"built_in"
		end

	character_item (index: INTEGER): CHARACTER_8
			-- Character item at `index'.
		require
			valid_index: valid_index (index)
			is_character_8: is_character_8_item (index)
		do
			Result := character_8_item (index)
		end

	character_32_item (index: INTEGER): CHARACTER_32
			-- Character item at `index'.
		require
			valid_index: valid_index (index)
			is_character_32: is_character_32_item (index)
		external
			"built_in"
		end

	wide_character_item (index: INTEGER): CHARACTER_32
			-- Character item at `index'.
		require
			valid_index: valid_index (index)
			is_character_32: is_character_32_item (index)
		do
			Result := character_32_item (index)
		end

	real_64_item (index: INTEGER): REAL_64
			-- Double item at `index'.
		require
			valid_index: valid_index (index)
			is_numeric: is_double_item (index)
		external
			"built_in"
		end

	double_item (index: INTEGER): REAL_64
			-- Double item at `index'.
		require
			valid_index: valid_index (index)
			is_numeric: is_double_item (index)
		do
			Result := real_64_item (index)
		end

	natural_8_item (index: INTEGER): NATURAL_8
			-- NATURAL_8 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_natural_8_item (index)
		external
			"built_in"
		end

	natural_16_item (index: INTEGER): NATURAL_16
			-- NATURAL_16 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_natural_16_item (index)
		external
			"built_in"
		end

	natural_32_item (index: INTEGER): NATURAL_32
			-- NATURAL_32 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_natural_32_item (index)
		external
			"built_in"
		end

	natural_64_item (index: INTEGER): NATURAL_64
			-- NATURAL_64 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_natural_64_item (index)
		external
			"built_in"
		end

	integer_8_item (index: INTEGER): INTEGER_8
			-- INTEGER_8 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_integer_8_item (index)
		external
			"built_in"
		end

	integer_16_item (index: INTEGER): INTEGER_16
			-- INTEGER_16 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_integer_16_item (index)
		external
			"built_in"
		end

	integer_32_item (index: INTEGER): INTEGER_32
			-- INTEGER_32 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_integer_32_item (index)
		external
			"built_in"
		end

	integer_item (index: INTEGER): INTEGER_32
			-- INTEGER_32 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_integer_32_item (index)
		do
			Result := integer_32_item (index)
		end

	integer_64_item (index: INTEGER): INTEGER_64
			-- INTEGER_64 item at `index'.
		require
			valid_index: valid_index (index)
			is_integer: is_integer_64_item (index)
		external
			"built_in"
		end

	pointer_item (index: INTEGER): POINTER
			-- Pointer item at `index'.
		require
			valid_index: valid_index (index)
			is_pointer: is_pointer_item (index)
		external
			"built_in"
		end

	real_32_item (index: INTEGER): REAL_32
			-- real item at `index'.
		require
			valid_index: valid_index (index)
			is_real_or_integer: is_real_item (index)
		external
			"built_in"
		end

	real_item (index: INTEGER): REAL_32
			-- real item at `index'.
		require
			valid_index: valid_index (index)
			is_real_or_integer: is_real_item (index)
		do
			Result := real_32_item (index)
		end

feature -- Comparison

	object_comparison: BOOLEAN
			-- Must search operations use `equal' rather than `='
			-- for comparing references? (Default: no, use `='.)
		external
			"built_in"
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		local
			i, nb: INTEGER
			l_object_compare: BOOLEAN
		do
			l_object_compare := object_comparison
			if l_object_compare = other.object_comparison then
				if l_object_compare then
					nb := count
					if nb = other.count then
						from
							Result := True
							i := 1
						until
							i > nb or not Result
						loop
							Result := equal (item (i), other.item (i))
							i := i + 1
						end
					end
				else
					Result := Precursor {HASHABLE} (other)
				end
			end
		end

feature -- Status setting

	compare_objects
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			set_object_comparison (True)
		ensure
			object_comparison: object_comparison
		end

	compare_references
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		do
			set_object_comparison (False)
		ensure
			reference_comparison: not object_comparison
		end

feature -- Status report

	hash_code: INTEGER
			-- Hash code value
		local
			i, nb, l_hash: INTEGER
			l_key: HASHABLE
		do
			from
				i := 1
				nb := count
			until
				i > nb
			loop
				inspect item_code (i)
				when boolean_code then
					l_hash := boolean_item (i).hash_code
				when character_8_code then
					l_hash := character_8_item (i).hash_code
				when character_32_code then
					l_hash := character_32_item (i).hash_code
				when real_64_code then
					l_hash := real_64_item (i).hash_code
				when real_32_code then
					l_hash := real_32_item (i).hash_code
				when pointer_code then
					l_hash := pointer_item (i).hash_code
				when natural_8_code then
					l_hash := natural_8_item (i).hash_code
				when natural_16_code then
					l_hash := natural_16_item (i).hash_code
				when natural_32_code then
					l_hash := natural_32_item (i).hash_code
				when natural_64_code then
					l_hash := natural_64_item (i).hash_code
				when integer_8_code then
					l_hash := integer_8_item (i).hash_code
				when integer_16_code then
					l_hash := integer_16_item (i).hash_code
				when integer_32_code then
					l_hash := integer_32_item (i).hash_code
				when integer_64_code then
					l_hash := integer_64_item (i).hash_code
				when reference_code then
					l_key ?= reference_item (i)
					if l_key /= Void then
						l_hash := l_key.hash_code
					else
						l_hash := 0
					end
				end
				Result := Result + l_hash * internal_primes.i_th (i)
				i := i + 1
			end
				-- Ensure it is a positive value.
			Result := Result.hash_code
		end

	valid_index (k: INTEGER): BOOLEAN
			-- Is `k' a valid key?
		do
			Result := k >= 1 and then k <= count
		end

	valid_type_for_index (v: ANY; index: INTEGER): BOOLEAN
			-- Is object `v' a valid target for element at position `index'?
		require
			valid_index: valid_index (index)
		local
			l_b: BOOLEAN_REF
			l_c: CHARACTER_REF
			l_wc: CHARACTER_32_REF
			l_d: REAL_64_REF
			l_r: REAL_32_REF
			l_p: POINTER_REF
			l_ui8: NATURAL_8_REF
			l_ui16: NATURAL_16_REF
			l_ui32: NATURAL_32_REF
			l_ui64: NATURAL_64_REF
			l_i8: INTEGER_8_REF
			l_i16: INTEGER_16_REF
			l_i32: INTEGER_32_REF
			l_i64: INTEGER_64_REF
		do
			if v = Void then
					-- A Void entry is always valid.
				Result := True
			else
				inspect item_code (index)
				when boolean_code then
					l_b ?= v
					Result := l_b /= Void
				when character_8_code then
					l_c ?= v
					Result := l_c /= Void
				when character_32_code then
					l_wc ?= v
					Result := l_wc /= Void
				when real_64_code then
					l_d ?= v
					Result := l_d /= Void
				when real_32_code then
					l_r ?= v
					Result := l_r /= Void
				when pointer_code then
					l_p ?= v
					Result := l_p /= Void
				when natural_8_code then
					l_ui8 ?= v
					Result := l_ui8 /= Void
				when natural_16_code then
					l_ui16 ?= v
					Result := l_ui16 /= Void
				when natural_32_code then
					l_ui32 ?= v
					Result := l_ui32 /= Void
				when natural_64_code then
					l_ui64 ?= v
					Result := l_ui64 /= Void
				when integer_8_code then
					l_i8 ?= v
					Result := l_i8 /= Void
				when integer_16_code then
					l_i16 ?= v
					Result := l_i16 /= Void
				when integer_32_code then
					l_i32 ?= v
					Result := l_i32 /= Void
				when integer_64_code then
					l_i64 ?= v
					Result := l_i64 /= Void
				when Reference_code then
						-- Let's check that type of `v' conforms to specified type of `index'-th
						-- arguments of current TUPLE.
					Result := v.generating_type.conforms_to (generating_type.generic_parameter (index))
				end
			end
		end

	count: INTEGER
			-- Number of element in Current.
		external
			"built_in"
		end

	lower: INTEGER = 1
			-- Lower bound of TUPLE.

	upper: INTEGER
			-- Upper bound of TUPLE.
		do
			Result := count
		end

	is_empty: BOOLEAN
			-- Is Current empty?
		do
			Result := count = 0
		end

feature -- Element change

	put (v: ANY; index: INTEGER)
			-- Insert `v' at position `index'.
		require
			valid_index: valid_index (index)
			valid_type_for_index: valid_type_for_index (v, index)
		local
			l_b: BOOLEAN_REF
			l_c: CHARACTER_REF
			l_wc: CHARACTER_32_REF
			l_d: DOUBLE_REF
			l_r: REAL_REF
			l_p: POINTER_REF
			l_ui8: NATURAL_8_REF
			l_ui16: NATURAL_16_REF
			l_ui32: NATURAL_32_REF
			l_ui64: NATURAL_64_REF
			l_i8: INTEGER_8_REF
			l_i16: INTEGER_16_REF
			l_i32: INTEGER_REF
			l_i64: INTEGER_64_REF
		do
			inspect item_code (index)
			when boolean_code then
				l_b ?= v
				check valid_type_for_index: l_b /= Void end
				put_boolean (l_b.item, index)
			when character_8_code then
				l_c ?= v
				check valid_type_for_index: l_c /= Void end
				put_character_8 (l_c.item, index)
			when character_32_code then
				l_wc ?= v
				check valid_type_for_index: l_wc /= Void end
				put_character_32 (l_wc.item, index)
			when real_64_code then
				l_d ?= v
				check valid_type_for_index: l_d /= Void end
				put_real_64 (l_d.item, index)
			when real_32_code then
				l_r ?= v
				check valid_type_for_index: l_r /= Void end
				put_real_32 (l_r.item, index)
			when pointer_code then
				l_p ?= v
				check valid_type_for_index: l_p /= Void end
				put_pointer (l_p.item, index)
			when natural_8_code then
				l_ui8 ?= v
				check valid_type_for_index: l_ui8 /= Void end
				put_natural_8 (l_ui8, index)
			when natural_16_code then
				l_ui16 ?= v
				check valid_type_for_index: l_ui16 /= Void end
				put_natural_16 (l_ui16, index)
			when natural_32_code then
				l_ui32 ?= v
				check valid_type_for_index: l_ui32 /= Void end
				put_natural_32 (l_ui32, index)
			when natural_64_code then
				l_ui64 ?= v
				check valid_type_for_index: l_ui64 /= Void end
				put_natural_64 (l_ui64, index)
			when integer_8_code then
				l_i8 ?= v
				check valid_type_for_index: l_i8 /= Void end
				put_integer_8 (l_i8, index)
			when integer_16_code then
				l_i16 ?= v
				check valid_type_for_index: l_i16 /= Void end
				put_integer_16 (l_i16, index)
			when integer_32_code then
				l_i32 ?= v
				check valid_type_for_index: l_i32 /= Void end
				put_integer_32 (l_i32.item, index)
			when integer_64_code then
				l_i64 ?= v
				check valid_type_for_index: l_i64 /= Void end
				put_integer_64 (l_i64.item, index)
			when reference_code then
				put_reference (v, index)
			end
		end

	put_reference (v: ANY; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type_for_index: valid_type_for_index (v, index)
			valid_type: is_reference_item (index)
		external
			"built_in"
		end

	put_boolean (v: BOOLEAN; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_boolean_item (index)
		external
			"built_in"
		end

	put_character_8 (v: CHARACTER_8; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_character_8_item (index)
		external
			"built_in"
		end

	put_character (v: CHARACTER_8; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_character_8_item (index)
		do
			put_character_8 (v, index)
		end

	put_character_32 (v: CHARACTER_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_character_32_item (index)
		external
			"built_in"
		end

	put_wide_character (v: CHARACTER_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_character_32_item (index)
		do
			put_character_32 (v, index)
		end

	put_real_64 (v: REAL_64; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_double_item (index)
		external
			"built_in"
		end

	put_double (v: REAL_64; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_double_item (index)
		do
			put_real_64 (v, index)
		end

	put_real_32 (v: REAL_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_real_item (index)
		external
			"built_in"
		end

	put_real (v: REAL_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_real_item (index)
		do
			put_real_32 (v, index)
		end

	put_pointer (v: POINTER; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_pointer_item (index)
		external
			"built_in"
		end

	put_natural_8 (v: NATURAL_8; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_natural_8_item (index)
		external
			"built_in"
		end

	put_natural_16 (v: NATURAL_16; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_natural_16_item (index)
		external
			"built_in"
		end

	put_natural_32 (v: NATURAL_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_natural_32_item (index)
		external
			"built_in"
		end

	put_natural_64 (v: NATURAL_64; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_natural_64_item (index)
		external
			"built_in"
		end

	put_integer_32 (v: INTEGER_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_integer_32_item (index)
		external
			"built_in"
		end

	put_integer (v: INTEGER_32; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_integer_32_item (index)
		do
			put_integer_32 (v, index)
		end

	put_integer_8 (v: INTEGER_8; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_integer_8_item (index)
		external
			"built_in"
		end

	put_integer_16 (v: INTEGER_16; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_integer_16_item (index)
		external
			"built_in"
		end

	put_integer_64 (v: INTEGER_64; index: INTEGER)
			-- Put `v' at position `index' in Current.
		require
			valid_index: valid_index (index)
			valid_type: is_integer_64_item (index)
		external
			"built_in"
		end

feature -- Type queries

	is_boolean_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a BOOLEAN?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = boolean_code)
		end

	is_character_8_item, is_character_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a CHARACTER_8?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = character_8_code)
		end

	is_character_32_item, is_wide_character_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a CHARACTER_32?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = character_32_code)
		end

	is_double_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a REAL_64?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = real_64_code)
		end

	is_natural_8_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an NATURAL_8?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = natural_8_code)
		end

	is_natural_16_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an NATURAL_16?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = natural_16_code)
		end

	is_natural_32_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an NATURAL_32?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = natural_32_code)
		end

	is_natural_64_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an NATURAL_64?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = natural_64_code)
		end

	is_integer_8_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an INTEGER_8?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = integer_8_code)
		end

	is_integer_16_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an INTEGER_16?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = integer_16_code)
		end

	is_integer_item, is_integer_32_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an INTEGER_32?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = integer_32_code)
		end

	is_integer_64_item (index: INTEGER): BOOLEAN
			-- Is item at `index' an INTEGER_64?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = integer_64_code)
		end

	is_pointer_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a POINTER?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = pointer_code)
		end

	is_real_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a REAL_32?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = real_32_code)
		end

	is_reference_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a REFERENCE?
		require
			valid_index: valid_index (index)
		do
			Result := (item_code (index) = reference_code)
		end

	is_numeric_item (index: INTEGER): BOOLEAN
			-- Is item at `index' a number?
		obsolete
			"Use the precise type query instead."
		require
			valid_index: valid_index (index)
		local
			tcode: like item_code
		do
			tcode := item_code (index)
			inspect tcode
			when
				integer_8_code, integer_16_code, integer_32_code,
				integer_64_code, real_32_code, real_64_code
			then
				Result := True
			else
				-- Nothing to do here since Result already initialized to False.
			end
		end

	is_uniform: BOOLEAN
			-- Are all items of the same basic type or all of reference type?
		do
			Result := is_tuple_uniform (any_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_boolean: BOOLEAN
			-- Are all items of type BOOLEAN?
		do
			Result := is_tuple_uniform (boolean_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_character_8, is_uniform_character: BOOLEAN
			-- Are all items of type CHARACTER_8?
		do
			Result := is_tuple_uniform (character_8_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniforme_character_32, is_uniform_wide_character: BOOLEAN
			-- Are all items of type CHARACTER_32?
		do
			Result := is_tuple_uniform (character_32_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_double: BOOLEAN
			-- Are all items of type REAL_64?
		do
			Result := is_tuple_uniform (real_64_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_natural_8: BOOLEAN
			-- Are all items of type NATURAL_8?
		do
			Result := is_tuple_uniform (natural_8_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_natural_16: BOOLEAN
			-- Are all items of type NATURAL_16?
		do
			Result := is_tuple_uniform (natural_16_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_natural_32: BOOLEAN
			-- Are all items of type NATURAL_32?
		do
			Result := is_tuple_uniform (natural_32_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_natural_64: BOOLEAN
			-- Are all items of type NATURAL_64?
		do
			Result := is_tuple_uniform (natural_64_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_integer_8: BOOLEAN
			-- Are all items of type INTEGER_8?
		do
			Result := is_tuple_uniform (integer_8_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_integer_16: BOOLEAN
			-- Are all items of type INTEGER_16?
		do
			Result := is_tuple_uniform (integer_16_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_integer, is_uniform_integer_32: BOOLEAN
			-- Are all items of type INTEGER?
		do
			Result := is_tuple_uniform (integer_32_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_integer_64: BOOLEAN
			-- Are all items of type INTEGER_64?
		do
			Result := is_tuple_uniform (integer_64_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_pointer: BOOLEAN
			-- Are all items of type POINTER?
		do
			Result := is_tuple_uniform (pointer_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_real: BOOLEAN
			-- Are all items of type REAL_32?
		do
			Result := is_tuple_uniform (real_32_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	is_uniform_reference: BOOLEAN
			-- Are all items of reference type?
		do
			Result := is_tuple_uniform (reference_code)
		ensure
			yes_if_empty: (count = 0) implies Result
		end

feature -- Type conversion queries

	convertible_to_double: BOOLEAN
			-- Is current convertible to an array of doubles?
		obsolete
			"Will be removed in future releases"
		local
			i, cnt: INTEGER
			tcode: like item_code
		do
			Result := True
			from
				i := 1
				cnt := count
			until
				i > cnt or else not Result
			loop
				tcode := item_code (i)
				inspect tcode
				when
					integer_8_code, integer_16_code, integer_32_code,
					integer_64_code, real_32_code, real_64_code
				then
					Result := True
				else
					Result := False
				end
				i := i + 1
			end
		ensure
			yes_if_empty: (count = 0) implies Result
		end

	convertible_to_real: BOOLEAN
			-- Is current convertible to an array of reals?
		obsolete
			"Will be removed in future releases"
		local
			i, cnt: INTEGER
			tcode: like item_code
		do
			Result := True
			from
				i := 1
				cnt := count
			until
				i > cnt or else not Result
			loop
				tcode := item_code (i)
				inspect tcode
				when
					integer_8_code, integer_16_code, integer_32_code,
					integer_64_code, real_32_code
				then
					Result := True
				else
					Result := False
				end
				i := i + 1
			end
		ensure
			yes_if_empty: (count = 0) implies Result
		end

feature -- Conversion

	arrayed: ARRAY [ANY]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	boolean_arrayed: ARRAY [BOOLEAN]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			is_uniform_boolean: is_uniform_boolean
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (boolean_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	character_8_arrayed, character_arrayed: ARRAY [CHARACTER_8]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			is_uniform_character: is_uniform_character
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (character_8_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	double_arrayed: ARRAY [REAL_64]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			convertible: convertible_to_double
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (double_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	integer_arrayed: ARRAY [INTEGER]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			is_uniform_integer: is_uniform_integer
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (integer_32_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	pointer_arrayed: ARRAY [POINTER]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			is_uniform_pointer: is_uniform_pointer
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (pointer_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	real_arrayed: ARRAY [REAL_32]
			-- Items of Current as array
		obsolete
			"Will be removed in future releases"
		require
			convertible: convertible_to_real
		local
			i, cnt: INTEGER
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				Result.put (real_item (i), i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
			same_items: -- Items are the same in same order
		end

	string_arrayed: ARRAY [STRING]
			-- Items of Current as array
			-- NOTE: Items with a type not cconforming to
			--       type STRING are set to Void.
		obsolete
			"Will be removed in future releases"
		local
			i, cnt: INTEGER
			s: STRING
		do
			from
				i := 1
				cnt := count
				create Result.make (1, cnt)
			until
				i > cnt
			loop
				s ?= item (i)
				Result.put (s, i)
				i := i + 1
			end
		ensure
			exists: Result /= Void
			same_count: Result.count = count
		end

feature -- Retrieval

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_area: SPECIAL [ANY]
			i, nb: INTEGER
			l_any: ANY
		do
				-- Old version of TUPLE had a SPECIAL [ANY] to store all values.
				-- If we can get access to it, then most likely we can recover this
				-- old TUPLE implementation.
			l_area ?= Mismatch_information.item (area_name)
			if l_area /= Void then
				from
					i := 1
					nb := l_area.count
				until
					i > nb
				loop
					l_any := l_area.item (i - 1)
					if valid_type_for_index (l_any, i) then
						put (l_any, i)
					else
							-- We found an unexpected type in old special. We cannot go on.
						Precursor {MISMATCH_CORRECTOR}
					end
					i := i + 1
				end
			else
				Precursor {MISMATCH_CORRECTOR}
			end
		end

feature -- Access

	item_code (index: INTEGER): NATURAL_8
			-- Type code of item at `index'. Used for
			-- argument processing in ROUTINE
		require
			valid_index: valid_index (index)
		external
			"built_in"
		end

	reference_code: NATURAL_8 = 0x00
	boolean_code: NATURAL_8 = 0x01
	character_8_code, character_code: NATURAL_8 = 0x02
	real_64_code: NATURAL_8 = 0x03
	real_32_code: NATURAL_8 = 0x04
	pointer_code: NATURAL_8 = 0x05
	integer_8_code: NATURAL_8 = 0x06
	integer_16_code: NATURAL_8 = 0x07
	integer_32_code: NATURAL_8 = 0x08
	integer_64_code: NATURAL_8 = 0x09
	natural_8_code: NATURAL_8 = 0x0A
	natural_16_code: NATURAL_8 = 0x0B
	natural_32_code: NATURAL_8 = 0x0C
	natural_64_code: NATURAL_8 = 0x0D
	character_32_code, wide_character_code: NATURAL_8 = 0x0E
	any_code: NATURAL_8 = 0xFF
			-- Code used to identify type in TUPLE.

feature {NONE} -- Implementation

	area_name: STRING = "area"
			-- Name of attributes where TUPLE elements were stored.

	is_tuple_uniform (code: like item_code): BOOLEAN
			-- Are all items of type `code'?
		local
			i, nb: INTEGER
			l_code: like item_code
		do
			Result := True
			if count > 0 then
				from
					nb := count
					if code = any_code then
							-- We take first type code and compare all the remaining ones
							-- against it.
						i := 2
						l_code := item_code (1)
					else
						i := 1
						l_code := code
					end
				until
					i > nb or not Result
				loop
					Result := l_code = item_code (i)
					i := i + 1
				end
			end
		end

	internal_primes: PRIMES
			-- For quick access to prime numbers.
		once
			create Result
		end

	set_object_comparison (b: BOOLEAN)
			-- Set `object_comparison' to `b'.
		external
			"built_in"
		ensure
			object_comparison_set: object_comparison = b
		end

end
