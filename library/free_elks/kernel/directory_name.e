note
	description: "Directory name abstraction"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2008-12-29 20:36:38 +0100 (Mon, 29 Dec 2008) $"
	revision: "$Revision: 254 $"

class DIRECTORY_NAME

inherit
	PATH_NAME

create
	make, make_from_string

create {DIRECTORY_NAME}
	string_make

feature

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

end
