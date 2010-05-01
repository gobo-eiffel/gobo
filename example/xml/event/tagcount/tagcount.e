note

	description:

		"Tag count XML parser example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TAGCOUNT

inherit

	KL_SHARED_ARGUMENTS

create

	make

feature {NONE} -- Initialization

	make is
			-- Run.
		do
			Arguments.set_program_name ("tagcount")
			create error_handler.make_standard
			if Arguments.argument_count /= 1 then
				error_handler.report_error_message ("File name expected on command line")
			else
				process_file (Arguments.argument (1))
			end
		end

feature -- Processing

	parse_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse open stream.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open: a_stream.is_open_read
		local
			a_parser: XM_PARSER
			a_consumer: TAGCOUNT_CALLBACKS
		do
			-- Create the parser.
			-- It is left in the default state, which means:
			-- ascii only, no external entities or DTDs,
			-- no namespace resolving.
			create {XM_EIFFEL_PARSER} a_parser.make
			
			-- Create the event comsumer that counts start tags.
			create {TAGCOUNT_CALLBACKS} a_consumer.make
			a_parser.set_callbacks (a_consumer)
			
			-- Parse and display result
			a_parser.parse_from_stream (a_stream)
			if not a_parser.is_correct then
				error_handler.report_error_message (a_parser.last_error_extended_description)
			else
				error_handler.report_info_message ("Number of tags found: " + a_consumer.count.out)
			end
		end

	process_file (filename: STRING) is
			-- Parse file.
		require
			filename_not_void: filename /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			error_handler.report_info_message ("Parsing...")
			create a_file.make (filename)
			a_file.open_read
			if not a_file.is_open_read then
				create cannot_read.make (filename)
				error_handler.report_error (cannot_read)
			else
				parse_stream (a_file)
				a_file.close
			end
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

invariant

	error_handler_not_void: error_handler /= Void

end
