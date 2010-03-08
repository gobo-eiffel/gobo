indexing

	description:

		"Interface for buffers"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_BUFFER [G]

feature -- Access

	item (i: INTEGER): G is
			-- Item at position `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		local
			r: detachable G
		do
				-- TODO: This routine should be deferred, but there is
				-- a bug with ISE Eiffel 5.1.5 up to 6.3 in the generated
				-- C code in finalized mode (ISE bug#15375), and having this
				-- routine effective is a workaround.
			check
					-- Fooling the compiler.
				r_not_void: r /= Void
			end
			Result := r
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items in buffer
		deferred
		ensure
			count_positive: Result >= 0
		end

feature -- Element change

	put (v: G; i: INTEGER) is
			-- Replace item at position `i' by `v'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
				-- TODO: This routine should be deferred, but there is
				-- a bug with ISE Eiffel 5.1.5 up to 6.3 in the generated
				-- C code in finalized mode (ISE bug#15375), and having this
				-- routine effective is a workaround.
		ensure
			inserted: item (i) = v
		end

	fill_from_stream (a_stream: KI_INPUT_STREAM [G]; pos, nb: INTEGER): INTEGER is
			-- Fill buffer, starting at position `pos', with
			-- at most `nb' items read from `a_stream'.
			-- Return the number of items actually read.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: a_stream.is_open_read
			not_end_of_input: not a_stream.end_of_input
			pos_large_enough: pos >= 1
			nb_large_enough: nb > 0
			enough_space: (pos + nb - 1) <= count
		do
			Result := a_stream.read_to_buffer (Current, pos, nb)
		ensure
			nb_item_read_large_enough: Result >= 0
			nb_item_read_small_enough: Result <= nb
			not_end_of_input: not a_stream.end_of_input implies Result > 0
		end

	move_left (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' items from `old_pos' to
			-- `new_pos' in buffer.
		require
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= 1
			enough_characters: (old_pos + nb - 1) <= count
			new_pos_large_enough: new_pos >= 1
			enough_space: (new_pos + nb - 1) <= count
			move_left: old_pos > new_pos
		local
			i, j, nb2: INTEGER
		do
			if nb > 0 then
				j := new_pos
				nb2 := old_pos + nb - 1
				from
					i := old_pos
				until
					i > nb2
				loop
					put (item (i), j)
					j := j + 1
					i := i + 1
				end
			end
		end

	move_right (old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' items from `old_pos' to
			-- `new_pos' in buffer.
		require
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= 1
			enough_characters: (old_pos + nb - 1) <= count
			new_pos_large_enough: new_pos >= 1
			enough_space: (new_pos + nb - 1) <= count
			move_right: old_pos < new_pos
		local
			i, j: INTEGER
		do
			if nb > 0 then
				j := new_pos + nb - 1
				from
					i := old_pos + nb - 1
				until
					i < old_pos
				loop
					put (item (i), j)
					j := j - 1
					i := i - 1
				end
			end
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize buffer so that it contains `n' items.
			-- Do not lose any previously entered items.
		require
			n_large_enough: n >= count
		deferred
		ensure
			count_set: count = n
		end

end
