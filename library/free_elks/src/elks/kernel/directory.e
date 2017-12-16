note
	description: "Directories, in the Unix sense, with creation and exploration features"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2015-08-03 17:18:55 -0700 (Mon, 03 Aug 2015) $"
	revision: "$Revision: 97763 $"

class DIRECTORY

inherit
	DISPOSABLE

	NATIVE_STRING_HANDLER

create
	make, make_with_path, make_with_name,
	make_open_read

feature -- Initialization

	make (dn: READABLE_STRING_GENERAL)
			-- Create directory object for directory
			-- of name `dn'.
		require
			string_exists: dn /= Void
		do
			make_with_name (dn)
		ensure
			name_set: internal_name = dn
		end

	make_with_name (dn: READABLE_STRING_GENERAL)
			-- Create directory object for directory
			-- of name `dn'.
		require
			string_exists: dn /= Void
		do
			set_name (dn)
			mode := Close_directory
		ensure
			name_set: internal_name = dn
		end

	make_with_path (a_path: PATH)
			-- Create file object with `a_path' as path.
		require
			a_path_attached: a_path /= Void
		do
			make (a_path.name)
		end

	make_open_read (dn: READABLE_STRING_GENERAL)
			-- Create directory object for directory
			-- of name `dn' and open it for reading.
		require
			string_exists: dn /= Void
		do
			make (dn)
			open_read
		ensure
			name_set: internal_name = dn
		end

feature -- Creation

	create_dir
			-- Create a physical directory.
		require
			physical_not_exists: not exists
		do
			file_mkdir (internal_name_pointer.item)
		end

	recursive_create_dir
			-- Create the directory recursively.
			--
			-- Ex: if /temp/ exists but not /temp/test, then trying
			--  to create /temp/test/toto will create /temp/test
			--  and then /temp/test/toto.
		local
			l_directory: DIRECTORY
			l_directories_to_build: ARRAYED_LIST [PATH]
			l_path: PATH
			l_entry: detachable PATH
			l_io_exception: IO_FAILURE
		do
				-- First ensure the path is fully resolved.
			l_path := path.canonical_path
			create l_directory.make_with_path (l_path)
			if not l_directory.exists then
					-- Directory does not exist, we need to create it.
					-- Find the first existing directory in `l_path'
				from
					create l_directories_to_build.make (10)
					l_entry := l_path.entry
				until
					l_directory.exists or l_entry = Void
				loop
					l_directories_to_build.extend (l_path)
					l_path := l_path.parent
					l_entry := l_path.entry
					l_directory.make_with_path (l_path)
				end

					-- Recursively create the directory.
				from
					l_directories_to_build.finish
				until
					l_directories_to_build.before
				loop
					l_path := l_directories_to_build.item
					l_directories_to_build.back

					l_directory.make_with_path (l_path)
					l_directory.create_dir
					if not l_directory.exists then
						create l_io_exception
						l_io_exception.set_description ({STRING_32} "Cannot create: " + l_path.name)
						l_io_exception.raise
					end
				end
			end
		ensure
			physical_exists: exists
		end

feature -- Access

	path: PATH
			-- Associated path of Current.
		do
			create Result.make_from_pointer (internal_name_pointer.item)
		ensure
			entry_not_empty: not Result.is_empty
		end

	readentry
			-- Read next directory entry
			-- make result available in `lastentry'.
			-- Make result Void if all entries have been read.
		require
			is_opened: not is_closed
		do
			last_entry_pointer := eif_dir_next (directory_pointer)
			if last_entry_pointer = default_pointer then
					-- We reached the end of our iteration.
				lastentry := Void
			else
					-- For backward compatibility, we had to leave `lastentry' as an attribute
					-- which is being updated at each `readentry' call.
				lastentry := file_info.pointer_to_file_name_8 (last_entry_pointer)
			end
		end

	name: STRING_8
			-- File name as a STRING_8 instance. The value might be truncated
			-- from the original name used to create the current FILE instance.
		obsolete
			"Use `path' to ensure you can retrieve all kind of names. [2017-05-31]"
		do
			Result := internal_name.as_string_8
		ensure then
			name_not_empty: not Result.is_empty
		end

	has_entry (entry_name: READABLE_STRING_GENERAL): BOOLEAN
			-- Has directory the entry `entry_name'?
			--| The use of `dir_temp' is required not
			--| to change the position in the current
			--| directory entries list.
		require
			string_exists: entry_name /= Void
		local
			dir_temp: DIRECTORY
			e: like last_entry_pointer
		do
			create dir_temp.make_open_read (internal_name)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			until
				Result or e = default_pointer
			loop
				if attached {READABLE_STRING_8} entry_name then
						-- We were given a STRING_8 instance, we lookup the name using the old way
					Result := entry_name.same_string (file_info.pointer_to_file_name_8 (e))
				elseif attached file_info.pointer_to_file_name_32 (e) as l_str then
					Result := entry_name.same_string (l_str)
				end
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			end
			dir_temp.close
		end

	open_read
			-- Open directory for reading.
		do
			directory_pointer := dir_open (internal_name_pointer.item)
			mode := Read_directory
		end

	close
			-- Close directory.
		require
			is_open: not is_closed
		do
			dir_close (directory_pointer)
			directory_pointer := default_pointer
			mode := Close_directory
		end

	start
			-- Go to first entry of directory.
		require
			is_opened: not is_closed
		do
			directory_pointer := dir_rewind (directory_pointer, internal_name_pointer.item)
		end

	change_name (new_name: READABLE_STRING_GENERAL)
			-- Change directory name to `new_name'.
		require
			new_name_not_void: new_name /= Void
			directory_exists: exists
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := file_info.file_name_to_pointer (new_name, Void)
			eif_dir_rename (internal_name_pointer.item, l_ptr.item)
			set_name (new_name)
		ensure
			name_changed: internal_name = new_name
		end

	rename_path (new_name: PATH)
			-- Change directory name to `new_name'.
		require
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
			file_exists: exists
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := new_name.to_pointer
			eif_dir_rename (internal_name_pointer.item, l_ptr.item)
			set_name (new_name.name)
		ensure
			name_changed: internal_name = new_name.name
		end

