note

	description:

		"XPath hexBinary values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_HEX_BINARY_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			hash_code, is_hex_binary, as_hex_binary
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make, make_and_encode

feature {NONE} -- Initialization

	make (a_value: STRING)
			-- Create from encoded string.
		require
			value_is_hexadecimal: a_value /= Void and then STRING_.is_hexadecimal (a_value) and then a_value.count \\ 2 = 0
		local
			l_index, l_count, l_code: INTEGER
		do
			make_atomic_value
			l_count := a_value.count
			create binary_value.make_filled ('%U', 1, l_count // 2)
			from l_index := 1 until l_index > l_count loop
				l_code := 16 * hexadecimal_digit_to_integer (a_value.item (l_index)) + hexadecimal_digit_to_integer (a_value.item (l_index + 1))
				l_index := l_index + 2
				binary_value.put (INTEGER_.to_character (l_code), l_index // 2)
			end
		ensure
			static_properties_computed: are_static_properties_computed
		end

	make_and_encode (a_value: like binary_value)
			-- Create from decoded octets.
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			binary_value := a_value
		ensure
			value_set: binary_value = a_value
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	binary_value: ARRAY [CHARACTER]
			-- Decoded octets

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type
		do
			Result := type_factory.hex_binary_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	hash_code: INTEGER
			-- Hash code value
		local
			l_index, l_count: INTEGER
		do
			l_count := binary_value.count; if l_count > 32 then l_count := 32 end
			from l_index := 1 until l_index > count loop
				Result := INTEGER_.bit_xor (INTEGER_.bit_shift_left (Result, 1), binary_value.item (l_index).code)
				l_index := l_index + 1
			end
			if Result < 0 then Result := 0 - Result end
		end

	string_value: STRING
			-- Value of the item as a string
		local
			l_index, l_count, l_code: INTEGER
		do
			l_count := binary_value.count; Result := ""
			from l_index := 1 until l_index > l_count loop
				l_code := binary_value.item (l_index).code
				Result := Result + INTEGER_.to_hexadecimal (l_code // 16, True)
				Result := Result + INTEGER_.to_hexadecimal (l_code \\ 16, True)
				l_index := l_index + 1
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			l_index, l_count: INTEGER
		do
			if other.is_hex_binary then
				l_count := binary_value.count
				if l_count = other.as_hex_binary.binary_value.count then
					Result := True
					from l_index := 1 until not Result or else l_index > l_count loop
						Result := binary_value.item (l_index) = other.as_hex_binary.binary_value.item (l_index)
						l_index := l_index + 1
					end
				end
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: detachable XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `other'
		do

			-- Since only equality, not ordering is defined, we return 0 or -1

			if same_expression (other) then
				Result := 0
			else
				Result := -1
			end
		end

feature -- Status report

	is_hex_binary: BOOLEAN
			-- Is `Current' a hexBinary value?
		do
			Result := True
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_hex_binary
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "hexBinary (%"")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `Current' convertible to `a_required_type'?
		do
			inspect
				a_required_type.primitive_type
			when
				Any_atomic_type_code, Any_item_fingerprint, Hex_binary_type_code,
				String_type_code, Untyped_atomic_type_code, Base64_binary_type_code
			 then
				Result := True
			end
		end

feature -- Conversion

	as_hex_binary: XM_XPATH_HEX_BINARY_VALUE
			-- `Current' seen as a hexBinary value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		do
			inspect
				a_required_type.primitive_type
			when Any_atomic_type_code, Any_item_fingerprint, Hex_binary_type_code then
				converted_value := Current
			when Untyped_atomic_type_code then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			when String_type_code then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			when Base64_binary_type_code then
				create {XM_XPATH_BASE64_BINARY_VALUE} converted_value.make_and_encode (binary_value)
			end
		end

feature {NONE} -- Immplementation

	hexadecimal_digit_to_integer (a_character: CHARACTER): INTEGER
			-- Integer value `a_character'
		require
			is_hexadecimal: STRING_.is_hexadecimal (a_character.out)
		do
			inspect
				a_character
			when '0' then
				Result := 0
			when '1' then
				Result := 1
			when '2' then
				Result := 2
			when '3' then
				Result := 3
			when '4' then
					Result := 4
			when '5' then
				Result := 5
			when '6' then
				Result := 6
			when '7' then
				Result := 7
			when '8' then
				Result := 8
			when '9' then
				Result := 9
			when 'a','A' then
				Result := 10
			when 'b','B' then
				Result := 11
			when 'c','C' then
				Result := 12
			when 'd','D' then
				Result := 13
			when 'e','E' then
				Result := 14
			when 'f','F' then
				Result := 15
			end
		ensure
			in_range: Result <= 15 and then Result >= 0
		end

invariant

	value_not_void: binary_value /= Void

end
