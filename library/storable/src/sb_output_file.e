note

	description:

		"Files used to write Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_OUTPUT_FILE

create

	make

feature {NONE} -- Initialization

	make (a_filename: STRING)
			-- Create a new storable output file named `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			filename := a_filename
			create output_file.make_with_name (a_filename)
			buffer_data_capacity := initial_buffer_size
				-- Keep 4 bytes to write buffer size.
			buffer_size := buffer_data_capacity + four_bytes
			create buffer.make (buffer_size)
			buffer_position := four_bytes
		ensure
			filename_set: filename = a_filename
		end

feature -- Access

	filename: STRING
			-- Name of file

feature -- Status report

	is_open_write: BOOLEAN
			-- Is file open for writing?

feature -- Basic operations

	open_write
			-- Try to open current file.
			-- Set `is_open_write' to true is successful.
		require
			closed: not is_open_write
		local
			retried: BOOLEAN
			l_file: KL_BINARY_OUTPUT_FILE
		do
			if not retried then
					-- Force creation of intermediary
					-- directories first.
				create l_file.make (filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_file.close
				end
				output_file.open_write
				is_open_write := True
					-- Keep 4 bytes to write buffer size.
				buffer_position := four_bytes
			else
				is_open_write := False
				if not output_file.is_closed then
					output_file.close
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
			open: is_open_write
		do
			flush_buffer
			is_open_write := False
			if not output_file.is_closed then
				output_file.close
			end
		ensure
			closed: not is_open_write
		end

feature -- Output

	put_unbuffered_character (c: CHARACTER_8)
			-- Write an unbuffered character_8 to current file.
		require
			open: is_open_write
		local
			l_pointer: MANAGED_POINTER
		do
			create l_pointer.make (1)
			l_pointer.put_character (c, 0)
			output_file.put_managed_pointer (l_pointer, 0, one_byte)
		end

	put_unbuffered_string (s: STRING_8)
			-- Write an unbuffered string_8 to current file.
		require
			open: is_open_write
			a_not_void: s /= Void
		local
			i, nb: INTEGER
		do
			from
				i := 1
				nb := s.count
			until
				i > nb
			loop
				put_unbuffered_character (s.item (i))
				i := i + 1
			end
		end

	put_character (c: CHARACTER_8)
			-- Write a buffered character to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + one_byte
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + one_byte
			end
			put_buffered_character (c, buffer_position)
			buffer_position := new_position
		end

	put_multi_character (c: SPECIAL [CHARACTER_8]; nb: INTEGER)
			-- Write buffered characters to current file.
		require
			open: is_open_write
			c_not_void: c /= Void
			valid_nb: nb <= c.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
		do
			cap := buffer_data_capacity // one_byte
			if nb <= cap then
				new_position := buffer_position + nb * one_byte
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * one_byte
				end
				j := buffer_position
				from i := 0 until i = nb loop
					put_buffered_character (c.item (i), j)
					j := j + one_byte
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * one_byte
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * one_byte
					end
					j := buffer_position
					from i := 0 until i = cap loop
						put_buffered_character (c.item (k), j)
						j := j + one_byte
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * one_byte
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * one_byte
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					put_buffered_character (c.item (k), j)
					j := j + one_byte
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

	put_boolean (b: BOOLEAN)
			-- Write a buffered boolean to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + one_byte
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + one_byte
			end
			put_buffered_boolean (b, buffer_position)
			buffer_position := new_position
		end

	put_multi_boolean (b: SPECIAL [BOOLEAN]; nb: INTEGER)
			-- Write buffered booleans to current file.
		require
			open: is_open_write
			b_not_void: b /= Void
			valid_nb: nb <= b.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
		do
			cap := buffer_data_capacity // one_byte
			if nb <= cap then
				new_position := buffer_position + nb * one_byte
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * one_byte
				end
				j := buffer_position
				from i := 0 until i = nb loop
					put_buffered_boolean (b.item (i), j)
					j := j + one_byte
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * one_byte
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * one_byte
					end
					j := buffer_position
					from i := 0 until i = cap loop
						put_buffered_boolean (b.item (k), j)
						j := j + one_byte
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * one_byte
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * one_byte
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					put_buffered_boolean (b.item (k), j)
					j := j + one_byte
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

	put_unbuffered_integer_8 (i: INTEGER_8)
			-- Write an unbuffered integer_8 to current file.
		require
			open: is_open_write
		local
			l_pointer: MANAGED_POINTER
		do
			create l_pointer.make (1)
			l_pointer.put_integer_8 (i, 0)
			output_file.put_managed_pointer (l_pointer, 0, one_byte)
		end

	put_integer_8 (i: INTEGER_8)
			-- Write a buffered integer_8 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + one_byte
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + one_byte
			end
			put_buffered_integer_8 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_integer_8 (ints: SPECIAL [INTEGER_8]; nb: INTEGER)
			-- Write buffered integer_8s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_integer_8 (ints.item (i))
				i := i + 1
			end
		end

	put_integer_16 (i: INTEGER_16)
			-- Write a buffered integer_16 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + two_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + two_bytes
			end
			put_buffered_integer_16 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_integer_16 (ints: SPECIAL [INTEGER_16]; nb: INTEGER)
			-- Write buffered integer_16s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_integer_16 (ints.item (i))
				i := i + 1
			end
		end

	put_unbuffered_integer_32 (i: INTEGER_32)
			-- Write an unbuffered integer_32 to current file.
		require
			open: is_open_write
		local
			l_pointer: MANAGED_POINTER
		do
			create l_pointer.make (four_bytes)
			l_pointer.put_integer_32 (i, 0)
			output_file.put_managed_pointer (l_pointer, 0, four_bytes)
		end

	put_integer_32 (i: INTEGER_32)
			-- Write a buffered integer_32 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + four_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + four_bytes
			end
			put_buffered_integer_32 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_integer_32 (ints: SPECIAL [INTEGER_32]; nb: INTEGER)
			-- Write buffered integer_32s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_integer_32 (ints.item (i))
				i := i + 1
			end
		end

	put_integer_64 (i: INTEGER_64)
			-- Write a buffered integer_64 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + eight_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + eight_bytes
			end
			put_buffered_integer_64 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_integer_64 (ints: SPECIAL [INTEGER_64]; nb: INTEGER)
			-- Write buffered integer_64s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_integer_64 (ints.item (i))
				i := i + 1
			end
		end

	put_natural_8 (i: NATURAL_8)
			-- Write a buffered natural_8 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + one_byte
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + one_byte
			end
			put_buffered_natural_8 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_natural_8 (ints: SPECIAL [NATURAL_8]; nb: INTEGER)
			-- Write buffered natural_8s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_natural_8 (ints.item (i))
				i := i + 1
			end
		end

	put_natural_16 (i: NATURAL_16)
			-- Write a buffered natural_16 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + two_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + two_bytes
			end
			put_buffered_natural_16 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_natural_16 (ints: SPECIAL [NATURAL_16]; nb: INTEGER)
			-- Write buffered natural_16s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_natural_16 (ints.item (i))
				i := i + 1
			end
		end

	put_natural_32 (i: NATURAL_32)
			-- Write a buffered natural_32 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + four_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + four_bytes
			end
			put_buffered_natural_32 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_natural_32 (ints: SPECIAL [NATURAL_32]; nb: INTEGER)
			-- Write buffered natural_32s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_natural_32 (ints.item (i))
				i := i + 1
			end
		end

	put_natural_64 (i: NATURAL_64)
			-- Write a buffered natural_64 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + eight_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + eight_bytes
			end
			put_buffered_natural_64 (i, buffer_position)
			buffer_position := new_position
		end

	put_multi_natural_64 (ints: SPECIAL [NATURAL_64]; nb: INTEGER)
			-- Write buffered natural_64s to current file.
		require
			open: is_open_write
			ints_not_void: ints /= Void
			valid_nb: nb <= ints.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_natural_64 (ints.item (i))
				i := i + 1
			end
		end

	put_real_32 (r: REAL_32)
			-- Write a buffered real_32 to current file.
		require
			open: is_open_write
		do
				-- Note: REAL_32s are stored as REAL_64s.
			put_real_64 (r)
		end

	put_multi_real_32 (r: SPECIAL [REAL_32]; nb: INTEGER)
			-- Write buffered real_32s to current file.
		require
			open: is_open_write
			r_not_void: r /= Void
			valid_nb: nb <= r.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_real_32 (r.item (i))
				i := i + 1
			end
		end

	put_real_64 (d: REAL_64)
			-- Write a buffered real_64 to current file.
		require
			open: is_open_write
		local
			new_position: INTEGER
		do
			new_position := buffer_position + eight_bytes
			if new_position > buffer_size then
				flush_buffer
				new_position := buffer_position + eight_bytes
			end
			put_buffered_real_64 (d, buffer_position)
			buffer_position := new_position
		end

	put_multi_real_64 (d: SPECIAL [REAL_64]; nb: INTEGER)
			-- Write buffered real_64s to current file.
		require
			open: is_open_write
			d_not_void: d /= Void
			valid_nb: nb <= d.count
		local
			i: INTEGER
		do
			from i := 0 until i = nb loop
				put_real_64 (d.item (i))
				i := i + 1
			end
		end

	put_pointer_32 (p: NATURAL_32)
			-- Write a buffered pointer (4 bytes) to current file.
		require
			open: is_open_write
		do
				-- Address on 4 bytes.
			put_integer_8 (4)
			put_natural_32 (p)
		end

	put_multi_pointer_32 (p: SPECIAL [NATURAL_64]; nb: INTEGER)
			-- Write buffered pointers (4 bytes) to current file.
		require
			open: is_open_write
			p_not_void: p /= Void
			valid_nb: nb <= p.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
		do
			put_integer_8 (4)
			cap := buffer_data_capacity // four_bytes
			if nb <= cap then
				new_position := buffer_position + nb * four_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * four_bytes
				end
				j := buffer_position
				from i := 0 until i = nb loop
					put_buffered_natural_32 (p.item (i).to_natural_32, j)
					j := j + four_bytes
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * four_bytes
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * four_bytes
					end
					j := buffer_position
					from i := 0 until i = cap loop
						put_buffered_natural_32 (p.item (k).to_natural_32, j)
						j := j + four_bytes
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * four_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * four_bytes
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					put_buffered_natural_32 (p.item (k).to_natural_32, j)
					j := j + four_bytes
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

	put_pointer_64 (p: NATURAL_64)
			-- Write a buffered pointer (8 bytes) to current file.
		require
			open: is_open_write
		do
				-- Address on 8 bytes.
			put_integer_8 (8)
			put_natural_64 (p)
		end

	put_multi_pointer_64 (p: SPECIAL [NATURAL_64]; nb: INTEGER)
			-- Write buffered pointers (8 bytes) to current file.
		require
			open: is_open_write
			p_not_void: p /= Void
			valid_nb: nb <= p.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
		do
			put_integer_8 (8)
			cap := buffer_data_capacity // eight_bytes
			if nb <= cap then
				new_position := buffer_position + nb * eight_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * eight_bytes
				end
				j := buffer_position
				from i := 0 until i = nb loop
					put_buffered_natural_64 (p.item (i), j)
					j := j + eight_bytes
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * eight_bytes
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * eight_bytes
					end
					j := buffer_position
					from i := 0 until i = cap loop
						put_buffered_natural_64 (p.item (k), j)
						j := j + eight_bytes
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * eight_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * eight_bytes
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					put_buffered_natural_64 (p.item (k), j)
					j := j + eight_bytes
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

	put_multi_reference_32 (r: SPECIAL [SB_REFERENCE_OBJECT]; nb: INTEGER)
			-- Write buffered reference addresses (4 bytes) to current file.
		require
			open: is_open_write
			r_not_void: r /= Void
			valid_nb: nb <= r.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
			ref: detachable SB_REFERENCE_OBJECT
		do
			put_integer_8 (4)
			cap := buffer_data_capacity // four_bytes
			if nb <= cap then
				new_position := buffer_position + nb * four_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * four_bytes
				end
				j := buffer_position
				from i := 0 until i = nb loop
					ref := r.item (i)
					if ref /= Void then
						put_buffered_natural_32 (ref.address.to_natural_32, j)
					else
						put_buffered_natural_32 (0, j)
					end
					j := j + four_bytes
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * four_bytes
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * four_bytes
					end
					j := buffer_position
					from i := 0 until i = cap loop
						ref := r.item (k)
						if ref /= Void then
							put_buffered_natural_32 (ref.address.to_natural_32, j)
						else
							put_buffered_natural_32 (0, j)
						end
						j := j + four_bytes
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * four_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * four_bytes
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					ref := r.item (k)
					if ref /= Void then
						put_buffered_natural_32 (ref.address.to_natural_32, j)
					else
						put_buffered_natural_32 (0, j)
					end
					j := j + four_bytes
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

	put_multi_reference_64 (r: SPECIAL [SB_REFERENCE_OBJECT]; nb: INTEGER)
			-- Write buffered reference addresses (8 bytes) to current file.
		require
			open: is_open_write
			r_not_void: r /= Void
			valid_nb: nb <= r.count
		local
			new_position: INTEGER
			cap: INTEGER
			i, j, k: INTEGER
			l_count, l_left_over: INTEGER
			ref: detachable SB_REFERENCE_OBJECT
		do
			put_integer_8 (8)
			cap := buffer_data_capacity // eight_bytes
			if nb <= cap then
				new_position := buffer_position + nb * eight_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + nb * eight_bytes
				end
				j := buffer_position
				from i := 0 until i = nb loop
					ref := r.item (i)
					if ref /= Void then
						put_buffered_natural_64 (ref.address, j)
					else
						put_buffered_natural_64 (0, j)
					end
					j := j + eight_bytes
					i := i + 1
				end
				buffer_position := new_position
			else
				l_count := nb // cap
				l_left_over := nb \\ cap
				k := 0
				from until l_count = 0 loop
					new_position := buffer_position + cap * eight_bytes
					if new_position > buffer_size then
						flush_buffer
						new_position := buffer_position + cap * eight_bytes
					end
					j := buffer_position
					from i := 0 until i = cap loop
						ref := r.item (k)
						if ref /= Void then
							put_buffered_natural_64 (ref.address, j)
						else
							put_buffered_natural_64 (0, j)
						end
						j := j + eight_bytes
						k := k + 1
						i := i + 1
					end
					buffer_position := new_position
					l_count := l_count - 1
				end
				new_position := buffer_position + l_left_over * eight_bytes
				if new_position > buffer_size then
					flush_buffer
					new_position := buffer_position + l_left_over * eight_bytes
				end
				j := buffer_position
				from i := 0 until i = l_left_over loop
					ref := r.item (k)
					if ref /= Void then
						put_buffered_natural_64 (ref.address, j)
					else
						put_buffered_natural_64 (0, j)
					end
					j := j + eight_bytes
					k := k + 1
					i := i + 1
				end
				buffer_position := new_position
			end
		end

feature {NONE} -- Output

	put_buffered_character (c: CHARACTER_8; pos: INTEGER)
			-- Write a buffered character to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + one_byte <= buffer_size
		do
			buffer.put_character (c, pos)
		end

	put_buffered_boolean (b: BOOLEAN; pos: INTEGER)
			-- Write a buffered boolean to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + one_byte <= buffer_size
		do
			if b then
				put_buffered_character ('%/1/', pos)
			else
				put_buffered_character ('%/0/', pos)
			end
		end

	put_buffered_integer_8 (i: INTEGER_8; pos: INTEGER)
			-- Write a buffered integer_8 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + one_byte <= buffer_size
		do
			buffer.put_integer_8 (i, pos)
		end

	put_buffered_integer_16 (i: INTEGER_16; pos: INTEGER)
			-- Write a buffered integer_16 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + two_bytes <= buffer_size
		do
			if platform_byte_order = storable_byte_order then
				buffer.put_integer_16 (i, pos)
			else
				buffer.put_integer_16_be (i, pos)
			end
		end

	put_buffered_integer_32 (i: INTEGER_32; pos: INTEGER)
			-- Write a buffered integer_32 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + four_bytes <= buffer_size
		do
			if platform_byte_order = storable_byte_order then
				buffer.put_integer_32 (i, pos)
			else
				buffer.put_integer_32_be (i, pos)
			end
		end

	put_buffered_integer_64 (i: INTEGER_64; pos: INTEGER)
			-- Write a buffered integer_64 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + eight_bytes <= buffer_size
		local
			lower: INTEGER
			upper: INTEGER
		do
				-- Note: INTEGER_64s are stored as two INTEGER_32s,
				-- first the lower part and then the upper part.
			lower := (i & 0x00000000FFFFFFFF).to_integer
			upper := ((i |>> 32) & 0x00000000FFFFFFFF).to_integer
			if platform_byte_order = storable_byte_order then
				buffer.put_integer_32 (lower, pos)
				buffer.put_integer_32 (upper, pos + four_bytes)
			else
				buffer.put_integer_32_be (lower, pos)
				buffer.put_integer_32_be (upper, pos + four_bytes)
			end
		end

	put_buffered_natural_8 (i: NATURAL_8; pos: INTEGER)
			-- Write a buffered natural_8 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + one_byte <= buffer_size
		do
			buffer.put_natural_8 (i, pos)
		end

	put_buffered_natural_16 (i: NATURAL_16; pos: INTEGER)
			-- Write a buffered natural_16 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + two_bytes <= buffer_size
		do
			if platform_byte_order = storable_byte_order then
				buffer.put_natural_16 (i, pos)
			else
				buffer.put_natural_16_be (i, pos)
			end
		end

	put_buffered_natural_32 (i: NATURAL_32; pos: INTEGER)
			-- Write a buffered natural_32 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + four_bytes <= buffer_size
		do
			if platform_byte_order = storable_byte_order then
				buffer.put_natural_32 (i, pos)
			else
				buffer.put_natural_32_be (i, pos)
			end
		end

	put_buffered_natural_64 (i: NATURAL_64; pos: INTEGER)
			-- Write a buffered natural_64 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + eight_bytes <= buffer_size
		local
			lower: NATURAL_32
			upper: NATURAL_32
		do
				-- Note: NATURAL_64s are stored as two NATURAL_32s,
				-- first the lower part and then the upper part.
			lower := (i & 0x00000000FFFFFFFF).to_natural_32
			upper := ((i |>> 32) & 0x00000000FFFFFFFF).to_natural_32
			if platform_byte_order = storable_byte_order then
				buffer.put_natural_32 (lower, pos)
				buffer.put_natural_32 (upper, pos + four_bytes)
			else
				buffer.put_natural_32_be (lower, pos)
				buffer.put_natural_32_be (upper, pos + four_bytes)
			end
		end

	put_buffered_real_64 (d: REAL_64; pos: INTEGER)
			-- Write a buffered real_64 to current file at position `pos'.
		require
			open: is_open_write
			pos_large_enough: pos >= 0
			pos_small_enough: pos + eight_bytes <= buffer_size
		do
				-- Note: REAL_64s are stored in little endian mode whereas
				-- everything else is stored in big endian mode.
			if platform_byte_order = storable_byte_order then
				buffer.put_real_64_le (d, pos)
			else
				buffer.put_real_64 (d, pos)
			end
		end

feature {NONE} -- Implementation

	output_file: RAW_FILE
			-- Output file

	buffer: MANAGED_POINTER
			-- Buffer

	buffer_size: INTEGER
			-- Size of current buffer

	buffer_data_capacity: INTEGER
			-- Space in `buffer' reserved to stored data

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

	flush_buffer
			-- Flush buffer to `output_file'.
		require
			open: is_open_write
		local
			nb: INTEGER
		do
			if buffer_position > four_bytes then
				nb := buffer_position
				put_buffered_integer_32 (nb - four_bytes, 0)
				output_file.put_managed_pointer (buffer, 0, nb)
			end
				-- Keep 4 bytes to write buffer size.
			buffer_position := four_bytes
		end

	one_byte: INTEGER = 1
	two_bytes: INTEGER = 2
	four_bytes: INTEGER = 4
	eight_bytes: INTEGER = 8
			-- Number of bytes

invariant

	filename_not_void: filename /= Void
	output_file_not_void: output_file /= Void
	buffer_not_void: buffer /= Void
	buffer_size: buffer.count = buffer_size
	buffer_position: buffer_position >= 0 and buffer_position < buffer_size
	buffer_data_capacity: buffer_size = buffer_data_capacity + four_bytes

end
