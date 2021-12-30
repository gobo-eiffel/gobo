note

	description:

		"Interface for directories"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_DIRECTORY

inherit

	KI_FILE_SYSTEM_ENTRY
		rename
			open as open_read,
			is_open as is_open_read
		redefine
			open_read
		end

	KI_INPUT_STREAM [STRING]
		rename
			read as read_entry,
			unread as unread_entry,
			last_item as last_entry,
			valid_unread_item as valid_unread_entry
		undefine
			is_closable,
			close
		redefine
			read_entry,
			last_entry
		end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

feature -- Access

	last_entry: STRING
			-- Last entry (file or subdirectory name) read
			-- (Note: this query returns the new object after
			-- each call to `read_entry'.)
		deferred
		ensure then
			last_entry_not_void: Result /= Void
		end

	filenames: detachable ARRAY [STRING]
			-- Names of readable files in current directory;
			-- Void if current directory could not be searched
		deferred
		ensure
			no_void_filename: Result /= Void implies not STRING_ARRAY_.has_void (Result)
			no_empty_filename: Result /= Void implies across Result as i_filename all not i_filename.is_empty end
		end

	directory_names: detachable ARRAY [STRING]
			-- Names of readable subdirectories in current directory;
			-- Void if current directory could not be searched
			-- (Do not include parent and current directory names.)
		deferred
		ensure
			no_void_directory_names: Result /= Void implies not STRING_ARRAY_.has_void (Result)
			no_empty_directory_names: Result /= Void implies across Result as i_directory_name all not i_directory_name.is_empty end
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Does current directory contain no entry apart from
			-- the parent and current directory entries?
			-- Return False if not able to open current directory.
		deferred
		end

	valid_unread_entry (an_entry: STRING): BOOLEAN
			-- Can `an_entry' be put back in input stream?
		do
			Result := an_entry /= Void and then an_entry.count > 0
		ensure then
			instance_free: class
			an_entry_not_void: Result implies an_entry /= Void
			an_entry_not_empty: Result implies an_entry.count > 0
		end

feature -- Basic operations

	open_read
			-- Try to open directory in read mode.  Set `is_open_read'
			-- to true and is ready to read first entry in directory
			-- if operation was successful.
		deferred
		ensure then
			not_end_of_input: is_open_read implies not end_of_input
		end

	create_directory
			-- Create current directory on disk.
			-- Do nothing if the directory could not
			-- be created, if it already existed or if
			-- `name' is a nested directory name and
			-- the parent directory does not exist.
		require
			is_closed: is_closed
		deferred
		end

	recursive_create_directory
			-- Create current directory on disk.
			-- Create its parent directories if they do not exist yet.
			-- Do nothing if the directory could not be created,
			-- if it already existed or `name' is a nested directory
			-- name and its parent directory does not exist and
			-- could not be created.
		require
			is_closed: is_closed
		deferred
		end

	recursive_delete
			-- Delete current directory, its files
			-- and its subdirectories recursively.
			-- Do nothing if the directory could not
			-- be deleted, if it did not exist.
		require
			is_closed: is_closed
		deferred
		end

	recursive_copy_directory (new_name: STRING)
			-- Copy recursively current directory to `new_name'.
			-- Do nothing if the directory could not be copied,
			-- if it did not exist, or if `new_name' already existed.
			-- (`new_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		require
			new_name_not_void: new_name /= Void
			is_closed: is_closed
		deferred
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [STRING])
			-- Apply `an_action' to every entry in the directory.
			-- Do nothing if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		require
			an_action_not_void: an_action /= Void
		deferred
		end

	do_if (an_action: PROCEDURE [STRING]; a_test: FUNCTION [STRING, BOOLEAN])
			-- Apply `an_action' to every entry in the directory that satisfies `a_test'.
			-- Do nothing if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		deferred
		end

	there_exists (a_test: FUNCTION [STRING, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one entry in the directory?
			-- False if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

	for_all (a_test: FUNCTION [STRING, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all entries in the directory?
			-- False if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

feature -- Input

	read_entry
			-- Read next entry in directory.
			-- Make result available in `last_entry'.
		deferred
		ensure then
			last_entry_not_empty: not end_of_input implies last_entry.count > 0
		end

end
