indexing

	description:

		"Unicode constants"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_CONSTANTS

inherit

	KL_SHARED_PLATFORM

feature -- Access

	minimum_unicode_character_code: INTEGER is 0
			-- Smallest code for unicode characters
--		ensure
--			definition: Result = 0
--		end

	maximum_unicode_character_code: INTEGER is 2147483647
			-- Largest code for unicode characters
			-- (2^31 - 1)
--		ensure
--			large_enough: Result >= 0
--			small_enough: Result <= Platform.Maximum_integer
--		end

	minimum_ascii_character_code: INTEGER is 0
			-- Smallest code for ASCII characters
--		ensure
--			definition: Result = 0
--		end

	maximum_ascii_character_code: INTEGER is 127
			-- Largest code for ASCII characters
			-- (2^7 - 1)
--		ensure
--			definition: Result = 127
--			small_enough: Result <= Platform.Maximum_byte_code
--		end

	minimum_ascii_character: CHARACTER is '%/0/'
			-- Smallest ASCII character
--		ensure
--			definition: Result.code = minimum_ascii_code
--		end

	maximum_ascii_character: CHARACTER is '%/127/'
			-- Largest ASCII character
--		ensure
--			definition: Result.code = maximum_ascii_code
--		end

end
