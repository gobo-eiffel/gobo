﻿note

	description:

		"Simple application that reads an XML file and outputs it again"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2018, Andreas Leitner and others"
	license: "MIT License"

class FORMATTER

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

create

	make

feature {NONE} -- Initialization

	make
			-- Run.
		do
			Arguments.set_program_name ("formatter")
			create error_handler.make_standard
			process_arguments
			if not has_error then
				process_data_file
			end
		end

feature -- Access

	in_filename: detachable STRING
			-- Name of the input file

	out_filename: detachable STRING
			-- Name of the output file (see use_std_out)

	use_stdout: BOOLEAN
			-- Only if this is True, we write to stdout
			-- otherwise we write to out_filename

	has_error: BOOLEAN
			-- Error during processing?

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Parser

	fact: XM_EXPAT_PARSER_FACTORY
			-- Expat XML parser factory
		once
			create Result
		ensure
			factory_not_void: Result /= Void
		end

	event_parser: detachable XM_PARSER
			-- XML parser

	tree_pipe: detachable XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks

feature -- Basic operations

	process_data_file
			-- Do the real work (parse and output).
		require
			in_filename_not_void: in_filename /= Void
			out_filename: not use_stdout implies out_filename /= Void
			parser_not_void: event_parser /= Void
			pipe_not_void: tree_pipe /= Void
		local
			formatter: XM_FORMATTER
			in: KL_TEXT_INPUT_FILE
			os: KL_TEXT_OUTPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			l_in_filename: like in_filename
			l_out_filename: like out_filename
			l_event_parser: like event_parser
			l_tree_pipe: like tree_pipe
		do
			l_in_filename := in_filename
			l_out_filename := out_filename
			l_event_parser := event_parser
			l_tree_pipe := tree_pipe
			check precondition_in_filename: l_in_filename /= Void then end
			check precondition_event_parser: l_event_parser /= Void then end
			check precondition_tree_pipe: l_tree_pipe /= Void then end

			error_handler.report_info_message ("- parsing data...")
			create in.make (l_in_filename)
			in.open_read
			if not in.is_open_read then
				create cannot_read.make (l_in_filename)
				error_handler.report_error (cannot_read)
				has_error := True
			else
				l_event_parser.parse_from_stream (in)
				in.close
				if l_tree_pipe.error.has_error then
					error_handler.report_error_message (l_tree_pipe.last_error)
					has_error := True
				else
					error_handler.report_info_message ("- printing document...")
					create formatter.make

					if use_stdout then
						formatter.set_output (std.output)
						formatter.process_document (l_tree_pipe.document)
					else
						check precondition_out_filename: l_out_filename /= Void then end
						create os.make (l_out_filename)
						os.open_write
						if not os.is_open_write then
							create cannot_write.make (l_out_filename)
							error_handler.report_error (cannot_write)
							has_error := True
						else
							formatter.set_output (os)
							formatter.process_document (l_tree_pipe.document)
							os.close
						end
					end
				end
			end
			error_handler.report_info_message ("exiting...")
		end

	process_arguments
			-- Read command line arguments.
		local
			parser_switch: STRING
			l_tree_pipe: like tree_pipe
			l_event_parser: like event_parser
		do
			if Arguments.argument_count < 2 then
				error_handler.report_error (Usage_message)
				has_error := True
			else
				parser_switch := Arguments.argument (1)
				if parser_switch.is_equal ("--expat") then
					if fact.is_expat_parser_available then
						l_event_parser := fact.new_expat_parser
						event_parser := l_event_parser
					else
						error_handler.report_error_message ("expat is not availabe, please choose other parser backend")
						has_error := True
					end
				elseif parser_switch.is_equal ("--eiffel") then
					create {XM_EIFFEL_PARSER} l_event_parser.make
					event_parser := l_event_parser
				else
					error_handler.report_error (Usage_message)
					has_error := True
				end
					-- Create standard pipe holder and bind it to event parser.
				if l_event_parser /= Void then
					create l_tree_pipe.make
					tree_pipe := l_tree_pipe
					l_event_parser.set_callbacks (l_tree_pipe.start)
				end
				in_filename := Arguments.argument (2)
				if Arguments.argument_count > 2 then
						-- We got an output file as well.
					out_filename := Arguments.argument (3)
				else
						-- We use STDOUT instead.
					use_stdout := True
				end
			end
		ensure
			in_filename_not_void: not has_error implies in_filename /= Void
			out_filename: not has_error implies (not use_stdout implies out_filename /= Void)
			parser_not_void: not has_error implies event_parser /= Void
			pipe_not_void: not has_error implies tree_pipe /= Void
		end

feature {NONE} -- Implementation

	Usage_message: UT_USAGE_MESSAGE
			-- Usage message
		local
			a_message: STRING
		once
			create a_message.make (46)
			a_message.append_character ('(')
			if fact.is_expat_parser_available then
				a_message.append_string ("--expat|")
			end
			a_message.append_string ("--eiffel) <input-file> [<output-file]")
			create Result.make (a_message)
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
