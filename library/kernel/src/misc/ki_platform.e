note

	description:

		"Interface for platform-dependent properties"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"

deferred class KI_PLATFORM

feature -- Bits

	Boolean_bits: INTEGER
			-- Number of bits in a value of type BOOLEAN
		deferred
		ensure
			instance_free: class
			large_enough: Result >= 1
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
--			small_enough: Result <= Boolean_bytes * Byte_bits
		end

	Byte_bits: INTEGER = 8
			-- Number of bits in a byte

	Character_bits: INTEGER
			-- Number of bits in a value of type CHARACTER
		deferred
		ensure
			instance_free: class
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
				-- definition: Result = Character_bytes * Byte_bits
			more_than_byte: Result >= Byte_bits
		end

	Double_bits: INTEGER
			-- Number of bits in a value of type DOUBLE
		deferred
		ensure
			instance_free: class
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
--			definition: Result = Double_bytes * Byte_bits
			more_than_real: Result >= Real_bits
		end

	Integer_bits: INTEGER
			-- Number of bits in a value of type INTEGER
		deferred
		ensure
			instance_free: class
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
--			definition: Result = Integer_bytes * Byte_bits
			more_than_character: Result >= Character_bits
		end

	Pointer_bits: INTEGER
			-- Number of bits in a value of type POINTER
		deferred
		ensure
			instance_free: class
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
--			definition: Result = Pointer_bytes * Byte_bits
		end

	Real_bits: INTEGER
			-- Number of bits in a value of type REAL
		deferred
		ensure
			instance_free: class
				-- Note: Postcondition commented out to avoid recursive
				-- call in once-function in KL_PLATFORM:
--			definition: Result = Real_bytes * Byte_bits
		end

feature -- Bytes

	Boolean_bytes: INTEGER
			-- Number of bytes in a value of type BOOLEAN
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
		end

	Byte_bytes: INTEGER = 1
			-- Number of bytes in a byte

	Character_bytes: INTEGER
			-- Number of bytes in a value of type CHARACTER
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
			more_than_byte: Result >= Byte_bytes
		end

	Double_bytes: INTEGER
			-- Number of bytes in a value of type DOUBLE
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
			more_than_real: Result >= Real_bytes
		end

	Integer_bytes: INTEGER
			-- Number of bytes in a value of type INTEGER
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
			more_than_character: Result >= Character_bytes
		end

	Pointer_bytes: INTEGER
			-- Number of bytes in a value of type POINTER
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
		end

	Real_bytes: INTEGER
			-- Number of bytes in a value of type REAL
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 1
		end

feature -- Values

	Minimum_byte_code: INTEGER = 0
			-- Smallest supported code for a byte

	Maximum_byte_code: INTEGER = 255
			-- Largest supported code for a byte

	Minimum_character_code: INTEGER
			-- Smallest supported code for CHARACTER values
		deferred
		ensure
			instance_free: class
			meaningful: Result = 0
		end

	Maximum_character_code: INTEGER
			-- Largest supported code for CHARACTER values
		deferred
		ensure
			instance_free: class
			meaningful: Result >= Maximum_byte_code
				-- Problem with ^ in SE 2.1b1, and with ISE 5.6 for .NET:
--			definition: Result = (2 ^ Character_bits) - 1
		end

	Minimum_integer: INTEGER
			-- Smallest supported value of type INTEGER
		deferred
		ensure
			instance_free: class
			meaningful: Result <= 0
				-- Result = - (2 ^ (Integer_bits - 1)):
			definition: Result = (2 ^ (Integer_bits - 2)) * -2
		end

	Maximum_integer: INTEGER
			-- Largest supported value of type INTEGER
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 0
				-- Result = 2 ^ (Integer_bits - 1) - 1:
			definition: Result = -(Minimum_integer + 1)
		end

	Minimum_integer_64: INTEGER_64
			-- Smallest supported value of type INTEGER_64
		deferred
		ensure
			instance_free: class
			meaningful: Result <= 0
		end

	Maximum_integer_64: INTEGER_64
			-- Largest supported value of type INTEGER_64
		deferred
		ensure
			instance_free: class
			meaningful: Result >= 0
			definition: Result = -(Minimum_integer_64 + 1)
		end

end
