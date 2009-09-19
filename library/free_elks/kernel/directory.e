note
	description: "Directories, in the Unix sense, with creation and exploration features"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DIRECTORY

inherit
	DISPOSABLE

create
	make, make_open_read

feature -- Initialization

	make (dn: STRING)
			-- Create directory object for directory
			-- of name `dn'.
		require
			string_exists: dn /= Void
		do
			name := dn
			mode := Close_directory
		end

	make_open_read (dn: STRING)
			-- Create directory object for directory
			-- of name `dn' and open it for reading.
		require
			string_exists: dn /= Void
		do
			make (dn)
			open_read
		end

	create_dir
			-- Create a physical directory.
		require
			physical_not_exists: not exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			file_mkdir ($external_name)
		end

	recursive_create_dir
			-- Create the directory `a_directory_name' recursively.
			--
			-- Ex: if /temp/ exists but not /temp/test, calling
			--     `recursive_create_directory ("/temp/test/toto")'
			--     will create /temp/test and then /temp/test/toto.
		require
			physical_not_exists: not exists
		local
			l_directory: DIRECTORY
			l_new_directory_name: DIRECTORY_NAME
			l_directories_to_build: ARRAYED_LIST [STRING]
			l_built_directory: STRING
			l_loc_directory_name: STRING
			l_separator_index: INTEGER
			l_io_exception: IO_FAILURE
		do
			create l_directories_to_build.make (10)

				-- Find the first existing directory in the path name
			from
				l_built_directory := name.twin
				l_separator_index := l_built_directory.count
				create l_directory.make (l_built_directory)
			until
				l_directory.exists
			loop
				l_separator_index := l_built_directory.last_index_of (Operating_environment.Directory_separator, l_built_directory.count)
				if l_separator_index = 0 then
					create l_io_exception
					l_io_exception.set_message ("Invalid directory: " + l_built_directory)
					l_io_exception.raise
				end
				l_directories_to_build.extend (l_built_directory.substring (l_separator_index + 1, l_built_directory.count))
				if l_built_directory @ (l_separator_index - 1) = ':' then
					l_loc_directory_name := l_built_directory.substring (1, l_separator_index)
				else
					l_loc_directory_name := l_built_directory.substring (1, l_separator_index - 1)
				end
				l_built_directory := l_built_directory.substring (1, l_separator_index - 1)
				create l_directory.make (l_loc_directory_name)
			end

				-- Recursively create the directory.
			from
				l_directories_to_build.finish
				create l_new_directory_name.make_from_string (l_built_directory)
			until
				l_directories_to_build.before
			loop
				l_new_directory_name.extend (l_directories_to_build.item)
				l_directories_to_build.back

				create l_directory.make (l_new_directory_name)
				l_directory.create_dir
				if not l_directory.exists then
					create l_io_exception
					l_io_exception.set_message ("Cannot create: " + l_new_directory_name)
					l_io_exception.raise
				end
			end
		ensure
			physical_exists: exists
		end

feature -- Access

	readentry
			-- Read next directory entry
			-- make result available in `lastentry'.
			-- Make result Void if all entries have been read.
		require
			is_opened: not is_closed
		do
			lastentry := dir_next (directory_pointer)
		end

	name: STRING
			-- Directory name

	has_entry (entry_name: STRING): BOOLEAN
			-- Has directory the entry `entry_name'?
			-- The use of `dir_temp' is required not
			-- to change the position in the current
			-- directory entries list.
		require
			string_exists: entry_name /= Void
		local
			dir_temp: DIRECTORY
			e: detachable STRING
		do
			create dir_temp.make_open_read (name)
			from
				dir_temp.readentry
				e := dir_temp.lastentry
			until
				Result or e = Void
			loop
				Result := e ~ entry_name
				dir_temp.readentry
				e := dir_temp.lastentry
			end
			dir_temp.close
		end

	open_read
			-- Open directory for reading.
		local
			external_name: ANY
		do
			external_name := name.to_c
			directory_pointer := dir_open ($external_name)
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
			dir_rewind (directory_pointer)
		end

	change_name (new_name: STRING)
			-- Change directory `name' to `new_name'.
		require
			new_name_not_void: new_name /= Void
			directory_exists: exists
		local
			ext_old_name, ext_new_name: ANY
		do
			ext_old_name := name.to_c
			ext_new_name := new_name.to_c
			eif_dir_rename ($ext_old_name, $ext_new_name)
			name := new_name
		ensure
			name_changed: name ~ new_name
		end

