indexing

	description:

		"Gobo Eiffel XML Spliter Dispatcher"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT_DISPATCHER

inherit

	KL_SHARED_FILE_SYSTEM

	XM_PRETTY_PRINT_FILTER
		redefine
			output
		end

creation

	make

feature

	make is
			-- create an instance of a xml dispatcher
		do
			make_null
			!! output_files.make
		end

feature

	put (a_file: KL_TEXT_OUTPUT_FILE) is
			-- add a new output file on top of the output file stack
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_files.put (a_file)
		end

	remove is
			-- remove the top output file from the output file stack
		do
			check
				output_files_count_greater_zero: output_files.count > 0
			end
			output_files.item.close
			output_files.remove
		end

feature

	output (s: UC_STRING) is
			-- Output string to top element of file output stack
		do
			if output_files.count > 0 then
				output_files.item.put_string (s)
			end
		end

feature {NONE}

	output_files: DS_LINKED_STACK [KL_TEXT_OUTPUT_FILE]
			-- file output stack

end
