note
	description: "Any medium that can perform input and/or output"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class IO_MEDIUM

inherit
	DISPOSABLE
		export
			{NONE} all
		end

	STRING_HANDLER

feature -- Access

	name: detachable STRING
			-- Medium name
		deferred
		end

	retrieved: detachable ANY
			-- Retrieved object structure
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if content is not a stored Eiffel structure.
		require
			is_readable: readable
			support_storable: support_storable
		deferred
		end

feature -- Element change

	basic_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable within current system only.
		require
			object_not_void: object /= Void
			extendible: extendible
			support_storable: support_storable
		deferred
		end

	general_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for same platform
			-- (machine architecture).
			--| This feature may use a visible name of a class written
			--| in the `visible' clause of the Ace file. This makes it
			--| possible to overcome class name clashes.
		require
			object_not_void: object /= Void
			extendible: extendible
			support_storable: support_storable
		deferred
		end

	independent_store (object: ANY)
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable from other systems for the same or other
			-- platform (machine architecture).
		require
			object_not_void: object /= Void
			extendible: extendible
			support_storable: support_storable
		deferred
		end

feature -- Status report

	handle: INTEGER
			-- Handle to medium
		require
			valid_handle: handle_available
		deferred
		end

	handle_available: BOOLEAN
			-- Is the handle available after class has been
			-- created?
		deferred
		end

	is_plain_text: BOOLEAN
			-- Is file reserved for text (character sequences)?
		do
		end

	last_character: CHARACTER_8
			-- Last character read by `read_character`.

	last_string: STRING_8
			-- Last string read

	last_integer: INTEGER
			-- Last integer read by `read_integer'

	last_integer_32: INTEGER
			-- Synonymy of `last_integer'
		do
			Result := last_integer
		end

	last_integer_64: INTEGER_64
			-- Last 64-bit integer read by `read_integer_64'

	last_integer_16: INTEGER_16
			-- Last 16-bit integer read by `read_integer_16'

	last_integer_8: INTEGER_8
			-- Last 8-bit integer read by `read_integer_8'

	last_natural_64: NATURAL_64
			-- Last 64-bit natural read by `read_natural_64'

	last_natural: NATURAL_32
			-- Last 32-bit natural read by `read_natural'

	last_natural_32: NATURAL_32
			-- Synonymy of `last_natural'
		do
			Result := last_natural
		end

	last_natural_16: NATURAL_16
			-- Last 16-bit natural read by `read_natural_16'

	last_natural_8: NATURAL_8
			-- Last 8-bit natural read by `read_natural_8'

	last_real: REAL_32
			-- Last real read by `read_real'

	last_real_32: REAL_32
			-- Last 32-bit real read by `read_real_32`.
			-- Synonym of `last_real`.
		do
			Result := last_real
		end

	last_double: REAL_64
			-- Last double read by `read_double'

	last_real_64: REAL_64
			-- Last 64-bit real read by `read_real_64`.
			-- Synonym of `last_double`.
		do
			Result := last_double
		end

	bytes_read: INTEGER
			-- Last number of bytes read by `read_to_managed_pointer'.

	exists: BOOLEAN
			-- Does medium exist?
		deferred
		end

	is_open_read: BOOLEAN
			-- Is this medium opened for input
		deferred
		end

	is_open_write: BOOLEAN
			-- Is this medium opened for output
		deferred
		end

	is_readable: BOOLEAN
			-- Is medium readable?
		require
			handle_exists: exists
		deferred
		end

	is_executable: BOOLEAN
			-- Is medium executable?
		require
			handle_exists: exists
		deferred
		end

	is_writable: BOOLEAN
			-- Is medium writable?
		require
			handle_exists: exists
		deferred
		end

	readable: BOOLEAN
			-- Is there a current item that may be read?
		require
			handle_exists: exists
		deferred
		end

	extendible: BOOLEAN
			-- May new items be added?
		deferred
		end

	is_closed: BOOLEAN
			-- Is the I/O medium open
		deferred
		end

	support_storable: BOOLEAN
			-- Can medium be used to store an Eiffel object?
		deferred
		end

feature -- Status setting

	close
			-- Close medium.
		require
			medium_is_open: not is_closed
		deferred
		end

feature -- Removal

	dispose
			-- Ensure this medium is closed when garbage collected.
		do
			if not is_closed then
				close
			end
		end

