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
		do
			Arguments.set_program_name ("gedoc")
				-- For compatibility with ISE's tools, define the environment
				-- variable "$ISE_LIBRARY" to $ISE_EIFFEL" if not set yet.
			ise_variables.set_ise_library_variable
			create error_handler.make_standard
			parse_arguments
			if attached format as l_format then
				l_format.execute
				if l_format.has_error then
					Exceptions.die (1)
				end
			end
			if has_error then
				Exceptions.die (1)
			end
		rescue
			Exceptions.die (2)
		end

feature -- Access

	format: detachable GEDOC_FORMAT
			-- Documentation format to be executed

feature -- Argument parsing

	format_option: AP_ENUMERATION_OPTION
			-- Option for '--format=<pretty|html_with_ise_stylesheet>'

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

	verbose_flag: AP_FLAG
			-- Flag for '--verbose'

	silent_flag: AP_FLAG
			-- Flag for '--silent'

	ise_option: AP_STRING_OPTION
			-- Option for '--ise[=major[.minor[.revision[.build]]]]'

	define_option: AP_STRING_OPTION
			-- Option for '--define=FOO=BAR'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments
			-- Initialize options and parse the command line.
		local
			l_parser: AP_PARSER
			l_list: AP_ALTERNATIVE_OPTIONS_LIST
			l_format: GEDOC_FORMAT
		do
			create l_parser.make
			l_parser.set_application_description ("Gobo Eiffel Doc, generate Eiffel documentation.")
			l_parser.set_parameters_description ("filename")
				-- format.
			create format_option.make_with_long_form ("format")
			format_option.set_description ("Format for the output. (default: pretty)")
			format_option.extend ("pretty")
			format_option.extend ("html_with_ise_stylesheet")
			format_option.set_parameter_description ("pretty|html_with_ise_stylesheet")
			l_parser.options.force_last (format_option)
				-- class.
			create class_option.make ('c', "class")
			class_option.set_description ("Name or class (or wildcard) to be processed.")
			class_option.set_parameter_description ("class_name")
			l_parser.options.force_last (class_option)
				-- output_directory.
			create output_option.make ('o', "output")
			output_option.set_description ("Directory for generated files. (default: next to each class file)")
			output_option.set_parameter_description ("directory_name")
			l_parser.options.force_last (output_option)
				-- library-prefix.
			create library_prefix_flag.make_with_long_form ("library-prefix")
			library_prefix_flag.set_description ("Add subfolder with library name in the output directory.")
			l_parser.options.force_last (library_prefix_flag)
				-- force.
			create force_flag.make ('f', "force")
			force_flag.set_description ("Overwrite existing files without asking.")
			l_parser.options.force_last (force_flag)
				-- interactive.
			create interactive_flag.make ('i', "interactive")
			interactive_flag.set_description ("Ask before overwriting a file, unless --force is specified.")
			l_parser.options.force_last (interactive_flag)
				-- verbose.
			create verbose_flag.make_with_long_form ("verbose")
			verbose_flag.set_description ("Should detailed informative messages be displayed?")
			l_parser.options.force_last (verbose_flag)
				-- silent.
			create silent_flag.make_with_long_form ("silent")
			silent_flag.set_description ("Should no informative messages be displayed?")
			l_parser.options.force_last (silent_flag)
				-- ise.
			create ise_option.make_with_long_form ("ise")
			ise_option.set_description ("Version of Eiffel whose semantics should be used during code analysis. (default: latest version)")
			ise_option.set_parameter_description ("major[.minor[.revision[.build]]]")
			ise_option.set_default_parameter (ise_latest.out)
			l_parser.options.force_last (ise_option)
				-- define.
			create define_option.make_with_long_form ("define")
			define_option.set_description ("Define variables to be used when reading Xace files.")
			define_option.set_parameter_description ("FOO=BAR")
			l_parser.options.force_last (define_option)
				-- version.
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gedoc and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_first (l_list)
				-- Parsing.
			l_parser.parse_arguments
			if version_flag.was_found then
				report_version_number
				Exceptions.die (0)
			elseif l_parser.parameters.count /= 1 or else not attached l_parser.parameters.first as l_input_filename then
				report_usage_message (l_parser)
				Exceptions.die (1)
			elseif not format_option.was_found or format_option.parameter ~ "pretty" then
				create {GEDOC_PRETTY_PRINT_FORMAT} l_format.make (l_input_filename, error_handler)
			elseif format_option.parameter ~ "html_with_ise_stylesheet" then
				create {GEDOC_HTML_WITH_ISE_STYLESHEET_FORMAT} l_format.make (l_input_filename, error_handler)
			end
			if l_format /= Void then
				set_ise_version (ise_option, l_parser, l_format)
				set_defined_variables (define_option, l_parser, l_format)
				set_class_filters (class_option, l_parser, l_format)
				set_output_directory (output_option, l_parser, l_format)
				l_format.set_force_flag (force_flag.was_found)
				l_format.set_interactive_flag (interactive_flag.was_found)
				l_format.set_library_prefix_flag (library_prefix_flag.was_found)
				l_format.set_verbose_flag (verbose_flag.was_found)
				l_format.set_silent_flag (silent_flag.was_found)
				format := l_format
			end
		ensure
			format_option_not_void: format_option /= Void
			class_option_not_void: class_option /= Void
			output_option_not_void: output_option /= Void
			library_prefix_flag_not_void: library_prefix_flag /= Void
			force_flag_not_void: force_flag /= Void
			interactive_flag_not_void: interactive_flag /= Void
			verbose_flag_not_void: verbose_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			ise_option_not_void: ise_option /= Void
			define_option_not_void: define_option /= Void
			version_flag_not_void: version_flag /= Void
		end

	set_ise_version (a_option: like ise_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'ise_version' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_ise_version: UT_VERSION
		do
			if not a_option.was_found then
				l_ise_version := ise_latest
			elseif not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				Exceptions.die (1)
			elseif STRING_.same_string (l_parameter, ise_latest.out) then
				l_ise_version := ise_latest
			else
				create l_ise_regexp.make
				l_ise_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_ise_regexp.recognizes (l_parameter) then
					inspect l_ise_regexp.match_count
					when 2 then
						create l_ise_version.make_major (l_ise_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_ise_version.make_major_minor (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, l_ise_regexp.captured_substring (7).to_integer)
					else
						report_usage_message (a_parser)
						Exceptions.die (1)
					end
				else
					report_usage_message (a_parser)
					Exceptions.die (1)
				end
			end
			a_format.set_ise_version (l_ise_version)
		end

	set_defined_variables (a_option: like define_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'defined_variables' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_defined_variables: DS_HASH_TABLE [STRING, STRING]
			l_splitter: ST_SPLITTER
			l_definition: STRING
			l_index: INTEGER
			l_gobo_eiffel: detachable STRING
		do
			create l_defined_variables.make_default
			l_gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if l_gobo_eiffel /= Void and then not l_gobo_eiffel.is_empty then
				l_defined_variables.force_last (l_gobo_eiffel, "GOBO_EIFFEL")
			elseif ise_option.was_found then
				l_defined_variables.force_last ("ise", "GOBO_EIFFEL")
			else
				l_defined_variables.force_last ("ge", "GOBO_EIFFEL")
			end
			if not a_option.parameters.is_empty then
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
			a_format.set_defined_variables (l_defined_variables)
		end

	set_class_filters (a_option: like class_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'class_filters' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_wildcard: LX_DFA_WILDCARD
			l_class_filters: DS_ARRAYED_LIST [LX_DFA_WILDCARD]
		do
			if not a_option.parameters.is_empty then
				create l_class_filters.make (a_option.parameters.count)
				across a_option.parameters as l_class_option loop
					if attached l_class_option.item as l_class_filter and then not l_class_filter.is_empty then
						create l_wildcard.compile_case_insensitive (l_class_filter)
						if not l_wildcard.is_compiled then
							report_invalid_class_option_error (l_class_filter)
							Exceptions.die (1)
						else
							l_class_filters.put_last (l_wildcard)
						end
					end
				end
				if not l_class_filters.is_empty then
					a_format.set_class_filters (l_class_filters)
				end
			end
		end

	set_output_directory (a_option: like output_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'output_directory' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		do
			if a_option.was_found and then attached a_option.parameter as l_output_directory then
				a_format.set_output_directory (Execution_environment.interpreted_string (l_output_directory))
			end
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	has_error: BOOLEAN
			-- Have some errors been reported?

	report_error (a_error: UT_ERROR)
			-- Report `a_error'.
		require
			a_error_not_void: a_error /= Void
		do
			error_handler.report_error (a_error)
			has_error := True
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

invariant

	error_handler_not_void: error_handler /= Void
	format_option_not_void: format_option /= Void
	class_option_not_void: class_option /= Void
	output_option_not_void: output_option /= Void
	library_prefix_flag_not_void: library_prefix_flag /= Void
	force_flag_not_void: force_flag /= Void
	interactive_flag_not_void: interactive_flag /= Void
	verbose_flag_not_void: verbose_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	ise_option_not_void: ise_option /= Void
	define_option_not_void: define_option /= Void
	version_flag_not_void: version_flag /= Void

end