feature -- Measurement

	count: INTEGER
			-- Number of entries in directory.
		require
			directory_exists: exists
		local
			dir_temp: DIRECTORY
		do
			create dir_temp.make_open_read (internal_name)
			from
				dir_temp.start
				dir_temp.readentry
			until
				dir_temp.last_entry_pointer = default_pointer
			loop
				Result := Result + 1
				dir_temp.readentry
			end
			dir_temp.close
		end

feature -- Conversion

	entries: ARRAYED_LIST [PATH]
			-- Entries (i.e. just the file or directory name) of current directory,
			-- in sequential format, in a platform specific order.
		local
			dir_temp: DIRECTORY
			e: like last_entry_pointer
		do
			create dir_temp.make_open_read (internal_name)
				-- Arbitrary size for arrayed_list creation to avoid
				-- querying `count' which traverses list of entries
				-- in current directory as we do here, making current
				-- less efficient if Current has a lot of entries.
			create Result.make (16)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			until
				e = default_pointer
			loop
				Result.extend (create {PATH}.make_from_pointer (e))
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			end
			dir_temp.close
		end

	resolved_entries: ARRAYED_LIST [PATH]
			-- Entries of current directory resolved in the context of current directory (i.e. the path
			-- of the current directory appended with the entry) in sequential format, in a platform specific
			-- order.
			-- Compared to `entries', it removes the need for callers to build the full path of the entry
			-- using `Current'.
		local
			dir_temp: DIRECTORY
			e: like last_entry_pointer
			l_path: like path
		do
			create dir_temp.make_open_read (internal_name)
				-- Arbitrary size for arrayed_list creation to avoid
				-- querying `count' which traverses list of entries
				-- in current directory as we do here, making current
				-- less efficient if Current has a lot of entries.
			create Result.make (16)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
				l_path := path
			until
				e = default_pointer
			loop
				Result.extend (l_path.extended_path (create {PATH}.make_from_pointer (e)))
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			end
			dir_temp.close
		end

	linear_representation: ARRAYED_LIST [STRING_8]
			-- The entries, in sequential format.
			-- Use `entries' or `linear_representation_32' to get a readable version
			-- of the Unicode entries.
		obsolete
			"Use `entries' instead if your application is using Unicode file names. [2017-05-31]"
		local
			dir_temp: DIRECTORY
			e: like last_entry_pointer
		do
			create dir_temp.make_open_read (internal_name)
				-- Arbitrary size for arrayed_list creation to avoid
				-- querying `count' which traverses list of entries
				-- in current directory as we do here, making current
				-- less efficient if Current has a lot of entries.
			create Result.make (16)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			until
				e = default_pointer
			loop
				Result.extend (file_info.pointer_to_file_name_8 (e))
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			end
			dir_temp.close
		end

	linear_representation_32: ARRAYED_LIST [STRING_32]
			-- The entries, in sequential format.
		local
			dir_temp: DIRECTORY
			e: like last_entry_pointer
			l_path: PATH
		do
			create dir_temp.make_open_read (internal_name)
				-- Arbitrary size for arrayed_list creation to avoid
				-- querying `count' which traverses list of entries
				-- in current directory as we do here, making current
				-- less efficient if Current has a lot of entries.
			create Result.make (16)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			until
				e = default_pointer
			loop
				create l_path.make_from_pointer (e)
				Result.extend (create {STRING_32}.make_from_string (l_path.name))
				dir_temp.readentry
				e := dir_temp.last_entry_pointer
			end
			dir_temp.close
		end

