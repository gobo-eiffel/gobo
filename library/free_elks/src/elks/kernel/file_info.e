note
	description: "Internal file information"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class FILE_INFO inherit

	TO_SPECIAL [NATURAL_8]
		rename
			area as buffered_file_info,
			make_empty_area as make_buffered_file_info
		redefine
			copy, is_equal
		end

	NATIVE_STRING_HANDLER
		redefine
			copy, is_equal
		end

create
	make

convert
	to_unix_file_info: {UNIX_FILE_INFO}

feature {NONE} -- Initialization

	make
			-- Creation procedure
		do
			make_filled_area (0, stat_size)
			is_following_symlinks := True
			exists := False
		ensure
			not_exists: not exists
			is_following_symlinks_set: is_following_symlinks
		end

feature -- Access

	protection: INTEGER
			-- Protection mode of file (12 lower bits)
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 0)
		end

	type: INTEGER
			-- File type (4 bits, 12 lowest bits zeroed)
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 11)
		end

	inode: INTEGER
			-- Inode number
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 1)
		end

	size: INTEGER
			-- File size, in bytes
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 6)
		end

	user_id: INTEGER
			-- UID of the file owner
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 4)
		end

	group_id: INTEGER
			-- GID of the file
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 5)
		end

	date: INTEGER
			-- Last modification date
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 7)
		end

	access_date: INTEGER
			-- Date of last access
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 8)
		end

	change_date: INTEGER
			-- Date of last status change
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 9)
		end

	device: INTEGER
			-- Device number on which inode resides
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 2)
		end

	device_type: INTEGER
			-- Device type on which inode resides
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 3)
		end

	links: INTEGER
			-- Number of links
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 10)
		end

	owner_name: STRING
			-- Name of the file owner, if available from /etc/passwd.
			-- Otherwise, the UID
		require
			exists: exists
		do
			Result := file_owner (user_id)
		end

	group_name: STRING
			-- Name of the file group, if available from /etc/group.
			-- Otherwise, the GID
		require
			exists: exists
		do
			Result := file_group (group_id)
		end

	file_name: detachable STRING
			-- File name as a STRING_8 instance. The value might be truncated
			-- from the original name used to create the current FILE instance.
		obsolete
			"Use `file_entry' to ensure that filenames are not truncated. [2017-05-31]"
		do
			if attached internal_file_name as l_name then
				Result := l_name.as_string_8
			end
		end

	file_entry: detachable PATH
			-- Associated entry for Current.
		do
			if attached internal_name_pointer as l_ptr then
				create Result.make_from_pointer (l_ptr.item)
			end
		end

feature {NATIVE_STRING_HANDLER} -- Access

	file_name_to_pointer (a_name: READABLE_STRING_GENERAL; a_ptr: detachable MANAGED_POINTER): MANAGED_POINTER
			-- File system specific encoding of `a_name' that will be stored in `a_ptr' if provided
			-- otherwise a new instance is created.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.
		require
			a_name_not_empty: not a_name.is_empty
		local
			u: UTF_CONVERTER
			l_c_string: C_STRING
		do
			Result := a_ptr
			if {PLATFORM}.is_windows then
					-- We generate a UTF-16 encoding of the filename
				if attached {READABLE_STRING_32} a_name then
					if attached Result then
						Result.resize ((a_name.count + 1) * 2)
					else
						create Result.make ((a_name.count + 1) * 2)
					end
					u.escaped_utf_32_substring_into_utf_16_0_pointer (a_name, 1, a_name.count, Result, 0, Void)
				else
						-- Our Windows API only handles Unicode characters, no encoding, so
						-- we are going to convert `a_name' from the local code page encoding
						-- to Unicode and then use the resulting pointer for `a_ptr'.
					create l_c_string.make (a_name)
					if attached Result then
						Result.resize (multi_byte_to_utf_16 (l_c_string.item, default_pointer, 0))
					else
						create Result.make (multi_byte_to_utf_16 (l_c_string.item, default_pointer, 0))
					end
					multi_byte_to_utf_16 (l_c_string.item, Result.item, Result.count).do_nothing
				end
			else
				if attached Result then
					Result.resize (a_name.count + 1)
				else
					create Result.make (a_name.count + 1)
				end
				if attached {READABLE_STRING_32} a_name then
						-- We generate a UTF-8 encoding of the filename
					u.escaped_utf_32_substring_into_utf_8_0_pointer (a_name, 1, a_name.count, Result, 0, Void)
				else
						-- We leave the sequence as is.
					;(create {C_STRING}.make_shared_from_pointer_and_count (Result.item, a_name.count)).set_string (a_name)
				end
			end
		end

	pointer_to_file_name_32 (a_ptr: POINTER): STRING_32
			-- Given a file system name represented by `a_ptr' provides a STRING_32 instance which
			-- could be escaped when underlying encoding is not valid.
		local
			u: UTF_CONVERTER
			l_managed: MANAGED_POINTER
		do
			create l_managed.share_from_pointer (a_ptr, pointer_length_in_bytes (a_ptr))
			if {PLATFORM}.is_windows then
				Result := u.utf_16_0_pointer_to_escaped_string_32 (l_managed)
			else
				Result := u.utf_8_0_pointer_to_escaped_string_32 (l_managed)
			end
		end

	pointer_to_file_name_8 (a_ptr: POINTER): STRING_8
			-- Given a file system name represented by `a_ptr' provides a STRING_8 instance.
			-- This is used for backward compatibility for APIs using STRING_8.
		local
			l_cstring: C_STRING
			l_count: INTEGER
		do
			if {PLATFORM}.is_windows then
					-- On Windows we will convert our Unicode path to a localized version that
					-- fits into a STRING_8.
				l_count := utf_16_to_multi_byte (a_ptr, default_pointer, 0)
				create l_cstring.make_empty (l_count)
				l_count := utf_16_to_multi_byte (a_ptr, l_cstring.item, l_count)
					-- We do -1 since we simply do not count the null terminating character to build our string.
				Result := l_cstring.substring_8 (1, l_count - 1)
			else
					-- On Unix we do not even try to interpret the path, we just give it as is.
				create l_cstring.make_shared_from_pointer (a_ptr)
				Result := l_cstring.string_8
			end
		end



