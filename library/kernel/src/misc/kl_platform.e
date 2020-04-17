note

	description:

		"Platform-dependent properties"

	usage: "[
		This class should not be used directly through
		inheritance and client/supplier relationship.
		Inherit from KL_SHARED_PLATFORM instead.
	]"
	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_PLATFORM

inherit

	KI_PLATFORM

	PLATFORM
		rename
			Minimum_character_code as old_minimum_character_code,
			Maximum_character_code as old_maximum_character_code,
			Minimum_integer as old_minimum_integer,
			Maximum_integer as old_maximum_integer,
			Boolean_bytes as old_boolean_bytes,
			Character_bytes as old_character_bytes,
			Pointer_bytes as old_pointer_bytes,
			Integer_bytes as old_obsolete_integer_bytes,
			Integer_32_bytes as old_integer_bytes,
			Double_bytes as old_obsolete_double_bytes,
			Real_64_bytes as old_double_bytes,
			Real_bytes as old_obsolete_real_bytes,
			Real_32_bytes as old_real_bytes,
			Integer_bits as old_obsolete_integer_bits,
			Integer_32_bits as old_integer_bits,
			Double_bits as old_obsolete_double_bits,
			Real_64_bits as old_double_bits,
			Real_bits as old_obsolete_real_bits,
			Real_32_bits as old_real_bits,
			Boolean_bits as old_boolean_bits,
			Character_bits as old_character_bits,
			Pointer_bits as old_pointer_bits
		export
			{NONE} all
		end

feature -- Bits

	Boolean_bits: INTEGER
			-- Number of bits in a value of type BOOLEAN
		once
			Result := old_boolean_bits
		end

	Character_bits: INTEGER
			-- Number of bits in a value of type CHARACTER_8
		once
			Result := 8
		end

	Double_bits: INTEGER
			-- Number of bits in a value of type REAL_64
		once
			Result := old_double_bits
		end

	Integer_bits: INTEGER
			-- Number of bits in a value of type INTEGER_32
		once
			Result := old_integer_bits
		end

	Pointer_bits: INTEGER
			-- Number of bits in a value of type POINTER
		once
			Result := old_pointer_bits
		end

	Real_bits: INTEGER
			-- Number of bits in a value of type REAL_32
		once
			Result := old_real_bits
		end

feature -- Bytes

	Boolean_bytes: INTEGER
			-- Number of bytes in a value of type BOOLEAN
		once
			Result := old_boolean_bytes
		end

	Character_bytes: INTEGER
			-- Number of bytes in a value of type CHARACTER_8
		once
			Result := 1
		end

	Double_bytes: INTEGER
			-- Number of bytes in a value of type REAL_64
		once
			Result := old_double_bytes
		end

	Integer_bytes: INTEGER
			-- Number of bytes in a value of type INTEGER_32
		once
			Result := old_integer_bytes
		end

	Pointer_bytes: INTEGER
			-- Number of bytes in a value of type POINTER
		once
			Result := old_pointer_bytes
		end

	Real_bytes: INTEGER
			-- Number of bytes in a value of type REAL_32
		once
			Result := old_real_bytes
		end

feature -- Values

	Minimum_character_code: INTEGER
			-- Smallest supported code for CHARACTER_8 values
		once
			Result := {CHARACTER_8}.min_value
		end

	Maximum_character_code: INTEGER
			-- Largest supported code for CHARACTER_8 values
		once
			Result := {CHARACTER_8}.max_value
		end

	Minimum_integer: INTEGER
			-- Smallest supported value of type INTEGER_32
		once
			Result := {INTEGER_32}.min_value
		end

	Maximum_integer: INTEGER
			-- Largest supported value of type INTEGER_32
		once
			Result := {INTEGER_32}.max_value
		end

	Minimum_integer_64: INTEGER_64
			-- Smallest supported value of type INTEGER_64
		once
			Result := -9223372036854775808
		end

	Maximum_integer_64: INTEGER_64
			-- Largest supported value of type INTEGER_64
		once
			Result := 9223372036854775807
		end

end
