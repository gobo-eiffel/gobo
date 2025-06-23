note

	description:

		"Files used to read Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_INPUT_FILE

inherit

	ANY

	UT_IMPORTED_FORMATTERS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_filename: STRING)
			-- Create a new storable input file named `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			filename := a_filename
			create input_file.make_with_name (a_filename)
			create buffer.make (initial_buffer_size)
			create error_handler.make_standard
		ensure
			filename_set: filename = a_filename
		end

feature -- Access

	filename: STRING
			-- Name of file

	error_handler: SB_ERROR_HANDLER
			-- Error handler

feature -- Status report

	is_open_read: BOOLEAN
			-- Is file open for reading?

feature -- Setting

	set_error_handler (a_error_handler: like error_handler)
			-- Set `error_handler' to `a_error_handler'.
		require
			a_error_handler_not_void: a_error_handler /= Void
		do
			error_handler := a_error_handler
		ensure
			error_handler_set: error_handler = a_error_handler
		end

feature -- Basic operations

	open_read
			-- Try to open current file.
			-- Set `is_open_read' to true is successful.
		require
			closed: not is_open_read
		local
			retried: BOOLEAN
		do
			if not retried then
				buffer_position := 0
				buffer_size := 0
				input_file.open_read
				is_open_read := True
			else
				is_open_read := False
				if not input_file.is_closed then
					input_file.close
				end
			end
		rescue
			if not retried then
				retried := True
				retry
			end
		end

	close
			-- Close current file.
		require
			open: is_open_read
		do
			is_open_read := False
			buffer_position := 0
			buffer_size := 0
			if not input_file.is_closed then
				input_file.close
			end
		ensure
			closed: not is_open_read
		end

feature -- Input

	last_character_8: CHARACTER_8
			-- Last character read by `read_character_8'

	last_integer_8: INTEGER_8
			-- Last integer read by `read_integer_8'

	last_integer_16: INTEGER_16
			-- Last integer read by `read_integer_16'

	last_integer_32: INTEGER
			-- Last integer read by `read_integer_32'

	last_integer_64: INTEGER_64
			-- Last integer read by `read_integer_64'

	last_natural_8: NATURAL_8
			-- Last integer read by `read_natural_8'

	last_natural_16: NATURAL_16
			-- Last integer read by `read_natural_16'

	last_natural_32: NATURAL_32
			-- Last integer read by `read_natural_32'

	last_natural_64: NATURAL_64
			-- Last integer read by `read_natural_64'

	last_real_32: REAL_32
			-- Last real read by `read_real_32'

	last_real_64: REAL_64
			-- Last real double by `read_real_64'

	read_unbuffered_character_8
			-- Read an unbuffered character_8 from current file
			-- and make result available in `last_character_8'.
		require
			open: is_open_read
		local
			retried: BOOLEAN
			l_pointer: MANAGED_POINTER
		do
			if not retried then
				create l_pointer.make (1)
				input_file.read_to_managed_pointer (l_pointer, 0, 1)
				last_character_8 := l_pointer.read_character (0)
			else
				error_handler.report_error_message ("Exception when reading an unbuffered character_8 from file '" + filename + "'")
			end
		rescue
			if not retried then
				retried := True
			end
		end

	read_character_8
			-- Read a buffered character from current file and make
			-- result available in `last_character_8'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 1
			if new_position <= buffer_size then
				last_character_8 := buffer.read_character (buffer_position)
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a character_8 in file '" + filename + "'")
			end
		end

	read_integer_8
			-- Read a buffered integer_8 from current file and make
			-- result available in `last_integer_8'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 1
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_integer_8 := buffer.read_integer_8 (buffer_position)
				else
					last_integer_8 := buffer.read_integer_8_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read an integer_8 in file '" + filename + "'")
			end
		end

	read_integer_16
			-- Read a buffered integer_16 from current file and make
			-- result available in `last_integer_16'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 2
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_integer_16 := buffer.read_integer_16 (buffer_position)
				else
					last_integer_16 := buffer.read_integer_16_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read an integer_16 in file '" + filename + "'")
			end
		end

	read_integer_32
			-- Read a buffered integer_32 from current file and make
			-- result available in `last_integer_32'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 4
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_integer_32 := buffer.read_integer_32 (buffer_position)
				else
					last_integer_32 := buffer.read_integer_32_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read an integer_32 in file '" + filename + "'")
			end
		end

	read_integer_64
			-- Read a buffered integer_64 from current file and make
			-- result available in `last_integer_64'.
		require
			open: is_open_read
		local
			new_position: INTEGER
			lower: INTEGER_64
			upper: INTEGER_64
		do
				-- Note: INTEGER_64s are stored as two INTEGER_32s,
				-- first the lower part and then the upper part.
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 8
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					lower := buffer.read_integer_32 (buffer_position)
					upper := buffer.read_integer_32 (buffer_position + 4)
					last_integer_64 := (lower & 0x00000000ffffffff) | (upper |<< 32)
				else
					lower := buffer.read_integer_32_be (buffer_position)
					upper := buffer.read_integer_32_be (buffer_position + 4)
					last_integer_64 := (lower & 0x00000000ffffffff) | (upper |<< 32)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read an integer_64 in file '" + filename + "'")
			end
		end

	read_unbuffered_natural_8
			-- Read an unbuffered natural_8 from current file
			-- and make result available in `last_natural_8'.
		require
			open: is_open_read
		local
			retried: BOOLEAN
			l_pointer: MANAGED_POINTER
		do
			if not retried then
				create l_pointer.make (1)
				input_file.read_to_managed_pointer (l_pointer, 0, 1)
				last_natural_8 := l_pointer.read_natural_8 (0)
			else
				error_handler.report_error_message ("Exception when reading an unbuffered natural_8 from file '" + filename + "'")
			end
		rescue
			if not retried then
				retried := True
			end
		end

	read_natural_8
			-- Read a buffered natural_8 from current file and make
			-- result available in `last_natural_8'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 1
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_natural_8 := buffer.read_natural_8 (buffer_position)
				else
					last_natural_8 := buffer.read_natural_8_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a natural_8 in file '" + filename + "'")
			end
		end

	read_natural_16
			-- Read a buffered natural_16 from current file and make
			-- result available in `last_natural_16'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 2
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_natural_16 := buffer.read_natural_16 (buffer_position)
				else
					last_natural_16 := buffer.read_natural_16_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a natural_16 in file '" + filename + "'")
			end
		end

	read_natural_32
			-- Read a buffered natural_32 from current file and make
			-- result available in `last_natural_32'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 4
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_natural_32 := buffer.read_natural_32 (buffer_position)
				else
					last_natural_32 := buffer.read_natural_32_be (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a natural_32 in file '" + filename + "'")
			end
		end

	read_natural_64
			-- Read a buffered natural_64 from current file and make
			-- result available in `last_natural_64'.
		require
			open: is_open_read
		local
			new_position: INTEGER
			lower: NATURAL_64
			upper: NATURAL_64
		do
				-- Note: NATURAL_64s are stored as two NATURAL_32s,
				-- first the lower part and then the upper part.
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 8
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					lower := buffer.read_natural_32 (buffer_position)
					upper := buffer.read_natural_32 (buffer_position + 4)
					last_natural_64 := (lower & 0x00000000ffffffff) | (upper |<< 32)
				else
					lower := buffer.read_natural_32_be (buffer_position)
					upper := buffer.read_natural_32_be (buffer_position + 4)
					last_natural_64 := (lower & 0x00000000ffffffff) | (upper |<< 32)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a natural_64 in file '" + filename + "'")
			end
		end

	read_real_32
			-- Read a buffered real_32 from current file and make
			-- result available in `last_real_32'.
		require
			open: is_open_read
		local
			new_position: INTEGER
			d: REAL_64
		do
				-- Note: REAL_32s are stored as REAL_64s.
				-- Note: REAL_64s are stored in little endian mode whereas
				-- everything else is stored in big endian mode.
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 8
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					d := buffer.read_real_64_le (buffer_position)
				else
					d := buffer.read_real_64 (buffer_position)
				end
				last_real_32 := d.truncated_to_real
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a real_32 in file '" + filename + "'")
			end
		end

	read_real_64
			-- Read a buffered double from current file and make
			-- result available in `last_real_64'.
		require
			open: is_open_read
		local
			new_position: INTEGER
		do
				-- Note: REAL_64s are stored in little endian mode whereas
				-- everything else is stored in big endian mode.
			if buffer_position >= buffer_size then
				read_new_buffer
			end
			new_position := buffer_position + 8
			if new_position <= buffer_size then
				if platform_byte_order = storable_byte_order then
					last_real_64 := buffer.read_real_64_le (buffer_position)
				else
					last_real_64 := buffer.read_real_64 (buffer_position)
				end
				buffer_position := new_position
			else
				error_handler.report_error_message ("Buffer not large enough to read a real_64 in file '" + filename + "'")
			end
		end

feature {NONE} -- Implementation

	input_file: RAW_FILE
			-- Input file

	buffer: MANAGED_POINTER
			-- Input buffer

	buffer_size: INTEGER
			-- Size of current buffer

	buffer_position: INTEGER
			-- Current position in buffer

	initial_buffer_size: INTEGER = 262144
			-- Initial buffer size (256KB)

	platform_byte_order: INTEGER
			-- Byte order of underlying platform
		local
			l_pointer: MANAGED_POINTER
		once
			create l_pointer.make (2)
			l_pointer.put_integer_16 (1, 0)
			if l_pointer.read_integer_16_be (0) = 1 then
					-- Big endian.
				Result := 0x4321
			else
					-- Little endian.
				Result := 0x1234
			end
		end

	storable_byte_order: INTEGER = 0x4321
			-- Byte order used to store the file
			-- (big endian)

	read_new_buffer
			-- Read new buffer from current file.
		require
			open: is_open_read
		local
			retried: BOOLEAN
			l_size: INTEGER
			l_read_size: INTEGER
			l_remaining_size: INTEGER
		do
			if not retried then
				buffer_position := 0
				buffer_size := 0
				input_file.read_to_managed_pointer (buffer, 0, 4)
				if platform_byte_order = storable_byte_order then
					l_size := buffer.read_integer_32 (0)
				else
					l_size := buffer.read_integer_32_be (0)
				end
				if l_size <= 0 then
					error_handler.report_error_message ("Invalid buffer size in file '" + filename + "': " + l_size.out)
				else
					if l_size > buffer.count then
						buffer.resize (l_size)
					end
					from
						l_remaining_size := l_size
					until
						l_remaining_size <= 0
					loop
						input_file.read_to_managed_pointer (buffer, l_size - l_remaining_size, l_remaining_size)
						l_read_size := input_file.bytes_read
						if l_read_size <= 0 then
							error_handler.report_error_message ("Could only read " + (l_size - l_remaining_size).out + " bytes out of " + l_size.out + " bytes expected in new buffer from file '" + filename + "'")
							l_remaining_size := -1
						else
							l_remaining_size := l_remaining_size - l_read_size
						end
					end
					buffer_size := l_size
				end
			else
				error_handler.report_error_message ("Cannot read new buffer from file '" + filename + "'")
			end
		rescue
			if not retried then
				retried := True
			end
		end

invariant

	filename_not_void: filename /= Void
	input_file_not_void: input_file /= Void
	buffer_not_void: buffer /= Void
	buffer_size: buffer.count >= buffer_size
	buffer_position: buffer_position >= 0 and buffer_position <= buffer_size
	error_handler_not_void: error_handler /= Void

end