feature -- Measurement

	count: INTEGER
			-- Number of entries in directory.
		require
			directory_exists: exists
		local
			dir_temp: DIRECTORY
			counter: INTEGER
		do
			create dir_temp.make_open_read (name)
			from
				dir_temp.start
				dir_temp.readentry
			until
				dir_temp.lastentry = Void
			loop
				counter := counter + 1
				dir_temp.readentry
			end
			Result := counter
			dir_temp.close
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [STRING]
			-- The entries, in sequential format.
		local
			dir_temp: DIRECTORY
			e: detachable STRING
		do
			create dir_temp.make_open_read (name)
				-- Arbitrary size for arrayed_list creation to avoid
				-- querying `count' which traverses list of entries
				-- in current directory as we do here, making current
				-- less efficient if Current has a lot of entries.
			create Result.make (16)
			from
				dir_temp.start
				dir_temp.readentry
				e := dir_temp.lastentry
			until
				e = Void
			loop
				Result.extend (e)
				dir_temp.readentry
				e := dir_temp.lastentry
			end
			dir_temp.close
		end

feature -- Status report

	lastentry: detachable STRING
			-- Last entry read by `readentry'

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
			Result := (count = 2)
		end

	empty: BOOLEAN
			-- Is directory empty?
		obsolete
			"Use `is_empty' instead"
		do
			Result := is_empty
		end

	exists: BOOLEAN
			-- Does the directory exist?
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_exists ($external_name)
		end

	is_readable: BOOLEAN
			-- Is the directory readable?
		require
			directory_exists: exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_is_readable ($external_name)
		end

	is_executable: BOOLEAN
			-- Is the directory executable?
		require
			directory_exists: exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_is_executable ($external_name)
		end

	is_writable: BOOLEAN
			-- Is the directory writable?
		require
			directory_exists: exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_is_writable ($external_name)
		end

