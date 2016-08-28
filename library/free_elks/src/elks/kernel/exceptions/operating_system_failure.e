note
	description: "[
		Operating system failure
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-12-26 18:57:50 -0800 (Wed, 26 Dec 2012) $"
	revision: "$Revision: 92096 $"

class
	OPERATING_SYSTEM_FAILURE

inherit
	OPERATING_SYSTEM_EXCEPTION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			Result := {EXCEP_CONST}.operating_system_exception
		end

	error_code: INTEGER
			-- Error code

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("Operating system error.")
		end

feature {EXCEPTION_MANAGER} -- Status setting

	set_error_code (a_code: like error_code)
			-- Set `error_code' with `a_code'
		do
			error_code := a_code
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
