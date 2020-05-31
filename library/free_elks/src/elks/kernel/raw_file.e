note
	description: "Files, viewed as persistent sequences of bytes"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class RAW_FILE

inherit
	FILE
		rename
			index as position
		redefine
			file_reopen, file_open, file_dopen, read_to_managed_pointer
		end

create
	make, make_with_name, make_with_path,
	make_open_read, make_open_write, make_open_append,
	make_open_read_write, make_create_read_write,
	make_open_read_append,
	make_open_temporary, make_open_temporary_with_prefix

feature -- Status report

	support_storable: BOOLEAN = True
			-- Can medium be used to an Eiffel structure?

feature -- Output

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write binary value of `i' at current position.
		do
			file_pib (file_pointer, i)
		end

	put_integer_8 (i: INTEGER_8)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_integer_8 (i, 0)
			put_managed_pointer (integer_buffer, 0, 1)
		end

	put_integer_16 (i: INTEGER_16)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_integer_16 (i, 0)
			put_managed_pointer (integer_buffer, 0, 2)
		end

	put_integer_64 (i: INTEGER_64)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_integer_64 (i, 0)
			put_managed_pointer (integer_buffer, 0, 8)
		end

	put_natural_8 (i: NATURAL_8)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_natural_8 (i, 0)
			put_managed_pointer (integer_buffer, 0, 1)
		end

	put_natural_16 (i: NATURAL_16)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_natural_16 (i, 0)
			put_managed_pointer (integer_buffer, 0, 2)
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_natural_32 (i, 0)
			put_managed_pointer (integer_buffer, 0, 4)
		end

	put_natural_64 (i: NATURAL_64)
			-- Write binary value of `i' at current position.
		do
			integer_buffer.put_natural_64 (i, 0)
			put_managed_pointer (integer_buffer, 0, 8)
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write binary value of `b' at current position.
		do
			if b then
				put_character ('%/001/')
			else
				put_character ('%U')
			end
		end

	put_real, putreal, put_real_32 (r: REAL_32)
			-- Write binary value of `r' at current position.
		do
			file_prb (file_pointer, r)
		end

	put_double, putdouble, put_real_64 (d: REAL_64)
			-- Write binary value `d' at current position.
		do
			file_pdb (file_pointer, d)
		end

	put_data (p: POINTER; size: INTEGER)
			-- Put `data' of length `size' pointed by `p' at
			-- current position.
		obsolete
			"Use `put_managed_pointer' instead. [2017-05-31]"
		require
			p_not_null: p /= default_pointer
			extendible: extendible
		do
			file_ps (file_pointer, p, size)
		end

