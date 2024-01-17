note

	description:

		"Parsers for arguments supplied to a program, with no predefined options"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2018, Bernd Schoeller and others"
	license: "MIT License"

class AP_BASIC_PARSER

inherit

	KL_SHARED_ARGUMENTS

	KL_SHARED_STANDARD_FILES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_STRING_EQUALITY_TESTER

	KL_SHARED_FILE_SYSTEM

	KL_IMPORTED_ARRAY_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

	AP_CONSTANTS

create

	make

feature {NONE} -- Initialization

	make
			-- Create a parser without predefined options.
		do
			create {DS_ARRAYED_LIST [AP_OPTION]} options.make (0)
			create {DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST]} alternative_options_lists.make (0)
			create {DS_ARRAYED_LIST [STRING]} parameters.make (0)
			create error_handler.make_standard
			parameters_description := default_parameters_description
			application_description := default_application_description
		end

feature -- Access

	alternative_options_lists: DS_LIST [AP_ALTERNATIVE_OPTIONS_LIST]
			-- List of alternative options lists

	application_description: STRING
			-- A string describing the purpose of the application

	error_handler: AP_ERROR_HANDLER
			-- Error handler for this argument parser

	options: DS_LIST [AP_OPTION]
			-- List of all available options

	parameters: DS_LIST [STRING]
			-- All argument that were not part of any option

	parameters_description: STRING
			-- Description of the parameters

	last_option_parameter: detachable STRING
			-- Last parameter that was passed to an option

	all_options: DS_LIST [AP_OPTION]
			-- All options that are used in the parser (including
			-- alternatives), without duplicates
		local
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create {DS_ARRAYED_LIST [AP_OPTION]} Result.make (0)
			from
				options.start
			until
				options.after
			loop
				if not Result.has (options.item_for_iteration) then
					Result.force_last (options.item_for_iteration)
				end
				options.forth
			end
			from
				alternative_options_lists.start
			until
				alternative_options_lists.after
			loop
				a_list := alternative_options_lists.item_for_iteration
				if not Result.has (a_list.introduction_option) then
					Result.force_last (a_list.introduction_option)
				end
				from
					a_list.start
				until
					a_list.after
				loop
					if not Result.has (a_list.item_for_iteration) then
						Result.force_last (a_list.item_for_iteration)
					end
					a_list.forth
				end
				alternative_options_lists.forth
			end
		ensure
			all_options_not_void: Result /= Void
		end

