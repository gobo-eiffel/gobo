indexing

	description:

		"Gobo Eiffel Compiler"

	copyright: "Copyright (c) 2005-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEC

inherit

	GEC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_FILE_SYSTEM
	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	execute

feature -- Execution

	execute is
			-- Start 'gec' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			nb: INTEGER
		do
			Arguments.set_program_name ("gec")
			create error_handler.make_standard
			parse_arguments
			a_filename := ace_filename
			create a_file.make (a_filename)
			a_file.open_read
			if a_file.is_open_read then
				last_universe := Void
				nb := a_filename.count
				if nb > 5 and then STRING_.same_string (a_filename.substring (nb - 4, nb), ".xace") then
					parse_xace_file (a_file)
				elseif nb > 4 and then STRING_.same_string (a_filename.substring (nb - 3, nb), ".ecf") then
					parse_ecf_file (a_file)
				else
					parse_ace_file (a_file)
				end
				a_file.close
				if last_universe /= Void then
					process_universe (last_universe)
					debug ("stop")
						std.output.put_line ("Press Enter...")
						std.input.read_character
					end
					if last_universe.error_handler.has_error then
						Exceptions.die (2)
					end
				else
					Exceptions.die (3)
				end
			else
				report_cannot_read_error (a_filename)
				Exceptions.die (1)
			end
		rescue
			Exceptions.die (4)
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	last_universe: ET_UNIVERSE
			-- Last universe parsed, if any

feature {NONE} -- Eiffel config file parsing

	parse_ace_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Read Ace file `a_file'.
			-- Put result in `last_universe' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_lace_parser: ET_LACE_PARSER
			l_lace_error_handler: ET_LACE_ERROR_HANDLER
		do
			last_universe := Void
			create l_lace_error_handler.make_standard
			create l_lace_parser.make (l_lace_error_handler)
			l_lace_parser.parse_file (a_file)
			if not l_lace_parser.syntax_error then
				last_universe := l_lace_parser.last_universe
			end
		end

	parse_xace_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Read Xace file `a_file'.
			-- Put result in `last_universe' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_xace_parser: ET_XACE_UNIVERSE_PARSER
			l_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			l_xace_variables: DS_HASH_TABLE [STRING, STRING]
			l_splitter: ST_SPLITTER
			l_cursor: DS_LIST_CURSOR [STRING]
			l_definition: STRING
			l_index: INTEGER
			gobo_eiffel: STRING
			defined_variables: STRING
		do
			last_universe := Void
			create l_xace_error_handler.make_standard
			create l_xace_variables.make_map (100)
			l_xace_variables.set_key_equality_tester (string_equality_tester)
			gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if gobo_eiffel /= Void then
				l_xace_variables.force_last (gobo_eiffel, "GOBO_EIFFEL")
			end
			if defined_variables /= Void then
				create l_splitter.make
				l_cursor := l_splitter.split (defined_variables).new_cursor
				from l_cursor.start until l_cursor.after loop
					l_definition := l_cursor.item
					if l_definition.count > 0 then
						l_index := l_definition.index_of ('=', 1)
						if l_index = 0 then
							l_xace_variables.force_last ("", l_definition)
						elseif l_index = l_definition.count then
							l_xace_variables.force_last ("", l_definition.substring (1, l_index - 1))
						elseif l_index /= 1 then
							l_xace_variables.force_last (l_definition.substring (l_index + 1, l_definition.count), l_definition.substring (1, l_index - 1))
						end
					end
					l_cursor.forth
				end
			end
			create l_xace_parser.make_with_variables (l_xace_variables, l_xace_error_handler)
			l_xace_parser.parse_file (a_file)
			if not l_xace_error_handler.has_error then
				last_universe := l_xace_parser.last_universe
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Read ECF file `a_file'.
			-- Put result in `last_universe' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
				-- ECF is not supported.
				-- Parse Ace file as default.
			parse_ace_file (a_file)
		end

