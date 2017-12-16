note

	description:

		"Gobo Eiffel Compiler"

	copyright: "Copyright (c) 2005-2017, Eric Bezault and others"
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

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	execute

feature -- Execution

	execute
			-- Start 'gec' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			nb: INTEGER
		do
			Arguments.set_program_name ("gec")
				-- For compatibility with ISE's tools, define the environment
				-- variable "$ISE_LIBRARY" to $ISE_EIFFEL" if not set yet.
			ise_variables.set_ise_library_variable
			create error_handler.make_standard
			parse_arguments
			a_filename := ace_filename
			create a_file.make (a_filename)
			a_file.open_read
			if a_file.is_open_read then
				last_system := Void
				nb := a_filename.count
				if nb > 5 and then STRING_.same_string (a_filename.substring (nb - 4, nb), ".xace") then
					parse_xace_file (a_file)
				elseif nb > 4 and then STRING_.same_string (a_filename.substring (nb - 3, nb), ".ecf") then
					parse_ecf_file (a_file)
				else
					parse_ace_file (a_file)
				end
				a_file.close
				if last_system /= Void then
					process_system (last_system)
					debug ("stop")
						std.output.put_line ("Press Enter...")
						std.input.read_character
					end
					if error_handler.has_error then
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

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	last_system: ET_SYSTEM
			-- Last Eiffel system parsed, if any

feature {NONE} -- Eiffel config file parsing

	parse_ace_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read Ace file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_lace_parser: ET_LACE_PARSER
			l_lace_error_handler: ET_LACE_ERROR_HANDLER
		do
			last_system := Void
			create l_lace_error_handler.make_standard
			create l_lace_parser.make (l_lace_error_handler)
			l_lace_parser.parse_file (a_file)
			if not l_lace_parser.syntax_error then
				last_system := l_lace_parser.last_system
			end
		end

	parse_xace_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read Xace file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_xace_parser: ET_XACE_SYSTEM_PARSER
			l_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			l_xace_variables: DS_HASH_TABLE [STRING, STRING]
			l_splitter: ST_SPLITTER
			l_cursor: DS_LIST_CURSOR [STRING]
			l_definition: STRING
			l_index: INTEGER
			defined_variables: STRING
		do
			last_system := Void
			create l_xace_error_handler.make_standard
			create l_xace_variables.make_map (100)
			l_xace_variables.set_key_equality_tester (string_equality_tester)
			l_xace_variables.force_last ("ge", "GOBO_EIFFEL")
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
				last_system := l_xace_parser.last_system
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_ecf_system: ET_ECF_SYSTEM
			l_target: ET_ECF_TARGET
			l_value: STRING
		do
			last_system := Void
			Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_finalize_mode (is_finalize)
			l_ecf_parser.parse_file (a_file)
			if not l_ecf_error_handler.has_error then
				l_ecf_system := l_ecf_parser.last_system
				if l_ecf_system /= Void then
					l_target := l_ecf_system.selected_target
					if l_target /= Void then
						l_value := l_target.variables.value ("gelint")
						if l_value /= Void and then l_value.is_boolean then
							ecf_gelint_option := l_value.to_boolean
						end
					end
					last_system := l_ecf_system
				end
			end
		end

	ecf_gelint_option: BOOLEAN
			-- Same as command-line option --gelint, but specified from the ECF file

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_system: ET_DYNAMIC_SYSTEM
			l_system_processor: ET_SYSTEM_PROCESSOR
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_root_type: ET_BASE_TYPE
			l_generator: ET_C_GENERATOR
			l_command: KL_SHELL_COMMAND
			l_filename: STRING
			l_system_name: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_type_names: DS_HASH_SET [STRING]
			s: STRING
		do
			if is_silent then
-- TODO.
			end
			if is_verbose then
