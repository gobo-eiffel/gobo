indexing
	description: "Internal file information"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UNIX_FILE_INFO inherit

	TO_SPECIAL [CHARACTER]
		rename
			area as buffered_file_info,
			make_area as make_buffered_file_info
		end

create

	make

feature -- Initialization

	make is
			-- Creation procedure
		do
			make_buffered_file_info (stat_size)
		end

feature -- Access

	protection: INTEGER is
			-- Protection mode of file (12 lower bits)
		do
			Result := file_info ($buffered_file_info, 0)
		end

	type: INTEGER is
			-- File type (4 bits, 12 lowest bits zeroed)
		do
			Result := file_info ($buffered_file_info, 11)
		end

	inode: INTEGER is
			-- Inode number
		do
			Result := file_info ($buffered_file_info, 1)
		end

	size: INTEGER is
			-- File size, in bytes
		do
			Result := file_info ($buffered_file_info, 6)
		end

	user_id: INTEGER is
			-- UID of the file owner
		do
			Result := file_info ($buffered_file_info, 4)
		end

	group_id: INTEGER is
			-- GID of the file
		do
			Result := file_info ($buffered_file_info, 5)
		end

	date: INTEGER is
			-- Last modification date
		do
			Result := file_info ($buffered_file_info, 7)
		end

	access_date: INTEGER is
			-- Date of last access
		do
			Result := file_info ($buffered_file_info, 8)
		end

	change_date: INTEGER is
			-- Date of last status change
		do
			Result := file_info ($buffered_file_info, 9)
		end

	device: INTEGER is
			-- Device number on which inode resides
		do
			Result := file_info ($buffered_file_info, 2)
		end

	device_type: INTEGER is
			-- Device type on which inode resides
		do
			Result := file_info ($buffered_file_info, 3)
		end

	links: INTEGER is
			-- Number of links
		do
			Result := file_info ($buffered_file_info, 10)
		end

	owner_name: STRING is
			-- Name of the file owner, if available from /etc/passwd.
			-- Otherwise, the UID
		do
			Result := file_owner (user_id)
		end

	group_name: STRING is
			-- Name of the file group, if available from /etc/group.
			-- Otherwise, the GID
		do
			Result := file_group (group_id)
		end

	file_name: ?STRING
			-- File name to which information applies

feature -- Status report

	is_plain: BOOLEAN is
			-- Is file a plain file?
		do
			Result := file_info ($buffered_file_info, 13) /= 0
		end

	is_device: BOOLEAN is
			-- Is file a device?
		do
			Result := file_info ($buffered_file_info, 14) /= 0
		end

	is_directory: BOOLEAN is
			-- Is file a directory?
		do
			Result := file_info ($buffered_file_info, 12) /= 0
		end

	is_symlink: BOOLEAN is
			-- Is file a symbolic link?
		do
			Result := file_info ($buffered_file_info, 18) /= 0
		end

	is_fifo: BOOLEAN is
			-- Is file a named pipe?
		do
			Result := file_info ($buffered_file_info, 17) /= 0
		end

	is_socket: BOOLEAN is
			-- Is file a named socket?
		do
			Result := file_info ($buffered_file_info, 19) /= 0
		end

	is_block: BOOLEAN is
			-- Is file a device block special file?
		do
			Result := file_info ($buffered_file_info, 16) /= 0
		end

	is_character: BOOLEAN is
			-- Is file a character block special file?
		do
			Result := file_info ($buffered_file_info, 15) /= 0
		end

	is_readable: BOOLEAN is
			-- Is file readable by effective UID?
		do
			Result := file_eaccess ($buffered_file_info, 0)
		end

	is_writable: BOOLEAN is
			-- Is file writable by effective UID?
		do
			Result := file_eaccess ($buffered_file_info, 1)
		end

	is_executable: BOOLEAN is
			-- Is file executable by effective UID?
		do
			Result := file_eaccess ($buffered_file_info, 2)
		end

	is_setuid: BOOLEAN is
			-- Is file setuid?
		do
			Result := file_eaccess ($buffered_file_info, 3)
		end

	is_setgid: BOOLEAN is
			-- Is file setgid?
		do
			Result := file_eaccess ($buffered_file_info, 4)
		end

	is_sticky: BOOLEAN is
			-- Is file sticky?
		do
			Result := file_eaccess ($buffered_file_info, 5)
		end

	is_owner: BOOLEAN is
			-- Is file owned by effective UID?
		do
			Result := file_eaccess ($buffered_file_info, 6)
		end

	is_access_owner: BOOLEAN is
			-- Is file owned by real UID?
		do
			Result := file_eaccess ($buffered_file_info, 7)
		end

	is_access_readable: BOOLEAN is
			-- Is file readable by real UID?
		require
			file_name_attached: file_name /= Void
		local
			ext_name: ANY
			f: ?STRING
		do
			f := file_name
			if f /= Void then
				ext_name := f.to_c
				Result := file_access ($ext_name, 3)
			end
		end

	is_access_writable: BOOLEAN is
			-- Is file writable by real UID?
		require
			file_name_attached: file_name /= Void
		local
			ext_name: ANY
			f: ?STRING
		do
			f := file_name
			if f /= Void then
				ext_name := f.to_c
				Result := file_access ($ext_name, 2)
			end
		end

	is_access_executable: BOOLEAN is
			-- Is file executable by real UID?
		require
			file_name_attached: file_name /= Void
		local
			ext_name: ANY
			f: ?STRING
		do
			f := file_name
			if f /= Void then
				ext_name := f.to_c
				Result := file_access ($ext_name, 1)
			end
		end

feature -- Element change

	update (f_name: STRING) is
			-- Update information buffer: fill it in with information
			-- from the inode of `f_name'.
		local
			ext_name: ANY
		do
			ext_name := f_name.to_c
			file_stat ($ext_name, $buffered_file_info)
				-- Do not duplicate the file name. That way, if the file is
				-- renamed, the name here will change accordingly and access()
				-- based calls will continue to work properly.
			file_name := f_name
		end

feature {NONE} -- Implementation

	stat_size: INTEGER is
			-- Get size of 'struct stat' (in bytes)
		external
			"C use %"eif_file.h%""
		end

	file_stat (name, stat_buf: POINTER) is
			-- Get information from file `name' into `stat_buf'
		external
			"C signature (char *, struct stat *) use %"eif_file.h%""
		end

	file_access (f_name: POINTER; which: INTEGER): BOOLEAN is
			-- Perform access test `which' on `f_name' using real ID.
		external
			"C signature (char *, EIF_INTEGER): EIF_BOOLEAN use %"eif_file.h%""
		end

	file_eaccess (stat_buf: POINTER; which: INTEGER): BOOLEAN is
			-- Perform access tests using effective ID.
		external
			"C signature (struct stat *, int): EIF_BOOLEAN use %"eif_file.h%""
		end

	file_info (stat_buf: POINTER; which: INTEGER): INTEGER is
			-- Extract information `which' from information buffer
		external
			"C signature (struct stat *, int): EIF_INTEGER use %"eif_file.h%""
		end

	file_owner (uid: INTEGER): STRING is
			-- Convert UID to login name if possible
		external
			"C signature (int): EIF_REFERENCE use %"eif_file.h%""
		end

	file_group (gid: INTEGER): STRING is
			-- Convert GID to group name if possible
		external
			"C signature (int): EIF_REFERENCE use %"eif_file.h%""
		end

end
