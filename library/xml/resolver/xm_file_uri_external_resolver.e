indexing

	description:

		"External URI resolver for the file scheme applied on the local filesystem"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_FILE_URI_EXTERNAL_RESOLVER

inherit

	XM_URI_EXTERNAL_RESOLVER
	
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

	make,
	make_current_directory
	
feature

	make is
			-- Create with no default URI
		do
			make_uris	
		end
		
	make_current_directory is
			-- Create with the current directory as default URI.
		local
			a_uri: UT_URI
		do
			make
			create a_uri.make ("file:")
			uris.put (a_uri)
		end
		
feature -- Action(s)

	resolve_uri (a_uri: UT_URI) is
			-- Resolve file URI.
		do
			if STRING_.same_case_insensitive (a_uri.scheme, File_scheme) then
				create {KL_TEXT_INPUT_FILE} last_stream.make (a_uri.path)
				last_stream.open_read
				if last_stream.is_open_read then
					last_error := Void
				else
					last_error := STRING_.concat (Cannot_open_file_error, a_uri.path)
				end
			else
				last_error := Not_file_uri_error
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

feature {NONE} -- Constant(s)

	File_scheme: STRING is "file"

feature {NONE} -- Error messages
	
	Cannot_open_file_error: STRING is "Cannot open file "
	Not_file_uri_error: STRING is "URI is not of file type"
	
end
