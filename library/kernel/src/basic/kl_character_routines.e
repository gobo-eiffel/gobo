﻿note

	description:

		"Routines that ought to be in class CHARACTER"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2018, Berend de Boer and others"
	license: "MIT License"

class KL_CHARACTER_ROUTINES

inherit

	KL_SHARED_PLATFORM

feature -- Status report

	is_digit (c: CHARACTER): BOOLEAN
			-- Is `c' a digit?
			-- A digit is one of 0123456789
		do
			Result := (c >= '0' and c <= '9')
		ensure
			instance_free: class
		end

	is_hex_digit (c: CHARACTER): BOOLEAN
			-- Is `c' a hexadecimal digit?
			-- A digit is one of 0123456789a-fA-f
		do
			Result := (c >= '0' and c <= '9') or (c >= 'a' and c <= 'f') or (c >= 'A' and c <= 'F')
		ensure
			instance_free: class
		end

feature -- Access

	next (c: CHARACTER): CHARACTER
			-- Next character
		require
			c_small_enough: c.code < Platform.Maximum_character_code
		do
			Result := c.next
		ensure
			instance_free: class
			definition: Result.code = c.code + 1
		end

	previous (c: CHARACTER): CHARACTER
			-- Previous character
		require
			c_small_enough: c.code > Platform.Minimum_character_code
		do
			Result := c.previous
		ensure
			instance_free: class
			definition: Result.code = c.code - 1
		end

	as_lower (c: CHARACTER): CHARACTER
			-- Lower-case version of character `c'
		do
			Result := c.lower
		end

	as_upper (c: CHARACTER): CHARACTER
			-- Upper-case version of character `c'
		do
			Result := c.upper
		end

end
