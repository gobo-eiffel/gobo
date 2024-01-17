note

	description:

		"Proxy character output streams"

	remark: "[
		`append', `put_integer' and `put_boolean' are NOT redefined,
		as they are defined entirely in terms of `put_character'
		and `put_string' - template pattern. This is most probably
		what descendants will want.
	]"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005-2019, Colin Adams and others"
	license: "MIT License"

class KL_PROXY_CHARACTER_OUTPUT_STREAM

inherit

	KI_CHARACTER_OUTPUT_STREAM
		redefine
			is_closable,
			close
		end

create

	make

feature {NONE} -- Initialization

	make (a_stream: like base_stream)
			-- Create a new proxy output stream.
		require
			a_stream_not_void: a_stream /= Void
		do
			base_stream := a_stream
		ensure
			base_stream_set: base_stream = a_stream
		end

feature -- Output

	put_character (c: CHARACTER_8)
			-- Write `c' to output stream.
		do
			base_stream.put_character (c)
		end

	put_string (a_string: READABLE_STRING_8)
			-- Write `a_string' to output stream.
		do
			base_stream.put_string (a_string)
		end

feature -- Access

	base_stream: KI_CHARACTER_OUTPUT_STREAM
			-- Underlying stream

	name: STRING
			-- Name of output stream
		do
			Result := base_stream.name
		end

feature -- Status report

	is_open_write: BOOLEAN
			-- Can characters be written to output stream?
		do
			Result := base_stream.is_open_write
		end

	is_closable: BOOLEAN
			-- Can current output stream be closed?
		do
			Result := base_stream.is_closable
		end

feature -- Basic operations

	flush
			-- Flush buffered data to disk.
		do
			base_stream.flush
		end

	close
			-- Try to close output stream if it is closable. Set
			-- `is_open_write' to false if operation was successful.
		do
			base_stream.close
		end

invariant

	base_stream_not_void: base_stream /= Void

end
