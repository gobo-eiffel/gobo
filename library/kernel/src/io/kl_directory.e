note

	description:

		"Filesystem's directories"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_DIRECTORY

inherit

	KI_DIRECTORY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

	DIRECTORY
		rename
			make as old_make,
			name as old_name,
			open_read as old_open_read,
			is_readable as old_is_readable,
			exists as old_exists,
			close as old_close,
			delete as old_delete,
			recursive_delete as old_recursive_delete,
			is_empty as old_is_empty
		export
			{NONE} all
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new directory object.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			name := a_name
			last_entry := Dummy_entry
			if a_name.count > 0 then
				string_name := STRING_.as_string_no_uc_string (a_name)
			else
				string_name := Empty_name
			end
			old_make (string_name)
		end

feature -- Access

	name: STRING
			-- Directory name;
			-- Note: If `name' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used.

	last_entry: STRING
			-- Last entry (file or subdirectory name) read
			-- (Note: this query returns the new object after
			-- each call to `read_entry'.)

	filenames: detachable ARRAY [STRING]
			-- Names of readable files in current directory;
			-- Void if current directory could not be searched
		local
			a_name: STRING
			an_array: ARRAY [STRING]
			i, nb, k: INTEGER
		do
			if is_closed then
				open_read
				if is_open_read then
					k := 10
					create an_array.make_filled ("", 1, k)
					from
						read_entry
					until
						end_of_input
					loop
						a_name := last_entry
						tmp_file.reset (file_system.pathname (string_name, a_name))
						if tmp_file.is_readable then
							nb := nb + 1
							if nb > k then
								k := k + 10
								STRING_ARRAY_.resize_with_default (an_array, "", 1, k)
							end
							an_array.put (a_name, nb)
						end
						read_entry
					end
					close
					create Result.make_filled ("", 1, nb)
					from
						i := 1
					until
						i > nb
					loop
						Result.put (an_array.item (i), i)
						i := i + 1
					end
				end
			else
				tmp_directory.reset (string_name)
				Result := tmp_directory.filenames
			end
		end

	directory_names: detachable ARRAY [STRING]
			-- Names of readable subdirectories in current directory;
			-- Void if current directory could not be searched
			-- (Do not include parent and current directory names.)
		local
			a_name: STRING
			an_array: ARRAY [STRING]
			i, nb, k: INTEGER
		do
			if is_closed then
				open_read
				if is_open_read then
					k := 10
					create an_array.make_filled ("", 1, k)
					from
						read_entry
					until
						end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							tmp_directory.reset (file_system.pathname (string_name, a_name))
							if tmp_directory.is_readable then
								nb := nb + 1
								if nb > k then
									k := k + 10
									STRING_ARRAY_.resize_with_default (an_array, "", 1, k)
								end
								an_array.put (a_name, nb)
							end
						end
						read_entry
					end
					close
					create Result.make_filled ("", 1, nb)
					from
						i := 1
					until
						i > nb
					loop
						Result.put (an_array.item (i), i)
						i := i + 1
					end
				end
			else
				tmp_directory.reset (string_name)
				Result := tmp_directory.directory_names
			end
		end

feature -- Status report

	is_open_read: BOOLEAN
			-- Has directory been opened in read mode?
		do
			Result := not is_closed
		end

	end_of_input: BOOLEAN
			-- Have all entries been read?

	exists: BOOLEAN
			-- Does directory physically exist on disk?
		do
			if name.count > 0 then
				Result := old_exists
			end
		end

	is_readable: BOOLEAN
			-- Can directory be opened in read mode?
		do
			if name.count > 0 then
				Result := old_exists and then old_is_readable
			end
		end

	is_empty: BOOLEAN
			-- Does current directory contain no entry apart from
			-- the parent and current directory entries?
			-- Return False if not able to open current directory.
		local
			a_name: STRING
		do
			if is_closed then
				open_read
				if is_open_read then
					from
						Result := True
						read_entry
					until
						not Result or end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							Result := False
						else
							read_entry
						end
					end
					close
				end
			else
				tmp_directory.reset (string_name)
				Result := tmp_directory.is_empty
			end
		end

