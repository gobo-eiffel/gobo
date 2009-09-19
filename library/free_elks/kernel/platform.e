note
	description: "Platform-dependent properties."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class PLATFORM

feature -- Platform

	is_thread_capable: BOOLEAN
			-- Is current platform capable of multi-threading?
		external
			"built_in static"
		end

	is_dotnet: BOOLEAN
			-- Are we targetting .NET?
		external
			"built_in static"
		end

	is_windows: BOOLEAN
			-- Are we running on Windows platform?
		external
			"built_in static"
		end

	is_unix: BOOLEAN
			-- Are we running on a Unix like platform?
		external
			"built_in static"
		end

	is_vms: BOOLEAN
			-- Are we running on VMS?
		external
			"built_in static"
		end

	is_mac: BOOLEAN
			-- Are we running on Mac OS?
		external
			"built_in static"
		end

	is_vxworks: BOOLEAN
			-- Are we running on VxWorks?
		external
			"built_in static"
		end

	is_little_endian: BOOLEAN
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

	boolean_bytes: INTEGER
			-- Number of bytes in a value of type `BOOLEAN'
		external
			"built_in static"
		end

	character_8_bytes: INTEGER = 1
			-- Number of bytes in a value of type `CHARACTER_8'

	character_32_bytes: INTEGER = 4
			-- Number of bytes in a value of type `CHARACTER_32'

	natural_8_bytes: INTEGER = 1
			-- Number of bytes in a value of type `NATURAL_8'

	natural_16_bytes: INTEGER = 2
			-- Number of bytes in a value of type `NATURAL_16'

	natural_32_bytes: INTEGER = 4
			-- Number of bytes in a value of type `NATURAL_32'

	natural_64_bytes: INTEGER = 8
			-- Number of bytes in a value of type `NATURAL_64'

	integer_8_bytes: INTEGER = 1
			-- Number of bytes in a value of type `INTEGER_8'

	integer_16_bytes: INTEGER = 2
			-- Number of bytes in a value of type `INTEGER_16'

	integer_32_bytes: INTEGER = 4
			-- Number of bytes in a value of type `INTEGER_32'

	integer_64_bytes: INTEGER = 8
			-- Number of bytes in a value of type `INTEGER_64'

	real_32_bytes: INTEGER = 4
			-- Number of bytes in a value of type `REAL_32'

	real_64_bytes: INTEGER = 8
			-- Number of bytes in a value of type `REAL_64'

	pointer_bytes: INTEGER
			-- Number of bytes in a value of type `POINTER'
		external
			"built_in static"
		end

feature -- Access bits size

	boolean_bits: INTEGER
			-- Number of bits in a value of type `BOOLEAN'
		do
			Result := boolean_bytes * 8
		end

	character_8_bits: INTEGER = 8
			-- Number of bits in a value of type `CHARACTER_8'

	character_32_bits: INTEGER = 32
			-- Number of bits in a value of type `CHARACTER_32'

	natural_8_bits: INTEGER = 8
			-- Number of bits in a value of type `NATURAL_8'

	natural_16_bits: INTEGER = 16
			-- Number of bits in a value of type `NATURAL_16'

	natural_32_bits: INTEGER = 32
			-- Number of bits in a value of type `NATURAL_32'

	natural_64_bits: INTEGER = 64
			-- Number of bits in a value of type `NATURAL_64'

	integer_8_bits: INTEGER = 8
			-- Number of bits in a value of type `INTEGER_8'

	integer_16_bits: INTEGER = 16
			-- Number of bits in a value of type `INTEGER_16'

	integer_32_bits: INTEGER = 32
			-- Number of bits in a value of type `INTEGER_32'

	integer_64_bits: INTEGER = 64
			-- Number of bits in a value of type `INTEGER_64'

	real_32_bits: INTEGER = 32
			-- Number of bits in a value of type `REAL_32'

	real_64_bits: INTEGER = 64
			-- Number of bits in a value of type `REAL_64'

	pointer_bits: INTEGER
			-- Number of bits in a value of type `POINTER'
		do
			Result := pointer_bytes * 8
		end

feature -- Obsoletes

	character_bytes: INTEGER
			-- Number of bytes in a value of type `CHARACTER_8'
		obsolete
			"Use `character_8_bytes' instead."
		external
			"built_in static"
		end

	wide_character_bytes: INTEGER
			-- Number of bytes in a value of type `CHARACTER_32'
		obsolete
			"Use `character_32_bytes' instead."
		external
			"built_in static"
		end

	integer_bytes: INTEGER
			-- Number of bytes in a value of type `INTEGER_32'
		obsolete
			"Use `integer_32_bytes' instead."
		external
			"built_in static"
		end

	real_bytes: INTEGER
			-- Number of bytes in a value of type `REAL_32'
		obsolete
			"Use `real_32_bytes' instead."
		external
			"built_in static"
		end

	double_bytes: INTEGER
			-- Number of bytes in a value of type `REAL_64'
		obsolete
			"Use `real_64_bytes' instead."
		external
			"built_in static"
		end

	character_bits: INTEGER
			-- Number of bits in a value of type `CHARACTER_8'
		obsolete
			"Use `character_8_bits' instead."
		do
			Result := 8
		end

	integer_bits: INTEGER
			-- Number of bits in a value of type `INTEGER_32'
		obsolete
			"Use `integer_32_bits' instead."
		do
			Result := 32
		end

	real_bits: INTEGER
			-- Number of bits in a value of type `REAL_32'
		obsolete
			"Use `real_32_bits' instead."
		do
			Result := 32
		end

	double_bits: INTEGER
			-- Number of bits in a value of type `REAL_64'
		obsolete
			"Use `real_64_bits' instead."
		do
			Result := 64
		end

	maximum_character_code: INTEGER
			-- Largest supported code for CHARACTER_8 values
		obsolete
			"Use `{CHARACTER}.max_value' instead."
		do
			Result := {CHARACTER}.max_value
		ensure
			meaningful: Result >= 127
		end

	maximum_integer: INTEGER
			-- Largest supported value of type INTEGER_32
		obsolete
			"Use `{INTEGER}.max_value' instead."
		do
			Result := {INTEGER}.max_value
		ensure
			meaningful: Result >= 0
		end

	minimum_character_code: INTEGER
			-- Smallest supported code for CHARACTER_8 values
		obsolete
			"Use `{CHARACTER}.min_value' instead."
		do
			Result := {CHARACTER}.min_value
		ensure
			meaningful: Result <= 0
		end

	minimum_integer: INTEGER
			-- Smallest supported value of type INTEGER_32
		obsolete
			"Use `{INTEGER}.min_value' instead."
		do
			Result := {INTEGER}.min_value
		ensure
			meaningful: Result <= 0
		end

end
