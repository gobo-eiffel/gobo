indexing

	description:

		"Gobo Eiffel Lex command lines"

	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GELEX_COMMAND_LINE

inherit

	GELEX_VERSION

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	make

feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new command line.
		require
			hander_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER

feature -- Parsing

	read_options (options: LX_DESCRIPTION) is
			-- Read options from the command line
			-- and update `options' accordingly.
		require
			options_not_void: options /= Void
		local
			a_parser: AP_PARSER
			a_version_flag: AP_FLAG
			a_pragma_option: AP_ENUMERATION_OPTION
			an_output_option: AP_STRING_OPTION
			a_size_option: AP_INTEGER_OPTION
			a_backup_flag: AP_FLAG
			a_debug_flag: AP_FLAG
			a_nofull_flag: AP_FLAG
			an_ecs_flag: AP_FLAG
			a_full_flag: AP_FLAG
			a_case_insensitive_flag: AP_FLAG
			a_meta_ecs_flag: AP_FLAG
			a_nodefault_flag: AP_FLAG
			a_nowarn_flag: AP_FLAG
			a_sep_file_flag: AP_FLAG
			an_inspect_flag: AP_FLAG
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
			an_error: AP_ERROR
		do
			create a_parser.make
			a_parser.set_application_description ("Gobo Eiffel Lex is a tool for generating Eiffel programs that perform pattern-matching on text.")
			a_parser.set_parameters_description ("filename")

			create a_version_flag.make ('V', "version")
			a_version_flag.set_description ("Display version information.")
			create a_list.make (a_version_flag)
			a_parser.alternative_options_lists.force_last (a_list)

			create a_size_option.make_with_short_form ('a')
			a_size_option.set_description ("Split manifest arrays larger than 'size'.")
			a_size_option.set_parameter_description ("size")
			a_parser.options.force_last (a_size_option)

			create a_backup_flag.make ('b', "backup")
			a_backup_flag.set_description ("Generate backing-up information to standard output.")
			a_parser.options.force_last (a_backup_flag)

			create a_nofull_flag.make ('c', "nofull")
			a_nofull_flag.set_description ("Generated compressed tables (small, but slower).")
			a_parser.options.force_last (a_nofull_flag)

			create a_debug_flag.make ('d', "debug")
			a_debug_flag.set_description ("Enable debug output.")
			a_parser.options.force_last (a_debug_flag)

			create an_ecs_flag.make ('e', "ecs")
			an_ecs_flag.set_description ("Direct gelex to construct equivalence classes.")
			a_parser.options.force_last (an_ecs_flag)

			create a_full_flag.make ('f', "full")
			a_full_flag.set_description ("Generate full tables (large, but faster).")
			a_parser.options.force_last (a_full_flag)

			create a_case_insensitive_flag.make ('i', "case-insensitive")
			a_case_insensitive_flag.set_description ("Generate a case-insensitive scanner.")
			a_parser.options.force_last (a_case_insensitive_flag)

			create a_meta_ecs_flag.make ('m', "meta-ecs")
			a_meta_ecs_flag.set_description ("Direct gelex to construct meta-equivalence classes.")
			a_parser.options.force_last (a_meta_ecs_flag)

			create an_output_option.make ('o', "outfile")
			an_output_option.set_description ("Name of the output file (instead of stdout).")
			an_output_option.set_parameter_description ("filename")
			a_parser.options.force_last (an_output_option)

			create a_pragma_option.make_with_long_form ("pragma")
			a_pragma_option.set_description ("Generation of #line comments.")
			a_pragma_option.extend ("line")
			a_pragma_option.extend ("noline")
			a_pragma_option.set_parameter_description ("[no]line")
			a_parser.options.force_last (a_pragma_option)

			create a_nodefault_flag.make ('s', "nodefault")
			a_nodefault_flag.set_description ("Cause the default rule to be suppressed.")
			a_parser.options.force_last (a_nodefault_flag)

			create a_nowarn_flag.make ('w', "nowarn")
			a_nowarn_flag.set_description ("Suppress warnings.")
			a_parser.options.force_last (a_nowarn_flag)

			create a_sep_file_flag.make_with_short_form ('x')
			a_sep_file_flag.set_description ("Write each semantic action into a separate routine.")
			a_parser.options.force_last (a_sep_file_flag)


			create an_inspect_flag.make ('z', "inspect")
			an_inspect_flag.set_description ("The generated code uses an inspect instruction to find out which action to execute.")

			a_parser.options.force_last (an_inspect_flag)

			a_parser.parse_arguments

			if a_version_flag.was_found then
				report_version_number		
			end

			if a_pragma_option.was_found then
				options.set_line_pragma (a_pragma_option.parameter.is_equal ("line"))
			end

			if an_output_option.was_found then
				options.set_output_filename (an_output_option.parameter)
			end

			if a_size_option.was_found then
				if a_size_option.parameter >= 0 then
					options.set_array_size (a_size_option.parameter)
				else
					create an_error.make_invalid_parameter_error (a_size_option, a_size_option.parameter.out)
					error_handler.report_error (an_error)
					Exceptions.die (1)
				end
			end

			if a_backup_flag.was_found then
				options.set_backing_up_report (True)
			end

			if a_debug_flag.was_found then
				options.set_debug_mode (True)
			end

			if a_nofull_flag.was_found then
				options.set_equiv_classes_used (False)
				options.set_meta_equiv_classes_used (False)
				options.set_full_table (False)
			end

			if a_full_flag.was_found then
				options.set_equiv_classes_used (False)
				options.set_meta_equiv_classes_used (False)
				options.set_full_table (True)
			end

			if an_ecs_flag.was_found then
				options.set_equiv_classes_used (True)
			end

			if a_meta_ecs_flag.was_found then
				options.set_meta_equiv_classes_used (True)
			end

			if a_case_insensitive_flag.was_found then
				options.set_case_insensitive (True)
			end

			if a_nodefault_flag.was_found then
				options.set_no_default_rule (True)
			end

			if a_nowarn_flag.was_found then
				options.set_no_warning (True)
			end

			if a_sep_file_flag.was_found then
				options.set_actions_separated (True)
			end

			if an_inspect_flag.was_found then
				options.set_inspect_used (True)
			end

			if a_parser.parameters.count /= 1 then
				error_handler.report_info_message (a_parser.help_option.full_usage_instruction (a_parser))
				Exceptions.die (1)
			end

			options.set_input_filename (a_parser.parameters.first)
		end

feature{NONE} -- Reporting

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			Exceptions.die (0)
		end

invariant

	error_handler_not_void: error_handler /= Void

end
