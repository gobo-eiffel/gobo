note

	description:

		"UTF-32 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF32_ROUTINES

inherit

	UC_UNICODE_CONSTANTS

	UC_IMPORTED_UNICODE_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

feature -- Status report

	valid_utf32 (a_string: STRING_8): BOOLEAN
			-- Are the bytes in `a_string' a valid UTF-32 encoding?
			-- 'a_string' has one byte per character.
			-- Default to big endian when no BOM.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			i, nb: INTEGER
			least_endian: BOOLEAN
		do
			Result := (a_string.count \\ 4) = 0
			if Result and a_string.count > 0 then
					-- Loop through most significant bytes, detecting starting point is enough.
				if is_endian_detection_character_least_first (a_string.item_code (1), a_string.item_code (2), a_string.item_code (3), a_string.item_code (4)) then
					least_endian := True
				end
				nb := a_string.count
				from
					i := 1
				until
					i > nb
				loop
					Result := unicode.valid_non_surrogate_code (code (a_string.item_code (i), a_string.item_code (i + 1), a_string.item_code (i + 2), a_string.item_code (i + 3), least_endian))
					if not Result then
						i := nb + 1
					else
						i := i + 4
					end
				end
			end
		ensure
			instance_free: class
			empty_is_true: a_string.count = 0 implies Result
			utf32_count_multiple_of_four: Result implies ((a_string.count \\ 4) = 0)
		end

feature -- Endian-ness detection

	bom_be: STRING_8
			-- BOM in big-endian format
		once
			Result := "%/0/%/0/%/254/%/255/"
		ensure
			instance_free: class
			bom_be_not_void: Result /= Void
			four_bytes: Result.count = 4
			first_byte: Result.item_code (1) = 0
			second_byte: Result.item_code (2) = 0
			third_byte: Result.item_code (3) = Hex_fe
			fourth_byte: Result.item_code (4) = Hex_ff
		end

	bom_le: STRING_8
			-- BOM in little-endian format
		once
			Result := "%/255/%/254/%/0/%/0/"
		ensure
			instance_free: class
			bom_le_not_void: Result /= Void
			four_bytes: Result.count = 4
			first_byte: Result.item_code (1) = Hex_ff
			second_byte: Result.item_code (2) = Hex_fe
			third_byte: Result.item_code (3) = 0
			fourth_byte: Result.item_code (4) = 0
		end

	is_endian_detection_character_most_first (first, second, third, fourth: INTEGER): BOOLEAN
			-- Do the four bytes represent the character
			-- 0xFEFF with `first' being the most significant byte?
		require
			first_is_byte: is_byte (first)
			second_is_byte: is_byte (second)
			third_is_byte: is_byte (third)
			fourth_is_byte: is_byte (fourth)
--			first_in_stream: the character represented by (first, second, third, fourth) is first in stream
		do
			Result := first = 0 and second = 0 and third = Hex_fe and fourth = Hex_ff
		ensure
			instance_free: class
			definition: Result = (first = 0 and second = 0 and third = Hex_fe and fourth = Hex_ff)
		end

	is_endian_detection_character_least_first (first, second, third, fourth: INTEGER): BOOLEAN
			-- Do the four bytes represent the character
			-- 0xFEFF with `first' being the least significant byte?
		require
			first_is_byte: is_byte (first)
			second_is_byte: is_byte (second)
			third_is_byte: is_byte (third)
			fourth_is_byte: is_byte (fourth)
--			first_in_stream: the character represented by (first, second, third, fourth) is first in stream
		do
			Result := first = Hex_ff and second = Hex_fe and third = 0 and fourth = 0
		ensure
			instance_free: class
			definition: Result = (first = Hex_ff and second = Hex_fe and third = 0 and fourth = 0)
		end

	is_byte (a: INTEGER): BOOLEAN
			-- Is `a' a byte?
		do
			Result := a >= 0 and a < Hex_100
		ensure
			instance_free: class
			definition: Result = (a >= 0 and a < Hex_100)
		end

feature -- Access

	code (first, second, third, fourth: INTEGER; least_endian: BOOLEAN): INTEGER
			-- Code point represented by four bytes
		require
			first_is_byte: is_byte (first)
			second_is_byte: is_byte (second)
			third_is_byte: is_byte (third)
			fourth_is_byte: is_byte (fourth)
		do
			if least_endian then
				Result := first + second * 256 + third * Two_byte_offset + fourth * Three_byte_offset
			else
				Result := fourth + third * 256 + second * Two_byte_offset + first * Three_byte_offset
			end
		ensure
			instance_free: class
			code_not_negative: Result >= 0
		end

feature {NONE} -- Constants

	Hex_100: INTEGER = 256
			-- 2 ^ 8

	Hex_fe: INTEGER = 254
			-- Endian detection character

	Hex_ff: INTEGER = 255
			-- Endian detection character

	Two_byte_offset: INTEGER = 65536
			-- 256 * 256

	Three_byte_offset: INTEGER = 16777216
			-- 256 * 256 * 256

end
