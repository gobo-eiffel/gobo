indexing

	description:

		"Print sample"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class PRINT

inherit

	KL_SHARED_ARGUMENTS

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Run.
		do
			Arguments.set_program_name ("print")
			create error_handler.make_standard
			process_arguments
			if not has_error then
				process_data_file
			end
		end

feature -- Processing

	process_data_file is
			-- Parse file.
		require
			filename_not_void: filename /= Void
			event_parser_not_void: event_parser /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			a_parser: XM_PARSER
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			error_handler.report_info_message ("parsing data...")
			create a_file.make (filename)
			a_file.open_read
			if not a_file.is_open_read then
				create cannot_read.make (filename)
				error_handler.report_error (cannot_read)
				has_error := True
			else
				a_parser := event_parser
				a_parser.set_dtd_resolver (new_file_resolver)
				a_parser.set_entity_resolver (new_file_resolver)
				
				a_parser.set_dtd_callbacks (new_dtd_pretty_print)
				a_parser.set_callbacks (standard_callbacks_pipe (<<new_pretty_print>>))
				a_parser.parse_from_stream (a_file)
				if not a_parser.is_correct then
					error_handler.report_error_message (a_parser.last_error_extended_description)
					has_error := True
				else
					error_handler.report_info_message ("parsing ok.")
				end
				a_file.close
				error_handler.report_info_message ("exiting...")
			end
		end

	process_arguments is
			-- Parse command line.
		local
			parser_switch: STRING
		do
			if Arguments.argument_count /= 2 then
				error_handler.report_error (Usage_message)
				has_error := True
			else
				parser_switch := Arguments.argument (1)
				filename := Arguments.argument (2)
				if parser_switch.is_equal ("--expat") then
					if not fact.is_expat_parser_available then
						error_handler.report_error_message ("expat is not availabe, please choose other parser backend")
						has_error := True
					else
						error_handler.report_info_message ("Using expat parser")
						event_parser := fact.new_expat_parser
					end
				elseif parser_switch.is_equal ("--eiffel") then
					error_handler.report_info_message ("Using eiffel parser")
					create {XM_EIFFEL_PARSER} event_parser.make
				else
					error_handler.report_error (Usage_message)
					has_error := True
				end
			end
		ensure
			filename_not_void: (not has_error) implies filename /= Void
			event_parser_not_void: (not has_error) implies event_parser /= Void
		end

feature -- Parser

	fact: XM_EXPAT_PARSER_FACTORY is
			-- Expat XML parser factory
		once
			create Result
		ensure
			factory_not_void: Result /= Void
		end

	event_parser: XM_PARSER
			-- XML parser

feature -- Access

	has_error: BOOLEAN
			-- Has an error occurred?

	filename: STRING
			-- Name of file to read

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature {NONE} -- DTD

	new_dtd_pretty_print: XM_DTD_PRETTY_PRINT_FILTER is
			-- DTD pretty printer
		do
			create Result.make_null
		end
		
	new_file_resolver: XM_FILE_EXTERNAL_RESOLVER is
			-- File loader for DTD or entities.
		do
			create Result.make
		end
		
feature {NONE} -- Implementation

	Usage_message: UT_USAGE_MESSAGE is
			-- Usage message
		local
			a_message: STRING
		once
			a_message := clone ("(")
			if fact.is_expat_parser_available then
				a_message.append_string ("--expat|")
			end
			a_message.append_string ("--eiffel) <input-file>")
			create Result.make (a_message)
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
