note

	description:

		"Gobo Eiffel Lex: lexical analyzer generator"

	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GELEX

inherit

	LX_DESCRIPTION_OVERRIDER

	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	execute

feature -- Processing

	execute
			-- Start 'gelex' execution.
		local
			command_line: GELEX_COMMAND_LINE
		do
			if False then resurrect_code end

			Arguments.set_program_name ("gelex")
			create error_handler.make_standard
			create description.make
			create command_line.make (error_handler)
			command_line.read_options (description)
			parse_input_file
			build_dfa
			print_scanner
			print_backing_up_report
		end

	parse_input_file
			-- Parse input file.
		local
			parser: LX_LEX_PARSER
			filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			create parser.make_from_description (description, error_handler)
			parser.set_options_overrider (Current)
			filename := description.input_filename
			if filename /= Void then
				create a_file.make (filename)
				a_file.open_read
				if a_file.is_open_read then
					parser.parse_unicode_file (a_file)
					a_file.close
				else
					create cannot_read.make (filename)
					error_handler.report_error (cannot_read)
					Exceptions.die (1)
				end
			else
				parser.parse_unicode_file (std.input)
			end
			if not parser.successful then
				Exceptions.die (1)
			end
		end

	override_description (a_description: LX_DESCRIPTION)
			-- Override options specified in the input file
			-- by options specified on the command-line.
		local
			command_line: GELEX_COMMAND_LINE
		do
			create command_line.make (error_handler)
			command_line.read_options (a_description)
		end

	build_dfa
			-- Build `dfa'.
		local
			compressed_dfa: LX_COMPRESSED_DFA
			rules: DS_ARRAYED_LIST [LX_RULE]
			a_rule: LX_RULE
			dangerous_trailing: LX_DANGEROUS_TRAILING_CONTEXT_ERROR
			rule_not_used: LX_RULE_CANNOT_BE_MATCHED_ERROR
			default_used: LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR
			a_filename: STRING
			i, nb: INTEGER
		do
			a_filename := description.input_filename
			if a_filename = Void then
				a_filename := "standard input"
			end
			if description.full_table then
				create {LX_FULL_DFA} dfa.make (description)
			else
				create compressed_dfa.make (description)
				if not description.no_warning then
						-- Emit a warning message if rules contain
						-- "dangerous" variable trailing context.
					rules := compressed_dfa.dangerous_variable_trail_rules
					nb := rules.count
					from i := 1 until i > nb loop
						create dangerous_trailing.make (a_filename, rules.item (i).line_nb)
						error_handler.report_warning (dangerous_trailing)
						i := i + 1
					end
				end
				dfa := compressed_dfa
			end
			if not description.no_warning and not description.reject_used then
					-- Emit a warning message if rules cannot be matched.
				rules := description.rules
					-- The last rule, at index `rules.count', is the
					-- default rule. It is taken care of just after.
				nb := rules.count - 1
				from i := 1 until i > nb loop
					a_rule := rules.item (i)
					if not a_rule.is_useful then
						create rule_not_used.make (a_filename, a_rule.line_nb)
						error_handler.report_warning (rule_not_used)
					end
					i := i + 1
				end
					-- Emit a warning message if "nodefault" option
					-- has been sepcified and the default rule can
					-- be matched.
				if description.no_default_rule and rules.item (i).is_useful then
					create default_used.make (a_filename)
					error_handler.report_warning (default_used)
				end
			end
		ensure
			dfa_not_void: dfa /= Void
		end

	print_scanner
			-- Print scanner.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			check precondition: attached dfa as l_dfa then
				filename := description.output_filename
				if filename /= Void then
					create a_file.make (filename)
					a_file.open_write
					if a_file.is_open_write then
						l_dfa.print_scanner (a_file)
						a_file.close
					else
						create cannot_write.make (filename)
						error_handler.report_error (cannot_write)
						Exceptions.die (1)
					end
				else
					l_dfa.print_scanner (std.output)
				end
			end
		end

	print_backing_up_report
			-- Print backing up report.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			check precondition: attached dfa as l_dfa then
				if description.backing_up_report then
					filename := description.backing_up_filename
					if filename /= Void then
						create a_file.make (filename)
						a_file.open_write
						if a_file.is_open_write then
							l_dfa.print_backing_up_report (a_file)
							a_file.close
						else
							create cannot_write.make (filename)
							error_handler.report_error (cannot_write)
							Exceptions.die (1)
						end
					else
						l_dfa.print_backing_up_report (std.output)
					end
				end
			end
		end

feature -- Access

	description: LX_DESCRIPTION
			-- Scanner description

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	dfa: detachable LX_GENERATABLE_DFA
			-- Generated DFA

feature {NONE} -- Implementation

	resurrect_code
			-- Make sure that SmartEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: KL_EQUALITY_TESTER [LX_DFA_STATE]
			et2: KL_EQUALITY_TESTER [LX_NFA_STATE]
			et3: KL_EQUALITY_TESTER [LX_START_CONDITION]
			et4: KL_EQUALITY_TESTER [LX_RULE]
			et5: KL_EQUALITY_TESTER [INTEGER]
			et6: KL_EQUALITY_TESTER [STRING]
			et7: KL_EQUALITY_TESTER [LX_NFA]
			et8: KL_EQUALITY_TESTER [LX_PROTO]
			et9: KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]]
			et10: KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]]
			et11: KL_EQUALITY_TESTER [LX_SINGLETON]
			et12: KL_EQUALITY_TESTER [LX_SYMBOL_CLASS]
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
		end

invariant

	description_not_void: description /= Void
	error_handler_not_void: error_handler /= Void

end
