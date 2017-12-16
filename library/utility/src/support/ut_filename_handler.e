note

	description:

		"Filename handlers. Use the Unix/Windows filename conventions"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_FILENAME_HANDLER

inherit

	ANY -- Export features of ANY.

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new filename handler.
		do
			directory_separators := "/\"
		ensure
			directory_separators_set: directory_separators.is_equal ("/\")
		end

feature -- Access

	pathname (a_dirname, a_filename: STRING): STRING
			-- Pathname made up of `a_dirname' and `a_filename'
			-- and separated by the first directory separator
		require
			a_dirname_not_void: a_dirname /= Void
			a_filename_not_void: a_filename /= Void
		local
			c: CHARACTER
		do
			Result := STRING_.new_empty_string (a_dirname, a_dirname.count + a_filename.count + 1)
			Result.append_string (a_dirname)
			c := directory_separators.item (1)
			if c /= '%U' then
				Result.append_character (c)
			else
				Result := STRING_.appended_substring (Result, directory_separators, 1, 1)
			end
			Result := STRING_.appended_string (Result, a_filename)
		ensure
			pathname_not_void: Result /= Void
		end

	directory_separators: STRING
			-- Directory separators

feature -- Setting

	set_directory_separators (separators: STRING)
			-- Set `directory_separators' to `separators'.
		require
			separators_not_void: separators /= Void
			separators_not_empty: separators.count > 0
		do
			directory_separators := separators
		ensure
			directory_separators_set: directory_separators = separators
		end

invariant

	directory_separators_not_void: directory_separators /= Void
	directory_separators_not_empty: directory_separators.count > 0

end
