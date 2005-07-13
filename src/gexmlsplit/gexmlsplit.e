indexing

	description:

		"Gobo Eiffel XML Splitter"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_EXCEPTIONS
	KL_SHARED_STANDARD_FILES

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create and execute a new 'gexmlsplit'.
		local
			in_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			create error_handler.make_standard
				-- Set non-verbose mode.
			error_handler.set_info_null
			read_arguments
			create in_file.make (input_filename)
			in_file.open_read
			if in_file.is_open_read then
				split (in_file)
				in_file.close
			else
				create cannot_read.make (input_filename)
				error_handler.report_error (cannot_read)
				Exceptions.die (1)
			end
		end

feature -- Processing

	read_arguments is
			-- Parse command line arguments.
		do
			if Arguments.argument_count /= 1 then
				input_filename := ""
				report_usage_error
				Exceptions.die (1)
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
			error_handler.report_info_message ("parsing data...")

			create {XM_EIFFEL_PARSER} a_xml_parser.make
			a_xml_parser.set_string_mode_mixed
			create a_gexmlsplit_dispatcher.make (error_handler)
			create a_gexmlsplit_parser.make (a_gexmlsplit_dispatcher)

			create filters.make (1, 2)
			filters.put (a_gexmlsplit_parser, 1)
			filters.put (a_gexmlsplit_dispatcher, 2)
			a_xml_parser.set_callbacks (standard_callbacks_pipe (filters))
			a_xml_parser.parse_from_stream (in_file)

			if not a_xml_parser.is_correct then
				error_handler.report_error_message (a_xml_parser.last_error_extended_description)
			else
				error_handler.report_info_message ("parsing ok.")
			end
			error_handler.report_info_message ("exiting...")
		end

feature -- Access

	input_filename: STRING
			-- Name of file containing input XML document

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Usage message

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gexmlsplit usage message
		once
			create Result.make ("<input_filename>")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void
	input_filename_not_void: input_filename /= Void

end