feature -- Removal

	delete
			-- Delete directory if empty.
		require
			directory_exists: exists
			empty_directory: is_empty
		local
			external_name: ANY
		do
			external_name := name.to_c
			eif_dir_delete ($external_name)
		end

	delete_content
			-- Delete all files located in directory and subdirectories.
		require
			directory_exists: exists
		local
			l: LINEAR [STRING]
			file_name: FILE_NAME
			file: RAW_FILE
			dir: DIRECTORY
		do
			l := linear_representation
			from
				l.start
			until
				l.after
			loop
				if
					not l.item.same_string (".") and
					not l.item.same_string ("..")
				then
					create file_name.make_from_string (name)
					file_name.set_file_name (l.item)
					create file.make (file_name)
					if
						file.exists and then
						not file.is_symlink and then
						file.is_directory
					then
							-- Start the recursion
						create dir.make (file_name)
						dir.recursive_delete
					else
						if file.exists and then file.is_writable then
							file.delete
						end
					end
				end
				l.forth
			end
		end

	recursive_delete
			-- Delete directory and all content contained within.
		require
			directory_exists: exists
		do
			delete_content
			if is_empty then
				delete
			end
		end

	delete_content_with_action (
			action: PROCEDURE [ANY, TUPLE]
			is_cancel_requested: FUNCTION [ANY, TUPLE, BOOLEAN]
			file_number: INTEGER)

			-- Delete all files located in directory and subdirectories.
			--
			-- `action' is called each time `file_number' files has
			-- been deleted and before the function exits.
			-- `action' may be set to Void if you don't need it.
			--
			-- Same for `is_cancel_requested'.
			-- Make it return `True' to cancel the operation.
			-- `is_cancel_requested' may be set to Void if you don't need it.
		require
			directory_exists: exists
			valid_file_number: file_number > 0
		local
			l: LINEAR [STRING]
			file_name: FILE_NAME
			file: RAW_FILE
			dir: DIRECTORY
			file_count: INTEGER
			deleted_files: ARRAYED_LIST [STRING]
			deleted_files_tuple: TUPLE [ARRAYED_LIST [STRING]]
			current_directory: STRING
			parent_directory: STRING
			requested_cancel: BOOLEAN
		do
			file_count := 1
			create deleted_files.make (file_number)
			create deleted_files_tuple

			l := linear_representation
			current_directory := "."
			parent_directory := ".."
			from
				l.start
			until
				l.after or requested_cancel
			loop
				if l.item /~ current_directory and l.item /~ parent_directory then
					create file_name.make_from_string (name)
					file_name.set_file_name (l.item)
					create file.make (file_name)
					if
						file.exists and then
						not file.is_symlink and then
						file.is_directory
					then
							-- Start the recursion
						create dir.make (file_name)
						dir.recursive_delete_with_action (action, is_cancel_requested, file_number)
					else
						if file.exists and then file.is_writable then
							file.delete
						end
					end
						-- Add the name of the deleted file to our array
						-- of deleted files.
					deleted_files.extend (file_name)
					file_count := file_count + 1

						-- If `file_number' has been reached, call `action'.
					if file_count > file_number then
						if action /= Void then
							deleted_files_tuple.put (deleted_files, 1)
							action.call (deleted_files_tuple)
						end
						if is_cancel_requested /= Void then
							requested_cancel := is_cancel_requested.item (Void)
						end
						deleted_files.wipe_out
						file_count := 1
					end
				end
				l.forth
			end
				-- If there is more than one deleted file and no
				-- agent has been called, call one now.
			if file_count > 1 then
				if action /= Void then
					deleted_files_tuple.put (deleted_files, 1)
					action.call (deleted_files_tuple)
				end
				deleted_files.wipe_out
				file_count := 1
			end
		end

	recursive_delete_with_action (
			action: PROCEDURE [ANY, TUPLE]
			is_cancel_requested: FUNCTION [ANY, TUPLE, BOOLEAN]
			file_number: INTEGER)

			-- Delete directory and all content contained within.
			--
			-- `action' is called each time `file_number' files has
			-- been deleted and before the function exits.
		require
			directory_exists: exists
		local
			deleted_files: ARRAYED_LIST [STRING]
		do
			delete_content_with_action (action, is_cancel_requested, file_number)
			if (is_cancel_requested = Void) or else (not is_cancel_requested.item (Void)) then
				delete

					-- Call the agent with the name of the directory
				if action /= Void then
					create deleted_files.make (1)
					deleted_files.extend (name)
					action.call ([deleted_files])
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

feature {NONE} -- Implementation

	mode: INTEGER
			-- Status mode of the directory.
			-- Possible values are the following:

	Close_directory: INTEGER = 1

	Read_directory: INTEGER = 2

	file_mkdir (dir_name: POINTER)
			-- Make directory `dir_name'.
		external
			"C signature (char *) use %"eif_file.h%""
		end

	dir_open (dir_name: POINTER): POINTER
			-- Open the directory `dir_name'.
		external
			"C signature (char *): EIF_POINTER use %"eif_dir.h%""
		end

	dir_rewind (dir_ptr: POINTER)
			-- Rewind the directory `dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	dir_close (dir_ptr: POINTER)
			-- Close the directory `dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	dir_next (dir_ptr: POINTER): detachable STRING
			-- Return the next entry for directory 'dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	eif_dir_delete (dir_name: POINTER)
			-- Delete the directory `dir_name'.
		external
			"C signature (char *) use %"eif_dir.h%""
		end

	eif_dir_exists (dir_name: POINTER): BOOLEAN
			-- Does the directory `dir_name' exist?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_readable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' readable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_executable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' executable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_writable (dir_name: POINTER): BOOLEAN
			-- Is `dir_name' writable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_rename (old_name, new_name: POINTER)
			-- Change directory name from `old_name' to `new_name'.
		external
			"C signature (char *, char *) use %"eif_file.h%""
		alias
			"file_rename"
		end

end
