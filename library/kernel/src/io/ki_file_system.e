note

	description:

		"Interface for file systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_FILE_SYSTEM

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES

	KL_IMPORTED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make
			-- Create a new file system object.
		do
		end

feature -- Status report

	is_current_file_system: BOOLEAN
			-- Is file system the file system of the underlying platform?
		deferred
		end

feature -- File handling

	is_file_readable (a_filename: STRING): BOOLEAN
			-- Can file named `a_filename' be opened in read mode?
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
		end

	file_exists (a_filename: STRING): BOOLEAN
			-- Does file named `a_filename' physically exist on disk?
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
		end

	file_count (a_filename: STRING): INTEGER
			-- Number of bytes in file named `a_filename';
			-- Return -1 if the number of bytes was not available,
			-- if the file did not exist for example.
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
			valid_values: Result = -1 or Result >= 0
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
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
			valid_values: Result = -1 or Result >= 0
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
		require
			a_filename1_not_void: a_filename1 /= Void
			a_filename2_not_void: a_filename2 /= Void
		deferred
		ensure
			instance_free: class
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
		require
			a_filename1_not_void: a_filename1 /= Void
			a_filename2_not_void: a_filename2 /= Void
		deferred
		ensure
			instance_free: class
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
		require
			a_filename1_not_void: a_filename1 /= Void
			a_filename2_not_void: a_filename2 /= Void
		deferred
		ensure
			instance_free: class
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
		require
			old_name_not_void: old_name /= Void
			new_name_not_void: new_name /= Void
		deferred
		ensure
			instance_free: class
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
		require
			old_name_not_void: old_name /= Void
			new_name_not_void: new_name /= Void
		deferred
		ensure
			instance_free: class
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
		require
			a_target_filename_not_void: a_target_filename /= Void
			a_source_filename_not_void: a_source_filename /= Void
		deferred
		ensure
			instance_free: class
		end

	delete_file (a_filename: STRING)
			-- Delete file named `a_filename'.
			-- Do nothing if the file could not be
			-- deleted or if it did not exist.
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
		end

	new_input_file (a_name: STRING): KI_TEXT_INPUT_FILE
			-- New input text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			instance_free: class
			input_file_not_void: Result /= Void
			name_set: Result.name = a_name
			is_closed: Result.is_closed
		end

	new_output_file (a_name: STRING): KI_TEXT_OUTPUT_FILE
			-- New output text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			instance_free: class
			output_file_not_void: Result /= Void
			name_set: Result.name = a_name
			is_closed: Result.is_closed
		end

	eol: STRING
			-- Line separator in current file system
		deferred
		ensure
			instance_free: class
			eol_not_void: Result /= Void
			eol_not_empty: Result.count > 0
		end

feature -- Directory handling

	is_directory_readable (a_dirname: STRING): BOOLEAN
			-- Can directory named `a_dirname' be opened in read mode?
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	directory_exists (a_dirname: STRING): BOOLEAN
			-- Does directory named `a_dirname' physically exist on disk?
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	is_directory_empty (a_dirname: STRING): BOOLEAN
			-- Does directory named `a_dirname' contain no entry apart
			-- from the parent and current directory entries?
			-- Return False if not able to open current directory.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
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
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
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
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	delete_directory (a_dirname: STRING)
			-- Delete directory named `a_dirname'.
			-- Do nothing if the directory could not be deleted,
			-- if it did not exist or if it is not empty.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	recursive_delete_directory (a_dirname: STRING)
			-- Delete directory named `a_dirname', its files
			-- and its subdirectories recursively. Do nothing if
			-- the directory could not be deleted, if it did not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	recursive_copy_directory (old_name, new_name: STRING)
			-- Copy recursively directory named `old_name' to `new_name'.
			-- Do nothing if the directory could not be copied,
			-- if it did not exist, or if `new_name' already existed.
			-- (`old_name' and `new_name' should follow the pathname
			-- convention of the underlying platform. For pathname
			-- conversion use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			old_name_not_void: old_name /= Void
			new_name_not_void: new_name /= Void
		deferred
		ensure
			instance_free: class
		end

