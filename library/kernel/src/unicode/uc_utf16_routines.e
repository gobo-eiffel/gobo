note

	description:

		"UTF-16 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF16_ROUTINES

inherit

	UC_UNICODE_CONSTANTS

	KL_IMPORTED_ANY_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

feature -- Status report

	valid_utf16 (a_string: STRING_8): BOOLEAN
			-- Are the bytes in `a_string' a valid UTF-16 encoding?
			-- 'a_string' has one byte per character.
			-- Default to big endian when no BOM.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			a_most: INTEGER
			i, cnt: INTEGER
		do
			Result := (a_string.count \\ 2) = 0
			if Result and a_string.count > 0 then
				from
						-- Loop through most significant bytes, detecting starting point is enough.
					if is_endian_detection_character_least_first (a_string.item_code (1), a_string.item_code (2)) then
						i := 2
					else
						i := 1
					end
					cnt := a_string.count
				until
					(i > cnt) or (not Result)
				loop
					a_most := a_string.item (i).code
					if is_surrogate (a_most) then
							-- Consume the next character.
						i := i + 2
						Result := is_high_surrogate (a_most) and ((i <= cnt) and then is_low_surrogate (a_string.item (i).code))
					end
					i := i + 2
				end
			end
		ensure
			instance_free: class
			empty_is_true: a_string.count = 0 implies Result
			utf16_even_count: Result implies ((a_string.count \\ 2) = 0)
		end

	valid_utf16be (a_string: STRING_8): BOOLEAN
			-- Are the bytes in `a_string' valid UTF-16BE?
			-- 'a_string' has one byte per character.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			a_most: INTEGER
			i, cnt: INTEGER
		do
			Result := (a_string.count \\ 2) = 0
			if Result and a_string.count > 0 then
				from
					i := 1
					cnt := a_string.count
				until
					(i > cnt) or (not Result)
				loop
					a_most := a_string.item (i).code
					if is_surrogate (a_most) then
							-- Consume the next character.
						i := i + 2
						Result := is_high_surrogate (a_most) and ((i <= cnt) and then is_low_surrogate (a_string.item (i).code))
					end
					i := i + 2
				end
			end
		ensure
			instance_free: class
			empty_is_true: a_string.count = 0 implies Result
			utf16_even_count: Result implies ((a_string.count \\ 2) = 0)
		end

	valid_utf16le (a_string: STRING_8): BOOLEAN
			-- Are the bytes in `a_string' valid UTF-16LE?
			-- 'a_string' has one byte per character.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			a_most: INTEGER
			i, cnt: INTEGER
		do
			Result := (a_string.count \\ 2) = 0
			if Result and a_string.count > 0 then
				from
					i := 2
				until
					(i > cnt) or (not Result)
				loop
					a_most := a_string.item (i).code
					if is_surrogate (a_most) then
							-- Consume the next character.
						i := i + 2
						Result := is_high_surrogate (a_most) and ((i <= cnt) and then is_low_surrogate (a_string.item (i).code))
					end
					i := i + 2
				end
			end
		ensure
			instance_free: class
			empty_is_true: a_string.count = 0 implies Result
			utf16_even_count: Result implies ((a_string.count \\ 2) = 0)
		end

feature -- Endian-ness detection

	bom_be: STRING_8
			-- BOM in big-endian format
		once
			Result := "%/254/%/255/"
		ensure
			instance_free: class
			bom_be_not_void: Result /= Void
			two_bytes: Result.count = 2
			first_byte: Result.item_code (1) = Hex_fe
			second_byte: Result.item_code (2) = Hex_ff
		end

	bom_le: STRING_8
			-- BOM in little-endian format
		once
			Result := "%/255/%/254/"
		ensure
			instance_free: class
			bom_le_not_void: Result /= Void
			two_bytes: Result.count = 2
			first_byte: Result.item_code (1) = Hex_ff
			second_byte: Result.item_code (2) = Hex_fe
		end

	is_endian_detection_character_most_first (first, second: INTEGER): BOOLEAN
			-- Do the two bytes `first' and `second' represent the character
			-- 0xFEFF with `first' being the most significant byte?
		require
			a_byte_is_byte: is_byte (first)
			other_byte_is_byte: is_byte (second)
--			first_in_stream: the character represented by (first, second) is first in stream
		do
			Result := first = Hex_fe and second = Hex_ff
		ensure
			instance_free: class
			definition: Result = (is_endian_detection_character (first, second) and (first = Hex_fe))
		end

	is_endian_detection_character_least_first (first, second: INTEGER): BOOLEAN
			-- Do the two bytes `first' and `second' represent the character
			-- 0xFEFF with `first' being the least significant byte?
		require
			a_byte_is_byte: is_byte (first)
			other_byte_is_byte: is_byte (second)
--			first_in_stream: the character represented by (first, second) is first in stream
		do
			Result := first = Hex_ff and second = Hex_fe
		ensure
			instance_free: class
			definition: Result = (is_endian_detection_character (first, second) and (first = Hex_ff))
		end

	is_endian_detection_character (a_byte, other_byte: INTEGER): BOOLEAN
			-- Can these two bytes represent ZERO WIDTH NON-BREAKING SPACE?
			-- (It has to be unicode character 0xFEFF, because 0xFFFE is not a valid character.)
		require
			a_byte_is_byte: is_byte (a_byte)
			other_byte_is_byte: is_byte (other_byte)
		do
			Result := (a_byte = Hex_fe and other_byte = Hex_ff) or (a_byte = Hex_ff and other_byte = Hex_fe)
		ensure
			instance_free: class
			definition: Result = (a_byte.min (other_byte) = Hex_fe and a_byte.max (other_byte) = Hex_ff)
		end

feature -- Surrogate

	is_surrogate (a_most: INTEGER): BOOLEAN
			-- Is this a high surrogate byte?
		require
			byte: is_byte (a_most)
		do
			Result := a_most >= Hex_d8 and a_most < Hex_e0
		ensure
			instance_free: class
		end

	is_high_surrogate (a_most: INTEGER): BOOLEAN
			-- Is this a high surrogate byte?
		require
			byte: is_byte (a_most)
		do
			Result := a_most >= Hex_d8 and a_most < Hex_dc
		ensure
			instance_free: class
		end

	is_low_surrogate (a_most: INTEGER): BOOLEAN
			-- Is this a low surrogate byte?
		require
			byte: is_byte (a_most)
		do
			Result := a_most >= Hex_dc and a_most < Hex_e0
		ensure
			instance_free: class
		end

	least_10_bits (msb, lsb: INTEGER): INTEGER
			-- UTF16 least 10 bytes of a byte pair
		require
			msb_byte: is_byte (msb)
			lsb_byte: is_byte (lsb)
			surrogate: is_surrogate (msb)
		do
			Result := ((msb \\ 4) * Hex_100) + lsb
		ensure
			instance_free: class
			ten_bits: Result >= 0 and Result < Hex_400
		end

	surrogate (a_high_10: INTEGER; a_low_10: INTEGER): INTEGER
			-- Supplementary code point from high and low values
		require
			high_10: a_high_10 >= 0 and a_high_10 < 1024
			low_10: a_low_10 >= 0 and a_low_10 < 1024
		do
			Result := Hex_10000 + ((a_high_10 * Hex_400) + a_low_10)
		ensure
			instance_free: class
			more_than_16bits: Result >= Hex_10000
		end

	surrogate_from_bytes (a_high_most, a_high_least, a_low_most, a_low_least: INTEGER): INTEGER
			-- Supplementary code point from bytes
		require
			surrogate_high: is_high_surrogate (a_high_most)
			high_least_byte: is_byte (a_high_least)
			surrogate_low: is_low_surrogate (a_low_most)
			low_least_byte: is_byte (a_low_least)
		do
			Result := surrogate (least_10_bits (a_high_most, a_high_least), least_10_bits (a_low_most, a_low_least))
		ensure
			instance_free: class
			more_than_16bits: Result >= Hex_10000
		end

	is_byte (a: INTEGER): BOOLEAN
			-- Is `a' a byte?
		do
			Result := a >= 0 and a < Hex_100
		ensure
			instance_free: class
			definition: Result = (a >= 0 and a < Hex_100)
		end

	supplementary_to_high_surrogate (a_code: INTEGER): INTEGER
			-- High surrogate for `a_code'
		require
			code_high_enough: a_code > maximum_bmp_character_code
			code_low_enough: a_code <= maximum_unicode_character_code
		do
			Result := INTEGER_.bit_shift_right (a_code, 10) + Hex_d7c0
		ensure
			instance_free: class
			high_surrogate: Result >= 256 * Hex_d8
			not_too_big: Result < 256 * Hex_dc
		end

	supplementary_to_low_surrogate (a_code: INTEGER): INTEGER
			-- Low surrogate for `a_code'
		require
			code_high_enough: a_code > maximum_bmp_character_code
			code_low_enough: a_code <= maximum_unicode_character_code
		do
			Result := INTEGER_.bit_or (INTEGER_.bit_and (a_code, Hex_3ff), Hex_dc00)
		ensure
			instance_free: class
			low_surrogate: Result >= 256 * Hex_dc
			not_too_big: Result < 256 * Hex_e0
		end

feature {NONE} -- Constants

	Hex_400: INTEGER = 1024
			-- 2 ^ 10

	Hex_100: INTEGER = 256
			-- 2 ^ 8

	Hex_fe: INTEGER = 254
			-- Endian detection character

	Hex_ff: INTEGER = 255
			-- Endian detection character

	Hex_d8: INTEGER = 216
			-- Hex_D800: start of so-called high-half zone or high surrogate area

	Hex_dc: INTEGER = 220
			-- Hex_DC00: start of so-called low-half zone or low surrogate area

	Hex_e0: INTEGER = 224
			-- Hex_E000: end (exclusive) of surrogate area

	Hex_10000: INTEGER = 65536
			-- Base of surrogates

	Hex_d7c0: INTEGER = 55232
			-- Hex D7C0

	Hex_3ff: INTEGER = 1023
			-- Hex 3FF

	Hex_dc00: INTEGER = 56320
			-- Hex_DC00: start of so-called low-half zone or low surrogate area

end
