indexing

	description:

		"Interface for files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_FILE

inherit

	KI_FILE_SYSTEM_ENTRY
		undefine
				-- Needed for VE.
			copy
		end

feature -- Access

	time_stamp: INTEGER is
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

	count: INTEGER is
			-- Number of bytes in current file;
			-- Return -1 if the number of bytes was not available,
			-- if the file did not exist for example.
		require
			is_closed: is_closed
		deferred
		ensure
			valid_values: Result = -1 or Result >= 0
		end

feature -- Basic operations

	change_name (new_name: STRING) is
			-- Rename current file as `new_name'.
			-- Do nothing if the file could not be renamed, if
			-- it did not exist or if `new_name' already existed.
			-- If renaming was successful, then `name' is set to
			-- `new_name'.
		require
			new_name_not_void: new_name /= Void
			is_closed: is_closed
		deferred
		end

	copy_file (new_name: STRING) is
			-- Copy current file to `new_name'.
			-- Do nothing if the file could not be copied, if it
			-- did not exist or if `new_name' already existed.
		require
			new_name_not_void: new_name /= Void
			is_closed: is_closed
		deferred
		end

end -- class KI_FILE