feature {NONE} -- Processing

	process_universe (a_universe: ET_UNIVERSE) is
			-- Process `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_null_error_handler: ET_NULL_ERROR_HANDLER
			l_system: ET_SYSTEM
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_class: ET_CLASS
			l_generator: ET_C_GENERATOR
			l_command: KL_SHELL_COMMAND
			l_filename: STRING
			l_system_name: STRING
		do
			if is_silent then
				create l_null_error_handler.make_standard
				a_universe.set_error_handler (l_null_error_handler)
			end
			a_universe.error_handler.set_ise
			a_universe.set_ise_version (ise_latest)
			if is_verbose then
-- TODO.
			end
			create l_system.make (a_universe)
			l_system.set_catcall_mode (is_cat)
			create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} l_builder.make (l_system)
			l_system.set_dynamic_type_set_builder (l_builder)
			l_system.compile
			l_class := a_universe.root_class
			if l_class = Void then
				-- Do nothing.
			elseif l_class = a_universe.none_class then
				-- Do nothing.
			elseif l_system.has_fatal_error then
				Exceptions.die (1)
			else
					-- C code generation.
				l_system_name := a_universe.system_name
				if l_system_name = Void then
					l_system_name := l_class.lower_name
				end
				create l_generator.make (l_system)
				l_generator.set_finalize (is_finalize)
				l_generator.set_split_mode (not no_split)
				if split_size > 0 then
					l_generator.set_split_threshold (split_size)
				end
				l_generator.generate (l_system_name)
				if l_generator.has_fatal_error then
					Exceptions.die (1)
				elseif not no_c_compile then
					if operating_system.is_windows then
						l_filename := l_system_name + ".bat"
					else
						l_filename := l_system_name + ".sh"
					end
					create l_command.make (file_system.absolute_pathname (l_filename))
					l_command.execute
					if l_command.exit_code /= 0 then
						Exceptions.die (1)
					end
				end
			end
		end

feature -- Error handling

	report_cannot_read_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_version_number is
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

feature -- Status report

	is_finalize: BOOLEAN is
			-- Compilation with optimizations turned on?
		do
			Result := finalize_flag.was_found
		end

	is_cat: BOOLEAN is
			-- Should CAT-call errors be considered as fatal errors?
		do
			Result := cat_flag.was_found
		end

	no_c_compile: BOOLEAN is
			-- Should the back-end C compiler not be invoked on the generated C code?
		do
			Result := no_c_compile_flag.was_found
		end

	no_split: BOOLEAN is
			-- Should C code be generated into a single file?
		do
			Result := no_split_flag.was_found
		end

	split_size: INTEGER
			-- Size (in bytes) of generated C files in bytes when in split mode

	is_silent: BOOLEAN is
			-- Should gec run in silent mode?
		do
			Result := silent_flag.was_found
		end

	is_verbose: BOOLEAN is
			-- Should gec run in verbose mode?
		do
			Result := verbose_flag.was_found
		end

feature -- Argument parsing

	ace_filename: STRING
			-- Name of the ace file

	cat_flag: AP_FLAG
			-- Flag for '--cat'

	finalize_flag: AP_FLAG
			-- Flag for '--finalize'

	no_c_compile_flag: AP_FLAG
			-- Flag for '--nocc'

	no_split_flag: AP_FLAG
			-- Flag for '--nosplit'

	split_size_option: AP_INTEGER_OPTION
			-- Option for '--splitsize=<size>'

	silent_flag: AP_FLAG
			-- Flag for '--silent'

	verbose_flag: AP_FLAG
			-- Flag for '--verbose'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments is
			-- Initialize options and parse the command line.
		local
			a_parser: AP_PARSER
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
			an_error: AP_ERROR
		do
			create a_parser.make
			a_parser.set_application_description ("Gobo Eiffel Compiler, translate Eiffel programs into C code.")
			a_parser.set_parameters_description ("ace_filename")
				-- Options.
			create finalize_flag.make_with_long_form ("finalize")
			finalize_flag.set_description ("Compile with optimizations turned on.")
			a_parser.options.force_last (finalize_flag)
			create cat_flag.make_with_long_form ("cat")
			cat_flag.set_description ("CAT-call errors should be considered as fatal errors.")
			a_parser.options.force_last (cat_flag)
			create no_c_compile_flag.make_with_long_form ("nocc")
			no_c_compile_flag.set_description ("Do not invoke the back-end C compiler on the generated C code.")
			a_parser.options.force_last (no_c_compile_flag)
			create no_split_flag.make_with_long_form ("nosplit")
			no_split_flag.set_description ("C code generated into a single file.")
			a_parser.options.force_last (no_split_flag)
			create split_size_option.make_with_long_form ("splitsize")
			split_size_option.set_description ("Size of generated C files in bytes when in split mode.")
			split_size_option.set_parameter_description ("size")
			a_parser.options.force_last (split_size_option)
			create silent_flag.make_with_long_form ("silent")
			silent_flag.set_description ("Run gec in silent mode.")
			a_parser.options.force_last (silent_flag)
			create verbose_flag.make_with_long_form ("verbose")
			verbose_flag.set_description ("Run gec in verbose mode.")
			a_parser.options.force_last (verbose_flag)
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gec and exit.")
			create a_list.make (version_flag)
			a_parser.alternative_options_lists.force_last (a_list)
				-- Parsing.
			a_parser.parse_arguments
			if version_flag.was_found then
				report_version_number
				Exceptions.die (0)
			elseif a_parser.parameters.count /= 1 then
				error_handler.report_info_message (a_parser.help_option.full_usage_instruction (a_parser))
				Exceptions.die (1)
			else
				ace_filename := a_parser.parameters.first
			end
			if split_size_option.was_found then
				if split_size_option.parameter > 0 then
					split_size := split_size_option.parameter
				else
					create an_error.make_invalid_parameter_error (split_size_option, split_size_option.parameter.out)
					error_handler.report_error (an_error)
					Exceptions.die (1)
				end
			end
		ensure
			ace_filename_not_void: ace_filename /= Void
			cat_flag_not_void: cat_flag /= Void
			finalize_flag_not_void: finalize_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			verbose_flag_not_void: verbose_flag /= Void
			no_c_compile_flag_not_void: no_c_compile_flag /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void
	ace_filename_not_void: ace_filename /= Void
	cat_flag_not_void: cat_flag /= Void
	finalize_flag_not_void: finalize_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	verbose_flag_not_void: verbose_flag /= Void
	no_c_compile_flag_not_void: no_c_compile_flag /= Void
	no_split_flag_not_void: no_split_flag /= Void
	split_size_option_not_void: split_size_option /= Void

end
