note

	description:

		"Gobo Eiffel Doc"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC

inherit

	GEDOC_VERSION

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	execute

feature -- Execution

	execute
			-- Start 'gedoc' execution.
		local
			l_file: KL_TEXT_INPUT_FILE
			nb: INTEGER
			l_input_classes: detachable DS_HASH_SET [ET_CLASS]
		do
			Arguments.set_program_name ("gedoc")
				-- For compatibility with ISE's tools, define the environment
				-- variable "$ISE_LIBRARY" to $ISE_EIFFEL" if not set yet.
			ise_variables.set_ise_library_variable
			ise_version := ise_latest
			create error_handler.make_standard
			parse_arguments
			create l_file.make (input_filename)
			l_file.open_read
			if l_file.is_open_read then
				last_system := Void
				nb := input_filename.count
				if nb > 5 and then STRING_.same_string (input_filename.substring (nb - 4, nb), ".xace") then
					parse_xace_file (l_file)
				elseif nb > 2 and then STRING_.same_string (input_filename.substring (nb - 1, nb), ".e") then
					if class_option.parameters.is_empty then
						create l_input_classes.make (1)
					end
					parse_eiffel_file (l_file, l_input_classes)
					if l_input_classes /= Void and then l_input_classes.is_empty then
						report_no_class_found_in_file_error (input_filename)
					end
				else
					parse_ecf_file (l_file)
				end
				l_file.close
				if attached last_system as l_last_system then
					process_system (l_last_system, l_input_classes)
					debug ("stop")
						std.output.put_line ("Press Enter...")
						io.read_line
					end
					if l_last_system.error_handler.has_eiffel_error then
						Exceptions.die (1)
					elseif l_last_system.error_handler.has_internal_error then
						Exceptions.die (1)
					elseif has_errors then
						Exceptions.die (1)
					end
				else
					Exceptions.die (1)
				end
			else
				report_cannot_read_error (input_filename)
				Exceptions.die (1)
			end
		rescue
			Exceptions.die (2)
		end

feature -- Access

	input_filename: STRING
			-- Name of the input file.
			-- It can be an Xace file, an ECF file or an Eiffel class file.

	defined_variables: detachable DS_HASH_TABLE [STRING, STRING]
			-- Variables defined on the command-line

	ise_version: UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

