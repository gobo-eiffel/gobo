note
	description: "Sequential files, viewed as persistent sequences of characters"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class FILE inherit

	UNBOUNDED [CHARACTER_8]

	SEQUENCE [CHARACTER_8]
		undefine
			prune
		redefine
			off, append, replaceable
		end

	IO_MEDIUM
		rename
			handle as descriptor,
			handle_available as descriptor_available
		redefine
			read_stream_thread_aware,
			read_line_thread_aware
		end

	NATIVE_STRING_HANDLER

feature -- Initialization

	make (fn: STRING_8)
			-- Create file object with `fn' as file name.
		obsolete
			"Use any of the `make_...' routines instead to benefit from Unicode file names. [2017-05-31]"
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
		ensure
			file_named: internal_name = fn
			file_closed: is_closed
		end

	make_with_name (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name.
		require
			fn_exists: fn /= Void
			fn_not_empty: not fn.is_empty
		do
			set_name (fn)
			mode := Closed_file
			file_pointer := default_pointer
			create last_string.make_empty
		ensure
			file_named: internal_name = fn
			file_closed: is_closed
		end

	make_with_path (a_path: PATH)
			-- Create file object with `a_path' as path.
		require
			a_path_attached: a_path /= Void
			a_path_not_empty: not a_path.is_empty
		do
			set_path (a_path)
			mode := Closed_file
			file_pointer := default_pointer
			create last_string.make_empty
		ensure
			path_set: path.same_as (a_path)
			file_closed: is_closed
		end

	make_open_read (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file in read mode.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			open_read
		ensure
			file_named: internal_name = fn
			exists: exists
			open_read: is_open_read
		end

	make_open_write (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file for writing;
			-- create it if it does not exist.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			open_write
		ensure
			file_named: internal_name = fn
			exists: exists
			open_write: is_open_write
		end

	make_open_append (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file in append-only mode.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			open_append
		ensure
			file_named: internal_name = fn
			exists: exists
			open_append: is_open_append
		end

	make_open_read_write (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file for both reading and writing.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			open_read_write
		ensure
			file_named: internal_name = fn
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	make_create_read_write (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file for both reading and writing;
			-- create it if it does not exist.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			create_read_write
		ensure
			file_named: internal_name = fn
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	make_open_read_append (fn: READABLE_STRING_GENERAL)
			-- Create file object with `fn' as file name
			-- and open file for reading anywhere
			-- but writing at the end only.
			-- Create file if it does not exist.
		require
			string_exists: fn /= Void
			string_not_empty: not fn.is_empty
		do
			make_with_name (fn)
			open_read_append
		ensure
			file_named: internal_name = fn
			exists: exists
			open_read: is_open_read
			open_append: is_open_append
		end

	make_open_temporary
			-- Create a file object with a unique temporary file name,
			-- with read/write mode.
		do
			make_open_temporary_with_prefix ("eiftmp")
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	make_open_temporary_with_prefix (a_prefix: READABLE_STRING_GENERAL)
			-- Create a file object with a unique temporary file name with prefix `a_prefix`,
			-- with read/write mode.
		note
			EIS:"name=mkstemp", "src=http://man7.org/linux/man-pages/man3/mkstemp.3.html", "protocol=uri"
		local
			l_fd: INTEGER
		do
			set_name (a_prefix.as_string_32 + {STRING_32} "XXXXXX")
			l_fd := eif_temp_file (internal_name_pointer.item, is_plain_text)
			make_with_name (buffered_file_info.pointer_to_file_name_32 (internal_name_pointer.item))
			fd_open_read_write (l_fd)
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

feature -- Access

	path: PATH
			-- Associated path of Current.
		do
			create Result.make_from_pointer (internal_name_pointer.item)
		ensure
			entry_not_empty: not Result.is_empty
		end

	name: STRING
			-- File name as a STRING_8 instance. The value might be truncated
			-- from the original name used to create the current FILE instance.
		obsolete
			"Use `path.name' to ensure that Unicode filenames are not truncated. [2017-05-31]"
		do
			Result := internal_name.as_string_8
		ensure then
			name_not_empty: not Result.is_empty
		end

	item: CHARACTER_8
			-- Current item
		do
			read_character
			Result := last_character
			back
		end

	position: INTEGER
			-- Current cursor position.
		do
			if not is_closed then
				Result := file_tell (file_pointer)
			end
		end

	descriptor: INTEGER
			-- File descriptor as used by the operating system.
		require else
			file_opened: not is_closed
		do
			Result := file_fd (file_pointer)
			descriptor_available := True
		end

	descriptor_available: BOOLEAN

	separator: CHARACTER
			-- ASCII code of character following last word read

	file_pointer: POINTER
			-- File pointer as required in C

	file_info: FILE_INFO
			-- Collected information about the file.
		do
			set_buffer
			Result := buffered_file_info.twin
		end

	inode: INTEGER
			-- I-node number
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.inode
		end

	links: INTEGER
			-- Number of links on file
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.links
		end

	user_id: INTEGER
			-- User identification of owner
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.user_id
		end

	group_id: INTEGER
			-- Group identification of owner
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.group_id
		end

	protection: INTEGER
			-- Protection mode, in decimal value
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.protection
		end

	owner_name: STRING
			-- Name of owner
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.owner_name
		end

	date: INTEGER
			-- Time stamp (time of last modification)
		require
			file_exists: exists
		do
			Result := eif_file_date (internal_name_pointer.item)
		end

	access_date: INTEGER
			-- Time stamp of last access made to the inode.
		require
			file_exists: exists
		do
			Result := eif_file_access_date (internal_name_pointer.item)
		end

	retrieved: detachable ANY
			-- Retrieved object structure
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if content is not a stored Eiffel structure.
		do
			(create {MISMATCH_CORRECTOR}).mismatch_information.do_nothing
			Result := c_retrieved (descriptor)
		end

	null_path: PATH
			-- Null device path.
		note
			EIS: "name=Null Device", "src=https://en.wikipedia.org/wiki/Null_device", "protocol=uri"
		do
			create Result.make_from_string (null_name)
		ensure
			instance_free: class
		end

	null_name: STRING
			-- Null device name.
		note
			EIS: "name=Null Device", "src=https://en.wikipedia.org/wiki/Null_device", "protocol=uri"
		do
			if {PLATFORM}.is_windows then
				Result := "nul"
			elseif {PLATFORM}.is_vms then
				Result := "NL:"
			elseif {PLATFORM}.is_vxworks  then
				Result := "/null"
			else
					-- On Unix or Unix like systems.
				Result := "/dev/null"
			end
		ensure
			instance_free: class
		end

feature -- Measurement

	count: INTEGER
			-- Size in bytes (0 if no associated physical file)
		do
			if exists then
				if not is_open_write then
					set_buffer
					Result := buffered_file_info.size
				else
					Result := file_size (file_pointer)
				end
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor position?
		do
			Result := not is_closed and then (end_of_file or count = 0)
		end

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor position?
		do
			Result := is_closed
		end

	off: BOOLEAN
			-- Is there no item?
		do
			Result := (count = 0) or else is_closed or else end_of_file
		end

	end_of_file: BOOLEAN
			-- Has an EOF been detected?
		require
			opened: not is_closed
		do
			Result := file_feof (file_pointer)
		end

	exists: BOOLEAN
			-- Does physical file exist?
			-- (Uses effective UID.)
		do
			if is_closed then
				Result := file_exists (internal_name_pointer.item)
			else
				Result := True
			end
		ensure then
			unchanged_mode: mode = old mode
		end

	access_exists: BOOLEAN
			-- Does physical file exist?
			-- (Uses real UID.)
		do
			if is_closed then
				Result := file_access (internal_name_pointer.item, 0)
			else
				Result := True
			end
		end

	path_exists: BOOLEAN
			-- Does physical file `name' exist without resolving
			-- symbolic links?
		do
			Result := file_path_exists (internal_name_pointer.item)
		ensure then
			unchanged_mode: mode = old mode
		end

	is_readable: BOOLEAN
			-- Is file readable?
			-- (Checks permission for effective UID.)
		do
			set_buffer
			Result := buffered_file_info.is_readable
		end

	is_writable: BOOLEAN
			-- Is file writable?
			-- (Checks write permission for effective UID.)
		do
			set_buffer
			Result := buffered_file_info.is_writable
		end

	is_executable: BOOLEAN
			-- Is file executable?
			-- (Checks execute permission for effective UID.)
		do
			set_buffer
			Result := buffered_file_info.is_executable
		end

	is_creatable: BOOLEAN
			-- Is file creatable in parent directory?
			-- (Uses effective UID to check that parent is writable
			-- and file does not exist.)
		do
			Result := file_creatable (internal_name_pointer.item, internal_name_pointer.count)
		end

	is_plain: BOOLEAN
			-- Is file a plain file?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_plain
		end

	is_device: BOOLEAN
			-- Is file a device?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_device
		end

	is_directory: BOOLEAN
			-- Is file a directory?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_directory
		end

	is_symlink: BOOLEAN
			-- Is file a symbolic link?
		require
			file_exists: path_exists
		local
			l_buffer: like buffered_file_info
			l_is_following_symbolic_links: BOOLEAN
		do
			l_buffer := buffered_file_info
			l_is_following_symbolic_links := l_buffer.is_following_symlinks
			l_buffer.set_is_following_symlinks (False)
			l_buffer.fast_update (internal_name, internal_name_pointer)
			Result := l_buffer.is_symlink
			l_buffer.set_is_following_symlinks (l_is_following_symbolic_links)
		end

	is_fifo: BOOLEAN
			-- Is file a named pipe?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_fifo
		end

	is_socket: BOOLEAN
			-- Is file a named socket?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_socket
		end

	is_block: BOOLEAN
			-- Is file a block special file?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_block
		end

	is_character: BOOLEAN
			-- Is file a character special file?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_character
		end

	is_setuid: BOOLEAN
			-- Is file setuid?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_setuid
		end

	is_setgid: BOOLEAN
			-- Is file setgid?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_setgid
		end

	is_sticky: BOOLEAN
			-- Is file sticky (for memory swaps)?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_sticky
		end

	is_owner: BOOLEAN
			-- Is file owned by effective UID?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_owner
		end

	is_access_readable: BOOLEAN
			-- Is file readable by real UID?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_access_readable
		end

	is_access_writable: BOOLEAN
			-- Is file writable by real UID?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_access_writable
		end

	is_access_executable: BOOLEAN
			-- Is file executable by real UID?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_access_executable
		end

	is_access_owner: BOOLEAN
			-- Is file owned by real UID?
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.is_access_owner
		end

	file_readable: BOOLEAN
			-- Is there a current item that may be read?
		do
			Result := (mode >= Read_write_file or mode = Read_file)
						and readable
		end

	is_closed: BOOLEAN
			-- Is file closed?
		do
			Result := mode = Closed_file
		end

	is_open_read: BOOLEAN
			-- Is file open for reading?
		do
			Result := mode = Read_file or else
				mode = Read_write_file or else
				mode = Append_read_file
		end

	is_open_write: BOOLEAN
			-- Is file open for writing?
		do
			Result := mode = Write_file or else
				mode = Read_write_file or else
				mode = Append_read_file or else
				mode = Append_file
		end

	is_open_append: BOOLEAN
			-- Is file open for appending?
		do
			Result := mode = Append_file or else
				mode = Append_read_file
		end

	file_writable: BOOLEAN
			-- Is there a current item that may be modified?
		do
			Result := mode >= Write_file
		end

	extendible: BOOLEAN
			-- May new items be added?
		do
			Result := mode >= Write_file
		end

	replaceable: BOOLEAN
			-- <Precursor>
		do
			Result := False
		end

	file_prunable: BOOLEAN
			-- May items be removed?
		obsolete
			"Use `prunable' instead. [2017-05-31]"
		do
		end

	full: BOOLEAN = False
			-- Is structure filled to capacity?

	prunable: BOOLEAN
			-- Is there an item to be removed?
		do
		end

feature -- Comparison

	same_file (fn: READABLE_STRING_GENERAL): BOOLEAN
			-- Is current file the same as `a_filename'?
		require
			fn_not_void: fn /= Void
			fn_not_empty: not fn.is_empty
		do
			Result := path.is_same_file_as (create {PATH}.make_from_string (fn))
		end

feature -- Status setting

	open_read
			-- Open file in read-only mode.
		require
			is_closed: is_closed
		do
			file_pointer := file_open (internal_name_pointer.item, 0)
			mode := Read_file
		ensure
			exists: exists
			open_read: is_open_read
		end

	open_write
			-- Open file in write-only mode;
			-- create it if it does not exist.
		do
			file_pointer := file_open (internal_name_pointer.item, 1)
			mode := Write_file
		ensure
			exists: exists
			open_write: is_open_write
		end

	open_append
			-- Open file in append-only mode;
			-- create it if it does not exist.
		require
			is_closed: is_closed
		do
			file_pointer := file_open (internal_name_pointer.item, 2)
			mode := Append_file
		ensure
			exists: exists
			open_append: is_open_append
		end

	open_read_write
			-- Open file in read and write mode.
		require
			is_closed: is_closed
		do
			file_pointer := file_open (internal_name_pointer.item, 3)
			mode := Read_write_file
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	create_read_write
			-- Open file in read and write mode;
			-- create it if it does not exist.
		require
			is_closed: is_closed
		do
			file_pointer := file_open (internal_name_pointer.item, 4)
			mode := Read_write_file
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	open_read_append
			-- Open file in read and write-at-end mode;
			-- create it if it does not exist.
		require
			is_closed: is_closed
		do
			file_pointer := file_open (internal_name_pointer.item, 5)
			mode := Append_read_file
		ensure
			exists: exists
			open_read: is_open_read
			open_append: is_open_append
		end

	fd_open_read (fd: INTEGER)
			-- Open file of descriptor `fd' in read-only mode.
		do
			file_pointer := file_dopen (fd, 0)
			mode := Read_file
		ensure
			exists: exists
			open_read: is_open_read
		end

	fd_open_write (fd: INTEGER)
			-- Open file of descriptor `fd' in write mode.
		do
			file_pointer := file_dopen (fd, 1)
			mode := Write_file
		ensure
			exists: exists
			open_write: is_open_write
		end

	fd_open_append (fd: INTEGER)
			-- Open file of descriptor `fd' in append mode.
		do
			file_pointer := file_dopen (fd, 2)
			mode := Append_file
		ensure
			exists: exists
			open_append: is_open_append
		end

	fd_open_read_write (fd: INTEGER)
			-- Open file of descriptor `fd' in read-write mode.
		do
			file_pointer := file_dopen (fd, 3)
			mode := Read_write_file
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	fd_open_read_append (fd: INTEGER)
			-- Open file of descriptor `fd'
			-- in read and write-at-end mode.
		do
			file_pointer := file_dopen (fd, 5)
			mode := Append_read_file
		ensure
			exists: exists
			open_read: is_open_read
			open_append: is_open_append
		end

	reopen_read (fname: READABLE_STRING_GENERAL)
			-- Reopen in read-only mode with file of name `fname';
			-- create file if it does not exist.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 0, file_pointer)
			mode := Read_file
		ensure
			exists: exists
			open_read: is_open_read
		end

	reopen_write (fname: READABLE_STRING_GENERAL)
			-- Reopen in write-only mode with file of name `fname';
			-- create file if it does not exist.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 1, file_pointer)
			mode := Write_file
		ensure
			exists: exists
			open_write: is_open_write
		end

	reopen_append (fname: READABLE_STRING_GENERAL)
			-- Reopen in append mode with file of name `fname';
			-- create file if it does not exist.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 2, file_pointer)
			mode := Append_file
		ensure
			exists: exists
			open_append: is_open_append
		end

	reopen_read_write (fname: READABLE_STRING_GENERAL)
			-- Reopen in read-write mode with file of name `fname'.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 3, file_pointer)
			mode := Read_write_file
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	recreate_read_write (fname: READABLE_STRING_GENERAL)
			-- Reopen in read-write mode with file of name `fname';
			-- create file if it does not exist.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 4, file_pointer)
			mode := Read_write_file
		ensure
			exists: exists
			open_read: is_open_read
			open_write: is_open_write
		end

	reopen_read_append (fname: READABLE_STRING_GENERAL)
			-- Reopen in read and write-at-end mode with file
			-- of name `fname'; create file if it does not exist.
		require
			is_open: not is_closed
			valid_name: fname /= Void
		do
			set_name (fname)
			file_pointer := file_reopen (internal_name_pointer.item, 5, file_pointer)
			mode := Append_read_file
		ensure
			exists: exists
			open_read: is_open_read
			open_append: is_open_append
		end

	close
			-- Close file.
		do
			file_close (file_pointer)
			mode := Closed_file
			file_pointer := default_pointer
			descriptor_available := False
		ensure then
			is_closed: is_closed
		end