feature -- Output

	put_new_line, new_line
			-- Write a new line character to medium
		require
			extendible: extendible
		deferred
		end

	put_string, putstring (s: READABLE_STRING_8)
			-- Write `s' to medium.
		require
			extendible: extendible
			non_void: s /= Void
		deferred
		end

	put_character, putchar (c: CHARACTER_8)
			-- Write `c' to medium.
		require
			extendible: extendible
		deferred
		end

	put_real, putreal, put_real_32 (r: REAL_32)
			-- Write `r' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_8 (i: INTEGER_8)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_16 (i: INTEGER_16)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_64 (i: INTEGER_64)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_8 (i: NATURAL_8)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_16 (i: NATURAL_16)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_64 (i: NATURAL_64)
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write `b' to medium.
		require
			extendible: extendible
		deferred
		end

	put_double, putdouble, put_real_64 (d: REAL_64)
			-- Write `d' to medium.
		require
			extendible: extendible
		deferred
		end

	put_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Put data of length `nb_bytes' pointed by `start_pos' index in `p' at
			-- current position.
		require
			p_not_void: p /= Void
			p_large_enough: p.count >= nb_bytes + start_pos
			nb_bytes_non_negative: nb_bytes >= 0
			extendible: extendible
		deferred
		end

feature -- Input

	read_real, readreal, read_real_32
			-- Read a new real.
			-- Make result available in `last_real'.
		require
			is_readable: readable
		deferred
		end

	read_double, readdouble, read_real_64
			-- Read a new double.
			-- Make result available in `last_double'.
		require
			is_readable: readable
		deferred
		end

	read_character, readchar
			-- Read a new character.
			-- Make result available in `last_character'.
		require
			is_readable: readable
		deferred
		end

	read_integer, readint, read_integer_32
			-- Read a new 32-bit integer.
			-- Make result available in `last_integer'.
		require
			is_readable: readable
		deferred
		end

	read_integer_8
			-- Read a new 8-bit integer.
			-- Make result available in `last_integer_8'.
		require
			is_readable: readable
		deferred
		end

	read_integer_16
			-- Read a new 16-bit integer.
			-- Make result available in `last_integer_16'.
		require
			is_readable: readable
		deferred
		end

	read_integer_64
			-- Read a new 64-bit integer.
			-- Make result available in `last_integer_64'.
		require
			is_readable: readable
		deferred
		end

	read_natural_8
			-- Read a new 8-bit natural.
			-- Make result available in `last_natural_8'.
		require
			is_readable: readable
		deferred
		end

	read_natural_16
			-- Read a new 16-bit natural.
			-- Make result available in `last_natural_16'.
		require
			is_readable: readable
		deferred
		end

	read_natural, read_natural_32
			-- Read a new 32-bit natural.
			-- Make result available in `last_natural'.
		require
			is_readable: readable
		deferred
		end

	read_natural_64
			-- Read a new 64-bit natural.
			-- Make result available in `last_natural_64'.
		require
			is_readable: readable
		deferred
		end

	read_stream, readstream (nb_char: INTEGER)
			-- Read a string of at most `nb_char' bound characters
			-- or until end of medium is encountered.
			-- Make result available in `last_string'.
		require
			is_readable: readable
		deferred
		ensure
			last_string_not_void: last_string /= Void
		end

	read_stream_thread_aware (nb_char: INTEGER)
			-- Read a string of at most `nb_char' bound characters
			-- or until end of medium is encountered.
			-- Make result available in `last_string'.
			-- Functionally identical to `read_stream' but
			-- won't prevent garbage collection from occurring
			-- while blocked waiting for data, though data must
			-- be copied an extra time.			
		require
			is_readable: readable
		do
			read_stream (nb_char)
		ensure
			last_string_not_void: last_string /= Void
		end

	read_line, readline
			-- Read characters until a new line or
			-- end of medium.
			-- Make result available in `last_string'.
		require
			is_readable: readable
		deferred
		ensure
			last_string_not_void: last_string /= Void
		end

	read_line_thread_aware
			-- Read characters until a new line or
			-- end of medium.
			-- Make result available in `last_string'.
			-- Functionally identical to `read_line' but
			-- won't prevent garbage collection from occurring
			-- while blocked waiting for data, though data must
			-- be copied an extra time.			
		require
			is_readable: readable
		do
			read_line
		ensure
			last_string_not_void: last_string /= Void
		end

	read_to_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER)
			-- Read at most `nb_bytes' bound bytes and make result
			-- available in `p' at position `start_pos'.
		require
			p_not_void: p /= Void
			p_large_enough: p.count >= nb_bytes + start_pos
			nb_bytes_non_negative: nb_bytes >= 0
			is_readable: readable
		deferred
		ensure
			bytes_read_non_negative: bytes_read >= 0
			bytes_read_not_too_big: bytes_read <= nb_bytes
		end

feature -- Obsolete

	lastchar: CHARACTER
			-- Last character read by `read_character'
		do
			Result := last_character
		end

	laststring: like last_string
			-- Last string read
		do
			Result := last_string
		end

	lastint: INTEGER
			-- Last integer read by `read_integer'
		do
			Result := last_integer
		end

	lastreal: REAL_32
			-- Last real read by `read_real'
		do
			Result := last_real
		end

	lastdouble: REAL_64
			-- Last double read by `read_double'
		do
			Result := last_double
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
