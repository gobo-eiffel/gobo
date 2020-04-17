note

	description:

		"Interface for input files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
		undefine
			is_closable,
			close
		redefine
			valid_unread_character,
			last_character
		end

	KL_SHARED_PLATFORM

feature -- Status report

	end_of_file: BOOLEAN
			-- Has the end of input file been reached?
		require
			is_open_read: is_open_read
		deferred
		end

	end_of_input: BOOLEAN
			-- Has the end of input stream been reached?
		do
			Result := end_of_file
		ensure then
			definition: Result = end_of_file
		end

	valid_unread_character (a_character: CHARACTER_8): BOOLEAN
			-- Can `a_character' be put back in input stream?
		do
			Result := a_character.code <= Platform.Maximum_byte_code
		ensure then
			extended_ascii: Result = (a_character.code <= Platform.Maximum_byte_code)
		end

feature -- Access

	last_character: CHARACTER_8
			-- Last character read
		deferred
		ensure then
			extended_ascii: Result.code <= Platform.Maximum_byte_code
		end

feature -- Basic operations

	open_read
			-- Open current file in read-only mode if
			-- it can be opened, let it closed otherwise.
		deferred
		ensure then
			not_eof: is_open_read implies not end_of_file
		end

end
