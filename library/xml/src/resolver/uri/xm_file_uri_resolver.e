note

	description:

		"External URI resolver for the file scheme applied on the local filesystem"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"

class XM_FILE_URI_RESOLVER

inherit

	XM_URI_RESOLVER

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature -- Initialization

	make
			-- Create.
		do
			last_error := "no stream"
		end

feature -- Status report

	scheme: STRING = "file"
			-- Scheme

feature -- Action(s)

	resolve (a_uri: UT_URI)
			-- Resolve file URI.
		local
			l_path: detachable STRING
			l_last_stream: KL_BINARY_INPUT_FILE
		do
			l_path := File_uri.uri_to_filename (a_uri)
			if l_path /= Void then
				create l_last_stream.make (l_path)
				l_last_stream.open_read
				if l_last_stream.is_open_read then
					last_stream := l_last_stream
					last_error := Void
				else
					last_error := STRING_.concat (Cannot_open_file_error, a_uri.path)
					last_stream := Void
				end
			else
				last_error := STRING_.concat (Cannot_open_file_error, a_uri.path)
				last_stream := Void
			end
		end

feature -- Result

	last_stream: detachable KI_BINARY_INPUT_FILE
			-- File matching stream

	last_error: detachable STRING
			-- Error

	has_error: BOOLEAN
			-- Is there an error?
		do
			Result := last_error /= Void
		end

	has_media_type: BOOLEAN
			-- Is the media type available.
		do
			Result := False
		end

	last_media_type: detachable UT_MEDIA_TYPE
			-- Media type, if available.
		do
			-- pre-condition is never met
		end

feature {NONE} -- Error messages

	Cannot_open_file_error: STRING = "Cannot open file "
			-- Error message

end
