class TUPLE

feature

	put (v: ANY; index: INTEGER) is
		do
			print ("TODO: TUPLE.put%N")
		end

	item alias "[]", infix "@" (index: INTEGER): ANY assign put is
		do
			print ("TODO: TUPLE.item%N")
		end

	boolean_item (index: INTEGER): BOOLEAN is
			-- Boolean item at `index'.
		do
			print ("TODO: TUPLE.boolean_item%N")
		end

	integer_item, integer_32_item (index: INTEGER): INTEGER is
		do
			print ("TODO: TUPLE.integer_item%N")
		end

	integer_64_item (index: INTEGER): INTEGER_64 is
		do
			print ("TODO: TUPLE.integer_64_item%N")
		end

	count: INTEGER is
		do
			print ("TODO: TUPLE.count%N")
		end

	lower: INTEGER is
		do
			print ("TODO: TUPLE.lower%N")
		end

	upper: INTEGER is
		do
			print ("TODO: TUPLE.upper%N")
		end

	valid_index (k: INTEGER): BOOLEAN is
			-- Is `k' a valid key?
		do
			print ("TODO: TUPLE.valid_index%N")
		end

	object_comparison: BOOLEAN is
			-- Must search operations use `equal' rather than `='
			-- for comparing references? (Default: no, use `='.)
		do
			print ("TODO: TUPLE.object_comparison%N")
		end

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			print ("TODO: TUPLE.compare_objects%N")
		end

	is_boolean_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a BOOLEAN?
		do
			print ("TODO: TUPLE.is_boolean_item%N")
		end

	is_character_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a CHARACTER?
		do
			print ("TODO: TUPLE.is_character_item%N")
		end

	is_wide_character_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a WIDE_CHARACTER?
		do
			print ("TODO: TUPLE.is_wide_character_item%N")
		end

	is_double_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a DOUBLE?
		do
			print ("TODO: TUPLE.is_double_item%N")
		end

	is_natural_8_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an NATURAL_8?
		do
			print ("TODO: TUPLE.is_natural_8_item%N")
		end

	is_natural_16_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an NATURAL_16?
		do
			print ("TODO: TUPLE.is_natural_16_item%N")
		end

	is_natural_32_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an NATURAL_32?
		do
			print ("TODO: TUPLE.is_natural_32_item%N")
		end

	is_natural_64_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an NATURAL_64?
		do
			print ("TODO: TUPLE.is_natural_64_item%N")
		end

	is_integer_8_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an INTEGER_8?
		do
			print ("TODO: TUPLE.is_integer_8_item%N")
		end

	is_integer_16_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an INTEGER_16?
		do
			print ("TODO: TUPLE.is_integer_16_item%N")
		end

	is_integer_item, is_integer_32_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an INTEGER_32?
		do
			print ("TODO: TUPLE.is_integer_32_item%N")
		end

	is_integer_64_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' an INTEGER_64?
		do
			print ("TODO: TUPLE.is_integer_64_item%N")
		end

	is_pointer_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a POINTER?
		do
			print ("TODO: TUPLE.is_pointer_item%N")
		end

	is_real_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a REAL?
		do
			print ("TODO: TUPLE.is_real_item%N")
		end

	is_reference_item (index: INTEGER): BOOLEAN is
			-- Is item at `index' a REFERENCE?
		do
			print ("TODO: TUPLE.is_reference_item%N")
		end

	reference_code: NATURAL_8 is 0x00
	boolean_code: NATURAL_8 is 0x01
	character_8_code, character_code: NATURAL_8 is 0x02
	real_64_code: NATURAL_8 is 0x03
	real_32_code: NATURAL_8 is 0x04
	pointer_code: NATURAL_8 is 0x05
	integer_8_code: NATURAL_8 is 0x06
	integer_16_code: NATURAL_8 is 0x07
	integer_32_code: NATURAL_8 is 0x08
	integer_64_code: NATURAL_8 is 0x09
	natural_8_code: NATURAL_8 is 0x0A
	natural_16_code: NATURAL_8 is 0x0B
	natural_32_code: NATURAL_8 is 0x0C
	natural_64_code: NATURAL_8 is 0x0D
	character_32_code, wide_character_code: NATURAL_8 is 0x0E
	any_code: NATURAL_8 is 0xFF

	put_reference (v: ANY; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_reference%N")
		end

	put_boolean (v: BOOLEAN; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_boolean%N")
		end

	put_character_8, put_character (v: CHARACTER; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_character%N")
		end

	put_character_32, put_wide_character (v: WIDE_CHARACTER; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_wide_character%N")
		end

	put_real_64, put_double (v: DOUBLE; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_double%N")
		end

	put_real_32, put_real (v: REAL; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_real%N")
		end

	put_pointer (v: POINTER; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_pointer%N")
		end

	put_natural_8 (v: NATURAL_8; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_natural_8%N")
		end

	put_natural_16 (v: NATURAL_16; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_natural_16%N")
		end

	put_natural_32 (v: NATURAL_32; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_natural_32%N")
		end

	put_natural_64 (v: NATURAL_64; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_natural_64%N")
		end

	put_integer, put_integer_32 (v: INTEGER; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_integer%N")
		end

	put_integer_8 (v: INTEGER_8; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_integer_8%N")
		end

	put_integer_16 (v: INTEGER_16; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_integer_16%N")
		end

	put_integer_64 (v: INTEGER_64; index: INTEGER) is
			-- Put `v' at position `index' in Current.
		do
			print ("TODO: TUPLE.put_integer_64%N")
		end

end
