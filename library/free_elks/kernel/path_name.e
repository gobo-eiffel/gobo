indexing
	description: "Path name abstraction"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class PATH_NAME

inherit
	STRING
		rename
			make as string_make,
			make_from_string as string_make_from_string,
			extend as string_extend
		export
			{PATH_NAME} all
			{ANY} is_empty, empty, to_c, wipe_out, out, string, twin, prunable
		undefine
			new_string
		redefine
			is_equal
		end

feature -- Initialization

	make is
			-- Create path name object.
		do
			string_make (0)
		end

	make_from_string (p: STRING) is
			-- Create path name object and initialize it with the
			-- path name `p'
		require
			path_not_void: p /= Void
		do
			string_make (p.count)
			append (p)
		ensure
			valid_file_name: is_valid
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is the path name equal to `other'?
		local
			o_area: like area
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				o_area := other.area
				Result := eif_path_name_compare ($area, $o_area, count)
			end
		end

feature -- Status report

	is_directory_name_valid (dir_name: STRING): BOOLEAN is
			-- Is `dir_name' a valid subdirectory part for the operating system?
		require
			exists: dir_name /= Void
		local
			any: ANY
		do
			any := dir_name.to_c
			Result := eif_is_directory_name_valid ($any)
		end

	is_volume_name_valid (vol_name: STRING): BOOLEAN is
			-- Is `vol_name' a valid volume name for the operating system?
		require
			exists: vol_name /= Void
		local
			any: ANY
		do
			any := vol_name.to_c
			Result := eif_is_volume_name_valid ($any)
		end

	is_valid: BOOLEAN is
			-- Is the path name valid for the operating system?
		deferred
		end

feature -- Status setting

	set_volume (volume_name: STRING) is
			-- Set the volume part of the path name to `volume_name'.
		require
			string_exists: volume_name /= Void
			valid_volume_name: is_volume_name_valid (volume_name)
			empty_path_name: is_empty
		do
			append (volume_name)
		ensure
			valid_file_name: is_valid
		end

	extend, set_subdirectory (directory_name: STRING) is
			-- Append the subdirectory `directory_name' to the path name.
		require
			string_exists: directory_name /= Void
			valid_directory_name: is_directory_name_valid (directory_name)
		local
			new_size: INTEGER
			str1, str2: ANY
		do
			new_size := count + directory_name.count + 5
			if capacity < new_size then
				resize (new_size)
			end
			str1 := to_c
			str2 := directory_name.to_c
			eif_append_directory ($Current, $str1, $str2)
			set_count (c_strlen ($str1))
		ensure
			valid_file_name: is_valid
		end

	set_directory (directory_name: STRING) is
			-- Set the absolute directory part of the path name to `directory_name'.
		require
			string_exists: directory_name /= Void
			valid_directory_name: is_directory_name_valid (directory_name)
		local
			new_size: INTEGER
			str1, str2: ANY
		do
			new_size := count + directory_name.count + 5
			if capacity < new_size then
				resize (new_size)
			end
			str1 := to_c
			str2 := directory_name.to_c
			eif_set_directory ($Current, $str1, $str2)
			set_count (c_strlen ($str1))
		ensure
			valid_file_name: is_valid
		end

	extend_from_array (directories: ARRAY [STRING]) is
			-- Append the subdirectories from `directories' to the path name.
		require
			array_exists: directories /= Void and then not (directories.is_empty)
		local
			i, nb: INTEGER
		do
			from
				i := directories.lower
				nb := directories.upper
			until
				i > nb
			loop
				extend (directories.item (i))
				i := i + 1
			end
		ensure
			valid_file_name: is_valid
		end

feature {NONE} -- Externals

	eif_is_volume_name_valid (p: POINTER): BOOLEAN is
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

	eif_is_directory_name_valid (p: POINTER): BOOLEAN is
		external
			"C signature (EIF_CHARACTER *): EIF_BOOLEAN use %"eif_path_name.h%""
		end

	eif_append_directory (s, p, v: POINTER) is
		external
			"C signature (EIF_REFERENCE, EIF_CHARACTER *, EIF_CHARACTER *) use %"eif_path_name.h%""
		end

	eif_set_directory (s, p, v: POINTER) is
		external
			"C signature (EIF_REFERENCE, EIF_CHARACTER *, EIF_CHARACTER *) use %"eif_path_name.h%""
		end

	eif_path_name_compare (s, t: POINTER; length: INTEGER): BOOLEAN is
		external
			"C signature (EIF_CHARACTER *, EIF_CHARACTER *, EIF_INTEGER): EIF_BOOLEAN use %"eif_path_name.h%""
		end

	eif_volume_name (s: POINTER): STRING is
		external
			"C signature (EIF_CHARACTER *): EIF_REFERENCE use %"eif_path_name.h%""
		end

	eif_extracted_paths (s: POINTER): ARRAY [STRING] is
		external
			"C signature (EIF_CHARACTER *): EIF_REFERENCE use %"eif_path_name.h%""
		end

	c_strlen (ptr: POINTER): INTEGER is
		external
			"C signature (char *): EIF_INTEGER use <string.h>"
		alias
			"strlen"
		end

end
