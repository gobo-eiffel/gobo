indexing

	description:

		"External URI resolver for the file scheme applied on the local filesystem"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_FILE_URI_RESOLVER

inherit

	XM_URI_RESOLVER

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature

	make is
			-- Create.
		do
		end

feature -- Status report

	scheme: STRING is "file"

feature -- Action(s)

	resolve (a_uri: UT_URI) is
			-- Resolve file URI.
		local
			l_path: STRING
		do
			l_path := File_uri.uri_to_filename (a_uri)
			create {KL_TEXT_INPUT_FILE} last_stream.make (l_path)
			last_stream.open_read
			if last_stream.is_open_read then
				last_error := Void
			else
				last_error := STRING_.concat (Cannot_open_file_error, a_uri.path)
			end
		end

feature -- Result

	last_stream: KI_TEXT_INPUT_FILE
			-- File matching stream

	last_error: STRING
			-- Error

	has_error: BOOLEAN is
			-- Is there an error?
		do
			Result := last_error /= Void
		end

	has_media_type: BOOLEAN is
			-- Is the media type available.
		do
			Result := False
		end

	last_media_type: UT_MEDIA_TYPE is
			-- Media type, if available.
		do
			-- pre-condition is never met
		end

feature {NONE} -- Error messages

	Cannot_open_file_error: STRING is "Cannot open file "

end
