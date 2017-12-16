note

	description:

		"Gobo Eiffel Xace"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEXACE

inherit

	GEXACE_COMMAND_LINE_PARSER
		rename
			make as make_command_line_parser
		export
			{NONE} all
		end

	UT_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_SHARED_EXCEPTIONS

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_FILE_SYSTEM

create

	make

feature {NONE} -- Initialization

	make
			-- Create and execute a new 'gexace'.
		local
			a_cursor: DS_LINKED_LIST_CURSOR [GEXACE_COMMAND]
		do
			Arguments.set_program_name ("gexace")
			create variables.make_map (100)
			variables.set_key_equality_tester (string_equality_tester)
			create commands.make
			create error_handler.make
			make_command_line_parser
			process_arguments
			a_cursor := commands.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.execute
				a_cursor.forth
			end
			if error_handler.has_error then
				Exceptions.die (1)
			end
		end

feature -- Access

	commands: DS_LINKED_LIST [GEXACE_COMMAND]
			-- Commands read on the command-line

	variables: DS_HASH_TABLE [STRING, STRING]
			-- Defined variables

	error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			-- Error handler

feature {NONE} -- Command-line processing

	process_arguments
			-- Process command-line arguments.
		do
			process_define
			process_options
			process_command
		end

	process_define
			-- Process define option.
		do
			if match_long_option ("define") then
				if is_next_option_long_option and then has_next_option_value then
					process_define_string (next_option_value)
					consume_option
				else
						-- No variable specified.
					report_usage_error
					Exceptions.die (1)
				end
			end
		end

	process_options
			-- Process general options.
		do
			if match_long_option ("verbose") then
				error_handler.enable_verbose
				consume_option
				if match_long_option ("shallow") then
					is_shallow := True
					consume_option
				end
			elseif match_long_option ("shallow") then
				is_shallow := True
				consume_option
				if match_long_option ("verbose") then
					error_handler.enable_verbose
					consume_option
				end
			end
		end

	process_command
			-- Process command.
			-- One and only one command must be specified.
		do
			if match_long_option ("system") then
				process_system
			elseif match_long_option ("library") then
				process_library
			elseif match_long_option ("validate") then
				process_validate
			else
					-- No command has been specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_system
			-- Process 'system' command.
		require
			is_system: match_long_option ("system")
		local
			a_command: GEXACE_SYSTEM_COMMAND
			a_compiler: STRING
		do
			create a_command.make (variables, error_handler)
			a_command.set_shallow (is_shallow)
			commands.force_last (a_command)
			if is_next_option_long_option and then has_next_option_value then
				a_compiler := next_option_value
				consume_option
				process_format (a_command)
				process_compilers (a_command, a_compiler)
				process_output (a_command)
				process_xace_file (a_command)
			else
					-- No compiler specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_library
			-- Process 'library' command.
		require
			is_library: match_long_option ("library")
		local
			a_command: GEXACE_LIBRARY_COMMAND
			a_compiler: STRING
		do
			create a_command.make (variables, error_handler)
			a_command.set_shallow (is_shallow)
			commands.force_last (a_command)
			if is_next_option_long_option and then has_next_option_value then
				a_compiler := next_option_value
				consume_option
				process_format (a_command)
				process_compilers (a_command, a_compiler)
				process_output (a_command)
				process_xace_file (a_command)
			else
					-- No compiler specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_validate
			-- Process 'validate' command.
		require
			is_validate: match_long_option ("validate")
		local
			a_command: GEXACE_VALIDATE_COMMAND
		do
			create a_command.make (variables, error_handler)
			a_command.set_shallow (is_shallow)
			commands.force_last (a_command)
			consume_option
			process_xace_file (a_command)
		end

	process_compilers (a_command: GEXACE_BUILD_COMMAND; a_compiler: STRING)
			-- Process compiler name.
			-- Possible values are: "ge", "ise".
			-- The variable GOBO_EIFFEL will automatically be defined.
		require
			a_command_not_void: a_command /= Void
			a_compiler_not_void: a_compiler /= Void
		local
			g: ET_XACE_GENERATOR
			l_format: STRING
		do
			variables.force_last (a_compiler, "GOBO_EIFFEL")
			l_format := a_command.format
			if a_compiler.same_string ("ge") then
				if l_format = Void then
					create {ET_XACE_XACE_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("xace") then
					create {ET_XACE_XACE_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("ace") then
					create {ET_XACE_ACE_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("ecf") then
					create {ET_XACE_ECF_GENERATOR} g.make (a_compiler, variables, error_handler)
				end
			elseif a_compiler.is_equal ("ise") then
				if l_format = Void then
					create {ET_XACE_ECF_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("xace") then
					create {ET_XACE_XACE_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("ace") then
					create {ET_XACE_ACE_GENERATOR} g.make (a_compiler, variables, error_handler)
				elseif l_format.same_string ("ecf") then
					create {ET_XACE_ECF_GENERATOR} g.make (a_compiler, variables, error_handler)
				end
			end
			if g /= Void then
				g.set_shallow (is_shallow)
				a_command.generators.force_last (g)
			end
			if a_command.generators.is_empty then
					-- Invalid compiler has been specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_format (a_command: GEXACE_BUILD_COMMAND)
			-- Process format option
			-- ('--format=<a_format>).
		require
			a_command_not_void: a_command /= Void
		do
			if match_long_option ("format") then
				if is_next_option_long_option and then has_next_option_value then
					a_command.set_format (next_option_value)
					consume_option
				else
						-- No filename specified.
					report_usage_error
					Exceptions.die (1)
				end
			end
		end

	process_output (a_command: GEXACE_BUILD_COMMAND)
			-- Process output filename option
			-- ('--output=<filename>).
		require
			a_command_not_void: a_command /= Void
		local
			a_filename: STRING
		do
			if match_long_option ("output") then
				if is_next_option_long_option and then has_next_option_value then
					a_filename := next_option_value
					consume_option
					a_command.set_output_filename (a_filename)
				else
						-- No filename specified.
					report_usage_error
					Exceptions.die (1)
				end
			end
		end

	process_define_string (s: STRING)
			-- Process `s' and set variables accordingly.
			-- `s' is the content of a --define option.
		require
			s_not_void: s /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_definition: DS_PAIR [STRING, STRING]
		do
			a_cursor := split_string (s, ' ').new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.count /= 0 then
					a_definition := split_on_first (a_cursor.item, '=')
					if a_definition.second = Void then
						variables.force_last ("", a_cursor.item)
					else
						variables.force_last (a_definition.second, a_definition.first)
					end
				end
				a_cursor.forth
			end
		end

	process_xace_file (a_command: GEXACE_COMMAND)
			-- Process xace filename.
		require
			a_command_not_void: a_command /= Void
		do
			if has_next_option then
				a_command.set_xace_filename (next_option)
				consume_option
			end
		end

feature {NONE} -- Command-line options

	is_shallow: BOOLEAN
			-- Should Xace files not be flattened?

feature {NONE} -- Usage message

	report_usage_error
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Gexace usage message
		once
			create Result.make ("[defines][options] command [xace-file]%N%
				%%Tdefines:  --define=%"VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*%"%N%
				%%Toptions:  --verbose|--shallow%N%
				%%Tcommand:  --system=(ge|ise) [--format=(ace|ecf|xace)][--output=<filename>]%N%
				%%Tcommand:  --library=(ge|ise) [--format=(ace|ecf|xace)][--output=<filename>]%N%
				%%Tcommand:  --validate")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	variables_not_void: variables /= Void
	commands_not_void: commands /= Void
	no_void_command: not commands.has (Void)
	error_handler_not_void: error_handler /= Void

end
