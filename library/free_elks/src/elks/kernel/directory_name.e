note
	description: "Directory name abstraction"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-12-17 23:05:44 +0100 (Mon, 17 Dec 2012) $"
	revision: "$Revision: 665 $"

class DIRECTORY_NAME

inherit
	PATH_NAME

create
	make, make_from_string

create {DIRECTORY_NAME}
	string_make

feature -- Status report

	is_valid: BOOLEAN
			-- Is the directory name valid?
		local
			any: ANY
		do
			any := to_c
			Result := eif_is_directory_valid ($any)
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current
			-- New instance of current with space for at least `n' characters.
		do
			create Result.string_make (n)
		end

feature {NONE} -- Externals

	eif_is_directory_valid (p: POINTER): BOOLEAN
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
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