feature -- Argument parsing

	format_option: AP_ENUMERATION_OPTION
			-- Option for '--format=<pretty>'

	class_option: AP_STRING_OPTION
			-- Option for '--class=<class_name>'

	output_option: AP_STRING_OPTION
			-- Option for '--output=<directory_name>'

	library_prefix_flag: AP_FLAG
			-- Flag for '--library-prefix'

	force_flag: AP_FLAG
			-- Flag for '--force'

	interactive_flag: AP_FLAG
			-- Flag for '--interactive'

	ise_option: AP_STRING_OPTION
			-- Option for '--ise[=major[.minor[.revision[.build]]]]'

	define_option: AP_STRING_OPTION
			-- Option for '--define=FOO=BAR'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments
			-- Initialize options and parse the command line.
		local
			a_parser: AP_PARSER
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create a_parser.make
			a_parser.set_application_description ("Gobo Eiffel Doc, generate Eiffel documentation.")
			a_parser.set_parameters_description ("filename")
				-- format.
			create format_option.make_with_long_form ("format")
			format_option.set_description ("Format for the output. (default: pretty)")
			format_option.extend ("pretty")
			format_option.set_parameter_description ("pretty")
			a_parser.options.force_last (format_option)
				-- class.
			create class_option.make ('c', "class")
			class_option.set_description ("Class name, or comma-separated list of class names.")
			class_option.set_parameter_description ("class_name")
			a_parser.options.force_last (class_option)
				-- output_directory.
			create output_option.make ('o', "output")
			output_option.set_description ("Directory for generated files. (default: next to each class file)")
			output_option.set_parameter_description ("directory_name")
			a_parser.options.force_last (output_option)
				-- library-prefix.
			create library_prefix_flag.make_with_long_form ("library-prefix")
			library_prefix_flag.set_description ("Add subfolder with library name in the output directory.")
			a_parser.options.force_last (library_prefix_flag)
				-- force.
			create force_flag.make ('f', "force")
			force_flag.set_description ("Overwrite existing files without asking.")
			a_parser.options.force_last (force_flag)
				-- interactive.
			create interactive_flag.make ('i', "interactive")
			interactive_flag.set_description ("Ask before overwriting a file, unless --force is specified.")
			a_parser.options.force_last (interactive_flag)
				-- ise.
			create ise_option.make_with_long_form ("ise")
			ise_option.set_description ("Version of Eiffel whose semantics should be used during code analysis. (default: latest version)")
			ise_option.set_parameter_description ("major[.minor[.revision[.build]]]")
			ise_option.set_default_parameter (ise_latest.out)
			a_parser.options.force_last (ise_option)
				-- define.
			create define_option.make_with_long_form ("define")
			define_option.set_description ("Define variables to be used when reading Xace files.")
			define_option.set_parameter_description ("FOO=BAR")
			a_parser.options.force_last (define_option)
				-- version.
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gedoc and exit.")
			create a_list.make (version_flag)
			a_parser.alternative_options_lists.force_first (a_list)
				-- Parsing.
			a_parser.parse_arguments
			if version_flag.was_found then
				report_version_number
				Exceptions.die (0)
			else
				set_input_filename (a_parser)
				set_ise_version (ise_option, a_parser)
				set_defined_variables (define_option, a_parser)
			end
		ensure
			input_filename_not_void: input_filename /= Void
			format_option_not_void: format_option /= Void
			class_option_not_void: class_option /= Void
			output_option_not_void: output_option /= Void
			library_prefix_flag_not_void: library_prefix_flag /= Void
			force_flag_not_void: force_flag /= Void
			interactive_flag_not_void: interactive_flag /= Void
			ise_option_not_void: ise_option /= Void
			define_option_not_void: define_option /= Void
			version_flag_not_void: version_flag /= Void
		end

	set_input_filename (a_parser: AP_PARSER)
			-- Set `input_filename' with information passed in `a_parser'.
			-- Report usage message and exit in case of invalid input.
		require
			a_parser_not_void: a_parser /= Void
		do
			if a_parser.parameters.count /= 1 or else not attached a_parser.parameters.first as l_input_filename then
				report_usage_message (a_parser)
				Exceptions.die (1)
			else
				input_filename := l_input_filename
			end
		end

	set_ise_version (a_option: like ise_option; a_parser: AP_PARSER)
			-- Set `ise_version' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			if not a_option.was_found then
				ise_version := ise_latest
			elseif not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				Exceptions.die (1)
			else
				create l_ise_regexp.make
				l_ise_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_ise_regexp.recognizes (l_parameter) then
					inspect l_ise_regexp.match_count
					when 2 then
						create ise_version.make_major (l_ise_regexp.captured_substring (1).to_integer)
					when 4 then
						create ise_version.make_major_minor (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer)
					when 6 then
						create ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, l_ise_regexp.captured_substring (7).to_integer)
					else
						report_usage_message (a_parser)
						Exceptions.die (1)
					end
				else
					report_usage_message (a_parser)
					Exceptions.die (1)
				end
			end
		end

	set_defined_variables (a_option: like define_option; a_parser: AP_PARSER)
			-- Set `defined_variables' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_defined_variables: like defined_variables
			l_splitter: ST_SPLITTER
			l_definition: STRING
			l_index: INTEGER
		do
			if not a_option.parameters.is_empty then
				create l_defined_variables.make_default
				defined_variables := l_defined_variables
				create l_splitter.make
				across a_option.parameters as l_variables loop
					across l_splitter.split (l_variables.item) as l_variable loop
						l_definition := l_variable.item
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_defined_variables.force_last ("", l_definition)
							elseif l_index = l_definition.count then
								l_defined_variables.force_last ("", l_definition.substring (1, l_index - 1))
							elseif l_index /= 1 then
								l_defined_variables.force_last (l_definition.substring (l_index + 1, l_definition.count), l_definition.substring (1, l_index - 1))
							end
						end
					end
				end
			end
		end

