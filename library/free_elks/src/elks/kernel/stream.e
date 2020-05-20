note
	description: "Implementation of the STORABLE mechanism with streams."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	STREAM

inherit
	IO_MEDIUM

create
	make,
	make_with_size

feature -- Initialization

	make
			-- Create stream object with a default_size of 100 bytes
		do
			make_with_size (200)
		end

	make_with_size (n: INTEGER)
			-- Create stream object with a default_size of `n' bytes
		do
			buffer_size := n
			create_c_buffer
			create last_string.make_empty
		end

feature -- Access

	item: POINTER
			-- Direct access to stored/retrieved data
		do
			Result := c_buffer (internal_buffer_access)
		end

	buffer: POINTER
			-- C buffer correspond to the Eiffel STREAM
		obsolete
			"Use `item' instead to directly access stored/retrieved data. [2017-05-31]"
		do
			Result := internal_buffer_access
		end

	buffer_size: INTEGER
			-- Buffer's size.

	object_stored_size: INTEGER
			-- Size of last stored object.

	create_c_buffer
			-- Create the C memory corresponding to the C buffer.
		do
			internal_buffer_access := c_malloc (buffer_size)
		end

	retrieved: ANY
			-- Retrieved object structure
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if content is not a stored Eiffel structure.
		require else
			True
		local
			size: INTEGER
		do
			(create {MISMATCH_CORRECTOR}).mismatch_information.do_nothing
			Result := c_retrieved (internal_buffer_access, buffer_size, 0, $size)
			object_stored_size := size
		end

feature -- Element change

	basic_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable within current system only.
		local
			size: INTEGER
		do
			buffer_size := c_stream_basic_store (internal_buffer_access, buffer_size, $object, $size)
			object_stored_size := size
		end

	general_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for same platform
			-- (machine architecture).
			--| This feature may use a visible name of a class written
			--| in the `visible' clause of the Ace file. This makes it
			--| possible to overcome class name clashes.
		local
			size: INTEGER
		do
			buffer_size := c_stream_general_store (internal_buffer_access, buffer_size, $object, $size)
			object_stored_size := size
		end

	independent_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for the same or other
			-- platform (machine architecture).
		local
			size: INTEGER
		do
			buffer_size := c_stream_independent_store (internal_buffer_access, buffer_size, $object, $size)
			object_stored_size := size
		end

	set_additional_size (new_size: INTEGER)
			-- Set `new_size' to BUFFER_SIZE, internal value used to
			-- increment `buffer_size' during storable operations.
		external
			"C use %"eif_store.h%""
		alias
			"set_buffer_size"
		end

feature {NONE} -- Implementation

	internal_buffer_access: POINTER
			-- Access to C buffer pointed by `item'.

	c_buffer (a_buf: POINTER): POINTER
			-- Dereferenced pointer of `a_buf'
		require
			a_buf_not_null: a_buf /= default_pointer
		external
			"C inline"
		alias
			"return (*(EIF_POINTER *) $a_buf);"
		end

	c_stream_basic_store (stream_buffer: POINTER; stream_buffer_size: INTEGER; object: POINTER; c_real_size: POINTER): INTEGER
			-- Store object structure reachable form current object
			-- Return new size of `internal_buffer_access'.
		external
			"C signature (EIF_POINTER *, EIF_INTEGER, EIF_REFERENCE, EIF_INTEGER *): EIF_INTEGER use %"eif_store.h%""
		alias
			"stream_estore"
		end

	c_stream_general_store (stream_buffer: POINTER; stream_buffer_size: INTEGER; object: POINTER; c_real_size: POINTER): INTEGER
			-- Store object structure reachable form current object
			-- Return new size of `internal_buffer_access'.
		external
			"C signature (EIF_POINTER *, EIF_INTEGER, EIF_REFERENCE, EIF_INTEGER *): EIF_INTEGER use %"eif_store.h%""
		alias
			"stream_eestore"
		end

	c_stream_independent_store (stream_buffer: POINTER; stream_buffer_size: INTEGER; object: POINTER; c_real_size: POINTER): INTEGER
			-- Store object structure reachable form current object
			-- Return new size of `internal_buffer_access'.
		external
			"C signature (EIF_POINTER *, EIF_INTEGER, EIF_REFERENCE, EIF_INTEGER *): EIF_INTEGER use %"eif_store.h%""
		alias
			"stream_sstore"
		end

	c_retrieved (stream_buffer: POINTER; stream_buffer_size: INTEGER; stream_buffer_position: INTEGER; c_real_size: POINTER): ANY
			-- Object structured retrieved from stream of pointer
			-- `stream_ptr'
		external
			"C signature (EIF_POINTER *, EIF_INTEGER, EIF_INTEGER, EIF_INTEGER *): EIF_REFERENCE use %"eif_retrieve.h%""
		alias
			"stream_eretrieve"
		end

	c_malloc (size: INTEGER): POINTER
		external
			"C use %"eif_store.h%""
		alias
			"stream_malloc"
		end

	c_free (buf: POINTER)
		external
			"C signature (EIF_POINTER *) use %"eif_store.h%""
		alias
			"stream_free"
		end

feature -- Status report

	support_storable: BOOLEAN = True
			-- Can medium be used to store an Eiffel structure?

	exists: BOOLEAN = True
			-- Stream exists in any cases.

	is_open_read: BOOLEAN = True
			-- Stream opens for input.

	is_open_write: BOOLEAN = True
			-- Stream opens for output.

	is_readable: BOOLEAN = True

	is_executable: BOOLEAN
			-- Is stream executable?
		do
			Result := False
		end

	is_writable: BOOLEAN = True
			-- Stream is writable.

	readable: BOOLEAN
			-- Is there a current item that may be read?
		do
		end

	extendible: BOOLEAN
			-- May new items be added?
		do
			Result := True
		end

	is_closed: BOOLEAN
			-- Is the I/O medium open

feature -- Status setting

	close
			-- Close medium.
		do
			is_closed := True
			c_free (internal_buffer_access)
			internal_buffer_access := default_pointer
		end

feature -- Output

	put_new_line, new_line
			-- Write a new line character to medium
		require else
			stream_exists: exists
		do
			put_character ('%N')
		end

	put_string, putstring (s: READABLE_STRING_8)
			-- Write `s' to medium.
		do
		end

	put_character, putchar (c: CHARACTER_8)
			-- Write `c' to medium.
		do
		end

	put_real, putreal, put_real_32 (r: REAL_32)
			-- Write `r' to medium.
		do
		end

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write `i' to medium.
		do
		end

	put_integer_8 (i: INTEGER_8)
			-- Write `i' to medium.
		do
		end

	put_integer_16 (i: INTEGER_16)
			-- Write `i' to medium.
		do
		end

	put_integer_64 (i: INTEGER_64)
			-- Write `i' to medium.
		do
		end

	put_natural_8 (i: NATURAL_8)
			-- Write `i' to medium.
		do
		end

	put_natural_16 (i: NATURAL_16)
			-- Write `i' to medium.
		do
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write `i' to medium.
		do
		end

	put_natural_64 (i: NATURAL_64)
			-- Write `i' to medium.
		do
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write `b' to medium.
		do
		end

	put_double, putdouble, put_real_64 (d: REAL_64)
			-- Write `d' to medium.
		do
		end

	put_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Put data of length `nb_bytes' pointed by `start_pos' index in `p' at
			-- current position.
		do
		end

