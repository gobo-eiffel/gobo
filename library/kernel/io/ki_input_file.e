indexing

	description:

		"Interface for input files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_INPUT_FILE

inherit

	KI_FILE
		rename
			open as open_read,
			is_open as is_open_read
		redefine
			open_read
		end

	KI_CHARACTER_INPUT_STREAM

feature -- Status report

	end_of_file: BOOLEAN is
			-- Has the end of input file been reached?
		require
			is_open_read: is_open_read
		deferred
		end

	end_of_input: BOOLEAN is
			-- Has the end of input stream been reached?
		do
			Result := end_of_file
		ensure then
			definition: Result = end_of_file
		end

feature -- Basic operations

	open_read is
			-- Open current file in read-only mode if
			-- it can be opened, let it closed otherwise.
		deferred
		ensure then
			not_eof: is_open_read implies not end_of_file
		end

end -- class KI_INPUT_FILE
