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
		export
			{NONE} all
		end

	KL_SHARED_EXCEPTIONS

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_FILE_SYSTEM

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
			if match_long_option ("system") then
				process_system
			elseif match_long_option ("cluster") then
				process_cluster
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
			!! a_command.make (variables, error_handler)
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
			a_command: GEXACE_CLUSTER_COMMAND
			a_compiler: STRING
		do
			!! a_command.make (variables, error_handler)
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
			!! a_command.make (variables, error_handler)
			commands.force_last (a_command)
			consume_option
			process_xace_file (a_command)
		end

	process_compilers (a_command: GEXACE_BUILD_COMMAND; a_compiler: STRING) is
			-- Process compiler name.
			-- Possible values are: "ise", "se", "ve", "hact" or "xml".
			-- The variable GOBO_EIFFEL will automatically be defined
			-- for the four first cases.
		require
			a_command_not_void: a_command /= Void
			a_compiler_not_void: a_compiler /= Void
		local
			g: ET_XACE_GENERATOR
		do
			if a_compiler.is_equal ("se") then
				variables.define_value ("GOBO_EIFFEL", "se")
				!ET_XACE_SE_GENERATOR! g.make (error_handler)
				a_command.generators.force_last (g)
				if not variables.is_defined ("GOBO_CC") then
					variables.define_value ("GOBO_CC", se_c_compiler)
				end
			elseif a_compiler.is_equal ("ise") then
				variables.define_value ("GOBO_EIFFEL", "ise")
				!ET_XACE_ISE_GENERATOR! g.make (error_handler)
				a_command.generators.force_last (g)
				if not variables.is_defined ("GOBO_CC") then
					variables.define_value ("GOBO_CC", ise_c_compiler)
				end
			elseif a_compiler.is_equal ("ve") then
				variables.define_value ("GOBO_EIFFEL", "ve")
				!ET_XACE_VE_GENERATOR! g.make (error_handler)
				a_command.generators.force_last (g)
				if not variables.is_defined ("GOBO_CC") then
					variables.define_value ("GOBO_CC", ve_c_compiler)
				end
			elseif a_compiler.is_equal ("hact") then
				variables.define_value ("GOBO_EIFFEL", "hact")
				!ET_XACE_HACT_GENERATOR! g.make (error_handler)
				a_command.generators.force_last (g)
				if not variables.is_defined ("GOBO_CC") then
					variables.define_value ("GOBO_CC", hact_c_compiler)
				end
			elseif a_compiler.is_equal ("xml") then
				!ET_XACE_XML_GENERATOR! g.make (error_handler)
				a_command.generators.force_last (g)
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
			a_cursor: DS_LINEAR_CURSOR [ET_XACE_GENERATOR]
		do
			if match_long_option ("output") then
				if is_next_option_long_option and then has_next_option_value then
					a_filename := next_option_value
					consume_option
					a_cursor := a_command.generators.new_cursor
					from a_cursor.start until a_cursor.after loop
						a_cursor.item.set_output_filename (a_filename)
						a_cursor.forth
					end
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
				a_definition := split_on_first (a_cursor.item, '=')
				if a_definition.second = Void then
					variables.define_value (a_cursor.item, "")
				else
					variables.define_value (a_definition.first, a_definition.second)
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

feature {NONE} -- Determine which C compiler is used (only correct for Windows)

	hact_c_compiler: STRING is "msc"
			-- Default value for $GOBO_CC when generating
			-- Ace files for HACT

	ise_c_compiler: STRING is
			-- Default value for $GOBO_CC when generating
			-- Ace files for ISE
		local
			env_ise_c_compiler, env_eif_borland: STRING
			ise_c_compiler_defined, eif_borland_defined: BOOLEAN
		once
			env_ise_c_compiler := Execution_environment.variable_value ("ISE_C_COMPILER")
			ise_c_compiler_defined := env_ise_c_compiler /= Void and then env_ise_c_compiler.count > 0
			if ise_c_compiler_defined then
				Result := env_ise_c_compiler
			else
				env_eif_borland := Execution_environment.variable_value ("EIF_BORLAND")
				eif_borland_defined := env_eif_borland /= Void and then env_eif_borland.count > 0
				if eif_borland_defined then
					Result := "bcc"
				else
					-- ahem, what about unix?
					Result := "msc"
				end
			end
		ensure
			ise_c_compiler_not_void: Result /= Void
		end

	se_c_compiler: STRING is
			-- Default value for $GOBO_CC when generating
			-- Ace files for SE
		local
			system_se: STRING
			se_sys_dir: STRING
			a_file: KL_TEXT_INPUT_FILE
			compiler_se: STRING
			i, nb: INTEGER
		once
			system_se := Execution_environment.variable_value ("SmallEiffel")
			if system_se = Void then
				Result := "msc"
			else
				se_sys_dir := file_system.dirname (system_se)
				create a_file.make (file_system.pathname (se_sys_dir, "compiler.se"))
				a_file.open_read
				if not a_file.is_open_read then
					Result := "msc"
				else
					a_file.read_line
					compiler_se := clone (a_file.last_string)
					a_file.close
					nb := compiler_se.count
					if nb >= 5 and then compiler_se.substring (1, 5).is_equal ("bcc32") then
						Result := "bcc"
					elseif nb >= 2 and then compiler_se.substring (1, 2).is_equal ("cl") then
						Result := "msc"
					elseif nb >= 9 and then compiler_se.substring (1, 9).is_equal ("lcc-win32") then
						Result := "lcc"
					else
						from
							i := 1
						until
							Result /= Void
						loop
							if i > nb then
								Result := compiler_se
							else
								inspect compiler_se.item (i)
								when ' ', '%T', '%N', '%R', '%F' then
									if i > 1 then
										Result := compiler_se.substring (1, i - 1)
									else
										Result := "msc"
									end
								else
									i := i + 1
								end
							end
						end
					end
				end
			end
		ensure
			se_c_compiler_not_void: Result /= Void
		end

	ve_c_compiler: STRING is "msc"
			-- Default value for $GOBO_CC when generating
			-- ESD files for VE

feature {NONE} -- Usage message

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gexace usage message
		once
			!! Result.make ("[defines][options] command [xace-file]%N%
				%%Tdefines:  --define=%"VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*%"%N%
				%%Toptions:  --verbose%N%
				%%Tcommand:  --system=(se|ise|ve|hact|xml) [--output=<filename>]%N%
				%%Tcommand:  --cluster=(se|ise|ve|hact|xml) [--output=<filename>]%N%
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