-- TODO.
			end
			error_handler.set_ise
			create l_system_processor.make
			l_system_processor.set_error_handler (error_handler)
			l_system_processor.set_ise_version (ise_latest)
			if is_gelint then
				l_system_processor.set_flat_mode (True)
				l_system_processor.set_flat_dbc_mode (True)
			end
			create l_system.make (a_system, l_system_processor)
			if is_gelint then
				l_system.set_full_class_checking (True)
			end
			l_system.set_catcall_error_mode (catcall_error_mode)
			l_system.set_catcall_warning_mode (catcall_warning_mode)
			if new_instance_types_option.was_found then
				l_filename := new_instance_types_option.parameter
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					create l_type_names.make_equal (100)
					from
						l_file.read_line
					until
						l_file.end_of_file
					loop
						s := l_file.last_string.twin
						s.left_adjust
						s.right_adjust
						if not s.is_empty and not s.starts_with ("--") then
							l_type_names.force (s)
						end
						l_file.read_line
					end
					l_file.close
					l_system.set_new_instance_types (l_type_names)
				else
					report_cannot_read_error (l_filename)
					Exceptions.die (1)
				end
			end
			create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} l_builder.make (l_system, l_system_processor)
			l_system.set_dynamic_type_set_builder (l_builder)
			l_system.compile (l_system_processor)
			l_root_type := a_system.root_type
			if l_root_type = Void then
				-- Do nothing.
			elseif l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) then
				-- Do nothing.
			elseif l_system.has_fatal_error then
				Exceptions.die (1)
			else
					-- C code generation.
				l_system_name := a_system.system_name
				if l_system_name = Void then
					l_system_name := l_root_type.base_class.lower_name
				end
				create l_generator.make (l_system, l_system_processor)
				if gc_option.was_found then
						-- Override any option that might have been specified
						-- in the Eiffel config file.
					l_generator.set_use_boehm_gc (use_boehm_gc)
				end
				l_generator.set_finalize_mode (is_finalize)
				l_generator.set_split_mode (not no_split)
				if split_size > 0 then
					l_generator.set_split_threshold (split_size)
				end
				l_generator.generate (l_system_name)
				if is_verbose then
					error_handler.info_file.put_string ("Never void targets: ")
					error_handler.info_file.put_integer (l_generator.never_void_target_count)
					error_handler.info_file.put_new_line
					error_handler.info_file.put_string ("Can be void targets: ")
					error_handler.info_file.put_integer (l_generator.can_be_void_target_count)
					error_handler.info_file.put_new_line
				end
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

	report_cannot_read_error (a_filename: STRING)
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

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

feature -- Status report

	is_finalize: BOOLEAN
			-- Compilation with optimizations turned on?
		do
			Result := finalize_flag.was_found
		end

	is_gelint: BOOLEAN
			-- Should gelint be run on the full content of each class being compiled?
		do
			Result := gelint_flag.was_found or ecf_gelint_option
		end

	catcall_error_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?
		do
			Result := catcall_option.was_found and then STRING_.same_string (catcall_option.parameter, "error")
		end

	catcall_warning_mode: BOOLEAN
			-- Are CAT-call errors considered just as warnings?
		do
			Result := not catcall_option.was_found or else STRING_.same_string (catcall_option.parameter, "warning")
		end

	no_c_compile: BOOLEAN
			-- Should the back-end C compiler not be invoked on the generated C code?
		do
			Result := c_compile_option.was_found and then not c_compile_option.parameter
		end

	no_split: BOOLEAN
			-- Should C code be generated into a single file?
		do
			Result := split_option.was_found and then not split_option.parameter
		end

	split_size: INTEGER
			-- Size (in bytes) of generated C files in bytes when in split mode

	use_boehm_gc: BOOLEAN
			-- Should the application be compiled with the Boehm GC?
		do
			Result := gc_option.was_found and then STRING_.same_string (gc_option.parameter, "boehm")
		end

	is_silent: BOOLEAN
			-- Should gec run in silent mode?
		do
			Result := silent_flag.was_found
		end

	is_verbose: BOOLEAN
			-- Should gec run in verbose mode?
		do
			Result := verbose_flag.was_found
		end

