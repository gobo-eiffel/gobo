note
	description: "Serialize/Deserialize data from a medium."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2021-02-22 14:30:58 +0000 (Mon, 22 Feb 2021) $"
	revision: "$Revision: 105200 $"

class
	SED_MEDIUM_READER_WRITER

inherit
	SED_BINARY_READER_WRITER
		redefine
			read_header,
			write_header,
			cleanup,
			write_footer,
			is_ready_for_reading,
			is_ready_for_writing,
			medium
		end

inherit {NONE}

	PLATFORM
		export
			{NONE} all
		end

create
	make,
	make_for_reading,
	make_for_writing,
	make_with_buffer

feature {NONE} -- Initialization

	make (a_medium: IO_MEDIUM)
			-- Initialize current to read or write from `a_medium'.
		require
			a_medium_not_void: a_medium /= Void
			a_medium_support_storable: a_medium.support_storable
		do
			make_with_buffer (a_medium, default_buffer_size)
		ensure
			medium_set: medium = a_medium
			buffer_size_set: buffer_size = default_buffer_size
		end

	make_for_reading (a_medium: IO_MEDIUM)
			-- Initialize current to read from `a_medium'.
		require
			a_medium_not_void: a_medium /= Void
			a_medium_open_for_reading: a_medium.is_open_read
			a_medium_support_storable: a_medium.support_storable
		do
			make (a_medium)
			set_for_reading
		ensure
			medium_set: medium = a_medium
			buffer_size_set: buffer_size = default_buffer_size
		end

	make_for_writing (a_medium: IO_MEDIUM)
			-- Initialize current to write to `a_medium'.
		require
			a_medium_not_void: a_medium /= Void
			a_medium_open_for_writing: a_medium.is_open_write
			a_medium_support_storable: a_medium.support_storable
		do
			make (a_medium)
			set_for_writing
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
			a_medium_support_storable: a_medium.support_storable
		do
			medium := a_medium
			buffer_size := a_buffer_size
			create buffer.make (a_buffer_size)
		ensure
			medium_set: medium = a_medium
			buffer_size_set: buffer_size = a_buffer_size
			buffer_size_set: buffer.count = a_buffer_size
		end

feature -- Header/Footer

	read_header
			-- Retrieve configuration of how data was stored.
		do
				-- Read data from medium
			read_buffer_from_medium

				-- Read header telling how data is stored.
			is_little_endian_storable := read_boolean
			is_pointer_value_stored := read_boolean

				-- Note: it is ok here to call `read_integer_32' because
				-- `is_little_endian_storable' is set two lines above.
			stored_pointer_bytes := read_integer_32
		end

	write_header
			-- Store configuration on how data will be stored.
		do
				-- We reset `buffer_size' to use the full `buffer' capacity.
			buffer_size := buffer.count
			check enough_space: buffer.count > {PLATFORM}.integer_32_bytes * 4 + {PLATFORM}.boolean_bytes * 2 end
			is_little_endian_storable := is_little_endian

				-- Prepare chunk for storing data
			write_chunk_header

				-- Write how data is stored is stored.
			write_boolean (is_little_endian_storable)
			write_boolean (is_pointer_value_stored)
			write_integer_32 ({PLATFORM}.pointer_bytes)
		end

	write_chunk_header
			-- Store information about chunks
		do
				-- Reset the position in buffer
			buffer_position := 0

				-- We put `-1' to distinguish us from version prior to `reader_writer_version_6_6' which stored
				-- the size of the buffer directly. That way upon retrieval, if we read a negative number we know
				-- that this the new format.
			buffer.put_integer_32_be (-1, 0)
			buffer_position := buffer_position + {PLATFORM}.integer_32_bytes
				-- To make it easier in the future to cope with format breaking change, we store it.
			buffer.put_natural_32_be (reader_writer_version_6_6, buffer_position)
			buffer_position := buffer_position + {PLATFORM}.natural_32_bytes
				-- Leave the empty space for storing the actual size of buffer.
			buffer_position := buffer_position + {PLATFORM}.integer_32_bytes
				-- Leave the empty space for storing the presence of the next chunk or not.
			buffer_position := buffer_position + {PLATFORM}.boolean_bytes
		end

	write_footer
			-- Store last buffered data.
		do
			flush_buffer_to_medium (True)
		end

