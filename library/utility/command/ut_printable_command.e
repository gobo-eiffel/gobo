indexing

	description:

		"Commands whose textual representation (i.e. `out') %
		%can be printed to a file"

	library:    "Gobo Eiffel Utility Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class UT_PRINTABLE_COMMAND

inherit

	UT_COMMAND
		redefine
			out
		end

creation

	make

feature {NONE} -- Initialization

	make (a_string: like out) is
			-- Create a new printable command.
		require
			a_string_not_void: a_string /= Void
		do
			out := a_string
		ensure
			out_set: out = a_string
		end

feature -- Print

#ifndef ISE || HACT
	print_to_file (a_file: FILE) is
#else
	print_to_file (a_file: IO_MEDIUM) is
#endif
			-- Print current command textual representation
			-- (i.e. `out') to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (out)
		end

feature -- Execution

#ifndef ISE || HACT
	execute (a_file: FILE) is
#else
	execute (a_file: IO_MEDIUM) is
#endif
			-- Execute current command.
		do
			print_to_file (a_file)
		end

feature -- Status report

	executable (arg: ANY): BOOLEAN is
			-- Can current command be executed with `arg'?
		local
#ifndef ISE || HACT
			a_file: FILE
#else
			a_file: IO_MEDIUM
#endif
		do
			a_file ?= arg
			Result := a_file /= Void and then a_file.is_open_read
		end

feature -- Access

	out: STRING
			-- Textual representation

feature -- Setting

	set_out (a_string: like out) is
			-- Set `out' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			out := a_string
		ensure
			out_set: out = a_string
		end

invariant

	out_not_void: out /= Void

end -- class UT_PRINTABLE_COMMAND
