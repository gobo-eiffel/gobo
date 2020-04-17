note

	description:

		"File systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_FILE_SYSTEM

inherit

	KI_FILE_SYSTEM

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature -- Status report

	is_current_file_system: BOOLEAN
			-- Is file system the file system of the underlying platform?
		do
			Result := ANY_.same_types (Current, file_system)
		end

feature -- File handling

	is_file_readable (a_filename: STRING): BOOLEAN
			-- Can file named `a_filename' be opened in read mode?
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename)
			Result := tmp_file.is_readable
		end

	file_exists (a_filename: STRING): BOOLEAN
			-- Does file named `a_filename' physically exist on disk?
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename)
			Result := tmp_file.exists
		end

	file_count (a_filename: STRING): INTEGER
			-- Number of bytes in file named `a_filename';
			-- Return -1 if the number of bytes was not available,
			-- if the file did not exist for example.
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename)
			Result := tmp_file.count
		end

	file_time_stamp (a_filename: STRING): INTEGER
			-- Time stamp (number of seconds since 1 January 1970
			-- at 00:00:00 UTC) of last modification to file `a_filename';
			-- Return -1 if the time stamp was not available, if the
			-- file did not exist for example, or if the time stamp
			-- didn't fit into an INTEGER. (Use DT_DATE_TIME.make_from_epoch
			-- to convert this time stamp to a human readable format.)
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename)
			Result := tmp_file.time_stamp
		end

	same_physical_file (a_filename1, a_filename2: STRING): BOOLEAN
			-- Are files named `a_filename1' and `a_filename2'
			-- the same physical file? Return False if one
			-- or both files don't exist. (Return True if
			-- it was impossible to determine whether the
			-- files were physically the same files.)
			-- (`a_filename1' and `a_filename2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename1)
			Result := tmp_file.same_physical_file (a_filename2)
		end

	same_text_files (a_filename1, a_filename2: STRING): BOOLEAN
			-- Do files named `a_filename1' and `a_filename2'
			-- contain the same number of lines and are these
			-- lines equal? Return False if one or both files
			-- don't exist or cannot be open in read mode.
			-- (`a_filename1' and `a_filename2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
		local
			a_file1, a_file2: like new_input_file
			done: BOOLEAN
		do
			a_file1 := new_input_file (a_filename1)
			a_file1.open_read
			if a_file1.is_open_read then
				a_file2 := new_input_file (a_filename2)
				a_file2.open_read
				if a_file2.is_open_read then
					Result := True
					from
					until
						done
					loop
						a_file1.read_line
						a_file2.read_line
						if a_file1.end_of_file then
							if not a_file2.end_of_file then
								Result := False
							end
							a_file1.close
							a_file2.close
							done := True
						elseif a_file2.end_of_file then
							Result := False
							a_file1.close
							a_file2.close
							done := True
						elseif not a_file1.last_string.same_string (a_file2.last_string) then
							Result := False
							a_file1.close
							a_file2.close
							done := True
						end
					end
				else
					a_file1.close
					Result := False
				end
			else
				Result := False
			end
		end

	same_binary_files (a_filename1, a_filename2: STRING): BOOLEAN
			-- Do files named `a_filename1' and `a_filename2'
			-- contain the same number of characters and are these
			-- characters equal? Return False if one or both files
			-- don't exist or cannot be open in read mode.
			-- (`a_filename1' and `a_filename2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
		local
			a_file1, a_file2: KL_BINARY_INPUT_FILE
			a_count1, a_count2: INTEGER
			s1, s2: STRING
			i, nb: INTEGER
			done: BOOLEAN
		do
			create a_file1.make (a_filename1)
			a_count1 := a_file1.count
			a_file1.open_read
			if a_file1.is_open_read then
				create a_file2.make (a_filename2)
				a_count2 := a_file2.count
				a_file2.open_read
				if a_file2.is_open_read then
					if a_count1 /= a_count2 then
						Result := False
					else
						Result := True
						from
						until
							done
						loop
							a_file1.read_string (512)
							a_file2.read_string (512)
							if a_file1.end_of_file then
								if not a_file2.end_of_file then
									Result := False
								end
								a_file1.close
								a_file2.close
								done := True
							elseif a_file2.end_of_file then
								Result := False
								a_file1.close
								a_file2.close
								done := True
							else
									-- Note: there is a bug in ISE Eiffel 5.5.0409 in STRING.is_equal
									-- when null characters are enclosed in the string. Therefore we
									-- do the comparison ourselves by hand character by character.
								s1 := a_file1.last_string
								s2 := a_file2.last_string
								nb := s1.count
								if s2.count /= nb then
									Result := False
									a_file1.close
									a_file2.close
									done := True
								else
									from
										i := 1
									until
										i > nb
									loop
										if s1.item (i) /= s2.item (i) then
											Result := False
											a_file1.close
											a_file2.close
											done := True
												-- Jump out of the loop.
											i := nb + 1
										else
											i := i + 1
										end
									end
								end
							end
						end
					end
				else
					a_file1.close
					Result := False
				end
			else
				Result := False
			end
		end

	rename_file (old_name, new_name: STRING)
			-- Rename file named `old_name' as `new_name'.
			-- Do nothing if the file could not be renamed, if
			-- it did not exist or if `new_name' is physically
			-- the same file as current file. Overwrite `new_name'
			-- if it already existed. (`old_name' and `new_name'
			-- should follow the pathname convention of the
			-- underlying platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (old_name)
			tmp_file.change_name (new_name)
		end

	copy_file (old_name, new_name: STRING)
			-- Copy file named `old_name' to `new_name'.
			-- Do nothing if the file could not be copied, if it
			-- did not exist or if `new_name' is physically
			-- the same file as `old_name'. Overwrite `new_name'
			-- if it already existed. (`old_name' and `new_name'
			-- should follow the pathname convention of the
			-- underlying platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (old_name)
			tmp_file.copy_file (new_name)
		end

	concat_files (a_target_filename, a_source_filename: STRING)
			-- Copy content of file `a_source_filename' to the end of file
			-- `a_target_filename'. Do nothing if file `a_source_filename'
			-- does not exist. Create file `a_target_filename' if it does
			-- not exist yet. If file `a_source_filename' is physically the
			-- same as file `a_target_filename', then a copy of the file is
			-- appended to itself. Do nothing if file `a_target_filename'
			-- could not be open in append mode or if file `a_source_filename'
			-- could not be opened in read mode.
			-- (`a_source_filename' and `a_target_filename' should follow
			-- the pathname convention of the underlying platform. For pathname
			-- conversion use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_target_filename)
			tmp_file.concat (a_source_filename)
		end

	delete_file (a_filename: STRING)
			-- Delete file named `a_filename'.
			-- Do nothing if the file could not be
			-- deleted or if it did not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			tmp_file.reset (a_filename)
			tmp_file.delete
		end

feature -- Directory handling

	is_directory_readable (a_dirname: STRING): BOOLEAN
			-- Can directory named `a_dirname' be opened in read mode?
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				Result := tmp_directory.is_readable
			end
		end

	directory_exists (a_dirname: STRING): BOOLEAN
			-- Does directory named `a_dirname' physically exist on disk?
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				Result := tmp_directory.exists
			end
		end

	is_directory_empty (a_dirname: STRING): BOOLEAN
			-- Does directory named `a_dirname' contain no entry apart
			-- from the parent and current directory entries?
			-- Return False if not able to open current directory.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				Result := tmp_directory.is_empty
			end
		end

	create_directory (a_dirname: STRING)
			-- Create a new directory named `a_dirname'.
			-- Do nothing if the directory could not
			-- be created, if it already existed or if
			-- `a_dirname' is a nested directory name
			-- and the parent directory does not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				tmp_directory.create_directory
			end
		end

	recursive_create_directory (a_dirname: STRING)
			-- Create a new directory named `a_dirname' on disk.
			-- Create its parent directories if they do not exist yet.
			-- Do nothing if the directory could not be created,
			-- if it already existed or `name' is a nested directory
			-- name and its parent directory does not exist and
			-- could not be created.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				tmp_directory.recursive_create_directory
			end
		end

	delete_directory (a_dirname: STRING)
			-- Delete directory named `a_dirname'.
			-- Do nothing if the directory could not be deleted,
			-- if it did not exist or if it is not empty.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				tmp_directory.delete
			end
		end

	recursive_delete_directory (a_dirname: STRING)
			-- Delete directory named `a_dirname', its files
			-- and its subdirectories recursively. Do nothing if
			-- the directory could not be deleted, if it did not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not a_dirname.is_empty then
				tmp_directory.reset (a_dirname)
				tmp_directory.recursive_delete
			end
		end

	recursive_copy_directory (old_name, new_name: STRING)
			-- Copy recursively directory named `old_name' to `new_name'.
			-- Do nothing if the directory could not be copied,
			-- if it did not exist, or if `new_name' already existed.
			-- (`old_name' and `new_name' should follow the pathname
			-- convention of the underlying platform. For pathname
			-- conversion use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			if not old_name.is_empty then
				tmp_directory.reset (old_name)
				tmp_directory.recursive_copy_directory (new_name)
			end
		end

feature -- Working directory

	cwd, current_working_directory: STRING
			-- Name of current working directory;
			-- Return absolute pathname with the naming
			-- convention of the underlying file system
			-- (Return a new object at each call.)
		do
			Result := execution_environment.current_working_path.utf_8_name
		end

	cd, set_current_working_directory (a_dirname: STRING)
			-- Set current working directory to `a_dirname'.
			-- Do nothing if the current working directory could not
			-- be changed or if directory `a_dirname' did not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		local
			rescued: BOOLEAN
			a_string_dirname: STRING
			l_path: PATH
		do
			if not rescued then
				a_string_dirname := STRING_.as_string_no_uc_string (a_dirname)
				if a_string_dirname.count > 0 then
					create l_path.make_from_string (a_string_dirname)
					execution_environment.change_working_path (l_path)
				end
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

feature {NONE} -- Implementation

	tmp_file: KL_TEXT_INPUT_FILE
			-- Temporary file object
		once
			create Result.make (dummy_name)
		ensure
			instance_free: class
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	tmp_directory: KL_DIRECTORY
			-- Temporary directory object
		once
			create Result.make (dummy_name)
		ensure
			instance_free: class
			directory_not_void: Result /= Void
			directory_closed: Result.is_closed
		end

	dummy_name: STRING = "dummy"
			-- Dummy name

	execution_environment: EXECUTION_ENVIRONMENT
			-- Execution environment implementation
		once
			create Result
		ensure
			instance_free: class
			execution_environment_not_void: Result /= Void
		end

end