feature -- Basic operations

	open_read
			-- Try to open directory in read mode. Set `is_open_read'
			-- to true and is ready to read first entry in directory
			-- if operation was successful.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if name.count > 0 then
					entry_buffer := Void
					end_of_input := False
					if old_exists and then old_is_readable then
						old_open_read
						old_end_of_input := False
					end
				end
			elseif not is_closed then
				close
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	close
			-- Close directory if it is closable,
			-- let it open otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				old_close
				old_end_of_input := True
				entry_buffer := Void
				last_entry := Dummy_entry
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	create_directory
			-- Create current directory on disk.
			-- Do nothing if the directory could not
			-- be created, if it already existed or if
			-- `name' is a nested directory name and
			-- the parent directory does not exist.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if name.count > 0 then
					if not old_exists then
						create_dir
					end
				end
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	recursive_create_directory
			-- Create current directory on disk.
			-- Create its parent directories if they do not exist yet.
			-- Do nothing if the directory could not be created,
			-- if it already existed or `name' is a nested directory
			-- name and its parent directory does not exist and
			-- could not be created.
		local
			a_dirname: STRING
			a_pathname: STRING
			a_dir: KL_DIRECTORY
		do
			create_directory
			if not exists then
				a_pathname := file_system.canonical_pathname (string_name)
				a_dirname := file_system.dirname (a_pathname)
				if not STRING_.same_string (a_dirname, a_pathname) then
					create a_dir.make (a_dirname)
					if not a_dir.exists then
						a_dir.recursive_create_directory
						if a_dir.exists then
							create_directory
						end
					end
				end
			end
		end

	delete
			-- Delete current directory.
			-- Do nothing if the directory could not
			-- be deleted, if it did not exist or if
			-- it is not empty.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if name.count > 0 then
					if old_exists and then is_empty then
						old_delete
					end
				end
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	recursive_delete
			-- Delete current directory, its files
			-- and its subdirectories recursively.
			-- Do nothing if the directory could not
			-- be deleted, if it did not exist.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if name.count > 0 then
					if old_exists then
						old_recursive_delete
					end
				end
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	recursive_copy_directory (new_name: STRING)
			-- Copy recursively current directory to `new_name'.
			-- Do nothing if the directory could not be copied,
			-- if it did not exist, or if `new_name' already existed.
			-- (`new_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		local
			rescued: BOOLEAN
			a_name: STRING
			a_dir: KL_DIRECTORY
			a_new_dir: KL_DIRECTORY
			a_pathname: STRING
			a_new_pathname: STRING
		do
			if not rescued then
				if name.count > 0 then
					create a_new_dir.make (new_name)
					if not a_new_dir.exists and not file_system.file_exists (new_name) then
						a_new_dir.recursive_create_directory
						open_read
						if is_open_read then
							from
								read_entry
							until
								end_of_input
							loop
								a_name := last_entry
								if
									not STRING_.same_string (a_name, file_system.relative_current_directory) and then
									not STRING_.same_string (a_name, file_system.relative_parent_directory)
								then
									a_pathname := file_system.pathname (string_name, a_name)
									a_new_pathname := file_system.pathname (new_name, a_name)
									if file_system.is_file_readable (a_pathname) then
										file_system.copy_file (a_pathname, a_new_pathname)
									else
										create a_dir.make (a_pathname)
										a_dir.recursive_copy_directory (a_new_pathname)
									end
								end
								read_entry
							end
							close
						end
					end
				end
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [STRING])
			-- Apply `an_action' to every entry in the directory.
			-- Do nothing if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		local
			a_name: STRING
		do
			if is_closed then
				open_read
				if is_open_read then
					from
						read_entry
					until
						end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							an_action.call ([a_name])
						end
						read_entry
					end
					close
				end
			else
				tmp_directory.reset (string_name)
				tmp_directory.do_all (an_action)
			end
		end

	do_if (an_action: PROCEDURE [STRING]; a_test: FUNCTION [STRING, BOOLEAN])
			-- Apply `an_action' to every entry in the directory that satisfies `a_test'.
			-- Do nothing if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		local
			a_name: STRING
		do
			if is_closed then
				open_read
				if is_open_read then
					from
						read_entry
					until
						end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							if a_test.item ([a_name]) then
								an_action.call ([a_name])
							end
						end
						read_entry
					end
					close
				end
			else
				tmp_directory.reset (string_name)
				tmp_directory.do_if (an_action, a_test)
			end
		end

	there_exists (a_test: FUNCTION [STRING, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one entry in the directory?
			-- False if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		local
			a_name: STRING
		do
			if is_closed then
				open_read
				if is_open_read then
					from
						read_entry
					until
						Result or end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							if a_test.item ([a_name]) then
								Result := True
							end
						end
						read_entry
					end
					close
				end
			else
				tmp_directory.reset (string_name)
				Result := tmp_directory.there_exists (a_test)
			end
		end

	for_all (a_test: FUNCTION [STRING, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all entries in the directory?
			-- False if current directory could not be searched.
			-- (Semantics not guaranteed if `an_action' changes the contents of the directory.)
		local
			a_name: STRING
		do
			if is_closed then
				open_read
				if is_open_read then
					Result := True
					from
						read_entry
					until
						not Result or end_of_input
					loop
						a_name := last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and then
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							if not a_test.item ([a_name]) then
								Result := False
							end
						end
						read_entry
					end
					close
				end
			else
				tmp_directory.reset (string_name)
				Result := tmp_directory.for_all (a_test)
			end
		end

feature -- Input

	read_entry
			-- Read next entry in directory.
			-- Make result available in `last_entry'.
		local
			l_entry_buffer: like entry_buffer
		do
			l_entry_buffer := entry_buffer
			if l_entry_buffer /= Void then
				last_entry := l_entry_buffer.item
				entry_buffer := l_entry_buffer.right
			elseif old_end_of_input then
				end_of_input := True
			else
				readentry
				if attached {STRING} last_entry_32 as l_last_entry_32 then
					old_end_of_input := False
					last_entry := l_last_entry_32
				elseif attached last_entry_8 as l_last_entry_8 then
					old_end_of_input := False
					last_entry := l_last_entry_8
				else
					old_end_of_input := True
					last_entry := Dummy_entry
				end
				end_of_input := old_end_of_input
			end
		end

	unread_entry (an_entry: STRING)
			-- Put `an_entry' back in input stream.
			-- This entry will be read first by the next
			-- call to a read routine.
		local
			a_cell: like entry_buffer
			l_entry_buffer: like entry_buffer
		do
			create a_cell.make (an_entry)
			l_entry_buffer := entry_buffer
			if l_entry_buffer /= Void then
				a_cell.put_right (l_entry_buffer)
			end
			entry_buffer := a_cell
			last_entry := an_entry
			end_of_input := False
		end

feature {NONE} -- Implementation

	entry_buffer: detachable KL_LINKABLE [STRING]
			-- Unread entries

	valid_entry_buffer (a_buffer: like entry_buffer): BOOLEAN
			-- Is `a_buffer' a valid buffer for unread entries?
		do
			Result := a_buffer /= Void implies valid_unread_entry (a_buffer.item)
		ensure
			instance_free: class
			definition: Result = (a_buffer /= Void implies valid_unread_entry (a_buffer.item))
		end

	old_end_of_input: BOOLEAN
			-- Have all entries been read
			-- (do not take `unread_entry' into account)?

	string_name: STRING
			-- Name of directory (STRING version)

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

	Dummy_entry: STRING = ""
			-- Dummy entry

	Empty_name: STRING = "empty_name"
			-- Empty name place-holder

invariant

	string_name_not_void: string_name /= Void
	string_name_not_empty: not string_name.is_empty
	valid_entry_buffer: valid_entry_buffer (entry_buffer)

end