feature -- Argument parsing

	ace_filename: STRING
			-- Name of the ace file

	catcall_option: AP_ENUMERATION_OPTION
			-- Option for '--catcall=<no|error|warning>'

	finalize_flag: AP_FLAG
			-- Flag for '--finalize'

	gelint_flag: AP_FLAG
			-- Flag for '--gelint'

	c_compile_option: AP_BOOLEAN_OPTION
			-- Option for '--cc=<no|yes>'

	split_option: AP_BOOLEAN_OPTION
			-- Option for '--split=<no|yes>'

	split_size_option: AP_INTEGER_OPTION
			-- Option for '--split-size=<size>'

	gc_option: AP_ENUMERATION_OPTION
			-- Option for '--gc=<no|boehm>'

	new_instance_types_option: AP_STRING_OPTION
			-- Option for '--new_instance_types=<filename>'

	silent_flag: AP_FLAG
			-- Flag for '--silent'

	verbose_flag: AP_FLAG
			-- Flag for '--verbose'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments
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
				-- gelint.
			create gelint_flag.make_with_long_form ("gelint")
			gelint_flag.set_description ("Run gelint on the full content of each class being compiled.")
			a_parser.options.force_last (gelint_flag)
				-- catcall
			create catcall_option.make_with_long_form ("catcall")
			catcall_option.set_description ("Should CAT-call errors be considered as fatal errors, as warnings, or just ignored? (default: warning)")
			catcall_option.extend ("no")
			catcall_option.extend ("error")
			catcall_option.extend ("warning")
			catcall_option.set_parameter_description ("no|error|warning")
			a_parser.options.force_last (catcall_option)
				-- cc
			create c_compile_option.make_with_long_form ("cc")
			c_compile_option.set_description ("Should the back-end C compiler be invoked on the generated C code? (default: yes)")
			c_compile_option.set_parameter_description ("no|yes")
			a_parser.options.force_last (c_compile_option)
				-- split
			create split_option.make_with_long_form ("split")
			split_option.set_description ("Should generated C code be split over several C files instead of being held in a single possibly large C file? (default: yes)")
			split_option.set_parameter_description ("no|yes")
			a_parser.options.force_last (split_option)
				-- split-size
			create split_size_option.make_with_long_form ("split-size")
			split_size_option.set_description ("Size of generated C files in bytes when in split mode.")
			split_size_option.set_parameter_description ("size")
			a_parser.options.force_last (split_size_option)
				-- new_instance_types
			create new_instance_types_option.make_with_long_form ("new_instance_types")
			new_instance_types_option.set_description ("File containing the list of types which can have instances created by 'TYPE.new_instance' or 'TYPE.new_special_any_instance'.")
			new_instance_types_option.set_parameter_description ("filename")
			a_parser.options.force_last (new_instance_types_option)
				-- gc
			create gc_option.make_with_long_form ("gc")
			gc_option.set_description ("Which garbage collector should the application be compiled with? (default: no)")
			gc_option.extend ("no")
			gc_option.extend ("boehm")
			gc_option.set_parameter_description ("no|boehm")
			a_parser.options.force_last (gc_option)
				-- silent
			create silent_flag.make_with_long_form ("silent")
			silent_flag.set_description ("Run gec in silent mode.")
			a_parser.options.force_last (silent_flag)
				-- verbose
			create verbose_flag.make_with_long_form ("verbose")
			verbose_flag.set_description ("Run gec in verbose mode.")
			a_parser.options.force_last (verbose_flag)
				-- version
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
			catcall_option_not_void: catcall_option /= Void
			finalize_flag_not_void: finalize_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			verbose_flag_not_void: verbose_flag /= Void
			c_compile_option_not_void: c_compile_option /= Void
			split_option_not_void: split_option /= Void
			split_size_option_not_void: split_size_option /= Void
			gc_option_not_void: gc_option /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void
	ace_filename_not_void: ace_filename /= Void
	catcall_option_not_void: catcall_option /= Void
	gelint_flag_not_void: gelint_flag /= Void
	finalize_flag_not_void: finalize_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	verbose_flag_not_void: verbose_flag /= Void
	c_compile_option_not_void: c_compile_option /= Void
	split_option_not_void: split_option /= Void
	split_size_option_not_void: split_size_option /= Void
	new_instance_types_option_not_void: new_instance_types_option /= Void
	gc_option_not_void: gc_option /= Void

end
