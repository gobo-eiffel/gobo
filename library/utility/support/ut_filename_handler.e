indexing

	description:

		"Filename handlers. Use the Unix/Windows filename conventions"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_FILENAME_HANDLER

inherit

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new filename handler.
		do
			directory_separators := "/\"
		ensure
			directory_separators_set: equal (directory_separators, "/\")
		end

feature -- Access

	pathname (a_dirname, a_filename: STRING): STRING is
			-- Pathname made up of `a_dirname' and `a_filename'
			-- and separated by the first directory separator
		require
			a_dirname_not_void: a_dirname /= Void
			a_filename_not_void: a_filename /= Void
		do
			Result := STRING_.make (a_dirname.count + a_filename.count + 1)
			Result.append_string (a_dirname)
			Result.append_character (directory_separators.item (1))
			Result.append_string (a_filename)
		ensure
			pathname_not_void: Result /= Void
		end

	directory_separators: STRING
			-- Directory separators

feature -- Setting

	set_directory_separators (separators: STRING) is
			-- Set `directory_separators' to `separators'.
		require
			separators_not_void: separators /= Void
			separators_not_empty: not separators.empty
		do
			directory_separators := separators
		ensure
			directory_separators_set: directory_separators = separators
		end

invariant

	directory_separators_not_void: directory_separators /= Void
	directory_separators_not_empty: not directory_separators.empty

end -- class UT_FILENAME_HANDLER
