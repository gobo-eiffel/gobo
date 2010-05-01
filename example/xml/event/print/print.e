note

	description:

		"Print sample"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PRINT

inherit

	KL_SHARED_ARGUMENTS

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

	XM_RESOLVER_FACTORY
		export {NONE} all end
		
create

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
			a_dtd_printer: XM_DTD_PRETTY_PRINT_FILTER
			a_parser: XM_PARSER
		do
			error_handler.report_info_message ("parsing data...")
			a_parser := event_parser
			
			a_parser.set_dtd_resolver (new_file_resolver_current_directory)
			a_parser.set_entity_resolver (new_file_resolver_current_directory)
				
			create a_dtd_printer.make_null
			a_parser.set_dtd_callbacks (a_dtd_printer)
			a_parser.set_callbacks (standard_callbacks_pipe (<<new_pretty_print>>))
			a_parser.parse_from_system (filename)
			if not a_parser.is_correct then
				error_handler.report_error_message (a_parser.last_error_extended_description)
				has_error := True
			else
				error_handler.report_info_message ("parsing ok.")
			end
			error_handler.report_info_message ("exiting...")
		end

	process_arguments is
			-- Parse command line.
		local
			parser_switch: STRING
		do
			if Arguments.argument_count = 1 then
				filename := Arguments.argument (1)
				error_handler.report_info_message ("Defaulting to eiffel parser")
				create {XM_EIFFEL_PARSER} event_parser.make
			elseif Arguments.argument_count = 2 then
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
			else
				error_handler.report_error (Usage_message)
				has_error := True
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

feature {NONE} -- Implementation

	Usage_message: UT_USAGE_MESSAGE is
			-- Usage message
		local
			a_message: STRING
		once
			create a_message.make (31)
			a_message.append_character ('(')
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