feature -- Working directory

	cwd, current_working_directory: STRING
			-- Name of current working directory;
			-- Return absolute pathname with the naming
			-- convention of the underlying file system
			-- (Return a new object at each call.)
		require
			is_current_file_system: is_current_file_system
		deferred
		ensure
			current_working_directory_not_void: Result /= Void
			is_absolute: is_absolute_pathname (Result)
		end

	cd, set_current_working_directory (a_dirname: STRING)
			-- Set current working directory to `a_dirname'.
			-- Do nothing if the current working directory could not
			-- be changed or if directory `a_dirname' did not exist.
			-- (`a_dirname' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_dirname_not_void: a_dirname /= Void
			is_current_file_system: is_current_file_system
		deferred
		end

feature -- Pathname handling

	is_absolute_pathname (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' an absolute pathname?
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			not_relative: Result implies not is_relative_pathname (a_pathname)
		end

	is_relative_pathname (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' a relative pathname (relative
			-- to the current working directory)?
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			not_absolute: Result implies not is_absolute_pathname (a_pathname)
		end

	is_root_directory (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a root directory (i.e. it has no parent directory)?
			-- (`a_dirname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_dirname_not_void: a_dirname /= Void
		deferred
		ensure
			instance_free: class
		end

	same_pathnames (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Are `a_pathname1' and `a_pathname2' considered equal when
			-- viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
		deferred
		ensure
			instance_free: class
		end

	same_canonical_pathnames (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Are the canonical versions of `a_pathname1' and `a_pathname2'
			-- considered equal when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
		do
			Result := same_pathnames (canonical_pathname (a_pathname1), canonical_pathname (a_pathname2))
		ensure
			instance_free: class
			definition: Result = same_pathnames (canonical_pathname (a_pathname1), canonical_pathname (a_pathname2))
		end

	same_canonical_absolute_pathnames (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Are the canonical absolute versions of `a_pathname1' and `a_pathname2'
			-- considered equal when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
			is_current_file_system: is_current_file_system
		do
			Result := same_canonical_pathnames (absolute_pathname (a_pathname1), absolute_pathname (a_pathname2))
		ensure
			definition: Result = same_canonical_pathnames (absolute_pathname (a_pathname1), absolute_pathname (a_pathname2))
		end

	is_subpathname (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Is `a_pathname1' considered as a subpathname of `a_pathname2'
			-- when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
		deferred
		ensure
			instance_free: class
		end

	is_canonical_subpathname (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Is the canonical version of `a_pathname1' considered as
			-- a subpathname of the canonical version of `a_pathname2'
			-- when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
		do
			Result := is_subpathname (canonical_pathname (a_pathname1), canonical_pathname (a_pathname2))
		ensure
			instance_free: class
			definition: Result = is_subpathname (canonical_pathname (a_pathname1), canonical_pathname (a_pathname2))
		end

	is_canonical_absolute_subpathname (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Is the canonical absolute version of `a_pathname1' considered as
			-- a subpathname of the canonical absolute version of `a_pathname2'
			-- when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		require
			a_pathname1_not_void: a_pathname1 /= Void
			a_pathname2_not_void: a_pathname2 /= Void
			is_current_file_system: is_current_file_system
		do
			Result := is_canonical_subpathname (absolute_pathname (a_pathname1), absolute_pathname (a_pathname2))
		ensure
			definition: Result = is_canonical_subpathname (absolute_pathname (a_pathname1), absolute_pathname (a_pathname2))
		end

	basename (a_pathname: STRING): STRING
			-- Pathname with any leading directory components removed
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			basename_not_void: Result /= Void
			is_relative: not is_root_directory (a_pathname) implies is_relative_pathname (Result)
		end

	dirname (a_pathname: STRING): STRING
			-- Pathname containing only the leading directory components so
			-- that 'pathname (dirname (a_pathname), basename (a_pathname))'
			-- is equivalent to `a_pathname'; Return `relative_current_directory'
			-- when there is no leading directory components in `a_pathname';
			-- Return a root directory when `a_pathname' is a root directory
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			dirname_not_void: Result /= Void
			same_relative: is_relative_pathname (Result) = is_relative_pathname (a_pathname)
			same_absolute: is_absolute_pathname (Result) = is_absolute_pathname (a_pathname)
		end

	pathname (a_dirname, a_pathname: STRING): STRING
			-- Pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the pathname convention
			-- of current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_dirname_not_void: a_dirname /= Void
			a_pathname_not_void: a_pathname /= Void
			a_pathname_relative: is_relative_pathname (a_pathname)
		deferred
		ensure
			instance_free: class
			pathname_not_void: Result /= Void
			same_relative: is_relative_pathname (Result) = is_relative_pathname (a_dirname)
			same_absolute: is_absolute_pathname (Result) = is_absolute_pathname (a_dirname)
		end

	append_pathname_to_string (a_dirname, a_pathname, a_string: STRING)
			-- Append to `a_string' the pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the pathname convention
			-- of current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_dirname_not_void: a_dirname /= Void
			a_pathname_not_void: a_pathname /= Void
			a_pathname_relative: is_relative_pathname (a_pathname)
			a_string_not_void: a_string /= Void
			a_dirname_same_type: a_dirname.same_type (a_string)
			a_pathname_same_type: a_pathname.same_type (a_string)
		deferred
		ensure
			instance_free: class
			definition: a_string ~ old a_string + pathname (a_dirname, a_pathname)
		end

	nested_pathname (a_dirname: STRING; a_pathnames: ARRAY [STRING]): STRING
			-- Pathname made up of relative pathnames
			-- `a_pathnames' in directory `a_dirname'
			-- (`a_dirname' and `a_pathnames' should follow the pathname convention
			-- of current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_dirname_not_void: a_dirname /= Void
			a_pathnames_not_void: a_pathnames /= Void
			a_pathnames_not_empty: a_pathnames.count > 0
			no_void_pathname: not STRING_ARRAY_.has_void (a_pathnames)
			a_pathnames_relative: across a_pathnames as i_pathname all is_relative_pathname (i_pathname) end
		deferred
		ensure
			instance_free: class
			pathname_not_void: Result /= Void
			same_relative: is_relative_pathname (Result) = is_relative_pathname (a_dirname)
			same_absolute: is_absolute_pathname (Result) = is_absolute_pathname (a_dirname)
		end

	canonical_pathname (a_pathname: STRING): STRING
			-- Canonical form of `a_pathname'
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		local
			p: KI_PATHNAME
		do
			p := string_to_pathname (a_pathname)
			p.set_canonical
			Result := pathname_to_string (p)
		ensure
			instance_free: class
			canonical_pathname_not_void: Result /= Void
		end

	relative_current_directory: STRING
			-- Relative pathname of current directory
			-- (The result follows the pathname convention of current
			-- file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For
			-- pathname conversion use `pathname_from_file_system'.)
		deferred
		ensure
			instance_free: class
			relative_current_directory_not_void: Result /= Void
			is_relative: is_relative_pathname (Result)
		end

	relative_parent_directory: STRING
			-- Relative pathname of current parent directory
			-- (The result follows the pathname convention of current
			-- file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For
			-- pathname conversion use `pathname_from_file_system'.)
		deferred
		ensure
			instance_free: class
			relative_parent_directory_not_void: Result /= Void
			is_relative: is_relative_pathname (Result)
		end

	root_directory: STRING
			-- Pathname of current root directory
			-- (The result follows the pathname convention of current
			-- file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For
			-- pathname conversion use `pathname_from_file_system'.)
		deferred
		ensure
			instance_free: class
			root_directory_not_void: Result /= Void
			is_root: is_root_directory (Result)
			not_relative: not is_relative_pathname (Result)
		end

	absolute_pathname (a_pathname: STRING): STRING
			-- Absolute pathname of `a_pathname'
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
			is_current_file_system: is_current_file_system
		deferred
		ensure
			absolute_pathname_not_void: Result /= Void
			is_absolute: is_absolute_pathname (Result)
		end

	absolute_parent_directory (a_pathname: STRING): STRING
			-- Absolute pathname of parent directory of `a_pathname';
			-- Return `absolute_root_directory' if `a_pathname'
			-- is a root directory (i.e. has no parent)
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
			is_current_file_system: is_current_file_system
		deferred
		ensure
			absolute_parent_directory_not_void: Result /= Void
			is_absolute: is_absolute_pathname (Result)
		end

	absolute_root_directory: STRING
			-- Absolute pathname of current root directory
			-- (The result follows the pathname convention of current
			-- file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For
			-- pathname conversion use `pathname_from_file_system'.)
		require
			is_current_file_system: is_current_file_system
		deferred
		ensure
			absolute_root_directory_not_void: Result /= Void
			is_root: is_root_directory (Result)
			is_absolute: is_absolute_pathname (Result)
		end

	string_to_pathname (a_pathname: STRING): KI_PATHNAME
			-- Convert string to pathname
			-- (`a_pathname' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			string_to_pathname_not_void: Result /= Void
		end

	pathname_to_string (a_pathname: KI_PATHNAME): STRING
			-- Convert pathname to string
			-- (The result follows the pathname convention of current
			-- file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For
			-- pathname conversion use `pathname_from_file_system'.)
		require
			a_pathname_not_void: a_pathname /= Void
		deferred
		ensure
			instance_free: class
			pathname_to_string_not_void: Result /= Void
		end

	pathname_from_file_system (a_pathname: STRING; a_file_system: KI_FILE_SYSTEM): STRING
			-- Pathname using pathname convention of current file system
			-- (Unix convention in KL_UNIX_FILE_SYSTEM, Windows convention
			-- in KL_WINDOWS_FILE_SYSTEM, etc.) converted from `a_pathname'
			-- which should follow the pathname convention of `a_file_system'
		require
			a_pathname_not_void: a_pathname /= Void
			a_file_system_not_void: a_file_system /= Void
		do
			if ANY_.same_types (Current, a_file_system) then
				Result := a_pathname
			else
				Result := pathname_to_string (a_file_system.string_to_pathname (a_pathname))
			end
		ensure
			pathname_from_not_void: Result /= Void
		end

	has_extension (a_filename, an_extension: STRING): BOOLEAN
			-- Is `an_extension' a file extension of `a_filename'?
			-- (`a_filename' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_filename_not_void: a_filename /= Void
			an_extension_not_void: an_extension /= Void
		deferred
		ensure
			instance_free: class
		end

	extension (a_filename: STRING): STRING
			-- File extension of `a_filename' (include the leading '.')
			-- (`a_filename' should follow the pathname convention of
			-- current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. For pathname
			-- conversion use `pathname_from_file_system'.)
		require
			a_filename_not_void: a_filename /= Void
		deferred
		ensure
			instance_free: class
			extension_not_void: Result /= Void
		end

	exe_extension: STRING
			-- Executable file extension (with the leading '.'
			-- if this extension is not empty)
		deferred
		ensure
			instance_free: class
			exe_extension_not_void: Result /= Void
		end

end
