indexing

	description:

		"Interface for directories"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_DIRECTORY

feature {NONE} -- Initialization

	make (a_name: STRING) is
			-- Create a new directory object.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		deferred
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING is
			-- Directory name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	last_entry: STRING is
			-- Last entry (file or subdirectory name) read
			-- (Note: this query returns the new object after
			-- each call to `read_entry'.)
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
		deferred
		ensure
			last_entry_not_void: Result /= Void
		end

feature -- Status report

	is_open_read: BOOLEAN is
			-- Has directory been opened in read mode?
		deferred
		end

	is_closed: BOOLEAN is
			-- Is directory closed?
		deferred
		ensure
			definition: Result = not is_open_read
		end

	end_of_input: BOOLEAN is
			-- Have all entries been read?
		require
			is_open_read: is_open_read
		deferred
		end

feature -- Basic operations

	open_read is
			-- Try to open directory in read mode.  Set `is_open_read'
			-- to true and is ready to read first entry in directory
			-- if operation was successful.
		require
			is_closed: is_closed
		deferred
		ensure
			not_end_of_input: is_open_read implies not end_of_input
		end

	close is
			-- Close directory if it is closable,
			-- let it open otherwise.
		require
			not_closed: not is_closed
		deferred
		end

	create_directory is
			-- Create current directory on disk.
			-- Do nothing if the directory could not
			-- be created, if it already existed or if
			-- `name' is a nested directory name and
			-- the parent directory does not exist.
		require
			is_closed: is_closed
		deferred
		end

	delete is
			-- Delete current directory.
			-- Do nothing if the directory could not
			-- be deleted, if it did not exist or if
			-- it is not empty.
		require
			is_closed: is_closed
		deferred
		end

feature -- Cursor movement

	read_entry is
			-- Read next entry in directory.
			-- Make result available in `last_entry'.
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
		deferred
		end

end -- class KI_DIRECTORY