feature -- Input

	read_real, readreal, read_real_32
			-- Read a new real.
			-- Make result available in `last_real'.
		do
		end

	read_double, readdouble, read_real_64
			-- Read a new double.
			-- Make result available in `last_double'.
		do
		end

	read_character, readchar
			-- Read a new character.
			-- Make result available in `last_character'.
		do
		end

	read_integer, readint, read_integer_32
			-- Read a new integer.
			-- Make result available in `last_integer'.
		do
		end

	read_integer_8
			-- Read a new integer.
			-- Make result available in `last_integer_8'.
		do
		end

	read_integer_16
			-- Read a new integer.
			-- Make result available in `last_integer_16'.
		do
		end

	read_integer_64
			-- Read a new integer.
			-- Make result available in `last_integer_64'.
		do
		end

	read_natural_8
			-- Read a new natural.
			-- Make result available in `last_natural_8'.
		do
		end

	read_natural_16
			-- Read a new natural.
			-- Make result available in `last_natural_16'.
		do
		end

	read_natural, read_natural_32
			-- Read a new natural.
			-- Make result available in `last_natural'.
		do
		end

	read_natural_64
			-- Read a new natural.
			-- Make result available in `last_natural_64'.
		do
		end

	read_stream, readstream (nb_char: INTEGER)
			-- Read a string of at most `nb_char' bound characters
			-- or until end of medium is encountered.
			-- Make result available in `last_string'.
		do
		end

	read_line, readline
			-- Read characters until a new line or
			-- end of medium.
			-- Make result available in `last_string'.
		do
		end

	read_to_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Read at most `nb_bytes' bound bytes and make result
			-- available in `p' at position `start_pos'.
		do
		end

feature {NONE} -- Not exported

	name: detachable STRING
			-- Not meaningful
		do
		end

	handle: INTEGER
			-- Handle to medium
		do
		end

	handle_available: BOOLEAN
			-- Is the handle available after class has been
			-- created?
		do
		end

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
