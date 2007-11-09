indexing

	description:

		"Routines that ought to be in class INPUT_STREAM"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_INPUT_STREAM_ROUTINES

obsolete

	"[020502] Use descendants of KI_INPUT_STREAM instead."

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_ANY_ROUTINES

feature -- Initialization

	make_file_open_read (a_filename: STRING): like INPUT_STREAM_TYPE is
			-- Create a new file object with `a_filename' as
			-- file name and try to open it in read-only mode.
			-- `is_open_read (Result)' is set to True
			-- if operation was successful.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_is_string: ANY_.same_types (a_filename, "")
			a_filename_not_empty: a_filename.count > 0
		local
			rescued: BOOLEAN

			a_file: PLAIN_TEXT_FILE




		do
			if not rescued then

				create a_file.make (a_filename)
				Result := a_file
				a_file.open_read
			elseif not a_file.is_closed then
				a_file.close














			end
		ensure
			file_not_void: Result /= Void
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

feature -- Access

	name (a_stream: like INPUT_STREAM_TYPE): STRING is
			-- Name of `a_stream'
		require
			a_stream_void: a_stream /= Void





		do













			Result := a_stream.name

		ensure
			name_not_void: Result /= Void
		end

feature -- Status report

	is_open_read (a_stream: like INPUT_STREAM_TYPE): BOOLEAN is
			-- Is `a_stream' open in read mode?
		require
			a_stream_void: a_stream /= Void
		do



			Result := a_stream.is_open_read

		end

	is_closed (a_stream: like INPUT_STREAM_TYPE): BOOLEAN is
			-- Is `a_stream' closed?
		require
			a_stream_void: a_stream /= Void
		do



			Result := a_stream.is_closed

		end

	end_of_input (a_stream: like INPUT_STREAM_TYPE): BOOLEAN is
			-- Has an EOF been detected?
		require
			a_stream_void: a_stream /= Void
			a_stream_is_open_read: is_open_read (a_stream)
		do

			Result := not a_stream.readable







		end

feature -- Status setting

	close (a_stream: like INPUT_STREAM_TYPE) is
			-- Close `a_stream' if it is closable,
			-- let it open otherwise.
		require
			a_stream_not_void: a_stream /= Void
			not_closed: not is_closed (a_stream)




		do






			a_stream.close

		end

feature -- Input operations

	read_string (a_stream: like INPUT_STREAM_TYPE; nb_char: INTEGER): STRING is
			-- Read at most `nb_char' characters read from `a_stream'.
			-- Return the characters that have actually been read.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: is_open_read (a_stream)
			nb_char_large_enough: nb_char >= 0



















		do
			a_stream.read_stream (nb_char)
			Result := a_stream.last_string

		ensure
			string_not_void: Result /= Void
			string_count_small_enough: Result.count <= nb_char
		end

	read_stream (a_stream: like INPUT_STREAM_TYPE;
		a_buffer: STRING; pos, nb_char: INTEGER): INTEGER is
			-- Fill `a_buffer', starting at position `pos' with
			-- at most `nb_char' characters read from `a_stream'.
			-- Return the number of characters actually read.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: is_open_read (a_stream)
			a_buffer_not_void: a_buffer /= Void
			a_buffer_is_string: ANY_.same_types (a_buffer, "")
			valid_position: a_buffer.valid_index (pos)
			nb_char_large_enough: nb_char >= 0
			nb_char_small_enough: nb_char <= a_buffer.count - pos + 1
		local

			a_string: STRING




			i, j: INTEGER

		do
















			a_stream.read_stream (nb_char)
			a_string := a_stream.last_string
			Result := a_string.count



			j := pos
			from i := 1 until i > Result loop
				a_buffer.put (a_string.item (i), j)
				j := j + 1
				i := i + 1
			end


		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb_char
		end

end