feature {NONE} -- Eiffel config file parsing

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
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			gobo_eiffel: STRING
		do
			last_system := Void
			create l_xace_error_handler.make_standard
			create l_xace_variables.make_map (100)
			l_xace_variables.set_key_equality_tester (string_equality_tester)
			gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if gobo_eiffel /= Void and then not gobo_eiffel.is_empty then
				l_xace_variables.force_last (gobo_eiffel, "GOBO_EIFFEL")
			elseif ise_option.was_found then
				l_xace_variables.force_last ("ise", "GOBO_EIFFEL")
			else
				l_xace_variables.force_last ("ge", "GOBO_EIFFEL")
			end
			if attached defined_variables as l_defined_variables then
				l_cursor := l_defined_variables.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_xace_variables.force_last (l_cursor.item, l_cursor.key)
					l_cursor.forth
				end
			end
			create l_xace_parser.make_with_variables (l_xace_variables, l_xace_error_handler)
			l_xace_parser.parse_file (a_file)
			if not l_xace_error_handler.has_error and then attached l_xace_parser.last_system as l_last_system then
				l_last_system.activate_processors
				last_system := l_last_system
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
			l_gobo_eiffel: STRING
		do
			last_system := Void
			l_gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if l_gobo_eiffel = Void or else l_gobo_eiffel.is_empty then
				if ise_option.was_found then
					Execution_environment.set_variable_value ("GOBO_EIFFEL", "ise")
				else
					Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
				end
			end
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.parse_file (a_file)
			if not l_ecf_error_handler.has_error and then attached l_ecf_parser.last_system as l_last_system then
				l_last_system.activate_processors
				last_system := l_last_system
			end
		end

	parse_eiffel_file (a_file: KI_CHARACTER_INPUT_STREAM; a_classes: detachable DS_HASH_SET [ET_CLASS])
			-- Read Eiffel file `a_file' and keep track of it in
			-- newly created `last_system' if no error occurred.
			-- If `a_classes' is not Void, then add classes found
			-- in this file to this list.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_system: ET_SYSTEM
			l_cluster: ET_XACE_CLUSTER
			l_eiffel_preparser: ET_EIFFEL_PREPARSER
		do
			last_system := Void
			create l_system.make ("gedoc_system")
			l_system.set_ise_version (ise_version)
			l_system.activate_processors
			create l_cluster.make ("gedoc_cluster", ".", l_system)
			if attached {ET_EIFFEL_PREPARSER} l_system.eiffel_preparser as l_system_eiffel_preparser then
				l_eiffel_preparser := l_system_eiffel_preparser
			else
				create l_eiffel_preparser.make
			end
			l_eiffel_preparser.preparse_file (a_file.name, l_cluster)
			if not l_eiffel_preparser.error_handler.has_error then
				if a_classes /= Void then
					l_system.classes_do_if (agent a_classes.force_last, agent {ET_CLASS}.is_in_group (l_cluster))
				end
				last_system := l_system
			end
		end

	last_system: detachable ET_SYSTEM
			-- Last system parsed, if any

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM; a_input_classes: detachable DS_HASH_SET [ET_CLASS])
			-- Process `a_system'.
			-- Use `a_input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system', possibly filtered by option `class_option'.
		require
			a_system_not_void: a_system /= Void
		local
			l_input_classes: detachable DS_HASH_SET [ET_CLASS]
			l_ast_factory: ET_DECORATED_AST_FACTORY
			l_wildcard: LX_DFA_WILDCARD
			l_last_class_option: detachable STRING
		do
			a_system.set_ise_version (ise_version)
			a_system.set_unknown_builtin_reported (False)
			create l_ast_factory.make
			l_ast_factory.set_keep_all_breaks (True)
			a_system.set_ast_factory (l_ast_factory)
			if a_input_classes /= Void then
				l_input_classes := a_input_classes
			elseif not class_option.parameters.is_empty then
				a_system.preparse_recursive
				create l_input_classes.make (500)
				across class_option.parameters as l_class_option loop
					if attached l_class_option.item as l_class_name and then not l_class_name.is_empty then
						create l_wildcard.compile_case_insensitive (l_class_name)
						if not l_wildcard.is_compiled then
							report_invalid_class_option_error (l_class_name)
						else
							l_last_class_option := l_class_name
							a_system.add_classes_by_wildcarded_name_recursive (l_wildcard, l_input_classes)
						end
					end
				end
				if l_input_classes.is_empty and l_last_class_option /= Void then
					report_no_class_matching_wildcard_error (l_last_class_option)
				end
			end
			if l_input_classes /= Void then
				l_input_classes.do_all (agent {ET_CLASS}.process (a_system.eiffel_parser))
			else
				a_system.parse_all_recursive
			end
			if not format_option.was_found or format_option.parameter ~ "pretty" then
				if l_input_classes /= Void then
					l_input_classes.do_all (agent pretty_print_class)
				else
					a_system.classes_do_recursive (agent pretty_print_class)
				end
			end
		end

