note
	description: "[
		Objects representing delayed calls to a procedure.
		with some operands possibly still open.
		
		Note: Features are the same as those of ROUTINE,
			with `apply' made effective, and no further
			redefinition of `is_equal' and `copy'.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2015-12-17 05:34:17 -0800 (Thu, 17 Dec 2015) $"
	revision: "$Revision: 98279 $"

class
	PROCEDURE [OPEN_ARGS -> detachable TUPLE create default_create end]

inherit
	ROUTINE [OPEN_ARGS]
		rename
			call as call alias "()"
		end

create {NONE}

feature -- Calls

	apply
			-- Call procedure with `args' as last set.
		local
			l_args: detachable OPEN_ARGS
		do
			call (l_args)
		end
		
	call alias "()" (args: detachable OPEN_ARGS)
			-- <Precursor>
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2014, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