feature -- Status report

	is_ready_for_reading: BOOLEAN
			-- Is Current ready for future read operations?
		do
			Result := is_for_reading and then
				medium.exists and then medium.is_open_read and then
				medium.support_storable and then medium.readable
		end

	is_ready_for_writing: BOOLEAN
			-- Is Current ready for future write operations?
		do
			Result := not is_for_reading and then
				medium.exists and then medium.is_open_write and then medium.support_storable
		end

	is_last_chunk: BOOLEAN
			-- Are we reading the last chunk?
			--| Useful when an operation has to be terminated and that
			--| we need to empty the medium from all the received bytes.

	cleanup
			-- <Precursor>
		do
				-- Read all chinks of storable until the last one.
				-- It is necessary to do that especially when `medium'
				-- is a socket.
			from
			until
				is_last_chunk
			loop
				read_buffer_from_medium
			end
		end

feature -- Access

	reader_writer_version_6_6: NATURAL_32 = 1
			-- Version of format used for reading/writing.

feature {NONE} -- Implementation: Access

	medium: IO_MEDIUM
			-- Medium used for read/write operations

	version_position: INTEGER
			-- Position where information about version is stored
		do
			Result := size_position (False) + {PLATFORM}.integer_32_bytes
		end

	size_position (a_is_new_format: BOOLEAN): INTEGER
			-- Position where size information for current chunk is stored.
		do
			if a_is_new_format then
					-- Information is stored after -1 and version number.
				Result := version_position + {PLATFORM}.natural_32_bytes
			else
				Result := 0
			end
		end

	new_chunk_position: INTEGER
			-- Position where presence or not of a next chunk is stored.
		do
				-- Information is stored after `new_size_position'.
			Result := size_position (True) + {PLATFORM}.integer_32_bytes
		end

	chunk_header_size (a_is_new_format: BOOLEAN): INTEGER
			-- Size of data
		do
			Result := {PLATFORM}.integer_32_bytes	-- old size
			if a_is_new_format then
				Result := Result +
					{PLATFORM}.natural_32_bytes +	-- version
					{PLATFORM}.integer_32_bytes +	-- size
					{PLATFORM}.boolean_bytes		-- is last chunk?
			end
		end

feature {NONE} -- Buffer update

	check_buffer (n: INTEGER)
			-- If there is enough space in `buffer' to read `n' bytes, do nothing.
			-- Otherwise, read/write to `medium' to free some space.
		do
			if n + buffer_position > buffer_size then
				if is_for_reading then
					read_buffer_from_medium
				else
					flush_buffer_to_medium (False)
				end
			end
		end

	read_buffer_from_medium
			-- Read next chunk of data.
		require
			is_ready: is_ready_for_reading
		local
			l_version: NATURAL_32
			l_is_new_format: BOOLEAN
			l_failure: SERIALIZATION_FAILURE
		do
				-- Read the amount of data we are suppose to read
			medium.read_to_managed_pointer (buffer, 0, {PLATFORM}.integer_32_bytes)
			if medium.bytes_read = {PLATFORM}.integer_32_bytes then
				buffer_size := buffer.read_integer_32_be (0)
					-- By default `is_last_chunk' is always True so that retrieving
					-- an old format would not try to read indefinitely in `cleanup'.
				is_last_chunk := True
				if buffer_size = -1 then
						-- This is the new format, first we read the version information.
					l_is_new_format := True
					medium.read_to_managed_pointer (buffer, version_position, {PLATFORM}.integer_32_bytes)
					l_version := buffer.read_natural_32_be (version_position)
						-- Now depending on the version we read the various parameters.
					if l_version = reader_writer_version_6_6 then
							-- Read the actual size.
						medium.read_to_managed_pointer (buffer, size_position (True), {PLATFORM}.integer_32_bytes)
						buffer_size := buffer.read_integer_32_be (size_position (True))
							-- Read `is_last_chunk'
						medium.read_to_managed_pointer (buffer, new_chunk_position, {PLATFORM}.boolean_bytes)
						is_last_chunk := buffer.read_boolean (new_chunk_position)
					end
				else
					l_is_new_format := False
				end

					-- Put the position at the right place after the header.
				buffer_position := chunk_header_size (l_is_new_format)

					-- Resize `buffer' if necessary.
				if buffer_size > buffer.count then
					buffer.resize (buffer_size)
				end
					-- Read the data.
				if buffer_size > {PLATFORM}.integer_32_bytes then
					medium.read_to_managed_pointer (buffer, buffer_position, buffer_size - buffer_position)
					if medium.bytes_read /= buffer_size - buffer_position then
							-- Invalid data is being read here!!!
						buffer_position := 0
						buffer_size := buffer.count
						create l_failure
						l_failure.set_description ("Read less than expected number of bytes in buffer.")
						l_failure.raise
					end
				else
						-- Invalid data is being read here!!!
					buffer_position := 0
					buffer_size := buffer.count
					create l_failure
					l_failure.set_description ("Read less than 4 bytes in buffer's header.")
					l_failure.raise
				end
			else
				buffer_position := 0
				buffer_size := buffer.count
				create l_failure
				l_failure.set_description ("Cannot read buffer size from header.")
				l_failure.raise
			end
		end

	flush_buffer_to_medium (last_chunk: BOOLEAN)
			-- Write next chunk of data to `medium'.
		require
			is_ready: is_ready_for_writing
		do
				-- Write the amount of bytes we are actually writting at the right place
				-- (see `write_header' to know where it is actually).
			buffer.put_integer_32_be (buffer_position, size_position (True))
			buffer.put_boolean (last_chunk, new_chunk_position)
				-- Write the data to `medium'.
			medium.put_managed_pointer (buffer, 0, buffer_position)

				-- Put the position at the right place.
			write_chunk_header
		end

invariant
	medium_not_void: medium /= Void

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2021, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
