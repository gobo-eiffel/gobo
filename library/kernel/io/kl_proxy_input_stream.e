indexing

	description:

		"Proxy character input streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_PROXY_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
		redefine
			is_rewindable, is_closable, rewind, close
		end

feature {NONE} -- Initialization

	make (an_underlying_stream: like base_stream) is
			-- Establish invariant.
		require
			base_stream_not_void: an_underlying_stream /= Void
		do
			base_stream := an_underlying_stream
		ensure
			base_stream_set: base_stream = an_underlying_stream
		end

feature -- Access

	base_stream: KI_CHARACTER_INPUT_STREAM
			-- Underlying stream
		
	name: STRING is
			-- Name of input stream
		do
			Result := base_stream.name
		end

feature -- Status report

	end_of_input: BOOLEAN is
			-- Has the end of input stream been reached?
		do
			Result := base_stream.end_of_input
		end

	is_open_read: BOOLEAN is
			-- Can items be read from input stream?
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
