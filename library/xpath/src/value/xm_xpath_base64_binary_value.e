note

	description:

		"XPath base64Binary values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BASE64_BINARY_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			hash_code, is_base64_binary, as_base64_binary
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
			value_is_base64: a_value /= Void and then STRING_.is_base64 (a_value)
		local
			l_decoder: UT_BASE64_DECODING_INPUT_STREAM
			l_index, l_count: INTEGER
			l_stream: KL_STRING_INPUT_STREAM
			l_decoded_string: STRING
		do
			make_atomic_value
			create l_stream.make (a_value)
			create l_decoder.make (l_stream)
			l_count := a_value.count
			l_decoder.read_string (l_count)
			l_decoded_string := l_decoder.last_string
			l_count := l_decoded_string.count
			create binary_value.make_filled ('%U', 1, l_count)
			from l_index := 1 until l_index > l_count loop
				binary_value.put (l_decoded_string.item (l_index), l_index)
				l_index := l_index + 1
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
			Result := type_factory.base64_binary_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	hash_code: INTEGER
			-- Hash code value
		local
			a_count, an_index: INTEGER
		do
			a_count := binary_value.count; if a_count > 32 then a_count := 32 end
			from an_index := 1 until an_index > count loop
				Result := INTEGER_.bit_xor (INTEGER_.bit_shift_left (Result, 1), binary_value.item (an_index).code)
				an_index := an_index + 1
			end
			if Result < 0 then Result := 0 - Result end
		end

	string_value: STRING
			-- Value of the item as a string
		local
			an_encoder: UT_BASE64_ENCODING_OUTPUT_STREAM
			a_stream: KL_STRING_OUTPUT_STREAM
			an_index, a_count: INTEGER
		do
			create a_stream.make_empty
			create an_encoder.make (a_stream, False, False)
			from
				a_count := binary_value.count; an_index := 1
			until an_index > a_count loop
				an_encoder.put_character (binary_value.item (an_index))
				an_index := an_index + 1
			end
			an_encoder.close
			Result := a_stream.string
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			an_index, a_count: INTEGER
		do
			if other.is_base64_binary then
				a_count := binary_value.count
				if a_count = other.as_base64_binary.binary_value.count then
					Result := True
					from an_index := 1 until not Result or else an_index > a_count loop
						Result := binary_value.item (an_index) = other.as_base64_binary.binary_value.item (an_index)
						an_index := an_index + 1
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

	is_base64_binary: BOOLEAN
			-- Is `Current' a base64Binary value?
		do
			Result := True
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_base64_binary
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "base64Binary (%"")
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

		as_base64_binary: XM_XPATH_BASE64_BINARY_VALUE
			-- `Current' seen as a base64Binary value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		do
			inspect
				a_required_type.primitive_type
			when Any_atomic_type_code, Any_item_fingerprint, Base64_binary_type_code then
				converted_value := Current
			when Untyped_atomic_type_code then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			when String_type_code then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			when Hex_binary_type_code then
				create {XM_XPATH_HEX_BINARY_VALUE} converted_value.make_and_encode (binary_value)

			end
		end

invariant

	value_not_void: binary_value /= Void

end