feature -- Cursor movement

	start
			-- Go to first position.
		require else
			file_opened: not is_closed
		do
			file_go (file_pointer, 0)
		end

	finish
			-- Go to last position.
		require else
			file_opened: not is_closed
		do
			file_recede (file_pointer, 0)
		end

	forth
			-- Go to next position.
		require else
			file_opened: not is_closed
		do
			file_move (file_pointer, 1)
				-- Try to trigger EOF.
				-- Do not use `file_move' it does not trigger EOF.
			file_gc (file_pointer).do_nothing
			if not end_of_file then
				back
			end
		end

	back
			-- Go back one position.
		do
			file_move (file_pointer, - 1)
		end

	move (offset: INTEGER)
			-- Advance by `offset' from current location.
		require
			file_opened: not is_closed
		do
			file_move (file_pointer, offset)
		end

	go (abs_position: INTEGER)
			-- Go to the absolute `position'.
			-- (New position may be beyond physical length.)
		require
			file_opened: not is_closed
			non_negative_argument: abs_position >= 0
		do
			file_go (file_pointer, abs_position)
		end

	recede (abs_position: INTEGER)
			-- Go to the absolute `position' backwards,
			-- starting from end of file.
		require
			file_opened: not is_closed
			non_negative_argument: abs_position >= 0
		do
			file_recede (file_pointer, abs_position)
		end

	next_line
			-- Move to next input line.
		require
			is_readable: file_readable
		do
			file_tnil (file_pointer)
		end

