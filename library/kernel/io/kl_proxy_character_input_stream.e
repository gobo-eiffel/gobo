indexing

	description:

		"Proxy character input streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_PROXY_CHARACTER_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
		redefine
			is_rewindable, is_closable, rewind, close, valid_unread_character
		end

create

	make

feature {NONE} -- Initialization

	make (a_stream: like base_stream) is
			-- Create a new proxy for `a_stream'.
		require
			base_stream_not_void: a_stream /= Void
		do
			base_stream := a_stream
		ensure
			base_stream_set: base_stream = a_stream
		end

feature -- Input

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
		do
			base_stream.read_string (nb)
		end

	read_character is
			-- Read the next character in input stream.
			-- Make the result available in `last_character'.
		do
			base_stream.read_character
		end

	unread_character (an_item: CHARACTER) is
			-- Put `an_item' back in input stream.
			-- This character will be read first by the next
			-- call to a read routine.
		do
			base_stream.unread_character (an_item)
		end

feature -- Access

	base_stream: KI_CHARACTER_INPUT_STREAM
			-- Underlying stream

	name: STRING is
			-- Name of input stream
		do
			Result := base_stream.name
		end

	last_string: STRING is
			-- Last string read
		do
			Result := base_stream.last_string
		end

	last_character: CHARACTER is
			-- Last character read
		do
			Result := base_stream.last_character
		end

feature -- Status report

	end_of_input: BOOLEAN is
			-- Has the end of input stream been reached?
		do
			Result := base_stream.end_of_input
		end

	is_open_read: BOOLEAN is
			-- Can characters be read from input stream?
		do
			Result := base_stream.is_open_read
		end

	is_closable: BOOLEAN is
			-- Can current input stream be closed?
		do
			Result := base_stream.is_closable
		end

	is_rewindable: BOOLEAN is
			-- Can current input stream be rewound to return input from
			-- the beginning of the stream?
		do
			Result := base_stream.is_rewindable
		end

	valid_unread_character (a_character: CHARACTER): BOOLEAN is
			-- Can `a_character' be put back in input stream?
		do
			Result := base_stream.valid_unread_character (a_character)
		end

feature -- Basic operations

	close is
			-- Try to close input stream if it is closable. Set
			-- `is_open_read' to false if operation was successful.
		do
			base_stream.close
		end

	rewind is
			-- Move input position to the beginning of stream.
		do
			base_stream.rewind
		end

invariant

	base_stream_not_void: base_stream /= Void

end
