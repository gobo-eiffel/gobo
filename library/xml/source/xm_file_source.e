indexing

	description:

		"Files as source of XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_FILE_SOURCE

inherit

	XM_URI_SOURCE
		redefine
			out
		end

creation

	make

feature {NONE} -- Creation

	make (a_file: STRING) is
			-- Set file name.
		require
			not_void: a_file /= Void
		do
			file_name := a_file
		ensure
			set: same_string (file_name, a_file)
		end

feature -- Access

	file_name: STRING
			-- File name.

	uri: STRING is
			-- File URI.
		do
			Result := STRING_.concat ("file:", file_name)
		end

feature -- Output

	out: STRING is
			-- Filename.
		do
			Result := file_name.out
		end

invariant

	file_name_not_void: file_name /= Void

end