feature -- Status report

	last_entry_32: detachable STRING_32
			-- Last Unicode entry read by `readentry' if any.
		do
			if last_entry_pointer /= default_pointer then
				Result := file_info.pointer_to_file_name_32 (last_entry_pointer)
			end
		end

	last_entry_8: detachable STRING_8
			-- Raw byte sequence of the last found entry if this entry cannot be
			-- expressed with Unicode characters. This is useful
			-- when handling a file that is not a valid UTF-8 sequence on Unix.
		do
			if last_entry_pointer /= default_pointer then
				Result := file_info.pointer_to_file_name_8 (last_entry_pointer)
			end
		end

	lastentry: detachable STRING_8
			-- Last entry read by `readentry'.
		obsolete
			"Use `last_entry_32' for Unicode file names, or `last_entry_8' otherwise. [2017-05-31]"
		attribute
		end

	is_closed: BOOLEAN
			-- Is current directory closed?
		do
			Result := mode = Close_directory
		end

	is_empty: BOOLEAN
			-- Is directory empty?
		require
			directory_exists: exists
		do
				-- count = 2, since there are "." and ".." which
				-- are symbolic representations but not effective directories.
			Result := count = 2
		end

	exists: BOOLEAN
			-- Does the directory exist?
		do
			Result := eif_dir_exists (internal_name_pointer.item)
		end

	is_readable: BOOLEAN
			-- Is the directory readable?
		require
			directory_exists: exists
		do
			Result := eif_dir_is_readable (internal_name_pointer.item)
		end

	is_executable: BOOLEAN
			-- Is the directory executable?
		require
			directory_exists: exists
		do
			Result := eif_dir_is_executable (internal_name_pointer.item)
		end

	is_writable: BOOLEAN
			-- Is the directory writable?
		require
			directory_exists: exists
		do
			Result := eif_dir_is_writable (internal_name_pointer.item)
		end

