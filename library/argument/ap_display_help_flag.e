indexing

	description:

		"Flags that will generate a help text and terminate the application"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_DISPLAY_HELP_FLAG

inherit

	AP_FLAG
		redefine
			record_occurrence
		end

	KL_SHARED_EXCEPTIONS

	KL_SHARED_FILE_SYSTEM

	KL_SHARED_ARGUMENTS

create

	make,
	make_with_long_form,
	make_with_short_form

feature -- Constants

	usage_header: STRING is "usage: "
			-- Text that is used to introduce usage instructions

	text_before_description: STRING is "%N"
			-- Text that separates the usage instructions and the
			-- application description

	text_below_description: STRING is "%N"
			-- Text that separates the application description and the 
			-- list of options

	text_before_options: STRING is "%NOptions:%N"
			-- Text that introduces the options

	option_description_indentation: INTEGER is 1
			-- Number of characters for the indentation of the option 
			-- text

feature {AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER) is
			-- The option was found during parsing. Display the help text and 
			-- terminate the application.
		do
			display_help (a_parser)
		end

feature -- Help Display

	display_help (a_parser: AP_PARSER) is
			-- Display the help text for `a_parser' (and die afterwards).
		do
			a_parser.error_handler.report_info_message (full_help_text (a_parser))
			Exceptions.die (0)
		end

	display_usage (a_parser: AP_PARSER) is
			-- Display only the usage instructions (and die afterwards).
		do
			a_parser.error_handler.report_info_message (full_usage_instruction (a_parser))
			Exceptions.die (0)
		end

feature -- Text Generation

	full_help_text (a_parser: AP_PARSER): STRING is
			-- Full help text for `a_parser'
		require
			a_parser_not_void: a_parser /= Void
		local
			max_indent: INTEGER
			all_options: DS_LIST [AP_OPTION]
			comparator: AP_OPTION_COMPARATOR
			sorter: DS_QUICK_SORTER [AP_OPTION]
			is_not_first: BOOLEAN
		do
			create comparator
			create sorter.make (comparator)
			Result := full_usage_instruction (a_parser)
			if not a_parser.application_description.is_empty then
				Result.append_string (text_before_description)
				wrapper.set_new_line_indentation (0)
				Result.append_string (wrapper.wrapped_string (a_parser.application_description))
				Result.append_string (text_below_description)
			end
			Result.append_string (text_before_options)
			all_options := a_parser.all_options
			sorter.sort (all_options)
			max_indent := 0
			from
				all_options.start
			until
				all_options.after
			loop
				if not all_options.item_for_iteration.is_hidden then
					max_indent := all_options.item_for_iteration.names.count.max (max_indent)
				end
				all_options.forth
			end
			from
				all_options.start
			until
				all_options.after
			loop
				if not all_options.item_for_iteration.is_hidden then
					if is_not_first then
						Result.append_character ('%N')
					end
					Result.append_string (option_help_text (all_options.item_for_iteration, max_indent + 1))
					is_not_first := True
				end
				all_options.forth
			end
		ensure
			full_help_text_not_void: Result /= Void
		end

	full_usage_instruction (a_parser: AP_PARSER): STRING is
			-- Usage instruction for the programs standard and 
			-- alternative options
		require
			a_parser_not_void: a_parser /= Void
		local
			alt_list: DS_LIST [AP_ALTERNATIVE_OPTIONS_LIST]
		do
			Result := usage_instruction (a_parser)
			Result.append_character ('%N')
			alt_list := a_parser.alternative_options_lists
			from
				alt_list.start
			until
				alt_list.after
			loop
				if not alt_list.item_for_iteration.introduction_option.is_hidden then
					Result.append_string (alternative_usage_instruction (a_parser, alt_list.item_for_iteration))
				end
				Result.append_character ('%N')
				alt_list.forth
			end
		ensure
			full_usage_instruction_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	usage_instruction (a_parser: AP_PARSER): STRING is
			-- Short usage instruction for the programs standard options
		require
			a_parser_not_void: a_parser /= Void
		local
			args: STRING
			option: AP_OPTION
			l_options: DS_LIST [AP_OPTION]
			application_name: STRING
		do
			create args.make_empty
			l_options := a_parser.options
			from
				l_options.start
			until
				l_options.after
			loop
				option := l_options.item_for_iteration
				if not option.is_hidden then
					args.append_string (option.example)
					args.append_character (' ')
				end
				l_options.forth
			end
			args.append_string (a_parser.parameters_description)
			application_name := file_system.basename (Arguments.program_name)
			application_name.keep_head (maximum_application_name)
			create Result.make (20)
			Result.append_string (usage_header)
			Result.append_string (application_name)
			Result.append_character (' ')
			Result.append_string (args)
			wrapper.set_new_line_indentation (usage_header.count + application_name.count + 1)
			Result := wrapper.wrapped_string (Result)
		ensure
			usage_instruction_not_void: Result /= Void
		end

	alternative_usage_instruction (a_parser: AP_PARSER; a_list: AP_ALTERNATIVE_OPTIONS_LIST): STRING is
			-- Short usage instruction for the programs alternative options
		require
			a_parser_not_void: a_parser /= Void
			a_list_not_void: a_list /= Void
		local
			args: STRING
			option: AP_OPTION
			application_name: STRING
		do
			create args.make_empty
			args.append_string (a_list.introduction_option.name)
			args.append_character (' ')
			from
				a_list.start
			until
				a_list.after
			loop
				option := a_list.item_for_iteration
				if not option.is_hidden then
					args.append_string (option.example)
					args.append_character (' ')
				end
				a_list.forth
			end
			args.append_string (a_list.parameters_description)
			application_name := file_system.basename (Arguments.program_name)
			application_name.keep_head (maximum_application_name)
			create Result.make_filled (' ', usage_header.count)
			Result.append_string (application_name)
			Result.append_character (' ')
			Result.append_string (args)
			wrapper.set_new_line_indentation (usage_header.count + application_name.count + 1)
			Result := wrapper.wrapped_string (Result)
		ensure
			alternative_usage_instruction_not_void: Result /= Void
		end

	option_help_text (an_option: AP_OPTION; indent: INTEGER): STRING is
			-- Help text of `an_option', calculated from the option_names 
			-- and the description, assuming an indention of `indent' is 
			-- required for correct formating
		require
			an_option_not_void: an_option /= Void
			indent_not_too_small: indent >= an_option.names.count
			indent_not_too_large: indent <= terminal_width
		local
			spaces: STRING
		do
			create spaces.make_filled (' ', indent - an_option.names.count)
			wrapper.set_new_line_indentation (indent)
			Result := wrapper.wrapped_string (an_option.names + spaces + an_option.description)
		ensure
			option_help_text_not_void: Result /= Void
		end

	wrapper: ST_WORD_WRAPPER is
			-- A word wrapper for formating help texts
		once
			create Result.make
			Result.set_maximum_text_width (terminal_width)
		ensure
			wrapper_not_void: Result /= Void
		end

invariant

	reasonable_option_indentation: option_description_indentation < terminal_width

end
