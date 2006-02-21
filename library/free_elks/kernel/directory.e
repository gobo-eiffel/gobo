indexing
	description: "Directories, in the Unix sense, with creation and exploration features"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DIRECTORY

inherit
	DISPOSABLE
		export
			{DIRECTORY} all
		end

create
	make, make_open_read

feature -- Initialization

	make (dn: STRING) is
			-- Create directory object for the directory
			-- of name `dn'.
		require
			string_exists: dn /= Void
		do
			name := dn
			mode := Close_directory
		end

	make_open_read (dn: STRING) is
			-- Create directory object for the directory
			-- of name `dn' and open it for reading.
		require
			string_exists: dn /= Void
		do
			make (dn)
			open_read
		end

	create_dir is
			-- Create a physical directory.
		require
			physical_not_exists: not exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			file_mkdir ($external_name)
		end

feature -- Access

	readentry is
			-- Read next directory entry
			-- make result available in `lastentry'.
			-- Make result void if all entries have been read.
		require
			is_opened: not is_closed
		do
			lastentry := dir_next (directory_pointer)
		end

	name: STRING
			-- Directory name

	has_entry (entry_name: STRING): BOOLEAN is
			-- Has directory the entry `entry_name'?
			-- The use of `dir_temp' is required not
			-- to change the position in the current
			-- directory entries list.
		require
			string_exists: entry_name /= Void
		local
			dir_temp: DIRECTORY
		do
			create dir_temp.make_open_read (name)
			from
				dir_temp.readentry
			until
				Result or dir_temp.lastentry = Void
			loop
				Result := dir_temp.lastentry.is_equal (entry_name)
				dir_temp.readentry
			end
			dir_temp.close
		end

	open_read is
			-- Open directory `name' for reading.
		local
			external_name: ANY
		do
			external_name := name.to_c
			directory_pointer := dir_open ($external_name)
			mode := Read_directory
		end

	close is
			-- Close directory.
		require
			is_open: not is_closed
		do
			dir_close (directory_pointer)
			mode := Close_directory
		end

	start is
			-- Go to first entry of directory.
		require
			is_opened: not is_closed
		do
			dir_rewind (directory_pointer)
		end

	change_name (new_name: STRING) is
			-- Change file name to `new_name'
		require
			new_name_not_void: new_name /= Void
			file_exists: exists
		local
			ext_old_name, ext_new_name: ANY
		do
			ext_old_name := name.to_c
			ext_new_name := new_name.to_c
			eif_dir_rename ($ext_old_name, $ext_new_name)
			name := new_name
		ensure
			name_changed: name.is_equal (new_name)
		end

feature -- Measurement

	count: INTEGER is
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

	linear_representation: ARRAYED_LIST [STRING] is
			-- The entries, in sequential format.
		local
			dir_temp: DIRECTORY
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
			until
				dir_temp.lastentry = Void
			loop
				Result.extend (dir_temp.lastentry)
				dir_temp.readentry
			end
			dir_temp.close
		end

feature -- Status report

	lastentry: STRING
			-- Last entry read by `readentry'

	is_closed: BOOLEAN is
			-- Is current directory closed?
		do
			Result := mode = Close_directory
		end

	is_empty: BOOLEAN is
			-- Is directory empty?
		require
			directory_exists: exists
		do
				-- count = 2, since there are "." and ".." which
				-- are symbolic representations but not effective directories.
			Result := (count = 2)
		end
	
	empty: BOOLEAN is
			-- Is directory empty?
		obsolete
			"Use `is_empty' instead"
		do
			Result := is_empty
		end

	exists: BOOLEAN is
			-- Does the directory exist?
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_exists ($external_name)
		end

	is_readable: BOOLEAN is
			-- Is the directory readable?
		require
			directory_exists: exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_is_readable ($external_name)
		end

	is_executable: BOOLEAN is
			-- Is the directory executable?
		require
			directory_exists: exists
		local
			external_name: ANY
		do
			external_name := name.to_c
			Result := eif_dir_is_executable ($external_name)
		end

	is_writable: BOOLEAN is
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

	delete is
			-- Delete directory if empty
		require
			directory_exists: exists
			empty_directory: is_empty
		local
			external_name: ANY
		do
			external_name := name.to_c
			eif_dir_delete ($external_name)
		end

	delete_content is
			-- Delete all files located in current directory and its
			-- subdirectories.
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

	recursive_delete is
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
			action: PROCEDURE [ANY, TUPLE]
			is_cancel_requested: FUNCTION [ANY, TUPLE, BOOLEAN]
			file_number: INTEGER)
		is
			-- Delete all files located in current directory and its
			-- subdirectories. 
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
				if
					not l.item.is_equal (current_directory) and
					not l.item.is_equal (parent_directory)
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
		is
			-- Delete directory, its files and its subdirectories.
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

	dispose is
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

	Close_directory: INTEGER is unique

	Read_directory: INTEGER is unique

	file_mkdir (dir_name: POINTER) is
			-- Make directory `dir_name'.
		external
			"C signature (char *) use %"eif_file.h%""
		end

	dir_open (dir_name: POINTER): POINTER is
			-- Open the directory `dir_name'.
		external
			"C signature (char *): EIF_POINTER use %"eif_dir.h%""
		end

	dir_rewind (dir_ptr: POINTER) is
			-- Rewind the directory `dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	dir_close (dir_ptr: POINTER) is
			-- Close the directory `dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	dir_next (dir_ptr: POINTER): STRING is
			-- Return the next entry for directory 'dir_ptr'.
		external
			"C use %"eif_dir.h%""
		end

	eif_dir_delete (dir_name: POINTER) is
			-- Delete the directory `dir_name'.
		external
			"C signature (char *) use %"eif_dir.h%""
		end

	eif_dir_exists (dir_name: POINTER): BOOLEAN is
			-- Does the directory `dir_name' exist?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_readable (dir_name: POINTER): BOOLEAN is
			-- Is `dir_name' readable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_executable (dir_name: POINTER): BOOLEAN is
			-- Is `dir_name' executable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_is_writable (dir_name: POINTER): BOOLEAN is
			-- Is `dir_name' writable?
		external
			"C signature (char *): EIF_BOOLEAN use %"eif_dir.h%""
		end

	eif_dir_rename (old_name, new_name: POINTER) is
			-- Change directory name from `old_name' to `new_name'.
		external
			"C signature (char *, char *) use %"eif_file.h%""
		alias
			"file_rename"
		end

end
