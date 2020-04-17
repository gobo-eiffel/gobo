note

	description:

		"Output files containing extended ASCII characters %
		%(8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_OUTPUT_FILE

inherit

	KI_OUTPUT_FILE

	KL_FILE
		rename
			open as open_write,
			is_open as is_open_write
		end

feature -- Status report

	is_open_write: BOOLEAN
			-- Is file opened in write mode?
		do
			Result := old_is_open_write
		end

feature -- Output

	put_character (c: CHARACTER_8)
			-- Write `c' to output file.
		do
			old_put_character (c)
		end

	put_string (a_string: READABLE_STRING_8)
			-- Write `a_string' to output file.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		do
			old_put_string (STRING_.as_readable_string_8_no_uc_string (a_string).to_string_8)
		end

feature -- Basic operations

	open_write
			-- Open current file in write-only mode if
			-- it can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or its
			-- old content is removed otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if string_name /= Empty_name then
					old_open_write
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

	open_append
			-- Open current file in append mode if it
			-- can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or the
			-- data which will be written to the file will
			-- appear after its old content otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if string_name /= Empty_name then
					old_open_append
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

	recursive_open_write
			-- Open current file in write-only mode if
			-- it can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or its
			-- old content is removed otherwise. Try to
			-- recursively create its parent directory
			-- if it does not exist yet.
		local
			a_dirname: STRING
			a_pathname: STRING
			a_dir: KL_DIRECTORY
		do
			open_write
			if not is_open_write then
				a_pathname := file_system.canonical_pathname (name)
				a_dirname := file_system.dirname (a_pathname)
				create a_dir.make (a_dirname)
				if not a_dir.exists then
					a_dir.recursive_create_directory
					if a_dir.exists then
						open_write
					end
				end
			end
		end

	recursive_open_append
			-- Open current file in append mode if it
			-- can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or the
			-- data which will be written to the file will
			-- appear after its old content otherwise.
			-- Try to recursively create its parent directory
			-- if it does not exist yet.
		local
			a_dirname: STRING
			a_pathname: STRING
			a_dir: KL_DIRECTORY
		do
			open_append
			if not is_open_write then
				a_pathname := file_system.canonical_pathname (name)
				a_dirname := file_system.dirname (a_pathname)
				create a_dir.make (a_dirname)
				if not a_dir.exists then
					a_dir.recursive_create_directory
					if a_dir.exists then
						open_append
					end
				end
			end
		end

	flush
			-- Flush buffered data to disk.
		do
			old_flush
		end

feature {NONE} -- Implementation

	old_flush
			-- Flush buffered data to disk.
			-- Note that there is no guarantee that the operating
			-- system will physically write the data to the disk.
			-- At least it will end up in the buffer cache,
			-- making the data visible to other processes.
		require
			is_open: not old_is_closed
		deferred
		end

	old_put_character (c: CHARACTER_8)
			-- Write `c' at current position.
		require
			extendible: extendible
		deferred
		end

	extendible: BOOLEAN
			-- May new items be added?
		deferred
		end

	old_put_string (s: READABLE_STRING_8)
			-- Write `s' at current position.
		require
			extendible: extendible
			non_void: s /= Void
		deferred
		end

	old_is_open_write: BOOLEAN
			-- Is file open for writing?
		deferred
		end

	old_open_write
			-- Open file in write-only mode;
			-- create it if it does not exist.
		require
			is_closed: old_is_closed
		deferred
		ensure
			exists: old_exists
			open_write: old_is_open_write
		end

	old_open_append
			-- Open file in append-only mode;
			-- create it if it does not exist.
		require
			is_closed: old_is_closed
		deferred
		ensure
			exists: old_exists
			open_append: is_open_append
		end

	is_open_append: BOOLEAN
			-- Is file open for appending?
		deferred
		end

end
