note

	description:

		"Interface for files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_FILE

inherit

	KI_FILE_SYSTEM_ENTRY

feature -- Access

	time_stamp: INTEGER
			-- Time stamp (number of seconds since 1 January 1970
			-- at 00:00:00 UTC) of last modification to current file;
			-- Return -1 if the time stamp was not available, if the
			-- file did not exist for example, or if the time stamp
			-- didn't fit into an INTEGER. (Use DT_DATE_TIME.make_from_epoch
			-- to convert this time stamp to a human readable format.)
		deferred
		ensure
			valid_values: Result = -1 or Result >= 0
		end

feature -- Measurement

	count: INTEGER
			-- Number of bytes in current file;
			-- Return -1 if the number of bytes was not available,
			-- if the file did not exist for example.
		require
			is_closed: is_closed
		deferred
		ensure
			valid_values: Result = -1 or Result >= 0
		end

feature -- Status report

	same_physical_file (other_name: STRING): BOOLEAN
			-- Are current file and file named `other_name'
			-- the same physical file? Return False if one
			-- or both files don't exist. (Return True if
			-- it was impossible to determine whether the
			-- files were physically the same files.)
			-- (`other_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			other_name_not_void: other_name /= Void
			is_closed: is_closed
		deferred
		end

feature -- Basic operations

	change_name (new_name: STRING)
			-- Rename current file as `new_name'.
			-- Do nothing if the file could not be renamed, if
			-- it did not exist or if `new_name' is physically
			-- the same file as current file. Overwrite `new_name'
			-- if it already existed. If renaming was successful,
			-- then `name' is set to `new_name'.
			-- (`new_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			new_name_not_void: new_name /= Void
			is_closed: is_closed
		deferred
		end

	copy_file (new_name: STRING)
			-- Copy current file to `new_name'.
			-- Do nothing if the file could not be copied, if it
			-- did not exist or if `new_name' is physically
			-- the same file as current file. Overwrite `new_name'
			-- if it already existed.
			-- (`new_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			new_name_not_void: new_name /= Void
			is_closed: is_closed
		deferred
		end

	concat (a_filename: STRING)
			-- Copy content of file `a_filename' to the end of current file.
			-- Do nothing if file `a_filename' does not exist. Create
			-- current file if it does not exist yet. If file `a_filename'
			-- is physically the same as current file, then a copy of
			-- the file is appended to itself. Do nothing if current
			-- file could not be open in append mode or if file `a_filename'
			-- could not be opened in read mode.
			-- (`a_filename' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			a_filename_not_void: a_filename /= Void
			is_closed: is_closed
		deferred
		end

	change_mode (a_mask: INTEGER)
			-- Replace mode by `a_mask'.
		require
			file_exists: exists
		deferred
		end

end
