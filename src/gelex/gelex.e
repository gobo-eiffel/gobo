indexing

	description:

		"Gobo Eiffel Lex: lexical analyzer generator"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GELEX

inherit

	KL_SHARED_INPUT_STREAM_ROUTINES

	KL_SHARED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_STANDARD_FILES

creation

	execute

feature -- Processing

	execute is
			-- Start 'gelex' execution.
		local
			command_line: LX_LEX_COMMAND_LINE
		do
			!! error_handler.make
			!! description.make
			!! command_line.make (error_handler)
			command_line.read_options (description)
			parse_input_file
			if error_handler.syntax_error then
				error_handler.terminate (1)
			else
				build_dfa
				print_scanner
				print_backing_up_report
				error_handler.terminate (0)
			end
		end

	parse_input_file is
			-- Parse input file.
		local
			parser: LX_LEX_PARSER
			filename: STRING
			a_file: like INPUT_STREAM_TYPE
		do
			!! parser.make_from_description (description, error_handler)
			filename := description.input_filename
			if filename /= Void then
				a_file := input_stream_.make_file_open_read (filename)
				if input_stream_.is_open_read (a_file) then
					parser.parse_file (a_file)
					input_stream_.close (a_file)
				else
					error_handler.error_message
						(<<"cannot read %'", filename, "%'">>)
				end
			else
				parser.parse_file (std.input)
			end
			description := parser.to_description
		end

	build_dfa is
			-- Build `dfa'.
		local
			compressed_dfa: LX_COMPRESSED_DFA
			rules: DS_ARRAYED_LIST [LX_RULE]
			a_filename: STRING
		do
			if description.full_table then
				!LX_FULL_DFA! dfa.make (description)
			else
				!! compressed_dfa.make (description)
				rules := compressed_dfa.dangerous_variable_trail_rules
				a_filename := description.input_filename
				if a_filename = Void then
					a_filename := "standard input"
				end
				error_handler.dangerous_trailing_context (rules, a_filename)
				dfa := compressed_dfa
			end
		ensure
			dfa_not_void: dfa /= Void
		end

	print_scanner is
			-- Print scanner.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
			a_file: like OUTPUT_STREAM_TYPE
		do
			filename := description.output_filename
			if filename /= Void then
				a_file := output_stream_.make_file_open_write (filename)
				if output_stream_.is_open_write (a_file) then
					dfa.print_scanner (a_file)
					output_stream_.close (a_file)
				else
					error_handler.error_message
						(<<"cannot write to %'", filename, "%'">>)
				end
			else
				dfa.print_scanner (std.output)
			end
		end

	print_backing_up_report is
			-- Print backing up report.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
			a_file: like OUTPUT_STREAM_TYPE
		do
			if description.backing_up_report then
				filename := description.backing_up_filename
				if filename /= Void then
					a_file := output_stream_.make_file_open_write (filename)
					if output_stream_.is_open_write (a_file) then
						dfa.print_backing_up_report (a_file)
						output_stream_.close (a_file)
					else
						error_handler.error_message
							(<<"cannot write to %'", filename, "%'">>)
					end
				else
					dfa.print_backing_up_report (std.output)
				end
			end
		end

feature -- Access

	description: LX_DESCRIPTION
			-- Scanner description

	error_handler: GELEX_ERROR_HANDLER
			-- Error handler

	dfa: LX_GENERATABLE_DFA 
			-- Generated DFA

invariant

	description_not_void: description /= Void
	error_handler_not_void: error_handler /= Void

end -- class GELEX
