note

	description:

		"LSP servers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER

inherit

	LS_SERVER_MESSAGE_MANAGER
		redefine
			application_info
		end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start server execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
		rescue
			Exceptions.die (2)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start server execution with arguments `a_args'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_error_handler: like error_handler
		do
			create l_error_handler.make_standard
			execute_with_arguments_and_error_handler (a_args, l_error_handler)
		end

	execute_with_arguments_and_error_handler (a_args: ARRAY [STRING]; a_error_handler: like error_handler)
			-- Start server execution with arguments `a_args'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		local
			l_connection: separate LS_SERVER_CONNECTION
		do
			Arguments.set_program_name (server_name)
			error_handler := a_error_handler
			parse_arguments (a_args)
			l_connection := new_connection
			make (l_connection)
			start
		end

feature -- Access

	server_name: STRING_8
			-- Server name
			--
			-- (To be redefined in servers.)
		once
			Result := "langserver"
		ensure
			server_name_not_void: Result /= Void
		end

	server_description: STRING_8
			-- Server description
			--
			-- (To be redefined in servers.)
		once
			Result := "Language Server (LSP)."
		ensure
			server_description_not_void: Result /= Void
		end

	version_number: STRING_8
			-- Server version number
			--
			-- (To be redefined in servers.)
		once
			Result := "0.0.0"
		ensure
			version_number_not_void: Result /= Void
		end

	application_info: LS_APPLICATION_INFO
			-- Information about current application
			-- (application name, application version)
			--
			-- (To be redefined in clients and servers.)
		do
			create Result.make (server_name, version_number)
		ensure then
			application_info_not_void: Result /= Void
		end

	new_connection: separate LS_SERVER_CONNECTION
			-- New connection to be used to communicate with the client
		local
			l_stdio_connection: separate LS_STDIO_SERVER_CONNECTION
		do
			if stdio_flag.was_found then
				create l_stdio_connection.make
				Result := l_stdio_connection
			else
				create l_stdio_connection.make
				Result := l_stdio_connection
			end
		ensure
			new_connection_not_void: Result /= Void
		end

feature -- Argument parsing

	debug_flag: AP_FLAG
			-- Flag for '--debug'

	stdio_flag: AP_FLAG
			-- Flag for '--stdio'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments (a_args: ARRAY [STRING])
			-- Initialize options and parse arguments `a_args`.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_parser: AP_PARSER
			l_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create l_parser.make
			l_parser.set_application_description (server_description)
			l_parser.set_parameters_description ("")
				-- debug.
			create debug_flag.make_with_long_form ("debug")
			debug_flag.set_description ("Run in debug mode?")
			l_parser.options.force_last (debug_flag)
				-- stdio.
			create stdio_flag.make_with_long_form ("stdio")
			stdio_flag.set_description ("Should stdio be used to communicate with the client?")
			l_parser.options.force_last (stdio_flag)
				-- version
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_last (l_list)
			add_other_options (l_parser)
				-- Parsing.
			l_parser.parse_array (a_args)
			if version_flag.was_found then
				report_version_number
				Exceptions.die (0)
			elseif l_parser.parameters.count >= 1 then
				report_usage_message (l_parser)
				Exceptions.die (1)
			end
			debug_mode := debug_flag.was_found
		ensure
			debug_flag_not_void: debug_flag /= Void
			stdio_flag_not_void: stdio_flag /= Void
		end

	add_other_options (a_parser: AP_PARSER)
			-- Add other command-line options.
			--
			-- (To be redefined in servers.)
		require
			a_parser_not_void: a_parser /= Void
		do
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_error (a_error: UT_ERROR)
			-- Report `a_error'.
		require
			a_error_not_void: a_error /= Void
		do
			error_handler.report_error (a_error)
		end

	report_version_number
			-- Report version number.
		local
			l_message: UT_VERSION_NUMBER
		do
			create l_message.make (version_number)
			error_handler.report_info (l_message)
		end

	report_usage_message (a_parser: AP_PARSER)
			-- Report usage message.
		require
			a_parser_not_void: a_parser /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_parser.full_usage_instruction)
			report_error (l_error)
		end

invariant

	error_handler_not_void: error_handler /= Void
	debug_flag_not_void: debug_flag /= Void
	stdio_flag_not_void: stdio_flag /= Void

end
