indexing

	description:

		"Gobo Eiffel XML Splitter Dispatcher"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT_DISPATCHER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			output
		end

create

	make

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a xml dispatcher.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
			create output_files.make
			make_null
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Element change

	put (a_filename: STRING) is
			-- Add a new output file on top of the output file stack.
		require
			a_filename_not_void: a_filename /= Void
		local
			a_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create a_file.make (a_filename)
			a_file.open_write
			if not a_file.is_open_write then
				create cannot_write.make (a_filename)
				error_handler.report_error (cannot_write)
			end
			output_files.put (a_file)
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"UTF-8%"?>")
		ensure
			one_more: output_files.count = old output_files.count + 1
		end

	remove is
			-- Remove the top output file from the output file stack.
		local
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if not output_files.is_empty then
				a_file := output_files.item
				if a_file.is_open_write then
					a_file.close
				end
				output_files.remove
			end
		end

feature -- Output

	output (s: STRING) is
			-- Output string to top element of file output stack.
		local
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if not output_files.is_empty then
				a_file := output_files.item
				if a_file.is_open_write then
					a_file.put_string (s)
				end
			end
		end

feature {NONE} -- Implementation

	output_files: DS_LINKED_STACK [KL_TEXT_OUTPUT_FILE]
			-- File output stack

invariant

	error_handler_not_void: error_handler /= Void
	output_files_not_void: output_files /= Void
	no_void_output_file: not output_files.has (Void)

end
