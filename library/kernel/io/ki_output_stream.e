indexing

	description:

		"Interface for output streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_OUTPUT_STREAM [G]

feature -- Output

	put (v: G) is
			-- Write `v' to output stream.
		require
			is_open_write: is_open_write
		deferred
		end

	append (an_input_stream: KI_INPUT_STREAM [G]) is
			-- Read items of `an_input_stream' until the end
			-- of input is reached, and write these items to
			-- current output stream.
		require
			is_open_write: is_open_write
			an_input_stream_not_void: an_input_stream /= Void
			an_input_stream_open_read: an_input_stream.is_open_read
		do
			from
				if not an_input_stream.end_of_input then
					an_input_stream.read
				end
			until
				an_input_stream.end_of_input
			loop
				put (an_input_stream.last_item)
				an_input_stream.read
			end
		ensure
			end_of_input: an_input_stream.end_of_input
		end

feature -- Status report

	is_open_write: BOOLEAN is
			-- Can items be written to output stream?
		deferred
		end

	is_closable: BOOLEAN is
			-- Can current output stream be closed?
		do
			Result := False
		ensure
			is_open: Result implies is_open_write
		end

feature -- Access

	name: STRING is
			-- Name of output stream
		deferred
		ensure
			name_not_void: Result /= Void
		end

feature -- Basic operations

	close is
			-- Try to close output stream if it is closable. Set
			-- `is_open_write' to false if operation was successful.
		require
			is_closable: is_closable
		do
		end

end
