note
	description: "[
		Serialize/Deserialize data from memory.
		
		Given a memory area referenced by MANAGED_POINTER, store/retrieve data from 
		memory. Initially memory is read from the first byte unless changed via `set_position`.
		
		After the first store/retrieve operation, `count` is set to the position of the last
		written/read bytes. If you haven't set an initial position via `set_position`, it is
		also the number of bytes written/read, otherwise the number of bytes read is
		`count - initial_position`.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2016-07-09 07:24:57 +0000 (Sat, 09 Jul 2016) $"
	revision: "$Revision: 99004 $"

class
	SED_MEMORY_READER_WRITER

inherit
	SED_BINARY_READER_WRITER
		export
			{ANY} buffer
		end

create
	make,
	make_with_buffer

feature {NONE} -- Initialization

	make
			-- Initialize current to read or write from `a_medium'.
		do
			create {MANAGED_POINTER} buffer.make (default_buffer_size)
			buffer_size := default_buffer_size
		ensure
			buffer_set: buffer /= Void
			buffer_size_set: buffer_size = default_buffer_size
		end

	make_with_buffer (a_buffer: like buffer)
			-- Initialize current to read or write from `a_medium' using a buffer of size `a_buffer_size'.
			-- `buffer_size' will be overriden during read operation by the value of `buffer_size' used
			-- when writing.
		require
			a_buffer_not_void: a_buffer /= Void
		do
			buffer := a_buffer
			buffer_size := a_buffer.count
		ensure
			buffer_set: buffer = a_buffer
			buffer_size_set: buffer_size = a_buffer.count
		end

feature -- Access

	data: MANAGED_POINTER
			-- Copy of `buffer' from position `0` up to the byte of the last
			-- write/read operation.
		do
			create Result.make_from_pointer (buffer.item, buffer_position)
		ensure
			data_not_void: Result /= Void
			valid_data_size: Result.count = buffer_position
		end

	count: INTEGER
			-- After the first store/retrieve operation, `count` is the position of the last
			-- written/read bytes. If you haven't set an initial position via `set_position`, it is
			-- also the number of bytes written/read, otherwise the number of bytes read is
			-- `count - initial_position`.
		do
			Result := buffer_position
		end

feature -- Settings

	set_position (a_pos: INTEGER)
			-- Set position in `buffer` where next read/write operation will take place.
			-- Use with caution as setting it incorrectly might override existing data
			-- on the next write.
		require
			a_pos_non_negative: a_pos >= 0
			a_pos_not_too_big: a_pos < buffer.count
		do
			buffer_position := a_pos
		ensure
			position_set: buffer_position = a_pos
		end

feature {NONE} -- Buffer update

	check_buffer (n: INTEGER)
			-- If there is enough space in `buffer' to read `n' bytes, do nothing.
		do
			if n + buffer_position > buffer_size then
				buffer.resize ((n + buffer_position).max (buffer.count + buffer.count // 2))
				buffer_size := buffer.count
			end
		ensure then
			buffer_adapted: n + buffer_position <= buffer_size
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2016, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
