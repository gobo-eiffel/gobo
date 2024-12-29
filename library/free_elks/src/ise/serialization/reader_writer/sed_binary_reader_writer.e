note
	description: "Ancestor to serialize/deserialize data using a buffer in binary format."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2016-12-05 17:39:47 +0000 (Mon, 05 Dec 2016) $"
	revision: "$Revision: 99631 $"

deferred class
	SED_BINARY_READER_WRITER

inherit
	SED_READER_WRITER

feature -- Status report

	is_ready_for_reading: BOOLEAN
			-- Is Current ready for future read operations?
		do
			Result := is_for_reading
		end

	is_ready_for_writing: BOOLEAN
			-- Is Current ready for future write operations?
		do
			Result := not is_for_reading
		end

	is_for_reading: BOOLEAN
			-- Will current do a read operation?

feature -- Settings

	set_for_reading
			-- Set current for reading.
		do
			is_for_reading := True
		ensure
			is_for_reading: is_for_reading
		end

	set_for_writing
			-- Set current for writing.
		do
			is_for_reading := False
		ensure
			is_for_writing: not is_for_reading
		end

feature -- Access

	read_natural_8: NATURAL_8
			-- Read next natural_8
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_8_bytes)
			l_pos := buffer_position
			Result := buffer.read_natural_8 (l_pos)
			l_pos := l_pos + {PLATFORM}.natural_8_bytes
			buffer_position := l_pos
		end

	read_natural_16: NATURAL_16
			-- Read next natural_16
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_16_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				Result := buffer.read_natural_16_le (l_pos)
			else
				Result := buffer.read_natural_16_be (l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_16_bytes
			buffer_position := l_pos
		end

	read_natural_32: NATURAL_32
			-- Read next natural_32
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_32_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				Result := buffer.read_natural_32_le (l_pos)
			else
				Result := buffer.read_natural_32_be (l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_32_bytes
			buffer_position := l_pos
		end

	read_natural_64: NATURAL_64
			-- Read next natural_64
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_64_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				Result := buffer.read_natural_64_le (l_pos)
			else
				Result := buffer.read_natural_64_be (l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_64_bytes
			buffer_position := l_pos
		end

	read_integer_8: INTEGER_8
			-- Read next integer_8
		do
			check
				correct_size: {PLATFORM}.natural_8_bytes = {PLATFORM}.integer_8_bytes
			end
			Result := read_natural_8.as_integer_8
		end

	read_integer_16: INTEGER_16
			-- Read next integer_16
		do
			check
				correct_size: {PLATFORM}.natural_16_bytes = {PLATFORM}.integer_16_bytes
			end
			Result := read_natural_16.as_integer_16
		end

	read_integer_32: INTEGER
			-- Read next integer_32
		do
			check
				correct_size: {PLATFORM}.natural_32_bytes = {PLATFORM}.integer_32_bytes
			end
			Result := read_natural_32.as_integer_32
		end

	read_integer_64: INTEGER_64
			-- Read next integer_64
		do
			check
				correct_size: {PLATFORM}.natural_64_bytes = {PLATFORM}.integer_64_bytes
			end
			Result := read_natural_64.as_integer_64
		end

	read_real_32: REAL_32
			-- Read next real_32
		local
			l_pos: INTEGER_32
		do
			check_buffer ({PLATFORM}.real_32_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				Result := buffer.read_real_32_le (l_pos)
			else
				Result := buffer.read_real_32_be (l_pos)
			end
			l_pos := l_pos + {PLATFORM}.real_32_bytes
			buffer_position := l_pos
		end

	read_real_64: REAL_64
			-- Read next real_64
		local
			l_pos: INTEGER_32
		do
			check_buffer ({PLATFORM}.real_64_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				Result := buffer.read_real_64_le (l_pos)
			else
				Result := buffer.read_real_64_be (l_pos)
			end
			l_pos := l_pos + {PLATFORM}.real_64_bytes
			buffer_position := l_pos
		end

	read_pointer: POINTER
			-- Read next pointer
		local
			l_val32: NATURAL_32
			l_val64: NATURAL_64
		do
			if is_pointer_value_stored then
				check_buffer (stored_pointer_bytes)
				if {PLATFORM}.pointer_bytes = stored_pointer_bytes then
					if {PLATFORM}.pointer_bytes = {PLATFORM}.natural_32_bytes then
						l_val32 := read_natural_32;
						($Result).memory_copy ($l_val32, {PLATFORM}.natural_32_bytes)
					elseif {PLATFORM}.pointer_bytes = {PLATFORM}.natural_64_bytes then
						l_val64 := read_natural_64;
						($Result).memory_copy ($l_val64, {PLATFORM}.natural_64_bytes)
					else
						check
							not_supported: False
						end
					end
				elseif {PLATFORM}.pointer_bytes > stored_pointer_bytes then
					check
						expected_size: {PLATFORM}.pointer_bytes = {PLATFORM}.natural_64_bytes and stored_pointer_bytes = {PLATFORM}.natural_32_bytes
					end
					l_val32 := read_natural_32;
					($Result + {PLATFORM}.natural_32_bytes).memory_copy ($l_val32, {PLATFORM}.natural_32_bytes)
				else
					check
						expected_size: {PLATFORM}.pointer_bytes = {PLATFORM}.natural_32_bytes and stored_pointer_bytes = {PLATFORM}.natural_64_bytes
					end
						-- We may loose some data here
					l_val32 := read_natural_64.as_natural_32;
					($Result).memory_copy ($l_val32, {PLATFORM}.natural_32_bytes)
				end
			end
		end

feature -- Element change

	write_natural_8 (v: NATURAL_8)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_8_bytes)
			l_pos := buffer_position
			buffer.put_natural_8 (v, l_pos)
			l_pos := l_pos + {PLATFORM}.natural_8_bytes
			buffer_position := l_pos
		end

	write_natural_16 (v: NATURAL_16)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_16_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				buffer.put_natural_16_le (v, l_pos)
			else
				buffer.put_natural_16_be (v, l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_16_bytes
			buffer_position := l_pos
		end

	write_natural_32 (v: NATURAL_32)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_32_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				buffer.put_natural_32_le (v, l_pos)
			else
				buffer.put_natural_32_be (v, l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_32_bytes
			buffer_position := l_pos
		end

	write_natural_64 (v: NATURAL_64)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.natural_64_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				buffer.put_natural_64_le (v, l_pos)
			else
				buffer.put_natural_64_be (v, l_pos)
			end
			l_pos := l_pos + {PLATFORM}.natural_64_bytes
			buffer_position := l_pos
		end

	write_integer_8 (v: INTEGER_8)
			-- Write `v'.
		do
			check
				correct_size: {PLATFORM}.natural_8_bytes = {PLATFORM}.integer_8_bytes
			end
			write_natural_8 (v.as_natural_8)
		end

	write_integer_16 (v: INTEGER_16)
			-- Write `v'.
		do
			check
				correct_size: {PLATFORM}.natural_16_bytes = {PLATFORM}.integer_16_bytes
			end
			write_natural_16 (v.as_natural_16)
		end

	write_integer_32 (v: INTEGER)
			-- Write `v'.
		do
			check
				correct_size: {PLATFORM}.natural_32_bytes = {PLATFORM}.integer_32_bytes
			end
			write_natural_32 (v.as_natural_32)
		end

	write_integer_64 (v: INTEGER_64)
			-- Write `v'.
		do
			check
				correct_size: {PLATFORM}.natural_64_bytes = {PLATFORM}.integer_64_bytes
			end
			write_natural_64 (v.as_natural_64)
		end

	write_real_32 (v: REAL_32)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.real_32_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				buffer.put_real_32_le (v, l_pos)
			else
				buffer.put_real_32_be (v, l_pos)
			end
			l_pos := l_pos + {PLATFORM}.real_32_bytes
			buffer_position := l_pos
		end

	write_real_64 (v: REAL_64)
			-- Write `v'.
		local
			l_pos: INTEGER
		do
			check_buffer ({PLATFORM}.real_64_bytes)
			l_pos := buffer_position
			if is_little_endian_storable then
				buffer.put_real_64_le (v, l_pos)
			else
				buffer.put_real_64_be (v, l_pos)
			end
			l_pos := l_pos + {PLATFORM}.real_64_bytes
			buffer_position := l_pos
		end

	write_pointer (v: POINTER)
			-- Write `v'.
		local
			l_val32: NATURAL_32
			l_val64: NATURAL_64
		do
			if is_pointer_value_stored then
				if {PLATFORM}.pointer_bytes = {PLATFORM}.natural_32_bytes then
					($l_val32).memory_copy ($v,{PLATFORM}.natural_32_bytes)
					write_natural_32 (l_val32)
				elseif {PLATFORM}.pointer_bytes = {PLATFORM}.natural_64_bytes then
					($l_val64).memory_copy ($v, {PLATFORM}.natural_64_bytes)
					write_natural_64 (l_val64)
				else
					check
						not_supported: False
					end
				end
			end
		end

feature {NONE} -- Implementation: Access

	buffer: MANAGED_POINTER
			-- Buffer to store/fetch data from `medium'

	medium: detachable ANY
			-- Fake medium to avoid polymorphic attribute
			-- access.

feature {NONE} -- Implementation: Status report

	buffer_size: INTEGER
			-- Size for `buffer' to reduce access to medium

	buffer_position: INTEGER
			-- Position in `buffer' for next read/write operation

	default_buffer_size: INTEGER = 262144
			-- Default size for `buffer'

	is_little_endian_storable: BOOLEAN
			-- If `is_for_reading', encoding used to write data.
			-- Otherwise encoding that will be used to write data.

	stored_pointer_bytes: INTEGER
			-- Size of pointers in bytes used to write data.

feature {NONE} -- Buffer update

	check_buffer (n: INTEGER)
			-- If there is enough space in `buffer' to read `n' bytes, do nothing.
			-- Otherwise, read/write to `medium' to free some space and reset `buffer_position'
			-- to an appropriate position.
		require
			n_non_negative: n >= 0
		deferred
		end

invariant
	buffer_not_void: buffer /= Void
	buffer_size_non_negative: buffer_size >= 0
	buffer_position_non_negative: buffer_position >= 0
	stored_pointer_bytes_non_negative: stored_pointer_bytes >= 0

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end