feature -- Status report

	exists: BOOLEAN
			-- Does current file exists?

	is_following_symlinks: BOOLEAN
			-- Does current follow symbolic links when retrieving properties?

	is_ready: BOOLEAN
			-- Is current ready to perform a query?
		do
			Result := internal_file_name /= Void
		end

	is_plain: BOOLEAN
			-- Is file a plain file?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 13) /= 0
		end

	is_device: BOOLEAN
			-- Is file a device?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 14) /= 0
		end

	is_directory: BOOLEAN
			-- Is file a directory?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 12) /= 0
		end

	is_symlink: BOOLEAN
			-- Is file a symbolic link?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 18) /= 0
		end

	is_fifo: BOOLEAN
			-- Is file a named pipe?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 17) /= 0
		end

	is_socket: BOOLEAN
			-- Is file a named socket?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 19) /= 0
		end

	is_block: BOOLEAN
			-- Is file a device block special file?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 16) /= 0
		end

	is_character: BOOLEAN
			-- Is file a character block special file?
		require
			exists: exists
		do
			Result := file_info ($buffered_file_info, 15) /= 0
		end

	is_readable: BOOLEAN
			-- Is file readable by effective UID?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 0)
		end

	is_writable: BOOLEAN
			-- Is file writable by effective UID?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 1)
		end

	is_executable: BOOLEAN
			-- Is file executable by effective UID?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 2)
		end

	is_setuid: BOOLEAN
			-- Is file setuid?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 3)
		end

	is_setgid: BOOLEAN
			-- Is file setgid?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 4)
		end

	is_sticky: BOOLEAN
			-- Is file sticky?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 5)
		end

	is_owner: BOOLEAN
			-- Is file owned by effective UID?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 6)
		end

	is_access_owner: BOOLEAN
			-- Is file owned by real UID?
		require
			exists: exists
		do
			Result := file_eaccess ($buffered_file_info, 7)
		end

	is_access_readable: BOOLEAN
			-- Is file readable by real UID?
		require
			is_ready: is_ready
		do
			if attached internal_name_pointer as l_ptr then
				Result := file_access (l_ptr.item, 3)
			end
		end

	is_access_writable: BOOLEAN
			-- Is file writable by real UID?
		require
			is_ready: is_ready
		do
			if attached internal_name_pointer as l_ptr then
				Result := file_access (l_ptr.item, 2)
			end
		end

	is_access_executable: BOOLEAN
			-- Is file executable by real UID?
		require
			is_ready: is_ready
		do
			if attached internal_name_pointer as l_ptr then
				Result := file_access (l_ptr.item, 1)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- <Precursor>
		do
			if other = Current then
				Result := True
			elseif attached internal_file_name as l_file_name and attached other.internal_file_name as l_other_file_name then
				Result := l_file_name.same_string (l_other_file_name) and is_following_symlinks = other.is_following_symlinks
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- <Precursor>
		do
			if other /= Current then
				standard_copy (other)
				set_area (other.buffered_file_info.twin)
				if attached other.internal_name_pointer as l_pointer then
					internal_name_pointer := l_pointer.twin
				end
				if attached other.internal_file_name as l_file_name then
					internal_file_name := l_file_name.twin
				end
			end
		ensure then
			not_shared_if_different: other /= Current implies buffered_file_info /= other.buffered_file_info
			equal_buffered_file_infos: buffered_file_info ~ other.buffered_file_info
		end

