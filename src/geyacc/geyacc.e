indexing

	description:

		"Gobo Eiffel Yacc: syntactical analyzer generator"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEYACC

inherit

	GEYACC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	execute

feature -- Processing

	execute is
			-- Start 'geyacc' execution.
		local
			fsm: PR_FSM
			parser_generator: PR_PARSER_GENERATOR
			out_file, token_file: like OUTPUT_STREAM_TYPE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			token_filename: STRING
			tokens_needed: BOOLEAN
			verbose_file: like OUTPUT_STREAM_TYPE
		do
			if False then resurrect_code end

			Arguments.set_program_name ("geyacc")
			!! error_handler.make_standard
			read_command_line
			parse_input_file
			if grammar /= Void then
				if verbose_filename /= Void then
						-- Verbose mode.
					verbose_file := OUTPUT_STREAM_.make_file_open_write (verbose_filename)
					if OUTPUT_STREAM_.is_open_write (verbose_file) then
						grammar.reduce_verbose (error_handler, verbose_file)
						grammar.set_nullable
						!! fsm.make (grammar)
						fsm.resolve_conflicts_verbose (error_handler, verbose_file)
						fsm.print_machine (verbose_file)
						OUTPUT_STREAM_.close (verbose_file)
					else
						!! cannot_write.make (verbose_filename)
						error_handler.report_error (cannot_write)
						Exceptions.die (1)
					end
				else
					grammar.reduce (error_handler)
					grammar.set_nullable
					!! fsm.make (grammar)
					fsm.resolve_conflicts (error_handler)
				end
				!! parser_generator.make (fsm)
				if token_classname /= Void then
						-- Print class text with token code constants.
					token_filename := STRING_.to_lower (token_classname)
					token_filename.append_string (Eiffel_extension)
					token_file := OUTPUT_STREAM_.make_file_open_write (token_filename)
					if OUTPUT_STREAM_.is_open_write (token_file) then
						parser_generator.print_token_class (token_classname, Version_number, token_file)
						OUTPUT_STREAM_.close (token_file)
					else
						!! cannot_write.make (token_filename)
						error_handler.report_error (cannot_write)
						Exceptions.die (1)
					end
				else
					tokens_needed := True
				end
				if output_filename /= Void then
					out_file := OUTPUT_STREAM_.make_file_open_write (output_filename)
					if OUTPUT_STREAM_.is_open_write (out_file) then
						parser_generator.print_parser (tokens_needed, actions_separated, out_file)
						OUTPUT_STREAM_.close (out_file)
					else
						!! cannot_write.make (output_filename)
						error_handler.report_error (cannot_write)
						Exceptions.die (1)
					end
				else
					parser_generator.print_parser (tokens_needed, actions_separated, std.output)
				end
			end
		end

	parse_input_file is
			-- Parse input file.
		local
			parser: PR_YACC_PARSER
			a_file: like INPUT_STREAM_TYPE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			!! parser.make (error_handler)
			if input_filename /= Void then
				a_file := INPUT_STREAM_.make_file_open_read (input_filename)
				if INPUT_STREAM_.is_open_read (a_file) then
					parser.parse_file (a_file)
					INPUT_STREAM_.close (a_file)
				else
					!! cannot_read.make (input_filename)
					error_handler.report_error (cannot_read)
					Exceptions.die (1)
				end
			else
				parser.parse_file (std.input)
			end
			if not parser.successful then
				Exceptions.die (1)
			else
				grammar := parser.last_grammar
			end
		end

	read_command_line is
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
		do
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("--version") or arg.is_equal ("-V") then
					report_version_number
				elseif arg.is_equal ("--help") or arg.is_equal ("-h") or arg.is_equal ("-?") then
					report_usage_message
				elseif arg.is_equal ("-t") or arg.is_equal ("-d") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						token_classname := STRING_.to_upper (Arguments.argument (i))
					end
				elseif arg.count > 9 and then arg.substring (1, 9).is_equal ("--tokens=") then
					token_classname := STRING_.to_upper (arg.substring (10, arg.count))
				elseif arg.count > 10 and then arg.substring (1, 10).is_equal ("--defines=") then
					token_classname := STRING_.to_upper (arg.substring (11, arg.count))
				elseif arg.is_equal ("-o") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						output_filename := Arguments.argument (i)
					end
				elseif arg.count > 14 and then arg.substring (1, 14).is_equal ("--output-file=") then
					output_filename := arg.substring (15, arg.count)
				elseif arg.is_equal ("-v") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						verbose_filename := Arguments.argument (i)
					end
				elseif arg.is_equal ("-x") then
					actions_separated := True
				elseif arg.count > 10 and then arg.substring (1, 10).is_equal ("--verbose=") then
					verbose_filename := arg.substring (11, arg.count)
				elseif i = nb then
					input_filename := arg
				else
					report_usage_error
				end
				i := i + 1
			end
			if input_filename = Void then
				report_usage_error
			end
		end

feature -- Access

	input_filename: STRING
	output_filename: STRING
	token_classname: STRING
	verbose_filename: STRING
	actions_separated: BOOLEAN
			-- Command line arguments

	grammar: PR_GRAMMAR
			-- Grammar description

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Constants

	Eiffel_extension: STRING is ".e"

feature {NONE} -- Error handling

	report_usage_error is
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	report_usage_message is
			-- Report usage message and exit.
		do
			error_handler.report_message (Usage_message)
			Exceptions.die (0)
		end

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			!! a_message.make (Version_number)
			error_handler.report_message (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gelex usage message
		once
			!! Result.make ("[-hxV?][-t classname][-v filename][-o filename] filename")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	resurrect_code is
			-- Make sure that SmallEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: DS_EQUALITY_TESTER [PR_RULE]
			et2: DS_EQUALITY_TESTER [PR_TOKEN]
			et3: DS_EQUALITY_TESTER [PR_VARIABLE]
			et4: DS_EQUALITY_TESTER [PR_TYPE]
			et5: DS_EQUALITY_TESTER [INTEGER]
			et6: DS_EQUALITY_TESTER [STRING]
			et7: DS_EQUALITY_TESTER [PR_TRANSITION]
			et8: DS_EQUALITY_TESTER [PR_REDUCTION]
			et9: DS_EQUALITY_TESTER [PR_STATE]
			et10: DS_EQUALITY_TESTER [PR_PORTION]
			et11: DS_EQUALITY_TESTER [PR_CONFLICT]
			et12: DS_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]]
			et13: DS_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]]
		do
			!! et1
			!! et2
			!! et3
			!! et4
			!! et5
			!! et6
			!! et7
			!! et8
			!! et9
			!! et10
			!! et11
			!! et12
			!! et13
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class GEYACC
