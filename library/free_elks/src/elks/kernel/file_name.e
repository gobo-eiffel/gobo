note
	description: "File name abstraction"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	FILE_NAME

obsolete "This class is obsolete, use PATH, or FILE instead [2019-05-31]"

inherit
	PATH_NAME

create
	make,
	make_from_string,
	make_temporary_name

create {FILE_NAME}
	string_make

feature {NONE} -- Initialization

	make_temporary_name
			-- Create a temporary filename.
		note
			EIS:"name={FILE}.make_open_temporary", "src=eiffel:?class=FILE&feature=make_open_temporary","protocol=uri"
			EIS:"name={FILE}.make_open_temporary_with_prefix", "src=eiffel:?class=FILE&feature=make_open_temporary_with_prefix","protocol=uri"
		obsolete
			"Use `{FILE}.make_open_temporary or {FILE}.make_open_temporary_with_prefix` instead. [2019-05-31]"
		local
			l_file: PLAIN_TEXT_FILE
		do
			if attached {EXECUTION_ENVIRONMENT}.temporary_directory_path as tmp then
				create l_file.make_open_temporary_with_prefix (tmp.extended ("tmp-").name)
			else
				create l_file.make_open_temporary_with_prefix ("tmp-")
			end
			make_from_string (l_file.path.utf_8_name)
			l_file.close
			l_file.delete
		end

feature -- Status report

	is_valid: BOOLEAN
			-- Is the file name valid for the operating system?
		local
			any: ANY
		do
			any := to_c
			Result := eif_is_file_valid ($any)
		end

	is_file_name_valid (f_name: STRING): BOOLEAN
			-- Is `f_name' a valid file name part for the operating system?
		local
			any: ANY
		do
			any := f_name.to_c
			Result := eif_is_file_name_valid ($any)
		end

	is_extension_valid (ext: STRING): BOOLEAN
			-- Is `ext' a valid extension for the operating system?
		local
			any: ANY
		do
			any := ext.to_c
			Result := eif_is_extension_valid ($any)
		end

feature -- Status setting

	set_file_name (file_name: STRING)
			-- Set the value of the file name part.
		require
			string_exists: file_name /= Void
			valid_file_name: is_file_name_valid (file_name)
		local
			new_size: INTEGER
			str1, str2: ANY
		do
			new_size := count + file_name.count + 5
			if capacity < new_size then
				resize (new_size)
			end
			str1 := to_c
			str2 := file_name.to_c
			eif_append_file_name ($Current, $str1, $str2)
			set_count (c_strlen ($str1))
		ensure
			valid_file_name: is_valid
		end

	add_extension (ext: STRING)
			-- Append the extension `ext' to the file name
		require
			string_exists: ext /= Void
			non_empty_extension: not ext.is_empty
			valid_extension: is_extension_valid (ext)
		do
			append_character ('.')
			append (ext)
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current
			-- New instance of current with space for at least `n' characters.
		do
			create Result.string_make (n)
		end

feature {NONE} -- Externals

	eif_append_file_name (s, p, v: POINTER)
		external
			"C signature (EIF_REFERENCE, EIF_CHARACTER *, EIF_CHARACTER *) use %"eif_path_name.h%""
		end

	eif_is_file_name_valid (p: POINTER): BOOLEAN
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

	eif_is_extension_valid (p: POINTER): BOOLEAN
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

	eif_is_file_valid (p: POINTER): BOOLEAN
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
