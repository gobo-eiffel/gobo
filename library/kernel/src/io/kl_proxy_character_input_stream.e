note

	description:

		"Proxy character input streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_PROXY_CHARACTER_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
		redefine
			is_rewindable,
			is_closable,
			rewind,
			close,
			valid_unread_character
		end

create

	make

feature {NONE} -- Initialization

	make (a_stream: like base_stream)
			-- Create a new proxy for `a_stream'.
		require
			base_stream_not_void: a_stream /= Void
		do
			base_stream := a_stream
		ensure
			base_stream_set: base_stream = a_stream
		end

feature -- Input

	read_string (nb: INTEGER)
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		do
			base_stream.read_string (nb)
		end

	read_character
			-- Read the next character in input stream.
			-- Make the result available in `last_character'.
		do
			base_stream.read_character
		end

	unread_character (an_item: CHARACTER_8)
			-- Put `an_item' back in input stream.
			-- This character will be read first by the next
			-- call to a read routine.
		do
			base_stream.unread_character (an_item)
		end

feature -- Access

	base_stream: KI_CHARACTER_INPUT_STREAM
			-- Underlying stream

	name: STRING
			-- Name of input stream
		do
			Result := base_stream.name
		end

	last_string: STRING_8
			-- Last string read
		do
			Result := base_stream.last_string
		end

	last_character: CHARACTER_8
			-- Last character read
		do
			Result := base_stream.last_character
		end

feature -- Status report

	end_of_input: BOOLEAN
			-- Has the end of input stream been reached?
		do
			Result := base_stream.end_of_input
		end

	is_open_read: BOOLEAN
			-- Can characters be read from input stream?
		do
			Result := base_stream.is_open_read
		end

	is_closable: BOOLEAN
			-- Can current input stream be closed?
		do
			Result := base_stream.is_closable
		end

	is_rewindable: BOOLEAN
			-- Can current input stream be rewound to return input from
			-- the beginning of the stream?
		do
			Result := base_stream.is_rewindable
		end

	valid_unread_character (a_character: CHARACTER_8): BOOLEAN
			-- Can `a_character' be put back in input stream?
		do
			Result := base_stream.valid_unread_character (a_character)
		end

feature -- Basic operations

	close
			-- Try to close input stream if it is closable. Set
			-- `is_open_read' to false if operation was successful.
		do
			base_stream.close
		end

	rewind
			-- Move input position to the beginning of stream.
		do
			base_stream.rewind
		end

invariant

	base_stream_not_void: base_stream /= Void

end