feature -- Input

	read_integer, readint, read_integer_32
			-- Read the binary representation of a new 32-bit integer
			-- from file. Make result available in `last_integer'.
		do
			last_integer := file_gib (file_pointer)
		end

	read_integer_8
			-- Read the binary representation of a new 8-bit integer
			-- from file. Make result available in `last_integer_8'.
		do
			read_to_managed_pointer (integer_buffer, 0, 1)
			last_integer_8 := integer_buffer.read_integer_8 (0)
		end

	read_integer_16
			-- Read the binary representation of a new 16-bit integer
			-- from file. Make result available in `last_integer_16'.
		do
			read_to_managed_pointer (integer_buffer, 0, 2)
			last_integer_16 := integer_buffer.read_integer_16 (0)
		end

	read_integer_64
			-- Read the binary representation of a new 64-bit integer
			-- from file. Make result available in `last_integer_64'.
		do
			read_to_managed_pointer (integer_buffer, 0, 8)
			last_integer_64 := integer_buffer.read_integer_64 (0)
		end

	read_natural_8
			-- Read the binary representation of a new 8-bit natural
			-- from file. Make result available in `last_natural_8'.
		do
			read_to_managed_pointer (integer_buffer, 0, 1)
			last_natural_8 := integer_buffer.read_natural_8 (0)
		end

	read_natural_16
			-- Read the binary representation of a new 16-bit natural
			-- from file. Make result available in `last_natural_16'.

		do
			read_to_managed_pointer (integer_buffer, 0, 2)
			last_natural_16 := integer_buffer.read_natural_16 (0)
		end

	read_natural, read_natural_32
			-- Read the binary representation of a new 32-bit natural
			-- from file. Make result available in `last_natural'.
		do
			read_to_managed_pointer (integer_buffer, 0, 4)
			last_natural := integer_buffer.read_natural_32 (0)
		end

	read_natural_64
			-- Read the binary representation of a new 64-bit natural
			-- from file. Make result available in `last_natural_64'.
		do
			read_to_managed_pointer (integer_buffer, 0, 8)
			last_natural_64 := integer_buffer.read_natural_64 (0)
		end

	read_real, readreal, read_real_32
			-- Read the binary representation of a new real
			-- from file. Make result available in `last_real'.
		do
			last_real := file_grb (file_pointer)
		end

	read_double, readdouble, read_real_64
			-- Read the binary representation of a new double
			-- from file. Make result available in `last_double'.
		do
			last_double := file_gdb (file_pointer)
		end

	read_data (p: POINTER; nb_bytes: INTEGER)
			-- Read a string of at most `nb_bytes' bound bytes
			-- or until end of file.
			-- Make result available in `p'.
		obsolete
			"Use `read_to_managed_pointer' instead. [2017-05-31]"
		require
			p_not_null: p /= default_pointer
			is_readable: file_readable
		do
			bytes_read := file_fread (p, 1, nb_bytes, file_pointer)
		end

	read_to_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Read at most `nb_bytes' bound bytes and make result
			-- available in `p' at position `start_pos'.
		do
			bytes_read := file_fread (p.item + start_pos, 1, nb_bytes, file_pointer)
		end

	read_to_string (a_string: STRING_8; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		do
			Result := file_gss (file_pointer, a_string.area.item_address (pos - 1), nb)
				-- `a_string' was externally modified, we need to reset its `hash_code'.
			a_string.reset_hash_codes
		end

feature {FILE_ITERATION_CURSOR} -- Iteration

	file_fread (dest: POINTER; elem_size, nb_elems: INTEGER; file: POINTER): INTEGER
			-- Read `nb_elems' of size `elem_size' in file `file' and store them
			-- in location `dest'.
		external
			"C signature (void *, size_t, size_t, FILE *): EIF_INTEGER use <stdio.h>"
		alias
			"fread"
		end

feature {NONE} -- Implementation

	integer_buffer: MANAGED_POINTER
			-- Buffer used to read INTEGER_64, INTEGER_16, INTEGER_8
		do
			Result := internal_integer_buffer
			if Result = Void then
				create Result.make (16)
				internal_integer_buffer := Result
			end
		end

	internal_integer_buffer: detachable MANAGED_POINTER
			-- Internal integer buffer

	file_gib (file: POINTER): INTEGER
			-- Get an integer from `file'
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gib"
		end

	file_grb (file: POINTER): REAL_32
			-- Read a real from `file'
		external
			"C signature (FILE *): EIF_REAL_32 use %"eif_file.h%""
		alias
			"eif_file_grb"
		end

	file_gdb (file: POINTER): REAL_64
			-- Read a double from `file'
		external
			"C signature (FILE *): EIF_REAL_64 use %"eif_file.h%""
		alias
			"eif_file_gdb"
		end

	file_open (f_name: POINTER; how: INTEGER): POINTER
			-- File pointer for file `f_name', in mode `how'.
		external
			"C signature (EIF_FILENAME, int): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_binary_open"
		end

	file_dopen (fd, how: INTEGER): POINTER
			-- File pointer for file of descriptor `fd' in mode `how'
			-- (which must fit the way `fd' was obtained).
		external
			"C signature (int, int): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_binary_dopen"
		end

	file_reopen (fname: POINTER; how: INTEGER; file: POINTER): POINTER
			-- File pointer to `file', reopened to have new name `f_name'
			-- in a mode specified by `how'.
		external
			"C signature (EIF_FILENAME, int, FILE *): EIF_POINTER use %"eif_file.h%""
		alias
			"eif_file_binary_reopen"
		end

	file_pib (file: POINTER; n: INTEGER)
			-- Put `n' to end of `file'.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_pib"
		end

	file_prb (file: POINTER; r: REAL_32)
			-- Put `r' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_32) use %"eif_file.h%""
		alias
			"eif_file_prb"
		end

	file_pdb (file: POINTER; d: REAL_64)
			-- Put `d' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_64) use %"eif_file.h%""
		alias
			"eif_file_pdb"
		end

invariant

	not_plain_text: not is_plain_text

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
