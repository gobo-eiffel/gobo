indexing
	description: "Directory name abstraction"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DIRECTORY_NAME

inherit
	PATH_NAME

create
	make, make_from_string

create {DIRECTORY_NAME}
	string_make

feature

	is_valid: BOOLEAN is
			-- Is the directory name valid?
		local
			any: ANY
		do
			any := to_c
			Result := eif_is_directory_valid ($any)
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current is
			-- New instance of current with space for at least `n' characters.
		do
			create Result.string_make (n)
		end
		
feature {NONE} -- Externals

	eif_is_directory_valid (p: POINTER): BOOLEAN is
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

end
