indexing

	description:

		"Gobo Eiffel Xace"

	system:     "Gobo Eiffel Xace"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

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

	KL_SHARED_EXCEPTIONS

creation

	make

feature

	make is
			-- Create and execute a new 'gexace'.
		local
			a_cursor: DS_LINKED_LIST_CURSOR [GEXACE_COMMAND]
		do
			Arguments.set_program_name ("gexace")
			!! variables.make
			!! commands.make
			!! error_handler.make
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

	variables: ET_XACE_VARIABLES
			-- Defined variables

	error_handler: ET_XACE_ERROR_HANDLER
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
			end
		end

	process_command is
			-- Process command.
			-- One and only one command must be specified.
		do
			if match_long_option ("build") then
				consume_option
				process_build
			elseif match_long_option ("validate") then
				consume_option
				process_validate
			else
					-- No command has been specified.
				report_usage_error
				Exceptions.die (1)
			end
		end

	process_build is
			-- Process 'build' command.
		local
			a_command: GEXACE_BUILD_COMMAND
		do
			!! a_command.make (variables, error_handler)
			commands.force_last (a_command)
			process_compilers (a_command)
			process_system_file (a_command)
		end

	process_validate is
			-- Process 'validate' command.
		local
			a_command: GEXACE_VALIDATE_COMMAND
		do
			!! a_command.make (variables, error_handler)
			commands.force_last (a_command)
			process_system_file (a_command)
		end

	process_compilers (a_command: GEXACE_BUILD_COMMAND) is
			-- Process compilers to output code for.
			-- Possible option is: "--ise", "--se", "--ve" or "--hact".
			-- One and only one compiler must be given.
			-- A variable with the upper case option name
			-- will automatically be defined.
		require
			a_command_not_void: a_command /= Void
		local
			g: ET_XACE_GENERATOR
		do
			if has_next_option then
				if match_long_option ("se") then
					variables.define_value ("GOBO_EIFFEL", "se")
					!ET_XACE_SE_GENERATOR! g.make (error_handler)
					a_command.generators.force_last (g)
					consume_option
				elseif match_long_option ("ise") then
					variables.define_value ("GOBO_EIFFEL", "ise")
					!ET_XACE_ISE_GENERATOR! g.make (error_handler)
					a_command.generators.force_last (g)
					consume_option
				elseif match_long_option ("ve") then
					variables.define_value ("GOBO_EIFFEL", "ve")
					!ET_XACE_VE_GENERATOR! g.make (error_handler)
					a_command.generators.force_last (g)
					consume_option
				elseif match_long_option ("hact") then
					variables.define_value ("GOBO_EIFFEL", "hact")
					!ET_XACE_HACT_GENERATOR! g.make (error_handler)
					a_command.generators.force_last (g)
					consume_option
				end
			end
			if a_command.generators.is_empty then
					-- No compiler has been specified.
				report_usage_error
				Exceptions.die (1)
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
				a_definition := split_on_first (a_cursor.item, '=')
				if a_definition.second = Void then
					variables.define_value (a_cursor.item, "")
				else
					variables.define_value (a_definition.first, a_definition.second)
				end
				a_cursor.forth
			end
		end

	process_system_file (a_command: GEXACE_COMMAND) is
			-- Process xace filename.
		require
			a_command_not_void: a_command /= Void
		do
			if has_next_option then
				a_command.set_system_filename (next_option)
				consume_option
			end
		end

feature {NONE} -- Usage message

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gexace usage message
		once
			!! Result.make ("[variable-definitions] [options] command [xace-file]%N%
			%%Tvariable-definitions:  --define=%"VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*%"%N%
			%%Toptions:  --verbose%N%
			%%Tcommand:  --build (--se|--ise|--ve|--hact)%N%
			%%Tcommand:  --validate")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	variables_not_void: variables /= Void
	commands_not_void: commands /= Void
	no_void_command: not commands.has (Void)
	error_handler_not_void: error_handler /= Void

end -- class GEXACE
