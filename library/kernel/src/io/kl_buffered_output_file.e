note

	description:

	"[
		Output files containing extended ASCII characters
		(8-bit code between 0 and 255), with buffer.
	]"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2017-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_BUFFERED_OUTPUT_FILE

inherit

	KL_OUTPUT_FILE
		redefine
			make,
			reset,
			put_character,
			put_string,
			open_write,
			open_append,
			recursive_open_write,
			recursive_open_append,
			flush,
			close
		select
			make
		end

	KL_OUTPUT_FILE
		rename
			make as non_buffered_make
		export
			{NONE} all
		redefine
			reset,
			put_character,
			put_string,
			open_write,
			open_append,
			recursive_open_write,
			recursive_open_append,
			flush,
			close
		end

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new file named `a_name'.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			make_with_buffer_size (a_name, default_buffer_capacity)
		end

	make_with_buffer_size (a_name: like name; a_buffer_size: INTEGER)
			-- Create a new file named `a_name'.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
			-- Use `a_buffer_size' for the size of the buffer.
		require
			a_name_not_void: a_name /= Void
			a_buffer_size_not_negative: a_buffer_size >= 0
		local
			l_buffer: STRING_8
		do
			create l_buffer.make (a_buffer_size)
			make_with_buffer (a_name, l_buffer)
		ensure
			name_set: name = a_name
			buffer_size_set: buffer.capacity = a_buffer_size
			is_closed: is_closed
		end

	make_with_buffer (a_name: like name; a_buffer: STRING_8)
			-- Create a new file named `a_name'.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
			-- Use `a_buffer' as buffer.
		require
			a_name_not_void: a_name /= Void
			a_buffer_not_void: a_buffer /= Void
		do
			non_buffered_make (a_name)
			buffer := a_buffer
		ensure
			name_set: name = a_name
			buffer_set: buffer = a_buffer
			is_closed: is_closed
		end

feature -- Initialization

	reset (a_name: like name)
			-- Reuse current Eiffel object memory to
			-- represent a new file system entry.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			make_with_buffer (a_name, buffer)
		end

feature -- Output

	put_character (c: CHARACTER_8)
			-- Write `c' to output file, or to its buffer if not full yet.
		local
			l_buffer: like buffer
			l_capacity: INTEGER
		do
			l_buffer := buffer
			l_capacity := l_buffer.capacity
			if l_capacity = 0 then
				old_put_character (c)
			else
				if l_buffer.count = l_capacity then
					old_put_string (l_buffer)
					l_buffer.wipe_out
				end
				l_buffer.append_character (c)
			end
		end

	put_string (a_string: READABLE_STRING_8)
			-- Write `a_string' to output file, or to its buffer if not full yet.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		local
			l_string: READABLE_STRING_8
			l_buffer: like buffer
			l_capacity: INTEGER
			l_string_count: INTEGER
		do
			l_buffer := buffer
			l_capacity := l_buffer.capacity
			l_string := STRING_.as_readable_string_8_no_uc_string (a_string)
			l_string_count := l_string.count
			if l_capacity < l_buffer.count + l_string_count then
				old_put_string (l_buffer)
				l_buffer.wipe_out
			end
			if l_string_count < l_capacity then
				l_buffer.append_string (l_string)
			else
				old_put_string (l_string.to_string_8)
			end
		end

feature -- Basic operations

	open_write
			-- Open current file in write-only mode if
			-- it can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or its
			-- old content is removed otherwise.
		do
			buffer.wipe_out
			precursor
		end

	open_append
			-- Open current file in append mode if it
			-- can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or the
			-- data which will be written to the file will
			-- appear after its old content otherwise.
		do
			buffer.wipe_out
			precursor
		end

	recursive_open_write
			-- Open current file in write-only mode if
			-- it can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or its
			-- old content is removed otherwise. Try to
			-- recursively create its parent directory
			-- if it does not exist yet.
		do
			buffer.wipe_out
			precursor
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
		do
			buffer.wipe_out
			precursor
		end

	flush
			-- Flush buffered data to disk.
		do
			old_put_string (buffer)
			buffer.wipe_out
			precursor
		end

	close
			-- Close current file if it is closable,
			-- let it open otherwise.
		do
			old_put_string (buffer)
			buffer.wipe_out
			precursor
		end

feature {NONE} -- Implementation

	buffer: STRING_8
			-- Buffer

	default_buffer_capacity: INTEGER = 10_000
			-- Default capacity for `buffer'

invariant

	buffer_not_void: buffer /= Void

end
