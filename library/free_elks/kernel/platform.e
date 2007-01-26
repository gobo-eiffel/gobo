indexing
	description: "Platform-dependent properties."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PLATFORM

feature -- Platform

	is_thread_capable: BOOLEAN is
			-- Is current platform capable of multi-threading?
		external
			"built_in"
		end

	is_dotnet: BOOLEAN is
			-- Are we targetting .NET?
		external
			"built_in"
		end

	is_windows: BOOLEAN is
			-- Are we running on Windows platform?
		external
			"built_in"
		end

	is_unix: BOOLEAN is
			-- Are we running on a Unix like platform?
		external
			"built_in"
		end

	is_vms: BOOLEAN is
			-- Are we running on VMS?
		external
			"built_in"
		end

	is_little_endian: BOOLEAN is
			-- Is current platform a little endian one?
		local
			l_nat16: NATURAL_16
			l_nat8: NATURAL_8
			l_first: NATURAL_8
		once
			l_nat16 := 0x4321
			l_nat8 := 0x21
			($l_first).memory_copy ($l_nat16, 1)
			Result := l_first = l_nat8
		end

feature -- Access bytes size

	boolean_bytes: INTEGER is
			-- Number of bytes in a value of type `BOOLEAN'
		external
			"built_in"
		end

	character_bytes: INTEGER is
			-- Number of bytes in a value of type `CHARACTER'
		external
			"built_in"
		end

	wide_character_bytes: INTEGER is
			-- Number of bytes in a value of type `WIDE_CHARACTER'
		external
			"built_in"
		end

	natural_8_bytes: INTEGER is 1
			-- Number of bytes in a value of type `INTEGER_8'

	natural_16_bytes: INTEGER is 2
			-- Number of bytes in a value of type `INTEGER_16'

	natural_32_bytes: INTEGER is 4
			-- Number of bytes in a value of type `INTEGER'

	natural_64_bytes: INTEGER is 8
			-- Number of bytes in a value of type `INTEGER_64'

	integer_bytes: INTEGER is
			-- Number of bytes in a value of type `INTEGER'
		external
			"built_in"
		end

	integer_8_bytes: INTEGER is 1
			-- Number of bytes in a value of type `INTEGER_8'

	integer_16_bytes: INTEGER is 2
			-- Number of bytes in a value of type `INTEGER_16'

	integer_32_bytes: INTEGER is 4
			-- Number of bytes in a value of type `INTEGER_32'

	integer_64_bytes: INTEGER is 8
			-- Number of bytes in a value of type `INTEGER_64'

	real_bytes: INTEGER is
			-- Number of bytes in a value of type `REAL'
		external
			"built_in"
		end

	real_32_bytes: INTEGER is 4
			-- Number of bytes in a value of type `REAL_32'

	real_64_bytes, double_bytes: INTEGER is 8
			-- Number of bytes in a value of type `REAL_64'

	pointer_bytes: INTEGER is
			-- Number of bytes in a value of type `POINTER'
		external
			"built_in"
		end

feature -- Access bits size

	boolean_bits: INTEGER is
			-- Number of bits in a value of type `BOOLEAN'
		once
			Result := boolean_bytes * 8
		end

	character_bits: INTEGER is
			-- Number of bits in a value of type `CHARACTER'
		once
			Result := character_bytes * 8
		end

	natural_8_bits: INTEGER is 8
			-- Number of bits in a value of type `NATURAL_8'

	natural_16_bits: INTEGER is 16
			-- Number of bits in a value of type `NATURAL_16'

	natural_32_bits: INTEGER is 32
			-- Number of bits in a value of type `NATURAL_32'

	natural_64_bits: INTEGER is 64
			-- Number of bits in a value of type `NATURAL_64'

	integer_bits: INTEGER is
			-- Number of bits in a value of type `INTEGER'
		once
			Result := integer_bytes * 8
		end

	integer_8_bits: INTEGER is 8
			-- Number of bits in a value of type `INTEGER_8'

	integer_16_bits: INTEGER is 16
			-- Number of bits in a value of type `INTEGER_16'

	integer_32_bits: INTEGER is 32
			-- Number of bits in a value of type `INTEGER_32'

	integer_64_bits: INTEGER is 64
			-- Number of bits in a value of type `INTEGER_64'

	real_bits: INTEGER is
			-- Number of bits in a value of type `REAL'
		once
			Result := real_bytes * 8
		end

	real_32_bits: INTEGER is 32
			-- Number of bits in a value of type `REAL_32'

	real_64_bits, double_bits: INTEGER is 64
			-- Number of bits in a value of type `REAL_64'

	pointer_bits: INTEGER is
			-- Number of bits in a value of type `POINTER'
		once
			Result := pointer_bytes * 8
		end

feature -- Access min max values

	maximum_character_code: INTEGER is
			-- Largest supported code for CHARACTER values
		do
			Result := {CHARACTER}.max_value
		ensure
			meaningful: Result >= 127
		end

	maximum_integer: INTEGER is
			-- Largest supported value of type INTEGER.
		do
			Result := {INTEGER}.max_value
		ensure
			meaningful: Result >= 0
		end

	minimum_character_code: INTEGER is
			-- Smallest supported code for CHARACTER values
		do
			Result := {CHARACTER}.min_value
		ensure
			meaningful: Result <= 0
		end

	minimum_integer: INTEGER is
			-- Smallest supported value of type INTEGER
		do
			Result := {INTEGER}.min_value
		ensure
			meaningful: Result <= 0
		end

end