feature -- Iteration

	new_cursor: FILE_ITERATION_CURSOR
			-- <Precursor>
		do
			create Result.make_open_read (internal_name_pointer)
		end

feature -- Element change

	extend (v: like item)
			-- Include `v' at end.
		do
			put_character (v)
		end

	flush
			-- Flush buffered data to disk.
			-- Note that there is no guarantee that the operating
			-- system will physically write the data to the disk.
			-- At least it will end up in the buffer cache,
			-- making the data visible to other processes.
		require
			is_open: not is_closed
		do
			file_flush (file_pointer)
		end

	link (fn: READABLE_STRING_GENERAL)
			-- Link current file to `fn'.
			-- `fn' must not already exist.
		require
			file_exists: exists
			-- `fn' does not exist already
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := buffered_file_info.file_name_to_pointer (fn, Void)
			file_link (internal_name_pointer.item, l_ptr.item)
		end

	append (f: like Current)
			-- Append a copy of the contents of `f'.
		require else
			target_is_closed: is_closed
			source_is_closed: f.is_closed
		do
				-- Open in append mode.
			open_append
				-- Open `f' in read mode.
			f.open_read
				-- Append contents of `f'.
			file_append (file_pointer, f.file_pointer, f.count)
				-- Close both files.
			close
			f.close
		ensure then
			new_count: count = old count + f.count
			files_closed: f.is_closed and is_closed
		end

	put_integer, putint (i: INTEGER)
			-- Write `i' at current position.
		deferred
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write `b' at current position.
		deferred
		end

	put_real, putreal (r: REAL_32)
			-- Write `r' at current position.
		deferred
		end

	put_double, putdouble (d: REAL_64)
			-- Write `d' at current position.
		deferred
		end

	put_string, putstring (s: READABLE_STRING_8)
			-- Write `s' at current position.
		local
			n: like {READABLE_STRING_8}.count
			ext_s: ANY
		do
			n := s.count
			if n > 0 then
				ext_s := s.area
				file_ps (file_pointer, $ext_s, n)
			end
		end

	put_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Put data of length `nb_bytes' pointed by `start_pos' index in `p' at
			-- current position.
		do
			file_ps (file_pointer, p.item + start_pos, nb_bytes)
		end

	put_character, putchar (c: CHARACTER_8)
			-- Write `c' at current position.
		do
			file_pc (file_pointer, c)
		end

	put_new_line, new_line
			-- Write a new line character at current position.
		do
			file_tnwl (file_pointer)
		end

	stamp (time: INTEGER)
			-- Stamp with `time' (for both access and modification).
		require
			file_exists: exists
		do
			file_utime (internal_name_pointer.item, time, 2)
		ensure
			date_updated: date = time	-- But race condition possible
		end

	set_access (time: INTEGER)
			-- Stamp with `time' (access only).
		require
			file_exists: exists
		do
			file_utime (internal_name_pointer.item, time, 0)
		ensure
			acess_date_updated: access_date = time	-- But race condition might occur
			date_unchanged: date = old date	-- Modulo a race condition
		end

	set_date (time: INTEGER)
			-- Stamp with `time' (modification time only).
		require
			file_exists: exists
		do
			file_utime (internal_name_pointer.item, time, 1)
		ensure
			access_date_unchanged: access_date = old access_date	-- But race condition might occur
			date_updated: date = time					-- Modulo a race condition
		end

	change_name (new_name: STRING)
			-- Change file name to `new_name'.
		obsolete
			"Use `rename_file' instead. [2017-05-31]"
		require
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
			file_exists: exists
		do
			rename_file (new_name)
		ensure
			name_changed: internal_name = new_name
		end

	rename_file (new_name: READABLE_STRING_GENERAL)
			-- Change file name to `new_name'
		require
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
			file_exists: exists
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := buffered_file_info.file_name_to_pointer (new_name, Void)
			file_rename (internal_name_pointer.item, l_ptr.item)
			set_name (new_name)
		ensure
			name_changed: internal_name = new_name
		end

	rename_path (new_path: PATH)
			-- Change file name to `new_path'
		require
			new_path_not_void: new_path /= Void
			new_path_not_empty: not new_path.is_empty
			file_exists: exists
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := new_path.to_pointer
			file_rename (internal_name_pointer.item, l_ptr.item)
			set_path (new_path)
		ensure
			name_changed: internal_name.same_string (new_path.name)
		end

	add_permission (who, what: STRING)
			-- Add read, write, execute or setuid permission
			-- for `who' ('u', 'g' or 'o') to `what'.
		require
			-- `who @ 1 in {u, g, o}'
			-- For every `i' in 1 .. `what'.`count', `what' @ `i' in {w, r, x, s, t}'
			who_is_not_void: who /= Void
			what_is_not_void: what /= Void
			file_descriptor_exists: exists
		local
			ext_who, ext_what: ANY
		do
			ext_who := who.to_c
			ext_what := what.to_c
			file_perm (internal_name_pointer.item, $ext_who, $ext_what, 1)
		end

	remove_permission (who, what: STRING)
			-- Remove read, write, execute or setuid permission
			-- for `who' ('u', 'g' or 'o') to `what'.
		require
			-- `who @ 1 in {u, g, o}'
			-- For every `i' in 1 .. `what'.`count', `what' @ `i' in {w, r, x, s, t}'
			who_is_not_void: who /= Void
			what_is_not_void: what /= Void
			file_descriptor_exists: exists
		local
			ext_who, ext_what: ANY
		do
			ext_who := who.to_c
			ext_what := what.to_c
			file_perm (internal_name_pointer.item, $ext_who, $ext_what, 0)
		end

	change_mode (mask: INTEGER)
			-- Replace mode by `mask'.
		require
			file_exists: exists
		do
			file_chmod (internal_name_pointer.item, mask)
		end

	change_owner (new_owner_id: INTEGER)
			-- Change owner of file to `new_owner_id' found in
			-- system password file. On some systems this
			-- requires super-user privileges.
		require
			file_exists: exists
		do
			file_chown (internal_name_pointer.item, new_owner_id)
		end

	change_group (new_group_id: INTEGER)
			-- Change group of file to `new_group_id' found in
			-- system password file.
		require
			file_exists: exists
		do
			file_chgrp (internal_name_pointer.item, new_group_id)
		end

	change_date: INTEGER
			-- Time stamp of last change.
		require
			file_exists: exists
		do
			set_buffer
			Result := buffered_file_info.change_date
		end

	touch
			-- Update time stamp (for both access and modification).
		require
			file_exists: exists
		do
			file_touch (internal_name_pointer.item)
		ensure
			date_changed: date /= old date	-- Race condition nearly impossible
		end

	basic_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable within current system only.
		do
			c_basic_store (descriptor, $object)
		end

	general_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for same platform
			-- (machine architecture).
			--| This feature may use a visible name of a class written
			--| in the `visible' clause of the Ace file. This makes it
			--| possible to overcome class name clashes.
		do
			c_general_store (descriptor, $object)
		end

	independent_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for the same or other
			-- platform (machine architecture).
		do
			c_independent_store (descriptor, $object)
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		require else
			is_closed: is_closed
		do
			open_write
			close
		end

	delete
			-- Remove link with physical file.
			-- File does not physically disappear from the disk
			-- until no more processes reference it.
			-- I/O operations on it are still possible.
			-- A directory must be empty to be deleted.
		require
			exists: path_exists
		do
			file_unlink (internal_name_pointer.item)
		end

	reset (fn: READABLE_STRING_GENERAL)
			-- Change file name to `fn' and reset
			-- file descriptor and all information.
		require
			valid_file_name: fn /= Void
		do
			set_name (fn)
			if mode /= Closed_file then
				close
			end
			last_integer := 0
			last_real := 0.0
			last_double := 0.0
			last_character := '%U'
			last_string.wipe_out
		ensure
			file_renamed: internal_name = fn
			file_closed: is_closed
		end

	reset_path (fp: PATH)
			-- Change file name to `fp' and reset
			-- file descriptor and all information.
		require
			valid_file_name: fp /= Void
		do
			set_path (fp)
			if mode /= Closed_file then
				close
			end
			last_integer := 0
			last_real := 0.0
			last_double := 0.0
			last_character := '%U'
			last_string.wipe_out
		ensure
			file_closed: is_closed
		end