feature -- Configuration

	set_application_description (a_string: STRING)
			-- Set the description for application to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			application_description := a_string
		ensure
			application_description_set: application_description = a_string
		end

	set_error_handler (an_error_handler: AP_ERROR_HANDLER)
			-- Set the error handler to `an_error_handler'.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	set_parameters_description (a_string: STRING)
			-- Set the description for parameters to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			parameters_description := a_string
		ensure
			parameters_description_set: parameters_description = a_string
		end

feature -- Status report

	has_long_option (an_option: STRING): BOOLEAN
			-- Does the parser have a long option `an_option' in the current
			-- option set?
		require
			an_option_not_void: an_option /= Void
		local
			l_option: AP_OPTION
			l_long_form: detachable STRING
		do
			from
				options.start
			until
				options.after
			loop
				l_option := options.item_for_iteration
				l_long_form := l_option.long_form
				if l_long_form /= Void and then	l_long_form.same_string (an_option) then
					check
						has_long_form: l_option.has_long_form
					end
					Result := True
					options.go_after
				else
					options.forth
				end
			end
		end

	has_short_option (a_character: CHARACTER): BOOLEAN
			-- Does the parser have a short option `a_character' in the
			-- current option set?
		local
			l_option: AP_OPTION
		do
			from
				options.start
			until
				options.after
			loop
				l_option := options.item_for_iteration
				if l_option.has_short_form and then l_option.short_form = a_character then
					Result := True
					options.go_after
				else
					options.forth
				end
			end
		end

feature -- Parser

	parse_arguments
			-- Parse the command line arguments.
		require
			valid_options: valid_options
		local
			args: DS_ARRAYED_LIST [STRING]
			i, nb: INTEGER
		do
			nb := Arguments.argument_count
			create args.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				args.force (Arguments.argument (i), i)
				i := i + 1
			end
			parse_list (args)
		end

	parse_array (an_array: ARRAY [STRING])
			-- Parse `an_array' of arguments.
		require
			an_array_not_void: an_array /= Void
			no_void_argument: not STRING_ARRAY_.has_void (an_array)
			valid_options: valid_options
		local
			args: DS_ARRAYED_LIST [STRING]
		do
			create args.make_from_array (an_array)
			parse_list (args)
		end

	parse_list (a_list: DS_LIST [STRING])
			-- Parse `a_list' of arguments.
		require
			a_list_not_void: a_list /= Void
			no_void_argument: not a_list.has_void
			valid_options: valid_options
		do
			reset_parser
			from
				a_list.start
			until
				a_list.after
			loop
				parse_argument (a_list)
			end
			check_options_after_parsing
			if error_handler.has_error then
				final_error_action
			end
		end

feature -- Error handling

	final_error_action
			-- Code to execute when an error was encountered.
		do
			error_handler.report_error_message (abort_message)
			Exceptions.die (1)
		end

feature -- Validity checks

	is_alpha_numeric (a_character: CHARACTER): BOOLEAN
			-- Is `a_character' an alpha-numeric character?
			-- (the property is available in CHARACTER_REF of FreeELKS,
			-- unfortunately SmartEiffel does not seem to support it)
		local
			c: CHARACTER
		do
			c := a_character
			Result := (c >= 'a' and c <= 'z') or (c >= 'A' and c <= 'Z') or (c >= '0' and c <= '9')
		end

	valid_long_form (a_string: STRING): BOOLEAN
			-- Is `a_string' a valid long form for an option?
			-- Allowed character: alpha_numeric, dash (not twice in
			-- a row and not at beginning or end)
		local
			i, nb: INTEGER
		do
			if a_string = Void then
				Result := False
			else
				nb := a_string.count
				if nb >= 1 then
					Result := True
					from
						i := 1
					until
						i > nb
					loop
						if
							is_alpha_numeric (a_string.item (i)) or
							((i > 1 and i < nb) and then
						 	(a_string.item (i) = short_option_introduction and
						 	a_string.item (i - 1) /= short_option_introduction))
						then
							i := i + 1
						else
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
					end
				end
			end
		ensure
			void_string_are_never_valid: (a_string = Void) implies not Result
		end

	valid_short_form (a_character: CHARACTER): BOOLEAN
			-- Is `a_character' a valid short form for an option?
			-- Allowed characters: alpha_numeric
		do
			Result := is_alpha_numeric (a_character)
		end

	all_valid_short_and_long_form (a_list: DS_LIST [AP_OPTION]): BOOLEAN
			-- Do all options that are part of `a_list' have valid short
			-- and long form? Is a short or long form used twice?
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_option: AP_OPTION
			long_set: DS_LINKED_LIST [STRING]
			short_set: DS_LINKED_LIST [CHARACTER]
		do
			Result := True
			create long_set.make
			long_set.set_equality_tester (string_equality_tester)
			create short_set.make
			nb := a_list.count
			from
				i := 1
			until
				(not Result) or (i > nb)
			loop
				l_option := a_list.item (i)
				if l_option = Void then
					Result := False
				else
					if l_option.has_short_form then
						Result := valid_short_form (l_option.short_form) and not short_set.has (l_option.short_form)
						short_set.force_last (l_option.short_form)
					end
					if attached l_option.long_form as l_long_form and Result then
						Result := valid_long_form (l_long_form) and not long_set.has (l_long_form)
						long_set.force_last (l_long_form)
					end
					i := i + 1
				end
			end
		end

	valid_options: BOOLEAN
			-- Are all options correctly set up?
		local
			aol: AP_ALTERNATIVE_OPTIONS_LIST
		do
			if all_valid_short_and_long_form (options) then
				Result := True
				from
					alternative_options_lists.start
				until
					(not Result) or alternative_options_lists.after
				loop
					aol := alternative_options_lists.item_for_iteration
					if not all_valid_short_and_long_form (aol) then
						Result := False
					else
						if aol.introduction_option.has_short_form then
							Result := not has_short_option (aol.introduction_option.short_form)
						end
						if attached aol.introduction_option.long_form as l_long_form and Result then
							Result := not has_long_option (l_long_form)
						end
					end
					alternative_options_lists.forth
				end
				alternative_options_lists.go_after
			end
		end

feature -- Help

	full_help_text: STRING
			-- Full help text
		local
			max_indent: INTEGER
			l_all_options: DS_LIST [AP_OPTION]
			comparator: AP_OPTION_COMPARATOR
			sorter: DS_QUICK_SORTER [AP_OPTION]
			is_not_first: BOOLEAN
		do
			create comparator
			create sorter.make (comparator)
			Result := full_usage_instruction
			if not application_description.is_empty then
				Result.append_string (text_before_description)
				wrapper.set_new_line_indentation (0)
				Result.append_string (wrapper.wrapped_string (application_description))
				Result.append_string (text_below_description)
			end
			Result.append_string (text_before_options)
			l_all_options := all_options
			sorter.sort (l_all_options)
			max_indent := 0
			from
				l_all_options.start
			until
				l_all_options.after
			loop
				if not l_all_options.item_for_iteration.is_hidden then
					max_indent := l_all_options.item_for_iteration.names.count.max (max_indent)
				end
				l_all_options.forth
			end
			max_indent := max_indent.min (description_max_indent)
			from
				l_all_options.start
			until
				l_all_options.after
			loop
				if not l_all_options.item_for_iteration.is_hidden then
					if is_not_first then
						Result.append_character ('%N')
					end
					Result.append_string (option_help_text (l_all_options.item_for_iteration, max_indent + 1))
					is_not_first := True
				end
				l_all_options.forth
			end
		ensure
			full_help_text_not_void: Result /= Void
		end

	full_usage_instruction: STRING
			-- Usage instruction for the programs standard and
			-- alternative options
		local
			alt_list: DS_LIST [AP_ALTERNATIVE_OPTIONS_LIST]
		do
			Result := usage_instruction
			Result.append_character ('%N')
			alt_list := alternative_options_lists
			from
				alt_list.start
			until
				alt_list.after
			loop
				if not alt_list.item_for_iteration.introduction_option.is_hidden then
					Result.append_string (alternative_usage_instruction (alt_list.item_for_iteration))
				end
				Result.append_character ('%N')
				alt_list.forth
			end
		ensure
			full_usage_instruction_not_void: Result /= Void
		end

feature {NONE} -- Help

	usage_instruction: STRING
			-- Short usage instruction for the programs standard options
		local
			args: STRING
			option: AP_OPTION
			l_options: DS_LIST [AP_OPTION]
			application_name: STRING
		do
			create args.make_empty
			l_options := options
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
			args.append_string (parameters_description)
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

	alternative_usage_instruction (a_list: AP_ALTERNATIVE_OPTIONS_LIST): STRING
			-- Short usage instruction for the programs alternative options
		require
			a_list_not_void: a_list /= Void
		local
			args: STRING
			option: AP_OPTION
			application_name: STRING
		do
			create args.make_empty
			args.append_string (a_list.introduction_option.example)
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

	option_help_text (an_option: AP_OPTION; indent: INTEGER): STRING
			-- Help text of `an_option', calculated from the option_names
			-- and the description, assuming an indention of `indent' is
			-- required for correct formating
		require
			an_option_not_void: an_option /= Void
			indent_not_too_small: indent >= 1
			indent_not_too_large: indent <= terminal_width
		local
			spaces: STRING
		do
			wrapper.set_new_line_indentation (indent)
			if indent <= an_option.names.count then
				create spaces.make_filled (' ', indent)
				Result := an_option.names + "%N" + wrapper.wrapped_string (spaces + an_option.description)
			else
				create spaces.make_filled (' ', indent - an_option.names.count)
				Result := wrapper.wrapped_string (an_option.names + spaces + an_option.description)
			end
		ensure
			option_help_text_not_void: Result /= Void
		end

	wrapper: ST_WORD_WRAPPER
			-- A word wrapper for formating help texts
		once
			create Result.make
			Result.set_maximum_text_width (terminal_width)
		ensure
			wrapper_not_void: Result /= Void
		end

	usage_header: STRING = "usage: "
			-- Text that is used to introduce usage instructions

	text_before_description: STRING = "%N"
			-- Text that separates the usage instructions and the
			-- application description

	text_below_description: STRING = "%N"
			-- Text that separates the application description and the
			-- list of options

	text_before_options: STRING = "%NOptions:%N"
			-- Text that introduces the options

	description_max_indent: INTEGER = 25
			-- Maximum indentation before option descriptions

feature {NONE} -- Implementation

	current_options: detachable DS_LIST [AP_OPTION]
			-- The current list of options for parsing
			-- Defaults to `options', and can be changed by parsing an
			-- introduction_option of one of the alternative_options_lists.

	is_first_option: BOOLEAN
			-- Are we still looking for the first option?

	check_options_after_parsing
			-- Check if all mandatory options were passed to the program and
			-- options were not given too often.
		require
			current_options_not_void: current_options /= Void
		local
			o: AP_OPTION
			error: AP_ERROR
			l_current_options: like current_options
		do
			l_current_options := current_options
			check
				-- Implied by precondition `current_options_not_void'
				current_options_not_void: l_current_options /= Void
			then
				from
					l_current_options.start
				until
					l_current_options.after
				loop
					o := l_current_options.item_for_iteration
					if o.is_mandatory and not o.was_found then
						create error.make_missing_option_error (o)
						error_handler.report_error (error)
					end
					if o.maximum_occurrences > 0 and o.occurrences > o.maximum_occurrences then
						create error.make_surplus_option_error (o)
						error_handler.report_error (error)
					end
					l_current_options.forth
				end
			end
		end

	parse_argument (a_argument_list: DS_LIST [STRING])
			-- Parse the current argument.
		require
			a_argument_list_attached: a_argument_list /= Void
			option_available: not a_argument_list.off
		local
			l_argument: STRING
			length: INTEGER
			l_parameters: like parameters
		do
			l_parameters := parameters
			l_argument := a_argument_list.item_for_iteration
			length := l_argument.count
			if length >= 2 and then l_argument.item (1) = short_option_introduction then
				if l_argument.item (2) = long_option_introduction then
					if length = 2 then
						from
							a_argument_list.forth
						until
							a_argument_list.after
						loop
							l_parameters.force_last (a_argument_list.item_for_iteration)
							a_argument_list.forth
						end
					else
						parse_long (a_argument_list)
					end
				else
					parse_short (a_argument_list)
				end
			else
				l_parameters.force_last (l_argument)
				a_argument_list.forth
			end
		end

	parse_long (a_argument_list: DS_LIST [STRING])
			-- Parse a long argument.
		require
			a_argument_list_attached: a_argument_list /= Void
			a_argument_list_not_off: not a_argument_list.off
--			current_is_long_option: {rl_item: STRING} a_argument_list.item_for_iteration and then rl_item.count >= 2 and then
--				(rl_item.item (1) = short_option_introduction and rl_item.item (2) = long_option_introduction)
		local
			l_argument: STRING
			option_string: STRING
			option: detachable AP_OPTION
			o: AP_OPTION
			parameter_position: INTEGER
			parameter: detachable STRING
			error: AP_ERROR
			l_current_options: like current_options
		do
			l_argument := a_argument_list.item_for_iteration
			parameter_position := l_argument.index_of (long_option_parameter_introduction, 3)
			if parameter_position > 0 then
				option_string := l_argument.substring (3, parameter_position - 1)
				parameter := l_argument.substring (parameter_position + 1, l_argument.count)
			else
				option_string := l_argument.substring (3, l_argument.count)
			end
			if is_first_option then
				from
					option := Void
					alternative_options_lists.start
				until
					option /= Void or alternative_options_lists.after
				loop
					o := alternative_options_lists.item_for_iteration.introduction_option
					if attached o.long_form as l_o_long_form then
						if STRING_.same_string (l_o_long_form, option_string) then
							option := o
							current_options := alternative_options_lists.item_for_iteration
						end
					end
					alternative_options_lists.forth
				end
				is_first_option := False
			end
			l_current_options := current_options
			if option = Void and l_current_options /= Void then
				from
					l_current_options.start
				until
					option /= Void or l_current_options.after
				loop
					o := l_current_options.item_for_iteration
					if attached o.long_form as l_o_long_form then
						if STRING_.same_string (l_o_long_form, option_string) then
							option := o
						end
					end
					l_current_options.forth
				end
			end
			if option = Void then
				create error.make_unknown_option_error (option_string)
				error_handler.report_error (error)
			else
				if option.needs_parameter then
					if parameter = Void then
						a_argument_list.forth
						if a_argument_list.off then
							create error.make_missing_parameter_error (option)
							error_handler.report_error (error)
						else
							parameter := a_argument_list.item_for_iteration
						end
					end
					if parameter /= Void then
						last_option_parameter := parameter
						option.record_occurrence (Current)
					end
				else
					if parameter = Void or option.allows_parameter then
						last_option_parameter := parameter
						option.record_occurrence (Current)
					else
						create error.make_unnecessary_parameter_error (option, parameter)
						error_handler.report_error (error)
					end
				end
			end
			if not a_argument_list.after then
				a_argument_list.forth
			end
		end

	parse_short (a_argument_list: DS_LIST [STRING])
			-- Parse a short option.
		require
			a_argument_list_attached: a_argument_list /= Void
			a_argument_list_not_off: not a_argument_list.off
--			current_is_short_option: {rl_item: STRING} a_argument_list.item_for_iteration and then
--				rl_item.count > 1 and then
--				(rl_item.item (1) = short_option_introduction and
--				 rl_item.item (2) /= long_option_introduction)
		local
			l_argument: STRING
			i: INTEGER
			option_character: CHARACTER
			option: detachable AP_OPTION
			o: AP_OPTION
			parameter: detachable STRING
			error: AP_ERROR
			l_current_options: like current_options
		do
			l_argument := a_argument_list.item_for_iteration
			from
				i := 2
			until
				i > l_argument.count
			loop
				option_character := l_argument.item (i)
				option := Void
				if is_first_option then
					from
						alternative_options_lists.start
					until
						option /= Void or alternative_options_lists.after
					loop
						o := alternative_options_lists.item_for_iteration.introduction_option
						if o.has_short_form and then o.short_form = option_character then
							option := o
							current_options := alternative_options_lists.item_for_iteration
						end
						alternative_options_lists.forth
					end
					is_first_option := False
				end
				l_current_options := current_options
				if option = Void and l_current_options /= Void then
					from
						l_current_options.start
					until
						option /= Void or l_current_options.after
					loop
						o := l_current_options.item_for_iteration
						if o.has_short_form and then o.short_form = option_character then
							option := o
						end
						l_current_options.forth
					end
				end
				if option = Void then
					create error.make_unknown_option_error (option_character.out)
					error_handler.report_error (error)
				else
					if option.needs_parameter then
						if i = l_argument.count then
							a_argument_list.forth
							if not a_argument_list.off then
								parameter := a_argument_list.item_for_iteration
							end
						else
							parameter := l_argument.substring (i + 1, l_argument.count)
							i := l_argument.count
						end
						if parameter = Void then
							create error.make_missing_parameter_error (option)
							error_handler.report_error (error)
						else
							last_option_parameter := parameter
							option.record_occurrence (Current)
						end
					else
						option.record_occurrence (Current)
					end
				end
				i := i + 1
			end
			if not a_argument_list.after then
				a_argument_list.forth
			end
		end

	reset_parser
			-- Reset parser and all option prior to parsing arguments.
		local
			all_options_list: DS_LIST [AP_OPTION]
		do
			error_handler.reset
			all_options_list := all_options
			from
				all_options_list.start
			until
				all_options_list.after
			loop
				all_options_list.item_for_iteration.reset
				all_options_list.forth
			end
			current_options := options
			create {DS_ARRAYED_LIST [STRING]} parameters.make (0)
			is_first_option := True
		ensure
			not_has_errors: not error_handler.has_error
		end

invariant

	options_not_void: options /= Void
	no_option_is_void: not options.has_void
	alternative_options_lists_not_void: alternative_options_lists /= Void
	application_description_not_void: application_description /= Void
	paramaters_description_not_void: parameters_description /= Void
	parameters_not_void: parameters /= Void

end