feature -- Conversion

	to_unix_file_info: UNIX_FILE_INFO
			-- Convert current to old format UNIX_FILE_INFO for backward compatibility.
		obsolete
			"Use `FILE_INFO' as type instead of `UNIX_FILE_INFO'. [2017-05-31]"
		do
			create Result.make
			if attached internal_file_name as l_name then
				Result.update (l_name)
			end
		end

feature -- Element change

	update (f_name: READABLE_STRING_GENERAL)
			-- Update information buffer: fill it in with information
			-- from the inode of `f_name'.
		require
			f_name_not_empty: not f_name.is_empty
		do
			fast_update (f_name, file_name_to_pointer (f_name, internal_name_pointer))
		end

	set_is_following_symlinks (v: BOOLEAN)
			-- Should `update' follow symlinks or not?
		do
			is_following_symlinks := v
		ensure
			is_following_symlinks_set: is_following_symlinks = v
		end

feature {FILE, DIRECTORY} -- Element change

	fast_update (f_name: READABLE_STRING_GENERAL; a_ptr: MANAGED_POINTER)
			-- Update information buffer: fill it in with information
			-- from the inode of `f_name'.
		require
			f_name_not_empty: not f_name.is_empty
			a_ptr_not_empty: a_ptr.count > 0
		do
				-- Do not duplicate the file name. That way, if the file is
				-- renamed, the name here will change accordingly and access()
				-- based calls will continue to work properly.	
			internal_file_name := f_name
			internal_name_pointer := a_ptr
			exists := eif_file_stat (a_ptr.item, $buffered_file_info, is_following_symlinks) = 0
		ensure
			file_name_set: internal_file_name = f_name
		end

feature {FILE_INFO} -- Access

	internal_file_name: detachable READABLE_STRING_GENERAL
			-- Store the name of the file as it was given to us by the user

	internal_name_pointer: detachable MANAGED_POINTER
			-- File system specific encoding of `internal_file_name'.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.
			-- to avoid conversion on storing as it is not necessary.

feature {NONE} -- Implementation

	stat_size: INTEGER
			-- Get size of 'rt_stat_buf' (in bytes)
		external
			"C use %"eif_file.h%""
		end

	eif_file_stat (fname, stat_buf: POINTER; follow_symlinks: BOOLEAN): INTEGER
			-- Get information from file `name' into `stat_buf'
		external
			"C signature (EIF_FILENAME, rt_stat_buf *, int): EIF_INTEGER use %"eif_file.h%""
		end

	file_access (fname: POINTER; which: INTEGER): BOOLEAN
			-- Perform access test `which' on `f_name' using real ID.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_access"
		end

	file_eaccess (stat_buf: POINTER; which: INTEGER): BOOLEAN
			-- Perform access tests using effective ID.
		external
			"C signature (rt_stat_buf *, int): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_eaccess"
		end

	file_info (stat_buf: POINTER; which: INTEGER): INTEGER
			-- Extract information `which' from information buffer
		external
			"C signature (rt_stat_buf *, int): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_info"
		end

	file_owner (uid: INTEGER): STRING
			-- Convert UID to login name if possible
		external
			"C signature (int): EIF_REFERENCE use %"eif_file.h%""
		alias
			"eif_file_owner"
		end

	file_group (gid: INTEGER): STRING
			-- Convert GID to group name if possible
		external
			"C signature (int): EIF_REFERENCE use %"eif_file.h%""
		alias
			"eif_file_group"
		end

	multi_byte_to_utf_16 (a_ptr, a_output: POINTER; a_output_length: INTEGER): INTEGER
			-- Given a 8-bit string `a_ptr', fill `a_output' of length `a_output_length' with the UTF-16
			-- encoding of `a_ptr' but only if `a_output' is not the default_pointer, otherwise it returns
			-- the number of expected bytes to fill `a_output' including the null-terminating character.
		require
			{PLATFORM}.is_windows
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"{
			#ifdef EIF_WINDOWS
				return (EIF_INTEGER) MultiByteToWideChar(CP_ACP, 0, (LPSTR) $a_ptr, -1, (LPWSTR) $a_output, (int) $a_output_length) * sizeof(wchar_t);
			#else
				return $a_output_length;
			#endif
			}"
		end

	utf_16_to_multi_byte (a_ptr: POINTER; a_output: POINTER; a_output_length: INTEGER): INTEGER
			-- Given a 16-bit string `a_ptr' encoded in UTF-16, fill `a_output' of length `a_output_length' with the
			-- 8-bit encoding of `a_ptr' but only if `a_output' is not the default_pointer, otherwise it returns
			-- the number of expected bytes to fill `a_output' including the null-terminated character.
		require
			{PLATFORM}.is_windows
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"{
			#ifdef EIF_WINDOWS
				return (EIF_INTEGER) WideCharToMultiByte(CP_ACP, 0, (LPCWSTR) $a_ptr, -1, (LPSTR) $a_output, (int) $a_output_length, NULL, NULL);
			#else
				return $a_output_length;
			#endif
			}"
		end

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
