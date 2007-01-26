indexing
	description: "Any medium that can perform input and/or output"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
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

	name: STRING is
			-- Medium name
		deferred
		end

	retrieved: ANY is
			-- Retrieved object structure
			-- To access resulting object under correct type,
			-- use assignment attempt.
			-- Will raise an exception (code `Retrieve_exception')
			-- if content is not a stored Eiffel structure.
		require
			is_readable: readable
			support_storable: support_storable
		deferred
		ensure
			Result_exists: Result /= Void
		end

feature -- Element change

	basic_store (object: ANY) is
			-- Produce an external representation of the
			-- entire object structure reachable from `object'.
			-- Retrievable within current system only.
		require
			object_not_void: object /= Void
			extendible: extendible
			support_storable: support_storable
		deferred
		end

	general_store (object: ANY) is
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

	independent_store (object: ANY) is
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

	handle: INTEGER is
			-- Handle to medium
		require
			valid_handle: handle_available
		deferred
		end

	handle_available: BOOLEAN is
			-- Is the handle available after class has been
			-- created?
		deferred
		end

	is_plain_text: BOOLEAN is
			-- Is file reserved for text (character sequences)?
		do
		end

	last_character: CHARACTER
			-- Last character read by `read_character'

	last_string: STRING
			-- Last string read

	last_integer: INTEGER
			-- Last integer read by `read_integer'

	last_integer_32: INTEGER is
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

	last_natural_32: NATURAL_32 is
			-- Synonymy of `last_natural'
		do
			Result := last_natural
		end

	last_natural_16: NATURAL_16
			-- Last 16-bit natural read by `read_natural_16'

	last_natural_8: NATURAL_8
			-- Last 8-bit natural read by `read_natural_8'

	last_real: REAL
			-- Last real read by `read_real'

	last_double: DOUBLE
			-- Last double read by `read_double'

	bytes_read: INTEGER
			-- Last number of bytes read by `read_to_managed_pointer'.

	exists: BOOLEAN is
			-- Does medium exist?
		deferred
		end

	is_open_read: BOOLEAN is
			-- Is this medium opened for input
		deferred
		end

	is_open_write: BOOLEAN is
			-- Is this medium opened for output
		deferred
		end

	is_readable: BOOLEAN is
			-- Is medium readable?
		require
			handle_exists: exists
		deferred
		end

	is_executable: BOOLEAN is
			-- Is medium executable?
		require
			handle_exists: exists
		deferred
		end

	is_writable: BOOLEAN is
			-- Is medium writable?
		require
			handle_exists: exists
		deferred
		end

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		require
			handle_exists: exists
		deferred
		end

	extendible: BOOLEAN is
			-- May new items be added?
		deferred
		end

	is_closed: BOOLEAN is
			-- Is the I/O medium open
		deferred
		end

	support_storable: BOOLEAN is
			-- Can medium be used to store an Eiffel object?
		deferred
		end

feature -- Status setting

	close is
			-- Close medium.
		require
			medium_is_open: not is_closed
		deferred
		end

feature -- Removal

	dispose is
			-- Ensure this medium is closed when garbage collected.
		do
			if not is_closed then
				close
			end
		end

feature -- Output

	put_new_line, new_line is
			-- Write a new line character to medium
		require
			extendible: extendible
		deferred
		end

	put_string, putstring (s: STRING) is
			-- Write `s' to medium.
		require
			extendible: extendible
			non_void: s /= Void
		deferred
		end

	put_character, putchar (c: CHARACTER) is
			-- Write `c' to medium.
		require
			extendible: extendible
		deferred
		end

	put_real, putreal (r: REAL) is
			-- Write `r' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer, putint, put_integer_32 (i: INTEGER) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_8 (i: INTEGER_8) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_16 (i: INTEGER_16) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_integer_64 (i: INTEGER_64) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_8 (i: NATURAL_8) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_16 (i: NATURAL_16) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural, put_natural_32 (i: NATURAL_32) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_natural_64 (i: NATURAL_64) is
			-- Write `i' to medium.
		require
			extendible: extendible
		deferred
		end

	put_boolean, putbool (b: BOOLEAN) is
			-- Write `b' to medium.
		require
			extendible: extendible
		deferred
		end

	put_double, putdouble (d: DOUBLE) is
			-- Write `d' to medium.
		require
			extendible: extendible
		deferred
		end

	put_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER) is
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

	read_real, readreal is
			-- Read a new real.
			-- Make result available in `last_real'.
		require
			is_readable: readable
		deferred
		end

	read_double, readdouble is
			-- Read a new double.
			-- Make result available in `last_double'.
		require
			is_readable: readable
		deferred
		end

	read_character, readchar is
			-- Read a new character.
			-- Make result available in `last_character'.
		require
			is_readable: readable
		deferred
		end

	read_integer, readint, read_integer_32 is
			-- Read a new 32-bit integer.
			-- Make result available in `last_integer'.
		require
			is_readable: readable
		deferred
		end

	read_integer_8 is
			-- Read a new 8-bit integer.
			-- Make result available in `last_integer_8'.
		require
			is_readable: readable
		deferred
		end

	read_integer_16 is
			-- Read a new 16-bit integer.
			-- Make result available in `last_integer_16'.
		require
			is_readable: readable
		deferred
		end

	read_integer_64 is
			-- Read a new 64-bit integer.
			-- Make result available in `last_integer_64'.
		require
			is_readable: readable
		deferred
		end

	read_natural_8 is
			-- Read a new 8-bit natural.
			-- Make result available in `last_natural_8'.
		require
			is_readable: readable
		deferred
		end

	read_natural_16 is
			-- Read a new 16-bit natural.
			-- Make result available in `last_natural_16'.
		require
			is_readable: readable
		deferred
		end

	read_natural, read_natural_32 is
			-- Read a new 32-bit natural.
			-- Make result available in `last_natural'.
		require
			is_readable: readable
		deferred
		end

	read_natural_64 is
			-- Read a new 64-bit natural.
			-- Make result available in `last_natural_64'.
		require
			is_readable: readable
		deferred
		end

	read_stream, readstream (nb_char: INTEGER) is
			-- Read a string of at most `nb_char' bound characters
			-- or until end of medium is encountered.
			-- Make result available in `last_string'.
		require
			is_readable: readable
		deferred
		ensure
			last_string_not_void: last_string /= Void
		end

	read_line, readline is
			-- Read characters until a new line or
			-- end of medium.
			-- Make result available in `last_string'.
		require
			is_readable: readable
		deferred
		ensure
			last_string_not_void: last_string /= Void
		end

	read_to_managed_pointer (p: MANAGED_POINTER; start_pos, nb_bytes: INTEGER) is
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

	lastchar: CHARACTER is
			-- Last character read by `read_character'
		do
			Result := last_character
		end

	laststring: STRING is
			-- Last string read
		do
			Result := last_string
		end

	lastint: INTEGER is
			-- Last integer read by `read_integer'
		do
			Result := last_integer
		end

	lastreal: REAL is
			-- Last real read by `read_real'
		do
			Result := last_real
		end

	lastdouble: DOUBLE is
			-- Last double read by `read_double'
		do
			Result := last_double
		end

end
