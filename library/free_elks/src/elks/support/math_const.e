note
	description: "[
		Basic mathematical constants.
		This class may be used as ancestor by classes needing its facilities.
		]"

	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MATH_CONST

feature -- Access

	Pi: REAL_64 = 3.1415926535897932384626433832795029
	Pi_2: REAL_64 = 1.5707963267948966192313216916397514
	Pi_4: REAL_64 = 0.7853981633974483096156608458198757

	Sqrt2: REAL_64 = 1.4142135623730950488016887242096981
			-- Square root of 2

	Euler: REAL_64 = 2.7182818284590452353602874713526625;
			-- Logarithm base

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