feature -- Removal

	delete
			-- Delete directory if empty.
		require
			directory_exists: exists
			empty_directory: is_empty
		do
			eif_dir_delete (internal_name_pointer.item)
		end

	delete_content
			-- Delete all files located in current directory and its
			-- subdirectories.
		require
			directory_exists: exists
		do
			delete_content_with_action (Void, Void, 0)
		end

	recursive_delete
			-- Delete directory, its files and its subdirectories.
		require
			directory_exists: exists
		do
			delete_content
			if is_empty then
				delete
			end
		end

	delete_content_with_action (
			action: detachable PROCEDURE [LIST [READABLE_STRING_GENERAL]]
			is_cancel_requested: detachable FUNCTION [BOOLEAN]
			file_number: INTEGER)
			-- Delete all files located in current directory and its
			-- subdirectories.
			--
			-- `action' is called each time at most `file_number' files has
			-- been deleted and before the function exits. If `a_file_number'
			-- is non-positive, `action' is not called.
			-- `action' may be set to Void if you don't need it.
			--
			-- Same for `is_cancel_requested'.
			-- Make it return `True' to cancel the operation.
			-- `is_cancel_requested' may be set to Void if you don't need it.
		require
			directory_exists: exists
			valid_file_number: file_number >= 0
		local
			l_file_name: PATH
			file: RAW_FILE
			l_info: like file_info
			dir: DIRECTORY
			dir_temp: DIRECTORY
			l_last_entry_pointer: like last_entry_pointer
			l_name: READABLE_STRING_32
			file_count: INTEGER
			deleted_files: ARRAYED_LIST [READABLE_STRING_32]
			requested_cancel: BOOLEAN
		do
				-- We limit `file_number' to something reasonable.
			create deleted_files.make (file_number.min (1024))

			from
					-- To delete files we do not need to follow symbolic links.
				l_info := file_info
				l_info.set_is_following_symlinks (False)
					-- Create a new directory that we will use to list all of its content.
				create dir_temp.make_open_read (internal_name)
				dir_temp.start
				dir_temp.readentry
				l_last_entry_pointer := dir_temp.last_entry_pointer
			until
				l_last_entry_pointer = default_pointer or requested_cancel
			loop
					-- Ignore current and parent directories.
				l_name := l_info.pointer_to_file_name_32 (l_last_entry_pointer)
				if not l_name.same_string_general (current_directory_string) and not l_name.same_string_general (parent_directory_string) then
						-- Avoid creating too many objects.
					l_file_name := path.extended (l_name)
					l_info.update (l_file_name.name)
					if l_info.exists then
						if not l_info.is_symlink and then l_info.is_directory then
								-- Start the recursion for true directory, we do not follow links to delete their content.
							if dir /= Void then
								dir.make_with_path (l_file_name)
							else
								create dir.make_with_path (l_file_name)
							end
							dir.recursive_delete_with_action (action, is_cancel_requested, file_number)
								-- No need to call action again because it was called by the previous instruction.
						elseif l_info.is_writable then
							if file /= Void then
								file.reset_path (l_file_name)
							else
								create file.make_with_path (l_file_name)
							end
							file.delete
								-- Add the name of the deleted file to our array
								-- of deleted files.
							deleted_files.extend (l_file_name.name)
							file_count := file_count + 1
						end
							-- If `file_number' has been reached, call `action'.
						if file_number > 0 and file_count >= file_number then
							if action /= Void then
								action (deleted_files)
							end
							if is_cancel_requested /= Void then
								requested_cancel := is_cancel_requested (Void)
							end
							deleted_files.wipe_out
							file_count := 0
						end
					end
				end
				dir_temp.readentry
				l_last_entry_pointer := dir_temp.last_entry_pointer
			end
			dir_temp.close
				-- Process unprocessed deleted files (if any).
			if file_number > 0 and file_count > 0 and action /= Void then
				action (deleted_files)
			end
		rescue
			if dir_temp /= Void and then not dir_temp.is_closed then
				dir_temp.close
			end
		end

	recursive_delete_with_action (
			action: detachable PROCEDURE [LIST [READABLE_STRING_GENERAL]]
			is_cancel_requested: detachable FUNCTION [BOOLEAN]
			file_number: INTEGER)
			-- Delete directory, its files and its subdirectories.
			--
			-- `action' is called each time at most `file_number' files has
			-- been deleted and before the function exits. If `a_file_number'
			-- is non-positive, `action' is not called.
		require
			directory_exists: exists
		local
			deleted_files: ARRAYED_LIST [READABLE_STRING_GENERAL]
		do
			delete_content_with_action (action, is_cancel_requested, file_number)
			if attached is_cancel_requested implies not is_cancel_requested (Void) then
				delete
					-- Call the agent with the name of the directory.
				if file_number > 0 and action /= Void then
					create deleted_files.make (1)
					deleted_files.extend (internal_name)
					action (deleted_files)
				end
			end
		end

	dispose
			-- Ensure this medium is closed when garbage collected.
		do
			if not is_closed then
				close
			end
		end

