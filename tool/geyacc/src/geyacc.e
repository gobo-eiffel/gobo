note

	description:

		"Gobo Eiffel Yacc: syntactical analyzer generator"

	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class GEYACC

inherit

	ANY -- Export features of ANY.

	GEYACC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

	UT_SHARED_ISE_VARIABLES
		export {NONE} all end

	UT_SHARED_GOBO_VARIABLES
		export {NONE} all end

create

	execute

feature -- Processing

	execute
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
				-- Set environment variables "$GOBO", "$GOBO_LIBRARY",
				-- "$BOEHM_GC" and "$ZIG" if not set yet.
			gobo_variables.set_gobo_variables
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			create error_handler.make_standard
			line_pragma := True
			array_size := -1
			read_command_line
			parse_input_file
			if attached grammar as l_grammar then
				if attached doc_format as l_doc_format then
					if l_doc_format.is_equal ("xml") then
						create {PR_XML_DOC_GENERATOR} doc_generator.make (l_grammar)
					else
						create {PR_HTML_DOC_GENERATOR} doc_generator.make (l_grammar)
						doc_generator.set_lhs_shared (True)
					end
					if attached output_filename as l_output_filename then
						create out_file.make (l_output_filename)
						out_file.open_write
						if out_file.is_open_write then
							doc_generator.print_grammar (out_file)
							out_file.close
						else
							create cannot_write.make (l_output_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						doc_generator.print_grammar (std.output)
					end
				else
					if attached verbose_filename as l_verbose_filename then
							-- Verbose mode.
						create verbose_file.make (l_verbose_filename)
						verbose_file.open_write
						if verbose_file.is_open_write then
							create fsm.make_verbose (l_grammar, error_handler, verbose_file)
							verbose_file.close
						else
							create cannot_write.make (l_verbose_filename)
							error_handler.report_error (cannot_write)
							create fsm.make (l_grammar, error_handler)
							Exceptions.die (1)
						end
					else
						create fsm.make (l_grammar, error_handler)
					end
					create parser_generator.make (fsm)
					parser_generator.set_line_pragma (line_pragma)
					if array_size >= 0 then
						parser_generator.set_array_size (array_size)
					end
					if attached input_filename as l_input_filename then
						parser_generator.set_input_filename (l_input_filename)
					end
					if attached token_filename as l_token_filename and attached token_classname as l_token_classname then
							-- Print class text with token code constants.
						create token_file.make (l_token_filename)
						token_file.open_write
						if token_file.is_open_write then
							parser_generator.print_token_class (l_token_classname, token_file)
							token_file.close
						else
							create cannot_write.make (l_token_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						tokens_needed := True
					end
					if attached output_filename as l_output_filename then
						create out_file.make (l_output_filename)
						out_file.open_write
						if out_file.is_open_write then
							parser_generator.print_parser (tokens_needed, actions_separated, rescue_on_abort, out_file)
							out_file.close
						else
							create cannot_write.make (l_output_filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						parser_generator.print_parser (tokens_needed, actions_separated, rescue_on_abort, std.output)
					end
				end
			end
		end

	parse_input_file
			-- Parse input file.
		local
			parser: PR_YACC_PARSER
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			create parser.make (error_handler)
			if attached input_filename as l_input_filename then
				create a_file.make (l_input_filename)
				a_file.open_read
				if a_file.is_open_read then
					parser.parse_file (a_file)
					a_file.close
				else
					create cannot_read.make (l_input_filename)
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

	read_command_line
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
			a_pragma: STRING
			l_string: STRING
			l_token_filename: like token_filename
			l_token_classname: like token_classname
			l_doc_format: like doc_format
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
						l_token_classname := Arguments.argument (i).as_upper
						token_classname := l_token_classname
						if token_filename = Void then
							l_token_filename := l_token_classname.as_lower
							l_token_filename.append_string (Eiffel_extension)
							token_filename := l_token_filename
						end
					end
				elseif arg.count > 9 and then arg.substring (1, 9).is_equal ("--tokens=") then
					l_token_classname := arg.substring (10, arg.count).as_upper
					token_classname := l_token_classname
					if token_filename = Void then
						l_token_filename := l_token_classname.as_lower
						l_token_filename.append_string (Eiffel_extension)
						token_filename := l_token_filename
					end
				elseif arg.count > 10 and then arg.substring (1, 10).is_equal ("--defines=") then
					l_token_classname := arg.substring (11, arg.count).as_upper
					token_classname := l_token_classname
					if token_filename = Void then
						l_token_filename := l_token_classname.as_lower
						l_token_filename.append_string (Eiffel_extension)
						token_filename := l_token_filename
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
				elseif arg.count > 13 and then arg.substring (1, 13).is_equal ("--array-size=") then
					l_string := arg.substring (14, arg.count)
					if l_string.is_integer and then l_string.to_integer >= 0 then
						array_size := l_string.to_integer
					else
						report_usage_error
					end
				elseif arg.is_equal ("-o") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						output_filename := Arguments.argument (i)
					end
				elseif arg.count > 14 and then arg.substring (1, 14).is_equal ("--output-file=") then
					output_filename := arg.substring (15, arg.count)
				elseif arg.same_string ("--rescue-on-abort") then
					rescue_on_abort := True
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
				elseif arg.count > 6 and then arg.substring (1, 6).is_equal ("--doc=") then
					l_doc_format := arg.substring (7, arg.count)
					doc_format := l_doc_format
					if not l_doc_format.is_equal ("html") and not l_doc_format.is_equal ("xml") then
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

	input_filename: detachable STRING
	output_filename: detachable STRING
	token_classname: detachable STRING
	token_filename: detachable STRING
	verbose_filename: detachable STRING
	actions_separated: BOOLEAN

	rescue_on_abort: BOOLEAN
			-- Should a rescue clause be generated in the action routines
			-- to catch abort exceptions? Useful when compiling in void-safe mode.

	doc_format: detachable STRING
			-- Command line arguments

	line_pragma: BOOLEAN
			-- Should line pragma be generated?

	array_size: INTEGER
			-- Maximum size supported for manifest arrays

	grammar: detachable PR_GRAMMAR
			-- Grammar description

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Constants

	Eiffel_extension: STRING = ".e"

feature {NONE} -- Error handling

	report_usage_error
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	report_usage_message
			-- Report usage message and exit.
		do
			error_handler.report_info (Usage_message)
			Exceptions.die (0)
		end

	report_version_number
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Geyacc usage message
		once
			create Result.make ("[--version][--help][-hxV?]%N%
				%%T[--pragma=[no]line][--doc=(html|xml)][--rescue-on-abort][-t classname]%N%
				%%T[--array-size=size][-k filename][-v filename][-o filename] filename")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	resurrect_code
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