feature -- Input

	read_real, readreal, read_real_32
			-- Read a new real.
			-- Make result available in `last_real'.
		require else
			is_readable: file_readable
		deferred
		end

	read_double, readdouble, read_real_64
			-- Read a new double.
			-- Make result available in `last_double'.
		require else
			is_readable: file_readable
		deferred
		end

	read_character, readchar
			-- Read a new character.
			-- Make result available in `last_character'.
		require else
			is_readable: file_readable
		do
			last_character := file_gc (file_pointer)
		end

	read_integer, readint
			-- Read a new integer.
			-- Make result available in `last_integer'.
		require else
			is_readable: file_readable
		deferred
		end

	read_line, readline
			-- Read a string until new line or end of file.
			-- Make result available in `last_string'.
			-- New line will be consumed but not part of `last_string'.
		require else
			is_readable: file_readable
		local
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			str_area: ANY
			done: BOOLEAN
			l: like last_string
		do
			l := last_string
			from
				str_area := l.area
				str_cap := l.capacity
			until
				done
			loop
				read := read + file_gs (file_pointer, $str_area, str_cap, read)
				if read > str_cap then
						-- End of line not reached yet
						--|The string must be consistently set before
						--|resizing.
					l.set_count (str_cap)
					if str_cap < 2048 then
						l.grow (str_cap + 1024)
					else
							-- Increase capacity by `Growth_percentage' as
							-- defined in RESIZABLE.
						l.automatic_grow
					end
					str_cap := l.capacity
					read := read - 1		-- True amount of byte read
					str_area := l.area
				else
					l.set_count (read)
					done := True
				end
			end
		end

	read_line_thread_aware
			-- <Precursor>
		require else
			is_readable: file_readable
		local
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			done: BOOLEAN
			l: like last_string
			l_old_count, l_new_count: INTEGER
			l_buffer: like read_data_buffer
		do
			l := last_string
			l_buffer := read_data_buffer
			from
				l.wipe_out
				str_cap := l_buffer.capacity
			until
				done
			loop
				read := file_gs_ta (file_pointer, l_buffer.item, str_cap, 0)
				l_old_count := l.count
				l_new_count := l_old_count + read.min (str_cap)
				done := read <= str_cap
				l.grow (l_new_count)
				l.set_count (l_new_count)
				l_buffer.copy_to_string (l, 1, l_old_count + 1, read.min (str_cap))
			end
		end

	read_stream, readstream (nb_char: INTEGER)
			-- Read a string of at most `nb_char' bound characters
			-- or until end of file.
			-- Make result available in `last_string'.
		require else
			is_readable: file_readable
		local
			str_area: ANY
			l: like last_string
		do
			l := last_string
			l.grow (nb_char)
			str_area := l.area
			l.set_count (file_gss (file_pointer, $str_area, nb_char))
		end

	read_stream_thread_aware (nb_char: INTEGER)
			-- <Precursor>
		require else
			is_readable: file_readable
		local
			new_count: INTEGER
			l_buffer: like read_data_buffer
			l_str: like last_string
		do
			l_str := last_string
			l_buffer := read_data_buffer
			l_buffer.set_count (nb_char)
			new_count := file_gss_ta (file_pointer, l_buffer.item, nb_char)
			l_buffer.set_count (new_count)
			l_str.grow (new_count)
			l_str.set_count (new_count)
			l_buffer.read_string_into (l_str)
		end

	read_to_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Read at most `nb_bytes' bound bytes and make result
			-- available in `p' at position `start_pos'.
		require else
			p_not_void: p /= Void
			p_large_enough: p.count >= nb_bytes + start_pos
			is_readable: file_readable
		do
			bytes_read := file_gss (file_pointer, p.item + start_pos, nb_bytes)
		end

	read_to_string (a_string: STRING_8; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		require
			is_readable: file_readable
			not_end_of_file: not end_of_file
			a_string_not_void: a_string /= Void
			valid_position: a_string.valid_index (pos)
			nb_large_enough: nb > 0
			nb_small_enough: nb <= a_string.count - pos + 1
		deferred
		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb
			character_read: not end_of_file implies Result > 0
		end

	read_word, readword
			-- Read a string, excluding white space and stripping
			-- leading white space.
			-- Make result available in `last_string'.
			-- White space characters are: blank, new_line, tab,
			-- vertical tab, formfeed, end of file.
		require
			is_readable: file_readable
		local
			str_area: ANY
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			l: like last_string
		do
			l := last_string
			from
				str_area := l.area
				str_cap := l.capacity
			until
				read > str_cap
			loop
				read := read +
					file_gw (file_pointer, $str_area, str_cap, read)
				if read > str_cap then
						-- End of word not reached yet.
					if str_cap < 2048 then
						l.grow (str_cap + 1024)
					else
							-- Increase capacity by `Growth_percentage' as
							-- defined in RESIZABLE.
						l.automatic_grow
					end
					str_area := l.area
					str_cap := l.capacity
					read := read - 1		-- True amount of byte read
				else
					l.set_count (read)
					read := str_cap + 1	-- End of loop
				end
			end
			separator := file_lh (file_pointer) -- Look ahead
		ensure
			last_string_not_void: last_string /= Void
		end

	read_word_thread_aware
			-- Read a string, excluding white space and stripping
			-- leading white space.
			-- Make result available in `last_string'.
			-- White space characters are: blank, new_line, tab,
			-- vertical tab, formfeed, end of file.
		require
			is_readable: file_readable
		local
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			done: BOOLEAN
			l: like last_string
			l_old_count, l_new_count: INTEGER
			l_buffer: like read_data_buffer
		do
			l := last_string
			l_buffer := read_data_buffer
			from
				l.wipe_out
				str_cap := l_buffer.capacity
			until
				done
			loop
				read := file_gw_ta (file_pointer, l_buffer.item, str_cap, 0)
				l_old_count := l.count
				l_new_count := l_old_count + read.min (str_cap)
				done := read <= str_cap
				l.grow (l_new_count)
				l.set_count (l_new_count)
				l_buffer.copy_to_string (l, 1, l_old_count + 1, read.min (str_cap))
			end
			separator := file_lh (file_pointer) -- Look ahead
		ensure
			last_string_not_void: last_string /= Void
		end

feature -- Convenience

	copy_to (file: like Current)
			-- Copy content of current from current cursor
			-- position to end of file into `file' from
			-- current cursor position of `file'.
		require
			file_not_void: file /= Void
			file_is_open_write: file.is_open_write
			current_is_open_read: is_open_read
		local
			l_modulo, l_read, nb: INTEGER
			l_pos: INTEGER
			l_old_last_string: like last_string
		do
			from
				l_read := 0
				nb := count
				l_modulo := 51200
				l_old_last_string := last_string
				create last_string.make (l_modulo)
				l_pos := position
				if l_pos /= 0 then
					go (0)
				end
			until
				l_read >= nb
			loop
				read_stream (l_modulo)
				file.put_string (last_string)
				l_read := l_read + l_modulo
			end
				-- Restore previous status of Current file.
			if l_pos /= 0 then
				go (l_pos)
			end
			last_string := l_old_last_string
		end

feature {FILE_ITERATION_CURSOR} -- Iteration

	file_open (fname: POINTER; how: INTEGER): POINTER
			-- File pointer for file `fname', in mode `how'.
		external
			"C signature (EIF_FILENAME, int): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_open"
		end

	file_close (file: POINTER)
			-- Close `file'.
		external
			"C signature (FILE *) use %"eif_file.h%""
		alias
			"eif_file_close"
		end

feature {NONE} -- Implementation

	internal_name: READABLE_STRING_GENERAL
			-- Store the name of the file as it was given to us by the user
			-- to avoid conversion on storing as it is not necessary.

	internal_name_pointer: MANAGED_POINTER
			-- File system specific encoding of `internal_name'.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.
		do
			if attached internal_detachable_name_pointer as l_ptr then
				Result := l_ptr
			else
					-- This is never True because `internal_detachable_name_pointer' is set during the creation
					-- of the FILE object.
				check internal_name_pointer_set: False then end
			end
		end

	internal_detachable_name_pointer: detachable MANAGED_POINTER note option: stable, transient attribute end
			-- File system specific encoding of `internal_name'.
			-- Typically a UTF-16 sequence on Windows, a UTF-8 sequence on Unix.

	set_name (a_name: READABLE_STRING_GENERAL)
			-- Set `name' with `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			internal_name := a_name
			internal_detachable_name_pointer := buffered_file_info.file_name_to_pointer (a_name, internal_detachable_name_pointer)
		ensure
			name_set: internal_name = a_name
		end

	set_path (a_path: PATH)
			-- Set `internal_name_pointer' with a content matching `a_path'.
		require
			a_path_not_void: a_path /= Void
		do
				-- In the case of `a_path' being a mixed-encoding, `internal_name' holds
				-- an encoded value of the actual path but not equal.
			internal_name := a_path.name
				-- Create a matching path.
			internal_detachable_name_pointer := a_path.to_pointer
		ensure
			path_set: path.same_as (a_path)
		end

	create_last_string (a_min_size: INTEGER)
			-- Create new instance of `last_string' with a least `a_min_size'
			-- as capacity.
		obsolete
			"Implementors should create `last_string' directly. [2017-05-31]"
		require
			last_string_void: last_string = Void
			a_min_size_non_negative: a_min_size >= 0
		do
			create last_string.make (default_last_string_size.max (a_min_size))
		ensure
			last_string_attached: last_string /= Void
			capacity_set: attached last_string as l and then l.capacity >= a_min_size
		end

	default_last_string_size: INTEGER = 256
			-- Default size for creating `last_string'

	true_string: STRING
			-- Character string "true"
		once
			Result := "True"
		end

	false_string: STRING
			-- Character string "false"
		once
			Result := "False"
		end

	buffered_file_info: FILE_INFO
			-- Information about the file.
		once
			create Result.make
		end

	read_data_buffer: C_STRING
			-- Buffer to read data in a thread aware context.
		once
			create Result.make_empty (default_last_string_size)
		ensure
			read_data_buffer_not_void: Result /= Void
		end

	set_buffer
			-- Resynchronizes information on file
		require
			file_exists: exists
		do
			buffered_file_info.fast_update (internal_name, internal_name_pointer)
		end

	file_link (from_name, to_name: POINTER)
			-- Link `to_name' to `from_name'
		external
			"C signature (EIF_FILENAME, EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_link"
		end

	file_unlink (fname: POINTER)
			-- Delete file `fname'.
		external
			"C signature (EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_unlink"
		end

	file_dopen (fd, how: INTEGER): POINTER
			-- File pointer for file of descriptor `fd' in mode `how'
			-- (which must fit the way `fd' was obtained).
		external
			"C signature (int, int): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_dopen"
		end

	file_reopen (fname: POINTER; how: INTEGER; file: POINTER): POINTER
			-- File pointer to `file', reopened to have new name `fname'
			-- in a mode specified by `how'.
		external
			"C signature (EIF_FILENAME, int, FILE *): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_reopen"
		end

	file_flush (file: POINTER)
			-- Flush `file'.
		external
			"C signature (FILE *) use %"eif_file.h%""
		alias
			"eif_file_flush"
		end

	file_fd (file: POINTER): INTEGER
			-- Operating system's file descriptor
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_fd"
		end

	file_gc (file: POINTER): CHARACTER_8
			-- Access the next character
		external
			"C blocking signature (FILE *): EIF_CHARACTER use %"eif_file.h%""
		alias
			"eif_file_gc"
		end

	file_gs (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- `a_string' updated with characters read from `file'
			-- until new line, with `begin' characters already read.
			-- If it does not fit, result is `length' - `begin' + 1.
			-- If it fits, result is number of characters read.
		external
			"C signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gs"
		end

	file_gss (file: POINTER; a_string: POINTER; length: INTEGER): INTEGER
			-- Read min (`length', remaining bytes in file) characters
			-- into `a_string'. If it does not fit, result is `length' + 1.
			-- Otherwise, result is the number of characters read.
		external
			"C signature (FILE *, char *, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gss"
		end

	file_gw (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- Read a string excluding white space and stripping
			-- leading white space from `file' into `a_string'.
			-- White space characters are: blank, new_line,
			-- tab, vertical tab, formfeed or end of file.
			-- If it does not fit, result is `length' - `begin' + 1,
			-- otherwise result is number of characters read.
		external
			"C signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gw"
		end

	file_gs_ta (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- Same as `file_gs' but it won't prevent garbage collection from occurring
			-- while blocked waiting for data.			
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gs"
		end

	file_gss_ta (file: POINTER; a_string: POINTER; length: INTEGER): INTEGER
			-- Same as `file_gss' but it won't prevent garbage collection from occurring
			-- while blocked waiting for data.			

		external
			"C blocking signature (FILE *, char *, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gss"
		end

	file_gw_ta (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- Same as `file_gw' but it won't prevent garbage collection from occurring
			-- while blocked waiting for data.			
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gw"
		end

	file_lh (file: POINTER): CHARACTER
			-- Look ahead in `file' and find out the value of the next
			-- character. Do not read over character.
		external
			"C signature (FILE *): EIF_CHARACTER use %"eif_file.h%""
		alias
			"eif_file_lh"
		end

	file_size (file: POINTER): INTEGER
			-- Size of `file'
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_size"
		end

	file_tnil (file: POINTER)
			-- Read upto next input line.
		external
			"C signature (FILE *) use %"eif_file.h%""
		alias
			"eif_file_tnil"
		end

	file_tell (file: POINTER): INTEGER
			-- Current cursor position in file.
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_tell"
		end

	file_touch (fname: POINTER)
			-- Touch file `fname'.
		external
			"C signature (EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_touch"
		end

	file_rename (old_name, new_name: POINTER)
			-- Change file name from `old_name' to `new_name'.
		external
			"C signature (EIF_FILENAME, EIF_FILENAME) use %"eif_file.h%""
		alias
			"eif_file_rename"
		end

	file_perm (fname, who, what: POINTER; flag: INTEGER)
			-- Change permissions for `fname' to `who' and `what'.
			-- `flag' = 1 -> add permissions,
			-- `flag' = 0 -> remove permissions.
		external
			"C signature (EIF_FILENAME, char *, char *, int) use %"eif_file.h%""
		alias
			"eif_file_perm"
		end

	file_chmod (fname: POINTER; mask: INTEGER)
			-- Change mode of `fname' to `mask'.
		external
			"C signature (EIF_FILENAME, int) use %"eif_file.h%""
		alias
			"eif_file_chmod"
		end

	file_chown (fname: POINTER; new_owner: INTEGER)
			-- Change owner of `fname' to `new_owner'
		external
			"C signature (EIF_FILENAME, int) use %"eif_file.h%""
		alias
			"eif_file_chown"
		end

	file_chgrp (fname: POINTER; new_group: INTEGER)
			-- Change group of `fname' to `new_group'
		external
			"C signature (EIF_FILENAME, int) use %"eif_file.h%""
		alias
			"eif_file_chgrp"
		end

	file_utime (fname: POINTER; time, how: INTEGER)
			-- Set access, modification time or both (`how' = 0,1,2) on
			-- `fname', using `time' as time stamp.
		external
			"C signature (EIF_FILENAME, int, int) use %"eif_file.h%""
		alias
			"eif_file_utime"
		end

	file_tnwl (file: POINTER)
			-- Print a new-line to `file'.
		external
			"C signature (FILE *) use %"eif_file.h%""
		alias
			"eif_file_tnwl"
		end

	file_append (file, from_file: POINTER; length: INTEGER)
			-- Append a copy of `from_file' to `file'
		external
			"C signature (FILE *, FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_append"
		end

	file_ps (file: POINTER; a_string: POINTER; length: INTEGER)
			-- Print `a_string' to `file'.
		external
			"C signature (FILE *, char *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_ps"
		end

	file_pc (file: POINTER; c: CHARACTER)
			-- Put `c' to end of `file'.
		external
			"C signature (FILE *, EIF_CHARACTER) use %"eif_file.h%""
		alias
			"eif_file_pc"
		end

	file_go (file: POINTER; abs_position: INTEGER)
			-- Go to absolute `position', originated from start.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_go"
		end

	file_recede (file: POINTER; abs_position: INTEGER)
			-- Go to absolute `position', originated from end.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_recede"
		end

	file_move (file: POINTER; offset: INTEGER)
			-- Move file pointer by `offset'.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_move"
		end

	file_feof (file: POINTER): BOOLEAN
			-- End of file?
		external
			"C signature (FILE *): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_feof"
		end

	file_exists (fname: POINTER): BOOLEAN
			-- Does `fname' exist.
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_exists"
		end

	file_path_exists (fname: POINTER): BOOLEAN
			-- Does `fname' exist.
		external
			"C signature (EIF_FILENAME): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_path_exists"
		end

	file_access (fname: POINTER; which: INTEGER): BOOLEAN
			-- Perform access test `which' on `fname' using real UID.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_access"
		end

	file_creatable (fname: POINTER; n: INTEGER): BOOLEAN
			-- Is `fname' with `n' bytes creatable.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_BOOLEAN use %"eif_file.h%""
		alias
			"eif_file_creatable"
		end

	c_retrieved (file_handle: INTEGER): detachable ANY
			-- Object structured retrieved from file of pointer
			-- `file_ptr'
		external
			"C use %"eif_retrieve.h%""
		alias
			"eretrieve"
		end

	c_basic_store (file_handle: INTEGER; object: POINTER)
			-- Store object structure reachable form current object
			-- in file pointer `file_ptr'.
		external
			"C signature (EIF_INTEGER, EIF_REFERENCE) use %"eif_store.h%""
		alias
			"estore"
		end

	c_general_store (file_handle: INTEGER; object: POINTER)
			-- Store object structure reachable form current object
			-- in file pointer `file_ptr'.
		external
			"C signature (EIF_INTEGER, EIF_REFERENCE) use %"eif_store.h%""
		alias
			"eestore"
		end

	c_independent_store (file_handle: INTEGER; object: POINTER)
			-- Store object structure reachable form current object
			-- in file pointer `file_ptr'.
		external
			"C signature (EIF_INTEGER, EIF_REFERENCE) use %"eif_store.h%""
		alias
			"sstore"
		end

	eif_file_date (a_path: POINTER): INTEGER
			-- Modification date of file named `a_path'.
		external
			"C signature (EIF_FILENAME): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_date"
		end

	eif_file_access_date (a_path: POINTER): INTEGER
			-- Access date of a file named `a_path'.
		external
			"C signature (EIF_FILENAME): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_access_date"
		end

	eif_temp_file (a_name_template: POINTER; a_text_mode: BOOLEAN): INTEGER
			-- Generate a temporary file and return an file descriptor to the file.
			-- `a_name_template`: pattern used to create the temporary file.
			-- `a_text_mode`:, if text mode is True, the temporary file is created in text mode,
			-- otherwise in binary mode.
		external
			"C signature (EIF_FILENAME, EIF_BOOLEAN): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_mkstemp"
		end

feature {NONE} -- Inapplicable

	go_to (r: CURSOR)
			-- Move to position marked `r'.
		do
		end

	replace (v: like item)
			-- Replace current item by `v'.
		do
		end

	remove
			-- Remove current item.
		do
		end

	prune (v: like item)
			-- Remove an occurrence of `v' if any.
		do
		ensure then
			count <= old count
		end

feature {FILE} -- Implementation

	mode: INTEGER
			-- Input-output mode

	Closed_file: INTEGER = 0
	Read_file: INTEGER = 1
	Write_file: INTEGER	= 2
	Append_file: INTEGER = 3
	Read_Write_file: INTEGER = 4
	Append_Read_file: INTEGER = 5

	set_read_mode
			-- Define file mode as read.
		do
			mode := Read_file
		end

	set_write_mode
			-- Define file mode as write.
		do
			mode := Write_file
		end

invariant

	valid_mode: Closed_file <= mode and mode <= Append_read_file
	name_exists: internal_name /= Void
	name_not_empty: not internal_name.is_empty

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
