indexing

	description:

		"Routines that ought to be in class OUTPUT_STREAM"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_OUTPUT_STREAM_ROUTINES

obsolete

	"[020502] Use descendants of KI_OUTPUT_STREAM instead."

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

feature -- Initialization

	make_file_open_write (a_filename: STRING): like OUTPUT_STREAM_TYPE is
			-- Create a new file object with `a_filename' as
			-- file name and try to open it in write-only mode.
			-- `is_open_write (Result)' is set to True
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
				a_file.open_write
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

feature -- Status report

	is_open_write (a_stream: like OUTPUT_STREAM_TYPE): BOOLEAN is
			-- Is `a_stream' open in write mode?
		require
			a_stream_void: a_stream /= Void
		do
			Result := a_stream.is_open_write
		end

	is_closed (a_stream: like OUTPUT_STREAM_TYPE): BOOLEAN is
			-- Is `a_stream' closed?
		require
			a_stream_void: a_stream /= Void
		do
			Result := a_stream.is_closed
		end

feature -- Status setting

	close (a_stream: like OUTPUT_STREAM_TYPE) is
			-- Close `a_stream' if it is closable,
			-- let it open otherwise.
		require
			a_stream_not_void: a_stream /= Void
			not_closed: not is_closed (a_stream)
		do
			a_stream.close
		end

feature -- Element change

	flush (a_stream: like OUTPUT_STREAM_TYPE) is
			-- Flush data of `a_stream' to disk.
		require
			a_stream_not_void: a_stream /= Void
			not_closed: not is_closed (a_stream)
		local
			a_file: FILE
		do
			a_file ?= a_stream
			if a_file /= Void then
				a_file.flush
			end
		end

end
