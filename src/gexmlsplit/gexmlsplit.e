indexing

	description:

		"Gobo Eiffel XML Spliter"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT

inherit

	KL_SHARED_ARGUMENTS

	KL_FILE_SYSTEM
		rename
			make as make_file_system
		end

	XM_CALLBACKS_FILTER_FACTORY

creation

	make

feature {NONE}

	make is
			-- Create and execute a new 'gexmlsplit'.
		do
			make_file_system
			read_arguments
			if not has_error then
				split
			end
		end

	read_arguments is
			-- parse command line arguments
			-- and open input file
			-- if input file cannot be opened or has not been
			-- specified
			-- set `has_error' to true.
		local
			a_in_file_name: STRING
		do
			if Arguments.argument_count /= 1 then
				report_usage_error
				has_error := True
			else
				a_in_file_name := Arguments.argument (1)
				!! in_file.make (a_in_file_name)
				in_file.open_read
				if not in_file.is_open_read then
					has_error := True
					io.put_string ("Unable to open input file:")
					io.put_string (a_in_file_name)
					io.put_string ("%N")
				end
			end
		ensure
			in_file_open_write_or_error_occured: (in_file /= Void and then in_file.is_open_read) or has_error
		end

	split is
			-- parse xml document stored in `in_file' and split
			-- contents.
			-- Two filters are used for the job:
			-- the first one (`a_gexmlsplit_parser') watches out for
			-- "document" elements and gives notice to the second
			-- filter (`a_gexmlsplit_dispatcher') which in turn,
			-- dispatches the output to the corresponding files.
		require
			in_file_not_void: in_file /= Void
			in_file_open_read: in_file.is_open_read
		local
			a_xml_parser: XM_PARSER
			a_gexmlsplit_parser: GEXMLSPLIT_PARSER
			a_gexmlsplit_dispatcher: GEXMLSPLIT_DISPATCHER
			filters: ARRAY [XM_CALLBACKS_FILTER]
		do
			io.put_string ("parsing data...%N")

			!XM_EIFFEL_PARSER! a_xml_parser.make
			!! a_gexmlsplit_dispatcher.make
			!! a_gexmlsplit_parser.make (a_gexmlsplit_dispatcher)

			!! filters.make (0, 1)
			filters.put (a_gexmlsplit_parser, 0)
			filters.put (a_gexmlsplit_dispatcher, 1)
			a_xml_parser.set_callbacks (
					standard_callbacks_pipe (filters))
			a_xml_parser.parse_from_stream (in_file)

			if not a_xml_parser.is_correct then
				io.put_string (a_xml_parser.last_error_extended_description)
				io.put_new_line
			else
				io.put_string ("parsing ok.%N")
			end

			in_file.close
			io.put_string ("exiting...%N")
		end

feature {NONE}

	in_file: KL_TEXT_INPUT_FILE
			-- file object for input xml document

	has_error: BOOLEAN
			-- error flag

feature {NONE} -- Usage message

	report_usage_error is
			-- Report usage error.
		do
			print (Usage_message)
		end

	Usage_message: STRING is
			-- Gexace usage message
		once
			Result := "gexmlsplit <intput_file_name>%N"
		ensure
			usage_message_not_void: Result /= Void
		end

end
