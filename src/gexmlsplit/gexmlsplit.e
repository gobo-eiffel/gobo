indexing

	description:

		"Gobo Eiffel XML Splitter"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

creation

	make

feature {NONE}

	make is
			-- Create and execute a new 'gexmlsplit'.
		local
			in_file: KL_TEXT_INPUT_FILE
		do
			read_arguments
			!! in_file.make (input_filename)
			in_file.open_read
			if in_file.is_open_read then
				split (in_file)
				in_file.close
			else
					-- TODO: Use UT_ERROR_HANDLER.
				std.error.put_string ("Unable to open input file: ")
				std.error.put_line (input_filename)
			end
		end

	read_arguments is
			-- Parse command line arguments.
		do
			if Arguments.argument_count /= 1 then
				report_usage_error
				input_filename := ""
			else
				input_filename := Arguments.argument (1)
			end
		ensure
			input_filename_not_void: input_filename /= Void
		end

	split (in_file: KI_TEXT_INPUT_FILE) is
			-- Parse xml document stored in `in_file' and split contents.
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
			debug
				std.output.put_line ("parsing data...")
			end

			!XM_EIFFEL_PARSER! a_xml_parser.make
			!! a_gexmlsplit_dispatcher.make
			!! a_gexmlsplit_parser.make (a_gexmlsplit_dispatcher)

			!! filters.make (0, 1)
			filters.put (a_gexmlsplit_parser, 0)
			filters.put (a_gexmlsplit_dispatcher, 1)
			a_xml_parser.set_callbacks (standard_callbacks_pipe (filters))
			a_xml_parser.parse_from_stream (in_file)

			debug
				if not a_xml_parser.is_correct then
					std.output.put_line (a_xml_parser.last_error_extended_description)
				else
					std.output.put_line ("parsing ok.")
				end
				std.output.put_line ("exiting...")
			end
		end

feature {NONE} -- Access

	input_filename: STRING
			-- Name of file containing input XML document

feature {NONE} -- Usage message

	report_usage_error is
			-- Report usage error.
		do
				-- TODO: Use UT_ERROR_HANDLER.
			std.output.put_line (Usage_message)
		end

	Usage_message: STRING is
			-- Gexace usage message
		once
			Result := "gexmlsplit <intput_file_name>"
		ensure
			usage_message_not_void: Result /= Void
		end

end
