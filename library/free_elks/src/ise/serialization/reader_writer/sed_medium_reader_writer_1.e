note
	description: "Serialize/Deserialize data from a medium."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2010-02-22 18:14:01 +0000 (Mon, 22 Feb 2010) $"
	revision: "$Revision: 82390 $"

class
	SED_MEDIUM_READER_WRITER_1

inherit
	SED_BINARY_READER_WRITER
		redefine
			read_header,
			write_header,
			write_footer,
			is_ready_for_reading,
			is_ready_for_writing,
			medium
		end

	PLATFORM
		export
			{NONE} all
		end

create
	make,
	make_with_buffer

feature {NONE} -- Initialization

	make (a_medium: IO_MEDIUM)
			-- Initialize current to read or write from `a_medium'.
		require
			a_medium_not_void: a_medium /= Void
		do
			make_with_buffer (a_medium, default_buffer_size)
		ensure
			medium_set: medium = a_medium
			buffer_size_set: buffer_size = default_buffer_size
		end

	make_with_buffer (a_medium: IO_MEDIUM; a_buffer_size: INTEGER)
			-- Initialize current to read or write from `a_medium' using a buffer of size `a_buffer_size'.
			-- `buffer_size' will be overriden during read operation by the value of `buffer_size' used
			-- when writing.
		require
			a_medium_not_void: a_medium /= Void
			a_buffer_size_non_negative: a_buffer_size >= 0
		do
			medium := a_medium
			buffer_size := a_buffer_size
			create buffer.make (a_buffer_size)
		ensure
			medium_set: medium = a_medium
			buffer_size_set: buffer_size = a_buffer_size
		end

feature -- Header/Footer

	read_header
			-- Retrieve configuration of how data was stored.
		do
				-- Read header
			medium.read_to_managed_pointer (buffer, 0, header_size)
			is_little_endian_storable := buffer.read_boolean (0)
			is_pointer_value_stored := buffer.read_boolean ({PLATFORM}.natural_8_bytes)
			buffer_size := buffer.read_integer_32_le (2 * {PLATFORM}.natural_8_bytes)
			stored_pointer_bytes := buffer.read_integer_32_le (2 * {PLATFORM}.natural_8_bytes + {PLATFORM}.integer_32_bytes)

				-- Initialize buffer for next read operation
			medium.read_to_managed_pointer (buffer, 0, buffer_size)
			buffer_position := 0
		ensure then
			buffer_position_reset: buffer_position = 0
		end

	write_header
			-- Store configuration on how data will be stored.
		do
			is_little_endian_storable := is_little_endian
			buffer.put_boolean (is_little_endian_storable, 0)
			buffer.put_boolean (is_pointer_value_stored, {PLATFORM}.natural_8_bytes)
			buffer.put_integer_32_le (buffer_size, 2 * {PLATFORM}.natural_8_bytes)
			buffer.put_integer_32_le ({PLATFORM}.pointer_bytes, 2 * {PLATFORM}.natural_8_bytes + {PLATFORM}.integer_32_bytes)

			medium.put_managed_pointer (buffer, 0, header_size)
			buffer_position := 0
		ensure then
			buffer_position_reset: buffer_position = 0
		end

	write_footer
			-- Store last buffered data.
		do
			medium.put_managed_pointer (buffer, 0, buffer_position)
		end

feature -- Status report

	is_ready_for_reading: BOOLEAN
			-- Is Current ready for future read operations?
		do
			Result := is_for_reading and then
				medium.exists and then medium.is_open_read and then medium.support_storable
		end

	is_ready_for_writing: BOOLEAN
			-- Is Current ready for future write operations?
		do
			Result := not is_for_reading and then
				medium.exists and then medium.is_open_write and then medium.support_storable
		end

feature {NONE} -- Implementation: Access

	medium: IO_MEDIUM
			-- Medium used for read/write operations

feature {NONE} -- Implementation: Status report

	header_size: INTEGER
			-- Size for header storing properties of data stored in `medium'
		do
			Result :=
				{PLATFORM}.natural_8_bytes 		-- `is_little_endian_storable'
				+ {PLATFORM}.natural_8_bytes	-- `is_pointer_value_stored'
				+ {PLATFORM}.integer_32_bytes	-- `buffer_size'
				+ {PLATFORM}.integer_32_bytes	-- `stored_pointer_bytes'
		end

feature {NONE} -- Buffer update

	check_buffer (n: INTEGER)
			-- If there is enough space in `buffer' to read `n' bytes, do nothing.
			-- Otherwise, read/write to `medium' to free some space.
		do
			if n + buffer_position > buffer_size then
				if is_for_reading then
					medium.read_to_managed_pointer (buffer, 0, buffer_size)
				else
					medium.put_managed_pointer (buffer, 0, buffer_size)
				end
				buffer_position := 0
			end
		end

invariant
	medium_not_void: medium /= Void

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"






end
