indexing

	description:

		"Gobo Eiffel Yacc: syntactical analyzer generator"

	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEYACC

inherit

	ANY -- Export features of ANY.

	GEYACC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

create

	execute

feature -- Processing

	execute is
			-- Start 'geyacc' execution.
		local
			fsm: PR_FSM
			parser_generator: PR_PARSER_GENERATOR
			out_file, token_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			tokens_needed: BOOLEAN
			verbose_file: KL_TEXT_OUTPUT_FILE
			doc_generator: PR_DOC_GENERATOR
		do
			if False then resurrect_code end

			Arguments.set_program_name ("geyacc")
			create error_handler.make_standard
			old_typing := False
			line_pragma := True
			read_command_line
			parse_input_file
			if grammar /= Void then
				if doc_format /= Void then
					if doc_format.is_equal ("xml") then
						create {PR_XML_DOC_GENERATOR} doc_generator.make (grammar)
					else
						create {PR_HTML_DOC_GENERATOR} doc_generator.make (grammar)
						doc_generator.set_lhs_shared (True)
					end
					if output_filename /= Void then
						create out_file.make (output_filename)
						out_file.open_write
						if out_file.is_open_write then
							doc_generator.print_grammar (out_file)
							out_file.close
						else
							create cannot_write.make (output_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						doc_generator.print_grammar (std.output)
					end
				else
					if verbose_filename /= Void then
							-- Verbose mode.
						create verbose_file.make (verbose_filename)
						verbose_file.open_write
						if verbose_file.is_open_write then
							create fsm.make_verbose (grammar, error_handler, verbose_file)
							verbose_file.close
						else
							create cannot_write.make (verbose_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						create fsm.make (grammar, error_handler)
					end
					create parser_generator.make (fsm)
					parser_generator.set_old_typing (old_typing)
					parser_generator.set_line_pragma (line_pragma)
					if input_filename /= Void then
						parser_generator.set_input_filename (input_filename)
					end
					if token_classname /= Void then
							-- Print class text with token code constants.
						create token_file.make (token_filename)
						token_file.open_write
						if token_file.is_open_write then
							parser_generator.print_token_class (token_classname, Version_number, token_file)
							token_file.close
						else
							create cannot_write.make (token_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						tokens_needed := True
					end
					if output_filename /= Void then
						create out_file.make (output_filename)
						out_file.open_write
						if out_file.is_open_write then
							parser_generator.print_parser (tokens_needed, actions_separated, out_file)
							out_file.close
						else
							create cannot_write.make (output_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						parser_generator.print_parser (tokens_needed, actions_separated, std.output)
					end
				end
			end
		end

	parse_input_file is
			-- Parse input file.
		local
			parser: PR_YACC_PARSER
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			create parser.make (error_handler)
			parser.set_old_typing (old_typing)
			if input_filename /= Void then
				create a_file.make (input_filename)
				a_file.open_read
				if a_file.is_open_read then
					parser.parse_file (a_file)
					a_file.close
				else
					create cannot_read.make (input_filename)
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
			a_pragma: STRING
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
						token_classname := Arguments.argument (i).as_upper
						if token_filename = Void then
							token_filename := token_classname.as_lower
							token_filename.append_string (Eiffel_extension)
						end
					end
				elseif arg.count > 9 and then arg.substring (1, 9).is_equal ("--tokens=") then
					token_classname := arg.substring (10, arg.count).as_upper
					if token_filename = Void then
						token_filename := token_classname.as_lower
						token_filename.append_string (Eiffel_extension)
					end
				elseif arg.count > 10 and then arg.substring (1, 10).is_equal ("--defines=") then
					token_classname := arg.substring (11, arg.count).as_upper
					if token_filename = Void then
						token_filename := token_classname.as_lower
						token_filename.append_string (Eiffel_extension)
					end
				elseif arg.is_equal ("-k") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						token_filename := Arguments.argument (i)
					end
				elseif arg.count > 14 and then arg.substring (1, 14).is_equal ("--tokens-file=") then
					token_filename := arg.substring (15, arg.count)
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
				elseif arg.is_equal ("--old_typing") then
					old_typing := True
				elseif arg.is_equal ("--new_typing") then
					old_typing := False
				elseif arg.count > 6 and then arg.substring (1, 6).is_equal ("--doc=") then
					doc_format := arg.substring (7, arg.count)
					if not doc_format.is_equal ("html") and not doc_format.is_equal ("xml") then
							-- Doc format not supported.
						report_usage_error
					end
				elseif arg.count > 9 and then arg.substring (1, 9).is_equal ("--pragma=") then
					a_pragma := arg.substring (10, arg.count)
					if a_pragma.is_equal ("line") then
						line_pragma := True
					elseif a_pragma.is_equal ("noline") then
						line_pragma := False
					else
						report_usage_error
					end
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
	token_filename: STRING
	verbose_filename: STRING
	actions_separated: BOOLEAN
	old_typing: BOOLEAN
	doc_format: STRING
			-- Command line arguments

	line_pragma: BOOLEAN
			-- Should line pragma be generated?

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
			error_handler.report_info (Usage_message)
			Exceptions.die (0)
		end

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Geyacc usage message
		once
			create Result.make ("[--version][--help][-hxV?][--(new|old)_typing]%N%
				%%T[--pragma=[no]line][--doc=(html|xml)][-t classname]%N%
				%%T[-k filename][-v filename][-o filename] filename")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	resurrect_code is
			-- Make sure that SmartEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: KL_EQUALITY_TESTER [PR_RULE]
			et2: KL_EQUALITY_TESTER [PR_TOKEN]
			et3: KL_EQUALITY_TESTER [PR_VARIABLE]
			et4: KL_EQUALITY_TESTER [PR_TYPE]
			et5: KL_EQUALITY_TESTER [INTEGER]
			et6: KL_EQUALITY_TESTER [STRING]
			et7: KL_EQUALITY_TESTER [PR_TRANSITION]
			et8: KL_EQUALITY_TESTER [PR_REDUCTION]
			et9: KL_EQUALITY_TESTER [PR_STATE]
			et10: KL_EQUALITY_TESTER [PR_PORTION]
			et11: KL_EQUALITY_TESTER [PR_CONFLICT]
			et12: KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]]
			et13: KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]]
		do
			create et1
			create et2
			create et3
			create et4
			create et5
			create et6
			create et7
			create et8
			create et9
			create et10
			create et11
			create et12
			create et13
		end

invariant

	error_handler_not_void: error_handler /= Void
	token_filename: token_classname /= Void implies token_filename /= Void

end
