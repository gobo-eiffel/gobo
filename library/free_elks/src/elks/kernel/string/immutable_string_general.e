note
	description: "Common ancestors to all immutable STRING classes."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	IMMUTABLE_STRING_GENERAL

inherit
	READABLE_STRING_GENERAL
		redefine
			is_immutable
		end

convert
	as_string_32: {READABLE_STRING_32, STRING_32}

feature -- Status report

	is_immutable: BOOLEAN = True
			-- <Precursor>

invariant
	immutable: is_immutable

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