feature {DIRECTORY} -- Implementation

	directory_pointer: POINTER
			-- Directory pointer as required in C

	last_entry_pointer: POINTER
			-- Pointer to the underlying C memory representing the last directory entry.

feature {NONE} -- Implementation

	set_name (a_name: READABLE_STRING_GENERAL)
			-- Set `name' with `a_name'.
		do
			internal_name := a_name
			internal_detachable_name_pointer := file_info.file_name_to_pointer (a_name, internal_detachable_name_pointer)
		ensure
			name_set: internal_name = a_name
		end

	internal_name: READABLE_STRING_GENERAL
			-- Store the name of the file as it was given to us by the user
			-- to avoid conversion on storing as it is not necessary.

	internal_name_pointer: MANAGED_POINTER
			-- File system specific encoding of `internal_name'.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.
		do
			if attached internal_detachable_name_pointer as l_ptr then
				Result := l_ptr
			else
					-- This is never True because `internal_detachable_name_pointer' is set during the creation
					-- of the FILE object.
				check internal_name_pointer_set: False then end
			end
		end

	internal_detachable_name_pointer: detachable MANAGED_POINTER note option: stable attribute end
			-- File system specific encoding of `internal_name'.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.

	mode: INTEGER
			-- Status mode of the directory.
			-- Possible values are the following:

	Close_directory: INTEGER = 1

	Read_directory: INTEGER = 2

	current_directory_string: STRING = "."
	parent_directory_string: STRING = ".."
			-- Constants to represent current (".") and parent ("..") directory.

	directory_separator_string: STRING
			-- Constant representing the directory separator
		once
			create Result.make (1)
			Result.append_character (operating_environment.directory_separator)
		end

	file_info: FILE_INFO
			-- To avoid creating objects when querying for files.
		once
			create Result.make
		end

	file_mkdir (dir_name: POINTER)
			-- Make directory `dir_name'.
		external
			"C signature (EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_mkdir"
		end

	dir_open (dir_name: POINTER): POINTER
			-- Open the directory `dir_name'.
		external
			"C signature (EIF_FILENAME): EIF_POINTER use %"eif_dir.h%""
		alias
			"eif_dir_open"
		end

	dir_rewind (dir_ptr: POINTER; dir_name: POINTER): POINTER
			-- Rewind the directory `dir_ptr' with name `a_name' and return a new directory traversal pointer.
		external
			"C signature (EIF_POINTER, EIF_FILENAME): EIF_POINTER use %"eif_dir.h%""
		alias
			"eif_dir_rewind"
		end

	dir_close (dir_ptr: POINTER)
			-- Close the directory `dir_ptr'.
		external
			"C use %"eif_dir.h%""
		alias
			"eif_dir_close"
		end

	eif_dir_next (dir_ptr: POINTER): POINTER
			-- Return pointer to the next entry in the current iteration.
		external
			"C use %"eif_dir.h%""
		end

	eif_dir_delete (dir_name: POINTER)
			-- Delete the directory `dir_name'.
		external
			"C signature (EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_unlink"
		end

	eif_dir_exists (dir_name: POINTER): BOOLEAN
			-- Does the directory `dir_name' exist?
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_readable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' readable?
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_executable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' executable?
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_writable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' writable?
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_rename (old_name, new_name: POINTER)
			-- Change directory name from `old_name' to `new_name'.
		external
			"C signature (EIF_FILENAME, EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_rename"
		end

invariant
	name_attached: attached internal_name

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
