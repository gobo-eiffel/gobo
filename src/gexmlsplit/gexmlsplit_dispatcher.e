indexing

	description:

		"Gobo Eiffel XML Splitter Dispatcher"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT_DISPATCHER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			output
		end

	KL_SHARED_STANDARD_FILES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a xml dispatcher.
		do
			make_null
			!! output_files.make
		end

feature -- Element change

	put (a_filename: STRING) is
			-- Add a new output file on top of the output file stack.
		require
			a_filename_not_void: a_filename /= Void
		local
			a_file: KL_TEXT_OUTPUT_FILE
		do
			!! a_file.make (a_filename)
			a_file.open_write
			if not a_file.is_open_write then
					-- TODO: Use UT_ERROR_HANDLER.
				std.error.put_string ("Unable to open output file: ")
				std.error.put_line (a_filename)
			end
			output_files.put (a_file)
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

	output (s: UC_STRING) is
			-- Output string to top element of file output stack.
		local
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if not output_files.is_empty then
				a_file := output_files.item
				if a_file.is_open_write then
					output_files.item.put_string (s)
				end
			end
		end

feature {NONE} -- Implementation

	output_files: DS_LINKED_STACK [KL_TEXT_OUTPUT_FILE]
			-- File output stack

invariant

	output_files_not_void: output_files /= Void
	no_void_output_file: not output_files.has (Void)

end
