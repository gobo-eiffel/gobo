indexing

	description:

		"Gobo Eiffel Xace"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001-2005, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make is
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

	process_arguments is
			-- Process command-line arguments.
		do
			process_define
			process_options
			process_command
		end

	process_define is
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

	process_options is
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

	process_command is
			-- Process command.
			-- One and only one command must be specified.
		do
			if match_long_option ("system") then
				process_system
			elseif match_long_option ("cluster") then
				process_cluster
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

	process_system is
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
				process_compilers (a_command, a_compiler)
				process_output (a_command)
				process_xace_file (a_command)
			else
					-- No compiler specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_cluster is
			-- Process 'cluster' command.
		require
			is_cluster: match_long_option ("cluster")
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
				process_compilers (a_command, a_compiler)
				process_output (a_command)
				process_xace_file (a_command)
			else
					-- No compiler specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_library is
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
				process_compilers (a_command, a_compiler)
				process_output (a_command)
				process_xace_file (a_command)
			else
					-- No compiler specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_validate is
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

	process_compilers (a_command: GEXACE_BUILD_COMMAND; a_compiler: STRING) is
			-- Process compiler name.
			-- Possible values are: "ge", "ise", "se", "ve" or "xml".
			-- The variable GOBO_EIFFEL will automatically be defined
			-- for the four first cases.
		require
			a_command_not_void: a_command /= Void
			a_compiler_not_void: a_compiler /= Void
		local
			g: ET_XACE_GENERATOR
			l_xml_generator: ET_XACE_XML_GENERATOR
		do
			if a_compiler.is_equal ("ge") then
				variables.force_last ("ge", "GOBO_EIFFEL")
				create {ET_XACE_GE_GENERATOR} g.make (variables, error_handler)
				a_command.generators.force_last (g)
			elseif a_compiler.is_equal ("se") then
				variables.force_last ("se", "GOBO_EIFFEL")
				create {ET_XACE_SE_GENERATOR} g.make (variables, error_handler)
				a_command.generators.force_last (g)
			elseif a_compiler.is_equal ("ise") then
				variables.force_last ("ise", "GOBO_EIFFEL")
				create {ET_XACE_ISE_GENERATOR} g.make (variables, error_handler)
				a_command.generators.force_last (g)
			elseif a_compiler.is_equal ("ve") then
				variables.force_last ("ve", "GOBO_EIFFEL")
				create {ET_XACE_VE_GENERATOR} g.make (variables, error_handler)
				a_command.generators.force_last (g)
				a_command.set_ve (True)
			elseif a_compiler.is_equal ("ve41") then
				variables.force_last ("ve", "GOBO_EIFFEL")
				create {ET_XACE_VE41_GENERATOR} g.make (variables, error_handler)
				a_command.generators.force_last (g)
			elseif a_compiler.is_equal ("xml") then
				create l_xml_generator.make (variables, error_handler)
				l_xml_generator.set_shallow (is_shallow)
				a_command.generators.force_last (l_xml_generator)
			end
			if a_command.generators.is_empty then
					-- Invalid compiler has been specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_output (a_command: GEXACE_BUILD_COMMAND) is
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

	process_define_string (s: STRING) is
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

	process_xace_file (a_command: GEXACE_COMMAND) is
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

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gexace usage message
		once
			create Result.make ("[defines][options] command [xace-file]%N%
				%%Tdefines:  --define=%"VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*%"%N%
				%%Toptions:  --verbose|--shallow%N%
				%%Tcommand:  --system=(ge|se|ise|ve|ve41|xml) [--output=<filename>]%N%
				%%Tcommand:  --library=(ge|se|ise|ve|ve41|xml) [--output=<filename>]%N%
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
