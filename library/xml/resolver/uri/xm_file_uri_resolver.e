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

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

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
			l_path := a_uri.path
			if operating_system.is_windows and then l_path.count > 0 and then (l_path.item (1) = '/' and l_path.has (':')) then
					-- Patch while waiting for UT_URI to be fixed.
				l_path := clone (l_path)
				l_path.keep_tail (l_path.count - 1)
			end
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

feature {NONE} -- Error messages

	Cannot_open_file_error: STRING is "Cannot open file "

end