feature {NONE} -- Pretty-print

	pretty_print_class (a_class: ET_CLASS)
			-- Pretty-print `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_parsed: a_class.is_none or else a_class.is_parsed
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
		do
			if a_class.is_none then
				-- Do nothing.
			elseif a_class.has_syntax_error then
				-- This error should have already been reported.
			elseif not attached output_directory (a_class) as l_directory then
				report_no_output_directory_for_class_error (a_class)
			else
				l_filename := file_system.pathname (l_directory, a_class.lower_name + ".e")
				if not is_file_overwritable (l_filename) then
					report_file_already_exists_error (l_filename)
				else
					create l_file.make (l_filename)
					l_file.recursive_open_write
					if l_file.is_open_write then
						create l_printer.make_null
						l_printer.set_file (l_file)
						a_class.process (l_printer)
						l_printer.set_null_file
						l_file.close
					else
						report_cannot_write_error (l_filename)
					end
				end
			end
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	has_errors: BOOLEAN
			-- Have some errors been reported?

	report_error (a_error: UT_ERROR)
			-- Report `a_error'.
		require
			a_error_not_void: a_error /= Void
		do
			error_handler.report_error (a_error)
			has_errors := True
		end

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_CANNOT_READ_FILE_ERROR
		do
			create l_error.make (a_filename)
			report_error (l_error)
		end

	report_cannot_write_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in wrtie mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create l_error.make (a_filename)
			report_error (l_error)
		end

	report_file_already_exists_error (a_filename: STRING)
			-- Report that `a_filename' already exists an dwill not be overwritten.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("File '" + a_filename + "' already exists. Not overwritten.")
			report_error (l_error)
		end

	report_no_output_directory_for_class_error (a_class: ET_CLASS)
			-- Report that it was not possible to find an output directory
			-- for `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Cannot find an output directory for class '" + a_class.upper_name + "'. Option --output must be specified.")
			report_error (l_error)
		end

	report_no_class_found_in_file_error (a_filename: STRING)
			-- Report that no class could be found in file `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No class was found in file '" + a_filename + "'.")
			report_error (l_error)
		end

	report_invalid_class_option_error (a_wildcard: STRING)
			-- Report that the wildcard specified for `class_option' is invalid.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Invalid wildcard '" + a_wildcard + "' in option '--class'.")
			report_error (l_error)
		end

	report_no_class_matching_wildcard_error (a_wildcard: STRING)
			-- Report that no class matches `a_wildcard'.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No class matches wildcard '" + a_wildcard + "'.")
			report_error (l_error)
		end

	report_version_number
			-- Report version number.
		local
			l_message: UT_VERSION_NUMBER
		do
			create l_message.make (Version_number)
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

feature {NONE} -- Implementation

	is_file_overwritable (a_filename: STRING): BOOLEAN
			-- Is it allowed to write to file `a_filename'?
		require
			a_filename_not_void: a_filename /= Void
		do
			if force_flag.was_found then
				Result := True
			elseif not file_system.file_exists (a_filename) then
				Result := True
			elseif interactive_flag.was_found then
				std.output.put_string ("File '")
				std.output.put_string (a_filename)
				std.output.put_line ("' already exists. Overwrite it (y/n)?")
				std.input.read_line
				Result := std.input.last_string.starts_with ("y")
			end
		end

	output_directory (a_class: ET_CLASS): detachable STRING
			-- Where to generate files for `a_class';
			-- Void if this directory could not be determined
			-- (e.g. --output was not specified and `a_class'
			-- is in a .NET assembly).
		require
			a_class_not_void: a_class /= Void
		do
			if output_option.was_found and then attached output_option.parameter as l_output_option then
				Result := Execution_environment.interpreted_string (l_output_option)
				if library_prefix_flag.was_found then
					Result := file_system.pathname (Result, a_class.universe.name)
				end
			elseif a_class.is_in_cluster then
				Result := a_class.group.full_pathname
			end
		end

invariant

	error_handler_not_void: error_handler /= Void
	input_filename_not_void: input_filename /= Void
	ise_version_not_void: ise_version /= Void
	format_option_not_void: format_option /= Void
	class_option_not_void: class_option /= Void
	output_option_not_void: output_option /= Void
	library_prefix_flag_not_void: library_prefix_flag /= Void
	force_flag_not_void: force_flag /= Void
	interactive_flag_not_void: interactive_flag /= Void
	ise_option_not_void: ise_option /= Void
	define_option_not_void: define_option /= Void
	version_flag_not_void: version_flag /= Void

end
