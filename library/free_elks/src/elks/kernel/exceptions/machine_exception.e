note
	description: "[
		Deferred class for machine exception, operation exceptions and hardware exceptions
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-12-26 18:57:50 -0800 (Wed, 26 Dec 2012) $"
	revision: "$Revision: 92096 $"

deferred class
	MACHINE_EXCEPTION

inherit
	EXCEPTION
		undefine
			code,
			tag
		end

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
